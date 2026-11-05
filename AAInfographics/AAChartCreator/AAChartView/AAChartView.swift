//
//  AAChartView.swift
//  AAChartKit-Swift
//
//  Created by An An on 2017/5/23.
//  Copyright © 2017年 An An . All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 *  🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit-Swift/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

import WebKit

@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
@objc public protocol AAChartViewDelegate: NSObjectProtocol {
    @objc optional func aaChartViewDidFinishLoad(_ aaChartView: AAChartView)
    @objc optional func aaChartViewDidFinishEvaluate(_ aaChartView: AAChartView)
    @objc optional func aaChartView(_ aaChartView: AAChartView, clickEventMessage: AAClickEventMessageModel)
    @objc optional func aaChartView(_ aaChartView: AAChartView, moveOverEventMessage: AAMoveOverEventMessageModel)
}

/// Refer to: https://api.highcharts.com/class-reference/Highcharts.Point
@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
public class AAEventMessageModel: NSObject {
    public var name: String?
    public var x: Float?
    public var y: Float?
    public var category: String?
    public var offset: [String: Any]?
    public var index: Int?
    
    required override init() {
        
    }
}


@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
public class AAClickEventMessageModel: AAEventMessageModel {}

@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
public class AAMoveOverEventMessageModel: AAEventMessageModel {}


/// Refer to: https://stackoverflow.com/questions/26383031/wkwebview-causes-my-view-controller-to-leak
@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
public class AALeakAvoider : NSObject, WKScriptMessageHandler {
    weak var delegate : WKScriptMessageHandler?
    
    public init(delegate:WKScriptMessageHandler) {
        self.delegate = delegate
        super.init()
    }
    
    public func userContentController(
        _ userContentController: WKUserContentController,
        didReceive message: WKScriptMessage
    ) {
        delegate?.userContentController(userContentController, didReceive: message)
    }
}


@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
public struct AADependency {
    let dependent: String // The plugin that has a dependency
    let on: String        // The plugin it depends on

    public init(_ dependent: String, on dependency: String) {
        self.dependent = dependent
        self.on = dependency
    }
}


@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
public class AAChartView: WKWebView {
    let kUserContentMessageNameClick = "click"
    let kUserContentMessageNameMouseOver = "mouseover"
    
    private var clickEventEnabled: Bool?
    private var touchEventEnabled: Bool?
    
    private weak var _delegate: AAChartViewDelegate?
    public weak var delegate: AAChartViewDelegate? {
        set {
            assert(optionsJson == nil, "You should set the delegate before drawing the chart") //To Make sure the clickEventEnabled and touchEventEnabled properties are working correctly
            
            _delegate = newValue
            if newValue?.responds(to: #selector(AAChartViewDelegate.aaChartView(_:clickEventMessage:))) == true {
                clickEventEnabled = true
                addClickEventMessageHandler()
            }
            if newValue?.responds(to: #selector(AAChartViewDelegate.aaChartView(_:moveOverEventMessage:))) == true {
                touchEventEnabled = true
                addMouseOverEventMessageHandler()
            }
        }
        
        get {
            _delegate
        }
    }
    
    // MARK: - Setter Method
#if os(iOS)
    public var isScrollEnabled: Bool? {
        willSet {
            scrollView.isScrollEnabled = newValue!
        }
    }
#endif
    
    
    public var isClearBackgroundColor: Bool? {
        willSet {
#if os(iOS)
            if newValue! == true {
                backgroundColor = .clear
                isOpaque = false
            } else {
                backgroundColor = .white
                isOpaque = true
            }
#elseif os(macOS)
            if newValue! == true {
                layer?.backgroundColor = .clear
                layer?.isOpaque = false
            } else {
                layer?.backgroundColor = .white
                layer?.isOpaque = true
            }
#endif
        }
    }
    
    public var isSeriesHidden: Bool? {
        willSet {
            if optionsJson != nil {
                let jsStr = "setChartSeriesHidden('\(newValue!)')"
                safeEvaluateJavaScriptString(jsStr)
            }
        }
    }
    
