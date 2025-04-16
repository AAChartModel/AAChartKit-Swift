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
   
    
    internal func drawChart() {
        if beforeDrawChartJavaScript != nil {
            #if DEBUG
            print("📝 \(beforeDrawChartJavaScript ?? "")")
            #endif
            safeEvaluateJavaScriptString(beforeDrawChartJavaScript!)
            beforeDrawChartJavaScript = nil
        }
        
        //Add `frame.size.height` to solve the problem that the height of the new version of Highcharts chart will not adapt to the container
        let jsStr = "loadTheHighChartView('\(optionsJson ?? "")','\(contentWidth ?? 0)','\(contentHeight ?? 0)');"
        safeEvaluateJavaScriptString(jsStr)
        
        if afterDrawChartJavaScript != nil {
            #if DEBUG
            print("📝 \(afterDrawChartJavaScript ?? "")")
            #endif
            safeEvaluateJavaScriptString(afterDrawChartJavaScript!)
            afterDrawChartJavaScript = nil
        }
    }
    
    internal func safeEvaluateJavaScriptString (_ jsString: String) {
        if optionsJson == nil {
            #if DEBUG
            print("💀💀💀AAChartView did not finish loading!!!")
            #endif
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
    
    internal func configureOptionsJsonStringWithAAOptions(_ aaOptions: AAOptions) {
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
        
        #if DEBUG
        if shouldPrintOptionsJSON {
            let modelJsonDic = aaOptions.toDic()
            let data = try? JSONSerialization.data(withJSONObject: modelJsonDic, options: .prettyPrinted)
            if data != nil {
                let prettyPrintedModelJson = String(data: data!, encoding: String.Encoding.utf8)
                print("""
                
                -----------🖨🖨🖨 console log AAOptions JSON information of AAChartView 🖨🖨🖨-----------:
                \(prettyPrintedModelJson!)
                
                """)
            }
        }
        #endif
        
        optionsJson = aaOptions.toJSON()
    }
    
    private func addClickEventMessageHandler() {
        configuration.userContentController.removeScriptMessageHandler(forName: kUserContentMessageNameClick)
        configuration.userContentController.add(AALeakAvoider.init(delegate: self), name: kUserContentMessageNameClick)
    }
    
    private func addMouseOverEventMessageHandler() {
        configuration.userContentController.removeScriptMessageHandler(forName: kUserContentMessageNameMouseOver)
        configuration.userContentController.add(AALeakAvoider.init(delegate: self), name: kUserContentMessageNameMouseOver)
    }
    

    deinit {
        configuration.userContentController.removeAllUserScripts()
        NotificationCenter.default.removeObserver(self)
        #if DEBUG
        print("👻👻👻 AAChartView instance \(self) has been destroyed!")
        #endif
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
        drawChart()
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


