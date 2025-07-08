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
public class AAChartView: WKWebView {
    let kUserContentMessageNameClick = "click"
    let kUserContentMessageNameMouseOver = "mouseover"
    
    private var clickEventEnabled: Bool?
    private var touchEventEnabled: Bool?
    private var beforeDrawChartJavaScript: String?
    private var afterDrawChartJavaScript: String?
    
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

    // Property to hold the plugin provider instance.
    private var pluginProvider: AAChartViewPluginProvider = DefaultPluginProvider()

    private var requiredPluginPaths: Set<String> = []
    private var loadedPluginPaths: Set<String> = [] // Keep track of loaded plugins

    public var userPluginPaths: Set<String> = []
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
    
    /// Determines required plugins, loads any missing ones sequentially, and then draws the chart.
    internal func loadAllPluginsAndDrawChart() {
        // 1. Determine the total set of required plugins (base requirements + user-defined)
        let totalRequiredPluginsSet = requiredPluginPaths.union(userPluginPaths)
        
        // 2. Identify plugins that are required but not yet loaded
        let pluginsToLoad = totalRequiredPluginsSet.subtracting(loadedPluginPaths)
        
        // 3. If no new plugins need loading, draw the chart immediately
        guard !pluginsToLoad.isEmpty else {
#if DEBUG
            if totalRequiredPluginsSet.isEmpty {
                print("ℹ️ No additional plugins needed for the current chart options.")
            } else {
                print("ℹ️ All required plugins (count: \(totalRequiredPluginsSet.count)) already loaded.")
                //打印 totalRequiredPluginsSet 的内容
                print("ℹ️ All required plugins: \(totalRequiredPluginsSet)")
            }
#endif
            drawChart()
            return
        }
        
        // 4. Load the necessary new plugins sequentially
        debugLog("ℹ️ Loading \(pluginsToLoad.count) new plugin scripts...")
        
        loadPluginScriptsSequentially(scriptsToLoad: pluginsToLoad) { [weak self] newlyLoadedPlugins in
            guard let self = self else { return }
            
            // 5. Update the set of all loaded plugins
            self.loadedPluginPaths.formUnion(newlyLoadedPlugins)
            
#if DEBUG
            if newlyLoadedPlugins.count < pluginsToLoad.count {
                print("⚠️ Failed to evaluate one or more new plugin scripts. Chart drawing may be affected.")
            }
            print("ℹ️ Total loaded plugins count: \(self.loadedPluginPaths.count)")
#endif
            
            // 6. Draw the chart after attempting to load new plugins
            self.drawChart()
        }
    }
    
    /// Loads a set of plugin scripts sequentially, evaluating them one by one.
    /// - Parameters:
    ///   - scriptsToLoad: A Set of file paths for the JavaScript plugins to load.
    ///   - completion: A closure called when all scripts have been attempted, passing a Set of paths for successfully loaded scripts.
    private func loadPluginScriptsSequentially(
        scriptsToLoad: Set<String>,
        completion: @escaping (Set<String>) -> Void
    ) {
        // Convert Set to Array for indexed access, maintaining order isn't critical here
        // but Array makes indexed recursion simpler than Set index manipulation.
        let scriptPathsArray = Array(scriptsToLoad)
        var successfullyLoaded = Set<String>()
        
        // Define the recursive loading function
        func loadNextScript(index: Int) {
            // Base case: All scripts in the array attempted
            guard index < scriptPathsArray.count else {
#if DEBUG
                if !scriptPathsArray.isEmpty {
                    print("✅ \(successfullyLoaded.count) out of \(scriptPathsArray.count) new plugin scripts evaluated successfully.")
                }
#endif
                completion(successfullyLoaded) // Return the set of successfully loaded scripts
                return
            }
            
            let path = scriptPathsArray[index]
            let scriptName = (path as NSString).lastPathComponent // Extract filename for logging
            
            do {
                // Read the script content
                let jsString = try String(contentsOfFile: path, encoding: .utf8)
                
                // Evaluate the script
                evaluateJavaScript(jsString) { [weak self] _, error in
                    // Use guard let to safely unwrap self and create a strong reference
                    guard let self = self else {
                        // If self is deallocated, stop loading further scripts
                        print("⚠️ AAChartView deallocated during script evaluation. Aborting plugin load.") // Direct print or use a static logger if available
                        completion(successfullyLoaded)
                        return
                    }
                    
                    if let error = error {
                        // Use self directly now, no optional chaining needed
                        self.debugLog("❌ Error evaluating new plugin script '\(scriptName)' (index \(index)): \(error)")
                        // Continue to the next script even if this one fails
                        loadNextScript(index: index + 1)
                    } else {
                        // Use self directly now, no optional chaining needed
                        self.debugLog("✅ New plugin script '\(scriptName)' (index \(index)) evaluated.")
                        successfullyLoaded.insert(path) // Add successfully evaluated script path
                        // Recursively load the next script
                        loadNextScript(index: index + 1)
                    }
                }
            } catch {
                // No change needed here as self is accessed synchronously if debugLog is called
                debugLog("❌ Failed to load plugin script file '\(scriptName)' (index \(index)): \(error)")
                // Continue to the next script even if file loading fails
                loadNextScript(index: index + 1)
            }
        }
        
        // Start loading from the first script
        loadNextScript(index: 0)
    }
    