    /// Content width of AAChartView
    public var contentWidth: CGFloat? {
        willSet {
            if optionsJson != nil {
                let jsStr = "setTheChartViewContentWidth('\(newValue!)')"
                safeEvaluateJavaScriptString(jsStr)
            }
        }
    }
    
    /// Content height of AAChartView
    public var contentHeight: CGFloat? {
        willSet {
            if optionsJson != nil {
                let jsStr = "setTheChartViewContentHeight('\(newValue!)')"
                safeEvaluateJavaScriptString(jsStr)
            }
        }
    }
    
    internal var optionsJson: String?

    // --- Plugin Loader ---
    private var pluginLoader: AAChartViewPluginLoaderProtocol = AAChartViewPluginLoader(provider: AAChartViewPluginProvider())

    public var userPluginPaths: Set<String> = []
    
    /// Configure plugin dependencies using a more readable struct-based array.
    /// Example: `aaChartView.dependencies = [AADependency("pluginB.js", on: "pluginA.js")]`
    public var dependencies: [AADependency] = []
#if DEBUG
    public var shouldPrintOptionsJSON: Bool = true
#endif
    
    // MARK: - Initialization
    override private init(frame: CGRect, configuration: WKWebViewConfiguration) {
        super.init(frame: frame, configuration: configuration)
        uiDelegate = self
        navigationDelegate = self
    }
    
    convenience public init() {
        let configuration = WKWebViewConfiguration()
        self.init(frame: .zero, configuration: configuration)
    }
    
    required public convenience init?(coder aDecoder: NSCoder) {
        let configuration = WKWebViewConfiguration()
        self.init(frame: .zero, configuration: configuration)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    // MARK: - Plugin Loading and Chart Drawing

    private func drawChart() {
        // Execute pre-draw script via loader
        pluginLoader.executeBeforeDrawScript(webView: self)

        // Check if optionsJson is ready before drawing
        guard optionsJson != nil else {
            debugLog("💀💀💀 Attempted to draw chart before optionsJson was configured.")
            return
        }

        let jsStr = "loadTheHighChartView('\(optionsJson!)','\(contentWidth ?? 0)','\(contentHeight ?? 0)');"
        safeEvaluateJavaScriptString(jsStr)

        // Execute post-draw script via loader
        pluginLoader.executeAfterDrawScript(webView: self)
    }

    internal func safeEvaluateJavaScriptString (_ jsString: String) {
        evaluateJavaScript(jsString, completionHandler: { [weak self] (item, error) in
            guard let self = self else { return }
#if DEBUG
            if error != nil {
                let objcError = error! as NSError
                let errorUserInfo = objcError.userInfo
                
                let errorInfo =
                """
                
                ☠️☠️💀☠️☠️WARNING!!!!!!!!!!!!!!!!!!!! JS WARNING !!!!!!!!!!!!!!!!!!!!WARNING☠️☠️💀☠️☠️
                ------------------------------------------------------------------------------------------
                code = \(objcError.code);
                domain = \(objcError.domain);
                userInfo = {
                    NSLocalizedDescription = "\(errorUserInfo["NSLocalizedDescription"] ?? "")";
                    WKJavaScriptExceptionColumnNumber = \(errorUserInfo["WKJavaScriptExceptionColumnNumber"] ?? "");
                    WKJavaScriptExceptionLineNumber = \(errorUserInfo["WKJavaScriptExceptionLineNumber"] ?? "");
                    WKJavaScriptExceptionMessage = \(errorUserInfo["WKJavaScriptExceptionMessage"] ?? "");
                    WKJavaScriptExceptionSourceURL = \(errorUserInfo["WKJavaScriptExceptionSourceURL"] ?? "");
                }
                ------------------------------------------------------------------------------------------
                ☠️☠️💀☠️☠️WARNING!!!!!!!!!!!!!!!!!!!! JS WARNING !!!!!!!!!!!!!!!!!!!!WARNING☠️☠️💀☠️☠️
                
                """
                print(errorInfo)
            }
#endif
            
            self.delegate?.aaChartViewDidFinishEvaluate?(self)
        })
    }
    
    private func configurePlotOptionsSeriesPointEvents(_ aaOptions: AAOptions) {
        if aaOptions.plotOptions == nil {
            aaOptions.plotOptions = AAPlotOptions().series(AASeries().point(AAPoint().events(AAPointEvents())))
        } else if aaOptions.plotOptions?.series == nil {
            aaOptions.plotOptions?.series = AASeries().point(AAPoint().events(AAPointEvents()))
        } else if aaOptions.plotOptions?.series?.point == nil {
            aaOptions.plotOptions?.series?.point = AAPoint().events(AAPointEvents())
        } else if aaOptions.plotOptions?.series?.point?.events == nil {
            aaOptions.plotOptions?.series?.point?.events = AAPointEvents()
        }
    }
    
#if DEBUG
    private func printOptionsJSONInfo(_ aaOptions: AAOptions) {
        let modelJsonDic = Self.optionsDictionaryForDebugLogging(aaOptions)

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: modelJsonDic, options: .prettyPrinted)
            if let prettyPrintedModelJson = String(data: jsonData, encoding: .utf8) {
                print("""
                            -----------🖨🖨🖨 console log AAOptions JSON information of AAChartView 🖨🖨🖨-----------:
                            \(prettyPrintedModelJson)
                            """)
            } else {
                print("⚠️ Warning: Could not convert JSON data to UTF8 string for logging.")
            }
        } catch {
            print("⚠️ Warning: Could not serialize AAOptions to JSON for logging: \(error)")
        }
    }

    internal static func optionsDictionaryForDebugLogging(_ aaOptions: AAOptions) -> [String: Any] {
        var modelJsonDic = aaOptions.toDic()

        // Truncate only the serialized copy; chart models may be reused by callers.
        if let seriesElements = aaOptions.series as? [AASeriesElement],
           !seriesElements.isEmpty {
            if seriesElements.count > 10 {
                print("💊 Warning: Series element count more than 10, only the first 10 elements will be displayed in the console!!!")
            }

            var seriesDictionaries = Array(seriesElements.prefix(10)).map { $0.toDic() }
            var didTruncateData = false
            for index in seriesDictionaries.indices {
                if let data = seriesDictionaries[index]["data"] as? [Any], data.count > 1000 {
                    seriesDictionaries[index]["data"] = Array(data.prefix(1000))
                    didTruncateData = true
                }
            }

            if didTruncateData {
                print("💊 Warning: Data array element count more than 1000, only the first 1000 data elements will be displayed in the console!!!")
            }
            modelJsonDic["series"] = seriesDictionaries
        }

        return modelJsonDic
    }
