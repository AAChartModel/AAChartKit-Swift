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

#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif
import WebKit

let kUserContentMessageNameClick = "click"
let kUserContentMessageNameMouseOver = "mouseover"

@available(iOS 9.0, macCatalyst 13.0, macOS 10.11, *)
@objc public protocol AAChartViewDelegate: NSObjectProtocol {
    @objc optional func aaChartViewDidFinishLoad(_ aaChartView: AAChartView)
    @objc optional func aaChartViewDidFinishEvaluate(_ aaChartView: AAChartView)
    @objc optional func aaChartView(_ aaChartView: AAChartView, clickEventMessage: AAClickEventMessageModel)
    @objc optional func aaChartView(_ aaChartView: AAChartView, moveOverEventMessage: AAMoveOverEventMessageModel)
}

@available(iOS 9.0, macCatalyst 13.0, macOS 10.11, *)
public class AAEventMessageModel: NSObject {
    public var name: String?
    public var x: Float?
    public var y: Float?
    public var category: String?
    public var offset: [String: Any]?
    public var index: Int?
}

@available(iOS 9.0, macCatalyst 13.0, macOS 10.11, *)
public class AAClickEventMessageModel: AAEventMessageModel {}

@available(iOS 9.0, macCatalyst 13.0, macOS 10.11, *)
public class AAMoveOverEventMessageModel: AAEventMessageModel {}

//Refer to: https://stackoverflow.com/questions/26383031/wkwebview-causes-my-view-controller-to-leak
@available(iOS 9.0, macCatalyst 13.0, macOS 10.11, *)
class AALeakAvoider : NSObject, WKScriptMessageHandler {
    weak var delegate : WKScriptMessageHandler?
    
    init(delegate:WKScriptMessageHandler) {
        self.delegate = delegate
        super.init()
    }
    
    func userContentController(
        _ userContentController: WKUserContentController,
        didReceive message: WKScriptMessage
    ) {
        delegate?.userContentController(userContentController, didReceive: message)
    }
}

@available(iOS 9.0, macCatalyst 13.0, macOS 10.11, *)
public class AAChartView: WKWebView {
    private var clickEventEnabled: Bool?
    private var touchEventEnabled: Bool?
    