    private func drawChart() {
        if beforeDrawChartJavaScript != nil {
            debugLog("📝 \(beforeDrawChartJavaScript ?? "")")
            safeEvaluateJavaScriptString(beforeDrawChartJavaScript!)
            beforeDrawChartJavaScript = nil
        }
        
        //Add `frame.size.height` to solve the problem that the height of the new version of Highcharts chart will not adapt to the container
        let jsStr = "loadTheHighChartView('\(optionsJson ?? "")','\(contentWidth ?? 0)','\(contentHeight ?? 0)');"
        safeEvaluateJavaScriptString(jsStr)
        
        if afterDrawChartJavaScript != nil {
            debugLog("📝 \(afterDrawChartJavaScript ?? "")")
            safeEvaluateJavaScriptString(afterDrawChartJavaScript!)
            afterDrawChartJavaScript = nil
        }
    }
    
    internal func safeEvaluateJavaScriptString (_ jsString: String) {
        if optionsJson == nil {
            debugLog("💀💀💀AAChartView did not finish loading!!!")
            return
        }
        
        evaluateJavaScript(jsString, completionHandler: { (item, error) in
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
    
    private func determineRequiredPlugins(for aaOptions: AAOptions) {
        // Use the provider to get additional required plugins based on options
        let providerPlugins = pluginProvider.getRequiredPluginPaths(for: aaOptions)
        requiredPluginPaths.formUnion(providerPlugins)

        debugLog("🔌 Determined requiredPluginPaths: \(requiredPluginPaths)")
    }
    
#if DEBUG
    private func printOptionsJSONInfo(_ aaOptions: AAOptions) {
        // --- 数据量截断处理 ---
        // 检查 series 是否为 [AASeriesElement] 类型且不为空
        if var seriesElements = aaOptions.series as? [AASeriesElement], // Make mutable for potential truncation
           !seriesElements.isEmpty {

            // 检查1 (先执行): series 数组本身元素个数是否超过 10
            if seriesElements.count > 10 {
                // 打印警告信息=>"💊 警告: 系列元素个数超过 10 个, 只打印前 10 个元素到控制台!!!"
                print("💊 Warning: Series element count more than 10, only the first 10 elements will be displayed in the console!!!")
                // 截取前 10 个 series 元素
                seriesElements = Array(seriesElements.prefix(10))
                // 更新 aaOptions.series 以便后续 JSON 序列化使用截断后的版本
                // 注意：这会修改传入的 aaOptions 对象的状态，仅用于打印目的
                aaOptions.series = seriesElements
            }

            // 检查2 (后执行): 对（可能已截断的）series 列表中的每个 series 的 data 数组元素个数进行检查
            var didTruncateData = false
            for seriesElement in seriesElements { // Iterate over the potentially truncated list
                // 使用可选绑定确保 data 存在
                if let data = seriesElement.data, data.count > 1000 {
                    // 截取前 1000 个元素
                    // 注意：这里直接修改了 seriesElement.data，仅影响后续的打印
                    seriesElement.data = Array(data.prefix(1000))
                    didTruncateData = true
                }
            }
            // 如果进行了数据截断，打印警告信息=>"💊 警告: 数据数组元素个数超过 1000 个, 只打印前 1000 个数据元素到控制台!!!"
            if didTruncateData {
                print("💊 Warning: Data array element count more than 1000, only the first 1000 data elements will be displayed in the console!!!")
            }
        }

        // --- JSON 打印 ---
        // 将（可能因为数据过长已被截断的）aaOptions 转换为字典
        let modelJsonDic = aaOptions.toDic()
        do {
            // 尝试序列化为 JSON Data
            let jsonData = try JSONSerialization.data(withJSONObject: modelJsonDic, options: .prettyPrinted)
            // 尝试将 JSON Data 转换为 UTF8 字符串，并安全解包
            if let prettyPrintedModelJson = String(data: jsonData, encoding: .utf8) {
                print("""
                            -----------🖨🖨🖨 console log AAOptions JSON information of AAChartView 🖨🖨🖨-----------:
                            \(prettyPrintedModelJson)
                            """)
            } else {
                print("⚠️ Warning: Could not convert JSON data to UTF8 string for logging.")
            }
        } catch {
            // 捕获并打印序列化错误
            print("⚠️ Warning: Could not serialize AAOptions to JSON for logging: \(error)")
        }
    }
#endif
    
    internal func configureOptionsJsonStringWithAAOptions(_ aaOptions: AAOptions) {
        // Determine required plugins using the new method and provider
        determineRequiredPlugins(for: aaOptions)

        if aaOptions.beforeDrawChartJavaScript != nil {
            beforeDrawChartJavaScript = aaOptions.beforeDrawChartJavaScript
            aaOptions.beforeDrawChartJavaScript = nil
        }

        if aaOptions.afterDrawChartJavaScript != nil {
            afterDrawChartJavaScript = aaOptions.afterDrawChartJavaScript
            aaOptions.afterDrawChartJavaScript = nil
        }

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