#endif
    
    internal func configureOptionsJsonStringWithAAOptions(_ aaOptions: AAOptions) {
        // Configure the plugin loader (determines required plugins, gets scripts)
        pluginLoader.configure(options: aaOptions)

        if isClearBackgroundColor == true {
            aaOptions.chart?.backgroundColor = AAColor.clear
        }

        if clickEventEnabled == true {
            aaOptions.clickEventEnabled = true
        }
        if touchEventEnabled == true {
            aaOptions.touchEventEnabled = true
        }
        if clickEventEnabled == true || touchEventEnabled == true {
            configurePlotOptionsSeriesPointEvents(aaOptions)
        }

        optionsJson = aaOptions.toJSON()

#if DEBUG
        if shouldPrintOptionsJSON {
            printOptionsJSONInfo(aaOptions)
        }
#endif
    }
    
    private func addClickEventMessageHandler() {
        configuration.userContentController.removeScriptMessageHandler(forName: kUserContentMessageNameClick)
        configuration.userContentController.add(AALeakAvoider.init(delegate: self), name: kUserContentMessageNameClick)
    }
    
    private func addMouseOverEventMessageHandler() {
        configuration.userContentController.removeScriptMessageHandler(forName: kUserContentMessageNameMouseOver)
        configuration.userContentController.add(AALeakAvoider.init(delegate: self), name: kUserContentMessageNameMouseOver)
    }
    
    //添加一个 debug log 方法, 用于打印一些调试信息
    private func debugLog(_ message: String) {
#if DEBUG
        print(message)
#endif
    }
    
    
    deinit {
        configuration.userContentController.removeAllUserScripts()
        NotificationCenter.default.removeObserver(self)
        debugLog("👻👻👻 AAChartView instance \(self) has been destroyed!")
    }
}