    private weak var _delegate: AAChartViewDelegate?
    public weak var delegate: AAChartViewDelegate? {
        set {
            assert(optionsJson == nil, "You should set the delegate before drawing the chart")//To Make sure the clickEventEnabled and touchEventEnabled properties are working correctly

            _delegate = newValue
            if newValue?.responds(to: #selector(AAChartViewDelegate.aaChartView(_:clickEventMessage:))) != nil {
                clickEventEnabled = true
                addClickEventMessageHandler()
            }
            if newValue?.responds(to: #selector(AAChartViewDelegate.aaChartView(_:moveOverEventMessage:))) != nil {
                touchEventEnabled = true
                addMouseOverEventMessageHandler()
            }
        }
        get {
            return _delegate
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
    
    private var optionsJson: String?
    
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
   
    
    private func drawChart() {
        let jsStr = "loadTheHighChartView('\(optionsJson ?? "")','\(contentWidth ?? 0)','\(contentHeight ?? 0)')"
        safeEvaluateJavaScriptString(jsStr)
    }
    
    private func safeEvaluateJavaScriptString (_ jsString: String) {
        
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
                
                ☠️☠️💀☠️☠️WARNING!!!!!!!!!!!!!!!!!!!! FBI WARNING !!!!!!!!!!!!!!!!!!!!WARNING☠️☠️💀☠️☠️
                ==========================================================================================
                ------------------------------------------------------------------------------------------
                code = \(objcError.code);
                domain = \(objcError.domain);
                userInfo =     {
                NSLocalizedDescription = "A JavaScript exception occurred";
                WKJavaScriptExceptionColumnNumber = \(errorUserInfo["WKJavaScriptExceptionColumnNumber"] ?? "");
                WKJavaScriptExceptionLineNumber = \(errorUserInfo["WKJavaScriptExceptionLineNumber"]  ?? "");
                WKJavaScriptExceptionMessage = \(errorUserInfo["WKJavaScriptExceptionMessage"] ?? "");
                WKJavaScriptExceptionSourceURL = \(errorUserInfo["WKJavaScriptExceptionSourceURL"] ?? "");
                }
                ------------------------------------------------------------------------------------------
                ==========================================================================================
                ☠️☠️💀☠️☠️WARNING!!!!!!!!!!!!!!!!!!!! FBI WARNING !!!!!!!!!!!!!!!!!!!!WARNING☠️☠️💀☠️☠️
                
                """
                print(errorInfo)
            }
            #endif

            self.delegate?.aaChartViewDidFinishEvaluate?(self)
        })
    }
    
    private func configureOptionsJsonStringWithAAOptions(_ aaOptions: AAOptions) {
        if isClearBackgroundColor == true {
            aaOptions.chart?.backgroundColor = "rgba(0,0,0,0)"
        }
        
        if clickEventEnabled == true {
            aaOptions.clickEventEnabled = true
        }
        if touchEventEnabled == true {
            aaOptions.touchEventEnabled = true
        }
        
        #if DEBUG
        let modelJsonDic = aaOptions.toDic()!
        let data = try? JSONSerialization.data(withJSONObject: modelJsonDic, options: .prettyPrinted)
        if data != nil {
            let prettyPrintedModelJson = String(data: data!, encoding: String.Encoding.utf8)
            print("""
                -----------🖨🖨🖨 console log AAOptions JSON information of AAChartView 🖨🖨🖨-----------:
                \(prettyPrintedModelJson!)
                """)
        }
        #endif
        
        optionsJson = aaOptions.toJSON()!
    }
    
    private func addClickEventMessageHandler() {
        configuration.userContentController.add(AALeakAvoider.init(delegate: self), name: kUserContentMessageNameClick)
    }
    
    private func addMouseOverEventMessageHandler() {
        configuration.userContentController.add(AALeakAvoider.init(delegate: self), name: kUserContentMessageNameMouseOver)
    }
    

    deinit {
        configuration.userContentController.removeAllUserScripts()
        NotificationCenter.default.removeObserver(self)
        #if DEBUG
        print("👻👻👻 AAChartView was destroyed!!!")
        #endif
    }

}


// MARK: - Configure Chart View Content With AAChartModel
@available(iOS 9.0, macCatalyst 13.0, macOS 10.11, *)
extension AAChartView {
    /// Function of drawing chart view
    ///
    /// - Parameter aaChartModel: The instance object of AAChartModel
    public func aa_drawChartWithChartModel(_ aaChartModel: AAChartModel) {
        let aaOptions = aaChartModel.aa_toAAOptions()
        aa_drawChartWithChartOptions(aaOptions)
    }
    
    /// Function of only refresh the chart data after the chart has been rendered
    ///
    /// - Parameter chartModel: chart model series  array
    public func aa_onlyRefreshTheChartDataWithChartModelSeries(_ chartModelSeries: [AASeriesElement]) {
        aa_onlyRefreshTheChartDataWithChartOptionsSeries(chartModelSeries)
    }
    
    /// Function of only refresh the chart data after the chart has been rendered
    ///
    /// - Parameter chartModel: chart model series  array
    /// - Parameter animation: enable animation effect or not
    public func aa_onlyRefreshTheChartDataWithChartModelSeries(_ chartModelSeries: [AASeriesElement], animation: Bool) {
        aa_onlyRefreshTheChartDataWithChartOptionsSeries(chartModelSeries, animation: animation)
    }
    
    ///  Function of refreshing whole chart view content after the chart has been rendered
    ///
    /// - Parameter aaChartModel: The instance object of AAChartModel
    public func aa_refreshChartWholeContentWithChartModel(_ aaChartModel: AAChartModel) {
        let aaOptions = aaChartModel.aa_toAAOptions()
        aa_refreshChartWholeContentWithChartOptions(aaOptions)
    }
}

// MARK: - Configure Chart View Content With AAOptions
@available(iOS 9.0, macCatalyst 13.0, macOS 10.11, *)
extension AAChartView {
    /// Function of drawing chart view
    ///
    /// - Parameter aaOptions: The instance object of AAOptions model
    public func aa_drawChartWithChartOptions(_ aaOptions: AAOptions) {
        if optionsJson == nil {
            configureOptionsJsonStringWithAAOptions(aaOptions)
            let path = BundlePathLoader()
                .path(forResource: "AAChartView",
                      ofType: "html",
                      inDirectory: "AAJSFiles.bundle")
            let urlStr = NSURL.fileURL(withPath: path!)
            let urlRequest = NSURLRequest(url: urlStr) as URLRequest
            load(urlRequest)
        } else {
            aa_refreshChartWholeContentWithChartOptions(aaOptions)
        }
    }
    
    /// Function of only refresh the chart data after the chart has been rendered
    ///
    /// - Parameter chartOptionsSeries: chart options series  array
    public func aa_onlyRefreshTheChartDataWithChartOptionsSeries(_ chartOptionsSeries: [AASeriesElement]) {
      aa_onlyRefreshTheChartDataWithChartOptionsSeries(chartOptionsSeries, animation: true)
    }
    
    /// Function of only refresh the chart data after the chart has been rendered
    ///
    /// - Parameter chartOptionsSeries: chart options series  array
    /// - Parameter animation: enable animation effect or not
    public func aa_onlyRefreshTheChartDataWithChartOptionsSeries(_ chartOptionsSeries: [AASeriesElement], animation: Bool) {
        var seriesElementDicArr = [[String: Any]]()
        chartOptionsSeries.forEach { (aaSeriesElement) in
            seriesElementDicArr.append(aaSeriesElement.toDic()!)
        }
        
         let str = getJSONStringFromArray(array: seriesElementDicArr)
         let jsStr = "onlyRefreshTheChartDataWithSeries('\(str)','\(animation)');"
         safeEvaluateJavaScriptString(jsStr)
     }
    
    ///  Function of refreshing whole chart view content after the chart has been rendered
    ///
    /// - Parameter aaOptions: The instance object of AAOptions model
    public func aa_refreshChartWholeContentWithChartOptions(_ aaOptions: AAOptions) {
        configureOptionsJsonStringWithAAOptions(aaOptions)
        drawChart()
    }
}

// MARK: - Addtional update Chart View Content methods
@available(iOS 9.0, macCatalyst 13.0, macOS 10.11, *)
extension AAChartView {
    /// A common chart update function
    /// (you can update any chart element) to open, close, delete, add, resize, reformat, etc. elements in the chart.
    /// Refer to https://api.highcharts.com.cn/highcharts#Chart.update
    ///
    /// It should be noted that when updating the array configuration,
    /// for example, when updating configuration attributes including arrays such as xAxis, yAxis, series, etc., the updated data will find existing objects based on id and update them. If no id is configured or passed If the id does not find the corresponding object, the first element of the array is updated. Please refer to this example for details.
    ///
    /// In a responsive configuration, the response of the different rules responsive.rules is actually calling chart.update, and the updated content is configured in chartOptions.
    ///
    /// - Parameter options: A configuration object for the new chart options as defined in the options section of the API.
    /// - Parameter redraw: Whether to redraw after updating the chart, the default is true
    public func aa_updateChart(options: AAObject, redraw: Bool) {
        let isOptionsClass: Bool = options is AAOptions
        let optionsDic = options.toDic()
        let finalOptionsDic: [String : Any]!
        
        if isOptionsClass == true {
            finalOptionsDic = optionsDic
        } else {
            var classNameStr = options.classNameString
            if classNameStr.contains(".") {
                classNameStr = classNameStr.components(separatedBy: ".")[1];
            }
            
            classNameStr = classNameStr.replacingOccurrences(of: "AA", with: "")
            
            //convert fisrt character to be lowercase string
            let firstChar = classNameStr.prefix(1)
            let lowercaseFirstChar = firstChar.lowercased()
            let index = classNameStr.index(classNameStr.startIndex, offsetBy: 1)
            classNameStr = String(classNameStr.suffix(from: index))
            let finalClassNameStr = lowercaseFirstChar + classNameStr
            finalOptionsDic = [finalClassNameStr: optionsDic as Any]
        }
                
        let optionsStr = getJSONStringFromDictionary(dictionary: finalOptionsDic)
        let jsStr = "updateChart('\(optionsStr)','\(redraw)')"
        safeEvaluateJavaScriptString(jsStr)
    }
    
    public func aa_addPointToChartSeriesElement(elementIndex: Int, options: Any) {
        aa_addPointToChartSeriesElement(
            elementIndex: elementIndex,
            options: options,
            shift: true
        )
    }
    
    public func aa_addPointToChartSeriesElement(
        elementIndex: Int,
        options: Any,
        shift: Bool
    ) {
        aa_addPointToChartSeriesElement(
            elementIndex: elementIndex,
            options: options,
            redraw: true,
            shift: shift,
            animation: true
        )
    }
    
    /// Add a new point to the data column after the chart has been rendered.
    /// The new point can be the last point, or it can be placed in the corresponding position given the X value (first, middle position, depending on the x value)
    /// Refer to https://api.highcharts.com.cn/highcharts#Series.addPoint
    ///
    /// - Parameter elementIndex: The specific series element
    /// - Parameter options: The configuration of the data point can be a single value, indicating the y value of the data point; it can also be an array containing x and y values; it can also be an object containing detailed data point configuration. For detailed configuration, see series.data.
    /// - Parameter redraw: The default is true, whether to redraw the icon after the operation is completed. When you need to add more than one point, it is highly recommended to set redraw to false and manually call chart.redraw() to redraw the chart after all operations have ended.
    /// - Parameter shift: The default is false. When this property is true, adding a new point will delete the first point in the data column (that is, keep the total number of data points in the data column unchanged). This property is very useful in the inspection chart
    /// - Parameter animation: The default is true, which means that when adding a point, it contains the default animation effect. This parameter can also be passed to the object form containing duration and easing. For details, refer to the animation related configuration.
    public func aa_addPointToChartSeriesElement(
        elementIndex: Int,
        options: Any,
        redraw: Bool,
        shift: Bool,
        animation: Bool
    ) {
        var optionsStr = ""
        if options is Int || options is Float || options is Double {
            optionsStr = "\(options)"
        } else if options is [Any] {
            optionsStr = getJSONStringFromArray(array: options as! [Any])
        } else {
            let aaOption: AAObject = options as! AAObject
            optionsStr = aaOption.toJSON()!
        }
    
        let javaScriptStr = "addPointToChartSeries('\(elementIndex)','\(optionsStr)','\(redraw)','\(shift)','\(animation)')"
        safeEvaluateJavaScriptString(javaScriptStr)
    }
    
    /// Add a new group of points to the data column after the chart has been rendered.
    ///
    public func aa_addPointsToChartSeriesArray(
        optionsArr: [Any],
        shift: Bool = true,
        animation: Bool = true
    ) {
        for (index, options) in optionsArr.enumerated() {
            aa_addPointToChartSeriesElement(
                elementIndex: index,
                options: options,
                redraw: false,
                shift: shift,
                animation: false
            )
        }
        
        aa_redraw(animation: animation)
    }
    
    /// Add a new series element to the chart after the chart has been rendered.
    /// Refer to https://api.highcharts.com.cn/highcharts#Chart.addSeries
    ///
    /// - Parameter element: chart series element
    public func aa_addElementToChartSeries(element: AASeriesElement) {
        let elementJson = element.toJSON()!
        let pureElementJsonStr = elementJson.aa_toPureJSString()
        let jsStr = "addElementToChartSeriesWithElement('\(pureElementJsonStr)')"
        safeEvaluateJavaScriptString(jsStr)
    }
    
    /// Remove a specific series element from the chart after the chart has been rendered.
    /// Refer to https://api.highcharts.com.cn/highcharts#Series.remove
    ///
    /// - Parameter elementIndex: chart series element index
    public func aa_removeElementFromChartSeries(elementIndex: Int) {
        let jsStr = "removeElementFromChartSeriesWithElementIndex('\(elementIndex)')"
        safeEvaluateJavaScriptString(jsStr)
    }
    
    /// Show the series element content with index
    ///
    /// - Parameter elementIndex: elementIndex element index
    public func aa_showTheSeriesElementContentWithSeriesElementIndex(_ elementIndex: NSInteger) {
        let jsStr = "showTheSeriesElementContentWithIndex('\(elementIndex)');"
        safeEvaluateJavaScriptString(jsStr)
    }
    
    ///  Hide the series element content with index
    ///
    /// - Parameter elementIndex: element index
    public func aa_hideTheSeriesElementContentWithSeriesElementIndex(_ elementIndex: NSInteger) {
        let jsStr = "hideTheSeriesElementContentWithIndex('\(elementIndex)');"
        safeEvaluateJavaScriptString(jsStr as String)
    }
    
    ///  Evaluate JavaScript string function body
    ///
    /// - Parameter JSFunctionBodyString: valid JavaScript function body string
    public func aa_evaluateJavaScriptStringFunction(_ JSFunctionString: String) {
        if optionsJson != nil {
            let pureJSFunctionStr = JSFunctionString.aa_toPureJSString()
            let jsFunctionNameStr = "evaluateTheJavaScriptStringFunction('\(pureJSFunctionStr)')"
            safeEvaluateJavaScriptString(jsFunctionNameStr)
        }
    }
    
    /// Update the X axis categories of chart
    /// - Parameters:
    ///   - categories: The X axis categories array
    ///   - redraw: Redraw whole chart or not
    public func aa_updateXAxisCategories(_ categories: [String], redraw: Bool = true) {
        let finalJSArrStr = categories.aa_toJSArray()
        let jsFunctionStr = "aaGlobalChart.xAxis[0].setCategories(\(finalJSArrStr),\(redraw));"
        safeEvaluateJavaScriptString(jsFunctionStr)
    }
    
    /// Update the X axis Extremes
    /// - Parameters:
    ///   - min: X axis minimum
    ///   - max: X axis maximum
    public func aa_updateXAxisExtremes(min: Int, max: Int) {
        let jsStr = "aaGlobalChart.xAxis[0].setExtremes(\(min), \(max))"
        safeEvaluateJavaScriptString(jsStr)
    }
    
    /// Redraw chart view
    /// - Parameter animation: Have animation effect or not
    public func aa_redraw(animation: Bool = true) {
        let jsStr = "redrawWithAnimation('\(animation)')"
        safeEvaluateJavaScriptString(jsStr)
    }
    
    #if os(iOS)
    /// Set the chart view content be adaptive to screen rotation with default animation effect
    public func aa_adaptiveScreenRotation() {
        let aaAnimation = AAAnimation()
            .duration(800)
            .easing(.easeOutQuart)
        aa_adaptiveScreenRotationWithAnimation(aaAnimation)
    }

    /// Set the chart view content be adaptive to screen rotation with custom animation effect
    /// Refer to https://api.highcharts.com.cn/highcharts#Chart.setSize
    ///
    /// - Parameter animation: The instance object of AAAnimation
    public func aa_adaptiveScreenRotationWithAnimation(_ animation: AAAnimation) {
        NotificationCenter.default.addObserver(
            forName: UIDevice.orientationDidChangeNotification,
            object: nil,
            queue: nil) { [weak self] _ in
                self?.handleDeviceOrientationChangeEventWithAnimation(animation)
        }
    }
    
    private func handleDeviceOrientationChangeEventWithAnimation(_ animation: AAAnimation) {
        let animationJsonStr = animation.toJSON()!
        let jsFuncStr = "changeChartSize('\(frame.size.width)','\(frame.size.height)','\(animationJsonStr)')"
        safeEvaluateJavaScriptString(jsFuncStr)
    }
    #endif
}

// MARK: - WKUIDelegate
@available(iOS 9.0, macCatalyst 13.0, macOS 10.11, *)
extension AAChartView: WKUIDelegate {
    open func webView(
        _ webView: WKWebView,
        runJavaScriptAlertPanelWithMessage message: String,
        initiatedByFrame frame: WKFrameInfo,
        completionHandler: @escaping () -> Void
    ) {
        #if os(iOS)
        let alertController = UIAlertController(
            title: "FBI WARNING",
            message: message,
            preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(
            title: "Okay",
            style: .default,
            handler: { _ in
            completionHandler()
        }))

        let alertHelperController = UIViewController()
        addSubview(alertHelperController.view)

        alertHelperController.present(
            alertController,
            animated: true,
            completion: nil
        )
        #elseif os(macOS)
        let alert = NSAlert()
        alert.alertStyle = .warning
        alert.messageText = "FBI WARNING"
        alert.informativeText = message
        alert.addButton(withTitle: "Okay")
        _ = alert.runModal() == .alertFirstButtonReturn
        #endif
    }
}

// MARK: - WKNavigationDelegate
@available(iOS 9.0, macCatalyst 13.0, macOS 10.11, *)
extension AAChartView:  WKNavigationDelegate {
    open func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        drawChart()
        delegate?.aaChartViewDidFinishLoad?(self)
    }
}

// MARK: - WKScriptMessageHandler
@available(iOS 9.0, macCatalyst 13.0, macOS 10.11, *)
extension AAChartView: WKScriptMessageHandler {
    open func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == kUserContentMessageNameClick {
            let messageBody = message.body as! [String: Any]
            let eventMessageModel = getClickEventMessageModel(messageBody: messageBody)
            delegate?.aaChartView?(self, clickEventMessage: eventMessageModel )
        } else if message.name == kUserContentMessageNameMouseOver {
            let messageBody = message.body as! [String: Any]
            let eventMessageModel = getMoveOverEventMessageModel(messageBody: messageBody)
            delegate?.aaChartView?(self, moveOverEventMessage: eventMessageModel)
        }
    }
}

@available(iOS 9.0, macCatalyst 13.0, macOS 10.11, *)
extension AAChartView {
    private func getClickEventMessageModel(messageBody: [String: Any]) -> AAClickEventMessageModel {
        let eventMessageModel = getEventMessageModel(messageBody: messageBody)
        let clickMessageModel = AAClickEventMessageModel()
        clickMessageModel.name = eventMessageModel.name
        clickMessageModel.x = eventMessageModel.x
        clickMessageModel.y = eventMessageModel.y
        clickMessageModel.category = eventMessageModel.category
        clickMessageModel.offset = eventMessageModel.offset
        clickMessageModel.index = eventMessageModel.index
        return clickMessageModel
    }
    
    private func getMoveOverEventMessageModel(messageBody: [String: Any]) -> AAMoveOverEventMessageModel {
        let eventMessageModel = getEventMessageModel(messageBody: messageBody)
        let moveOverMessageModel = AAMoveOverEventMessageModel()
        moveOverMessageModel.name = eventMessageModel.name
        moveOverMessageModel.x = eventMessageModel.x
        moveOverMessageModel.y = eventMessageModel.y
        moveOverMessageModel.category = eventMessageModel.category
        moveOverMessageModel.offset = eventMessageModel.offset
        moveOverMessageModel.index = eventMessageModel.index
        return moveOverMessageModel
    }
    
    private func getEventMessageModel(messageBody: [String: Any]) -> AAEventMessageModel {
        let eventMessageModel = AAEventMessageModel()
        eventMessageModel.name = messageBody["name"] as? String
        let x = messageBody["x"]
        if x is String {
            eventMessageModel.x = Float(x as! String)
        } else if x is Int {
            eventMessageModel.x = Float(x as! Int)
        } else if x is Float {
            eventMessageModel.x = (x as! Float)
        } else if x is Double {
            eventMessageModel.x = Float(x as! Double)
        }
        
        let y = messageBody["y"]
        if y is String {
            eventMessageModel.y = Float(y as! String)
        } else if y is Int {
            eventMessageModel.y = Float(y as! Int)
        } else if y is Float {
            eventMessageModel.y = (y as! Float)
        } else if y is Double {
            eventMessageModel.y = Float(y as! Double)
        }
        eventMessageModel.category = messageBody["category"] as? String
        eventMessageModel.offset = messageBody["offset"] as? [String: Any]
        eventMessageModel.index = messageBody["index"] as? Int
        return eventMessageModel
    }
}

// MARK: - JSONSerialization
@available(iOS 9.0, macCatalyst 13.0, macOS 10.11, *)
extension AAChartView {
    
    func getJSONStringFromDictionary(dictionary: [String: Any]) -> String {
        if !JSONSerialization.isValidJSONObject(dictionary) {
            print("❌ String object is not valid Dictionary JSON String")
            return ""
        }
        
        let data: Data = try! JSONSerialization.data(withJSONObject: dictionary, options: [])
        let JSONString = String(data: data, encoding: .utf8)
        return JSONString! as String
    }
    
    func getJSONStringFromArray(array: [Any]) -> String {
        if !JSONSerialization.isValidJSONObject(array) {
            print("❌ String object is not valid Array JSON String")
            return ""
        }
        
        let data: Data = try! JSONSerialization.data(withJSONObject: array, options: [])
        let JSONString = String(data: data, encoding: .utf8)
        return JSONString! as String
    }
    
    func getDictionaryFromJSONString(jsonString: String) -> [String: Any] {
        let jsonData: Data = jsonString.data(using: .utf8)!
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! [String: Any]
        }
        return [String: Any]()
    }
    
    func getArrayFromJSONString(jsonString: String) -> [Any] {
        let jsonData: Data = jsonString.data(using: .utf8)!
        let array = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if array != nil {
            return array as! [Any]
        }
        return [Any]()
    }
}