// MARK: - WKUIDelegate
@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
extension AAChartView: WKUIDelegate {
    open func webView(
        _ webView: WKWebView,
        runJavaScriptAlertPanelWithMessage message: String,
        initiatedByFrame frame: WKFrameInfo,
        completionHandler: @escaping () -> Void
    ) {
#if os(iOS)
        let alertController = UIAlertController(title: "JS WARNING", message: message, preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "Okay", style: .default) { _ in
            completionHandler()
        }
        alertController.addAction(okayAction)
        
        guard let presentingViewController = self.nextUIViewController() else {
            print("Unable to present UIAlertController from AAChartView. Completing JavaScript alert handler.")
            completionHandler()
            return
        }
        
        presentingViewController.present(alertController, animated: true, completion: nil)
        
#elseif os(macOS)
        let alert = NSAlert()
        alert.alertStyle = .warning
        alert.messageText = "JS WARNING"
        alert.informativeText = message
        alert.addButton(withTitle: "Okay")
        
        alert.beginSheetModal(for: NSApplication.shared.mainWindow!) { (response) in
            if response == NSApplication.ModalResponse.alertFirstButtonReturn {
                completionHandler()
            }
        }
#endif
    }
    
#if os(iOS)
    private func nextUIViewController() -> UIViewController? {
        var responder: UIResponder? = self
        while responder != nil {
            if let viewController = responder as? UIViewController {
                return viewController
            }
            responder = responder?.next
        }
        return nil
    }
#endif
    
}


// MARK: - WKNavigationDelegate
@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
extension AAChartView:  WKNavigationDelegate {
    internal func loadAllPluginsAndDrawChart() {
        // Load plugins via loader, then draw chart in completion
        // Convert the dependency array to a dictionary for the loader
        let dependenciesDict = dependencies.reduce(into: [String: String]()) { dict, dependency in
            dict[dependency.dependent] = dependency.on
        }

        pluginLoader.loadPluginsIfNeeded(
            webView: self,
            userPlugins: userPluginPaths,
            dependencies: dependenciesDict
        ) { [weak self] in
            // Ensure options are ready before drawing
            guard let self = self, self.optionsJson != nil else {
                self?.debugLog("💀💀💀 AAChartView options not ready after plugin load or view deallocated.")
                return
            }
            self.drawChart()
        }
    }
    
    open func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadAllPluginsAndDrawChart()
        delegate?.aaChartViewDidFinishLoad?(self)
    }
}


// MARK: - WKScriptMessageHandler
@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
extension AAChartView: WKScriptMessageHandler {
    open func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == kUserContentMessageNameClick {
            let messageBody = message.body as! [String: Any]
            let clickEventMessageModel = getEventMessageModel(messageBody: messageBody, eventType: AAClickEventMessageModel.self)
            delegate?.aaChartView?(self, clickEventMessage: clickEventMessageModel)
        } else if message.name == kUserContentMessageNameMouseOver {
            let messageBody = message.body as! [String: Any]
            let moveOverEventMessageModel = getEventMessageModel(messageBody: messageBody, eventType: AAMoveOverEventMessageModel.self)
            delegate?.aaChartView?(self, moveOverEventMessage: moveOverEventMessageModel)
        }
    }
}


// MARK: - Event Message Model
@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
extension AAChartView {
    private func getEventMessageModel<T: AAEventMessageModel>(messageBody: [String: Any], eventType: T.Type) -> T {
        let eventMessageModel = T()
        eventMessageModel.name = messageBody["name"] as? String
        eventMessageModel.x = getFloatValue(messageBody["x"])
        eventMessageModel.y = getFloatValue(messageBody["y"])
        eventMessageModel.category = messageBody["category"] as? String
        eventMessageModel.offset = messageBody["offset"] as? [String: Any]
        eventMessageModel.index = messageBody["index"] as? Int
        return eventMessageModel
    }
    
    private func getFloatValue<T>(_ value: T?) -> Float? {
        switch value {
        case let value as Float: return value
        case let value as Int: return Float(value)
        case let value as Double: return Float(value)
        case let value as String: return Float(value)
        default:
            return nil
        }
    }
}



