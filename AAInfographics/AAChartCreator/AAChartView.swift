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
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

import UIKit
import WebKit

let kUserContentMessageNameMouseOver = "MouseOver"

@objc public protocol AAChartViewDelegate: NSObjectProtocol {
    @objc optional func aaChartViewDidFinishedLoad ()
    @objc optional func aaChartView(_ aaChartView: AAChartView, moveOverEventMessage: AAMoveOverEventMessageModel)
}

public class AAMoveOverEventMessageModel: NSObject {
    var name: String?
    var x: Float?
    var y: Float?
    var category: String?
    var offset: [String: Any]?
    var index: Int?
}

public class AAChartView: UIView {
    public var delegate: AAChartViewDelegate?
    
    public var scrollEnabled: Bool? {
        willSet {
            if #available(iOS 9.0, *) {
                wkWebView?.scrollView.isScrollEnabled = newValue!
            } else {
                // Fallback on earlier versions
                uiWebView?.scrollView.isScrollEnabled = newValue!
            }
        }
    }
    
    public var isClearBackgroundColor: Bool? {
        willSet {
            if newValue! == true {
                backgroundColor = .clear
                if #available(iOS 9.0, *) {
                    wkWebView?.backgroundColor = .clear
                    wkWebView?.isOpaque = false
                } else {
                    // Fallback on earlier versions
                    uiWebView?.backgroundColor = .clear
                    uiWebView?.isOpaque = false
                }
            }
        }
    }
    
    public var isSeriesHidden: Bool? {
        willSet {
            if optionsJson != nil {
                let jsStr = "setChartSeriesHidden(\(newValue!))"
                evaluateJavaScriptWithFunctionNameString(jsStr)
                print(jsStr)
                
            }
        }
    }
    
    /// Content width of AAChartView
    public var contentWidth: CGFloat? {
        willSet {
            if optionsJson != nil {
                let jsStr = "setTheChartViewContentWidth('\(newValue!)')"
                evaluateJavaScriptWithFunctionNameString(jsStr)
            }
        }
    }
    
    /// Content height of AAChartView
    public var contentHeight: CGFloat? {
        willSet {
            if optionsJson != nil {
                let jsStr = "setTheChartViewContentHeight('\(newValue!)')"
                evaluateJavaScriptWithFunctionNameString(jsStr)
            }
        }
    }
    
    private var wkWebView: WKWebView?
    private var uiWebView: UIWebView?
    private var optionsJson: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpBasicView()
    }
    
    private func setUpBasicView() {
        contentWidth = 0
        contentHeight = 0
        //        backgroundColor =  .white
        if #available(iOS 9.0, *) {
            let userContentController = WKUserContentController()
            userContentController.add(self as WKScriptMessageHandler, name: kUserContentMessageNameMouseOver)
            let configuration = WKWebViewConfiguration()
            configuration.userContentController = userContentController
            
            wkWebView = WKWebView.init(frame: .zero, configuration: configuration)
            wkWebView?.backgroundColor = .white
//            wkWebView?.uiDelegate = self
            wkWebView?.navigationDelegate = self
            addSubview(wkWebView!)
            wkWebView?.translatesAutoresizingMaskIntoConstraints = false
            wkWebView?.superview!.addConstraints(configureTheConstraintArray(childView: wkWebView!,
                                                                             fatherView: self)) //Note:父控件添加约束
        } else {
            // Fallback on earlier versions
            uiWebView = UIWebView()
            uiWebView?.backgroundColor = .white
            uiWebView?.delegate = self
            addSubview(uiWebView!)
            uiWebView?.translatesAutoresizingMaskIntoConstraints = false
            uiWebView?.superview!.addConstraints(configureTheConstraintArray(childView: uiWebView!,
                                                                             fatherView: self)) //Note:父控件添加约束
        }
    }
    
    private func configureTheConstraintArray(childView: UIView, fatherView: UIView) -> [NSLayoutConstraint] {
        return [NSLayoutConstraint(item: childView,
                                   attribute: .left,
                                   relatedBy: .equal,
                                   toItem: fatherView,
                                   attribute: .left,
                                   multiplier: 1,
                                   constant: 0),
                NSLayoutConstraint(item: childView,
                                   attribute: .right,
                                   relatedBy: .equal,
                                   toItem: fatherView,
                                   attribute: .right,
                                   multiplier: 1,
                                   constant: 0),
                NSLayoutConstraint(item: childView,
                                   attribute: .top,
                                   relatedBy: .equal,
                                   toItem: fatherView,
                                   attribute: .top,
                                   multiplier: 1,
                                   constant: 0),
                NSLayoutConstraint(item: childView,
                                   attribute: .bottom,
                                   relatedBy: .equal,
                                   toItem: fatherView,
                                   attribute: .bottom,
                                   multiplier: 1,
                                   constant: 0)]
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawChart() {
        evaluateJavaScriptWithFunctionNameString(optionsJson!)
    }
    
    private func evaluateJavaScriptWithFunctionNameString (_ jsString: String) {
        if #available(iOS 9.0, *) {
            wkWebView?.evaluateJavaScript(jsString, completionHandler: { (item, error) in
                if error != nil {
                    let objcError = error! as NSError
                    let errorUserInfo = objcError.userInfo
                    
                    let errorInfo =
                    """
                    
                    ☠️☠️💀☠️☠️WARNING!!!!!!!!!!!!!!!!!!!! FBI WARNING !!!!!!!!!!!!!!!!!!!! WARNING☠️☠️💀☠️☠️
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
                    ------------------------------------------------------------------------------------------
                    ==========================================================================================
                    ☠️☠️💀☠️☠️WARNING!!!!!!!!!!!!!!!!!!!! FBI WARNING !!!!!!!!!!!!!!!!!!!! WARNING☠️☠️💀☠️☠️
                    
                    """
                    print(errorInfo)
                }
            })
        } else {
            // Fallback on earlier versions
            uiWebView?.stringByEvaluatingJavaScript(from: jsString)
        }
    }
    
    private func configureTheJavaScriptStringWithOptions(_ chartOptions: NSMutableDictionary) {
        let modelJsonDic = chartOptions
        let modelJsonData = try! JSONSerialization.data(withJSONObject: modelJsonDic,
                                                        options: JSONSerialization.WritingOptions.prettyPrinted)
        var modelJsonStr = String(data: modelJsonData, encoding: String.Encoding.utf8)!
        modelJsonStr = modelJsonStr.replacingOccurrences(of: "\n", with: "") as String
        
        let jsString = NSString.localizedStringWithFormat("loadTheHighChartView('%@','%f','%f');",
                                                          modelJsonStr,
                                                          contentWidth ?? 0,
                                                          contentHeight ?? 0)
        optionsJson = jsString as String;
    }
}

extension AAChartView {
    /// Function of drawing chart view
    ///
    /// - Parameter chartModel: The instance object of chart model
    public func aa_drawChartWithChartModel(_ chartModel: AAChartModel) {
        let options = AAOptionsConstructor.configureAAoptions(aaChartModel: chartModel)
        aa_drawChartWithChartOptions(options)
    }
    
    /// Function of only refresh the chart data
    ///
    /// - Parameter chartModel: The instance object of chart model
    public func aa_onlyRefreshTheChartDataWithChartModelSeries(_ chartModelSeries: [[String: AnyObject]]) {
        aa_onlyRefreshTheChartDataWithChartOptionsSeries(chartModelSeries)
    }
    
    ///  Function of refreshing whole chart view content
    ///
    /// - Parameter chartModel: The instance object of chart model
    public func aa_refreshChartWholeContentWithChartModel(_ chartModel: AAChartModel) {
        let options = AAOptionsConstructor.configureAAoptions(aaChartModel: chartModel)
        aa_refreshChartWholeContentWithChartOptions(options)
    }
    
    public func aa_drawChartWithChartOptions(_ options: NSMutableDictionary) {
        if optionsJson == nil {
            configureTheJavaScriptStringWithOptions(options)
            let path = Bundle(for: self.classForCoder)
                .path(forResource: "AAChartView",
                      ofType: "html",
                      inDirectory: "AAJSFiles.bundle")
            let urlStr = NSURL.fileURL(withPath: path!)
            let urlRequest = NSURLRequest(url: urlStr) as URLRequest
            if #available(iOS 9.0, *) {
                wkWebView?.load(urlRequest)
            } else {
                // Fallback on earlier versions
                uiWebView?.loadRequest(urlRequest)
            }
        } else {
            configureTheJavaScriptStringWithOptions(options)
            drawChart()
        }
    }
    
    public func aa_onlyRefreshTheChartDataWithChartOptionsSeries(_ chartModelSeries: [[String: AnyObject]]) {
        let jsonData = try! JSONSerialization.data(withJSONObject: chartModelSeries,
                                                   options: JSONSerialization.WritingOptions.prettyPrinted)
        var str = String(data: jsonData, encoding: String.Encoding.utf8)!
        str = str.replacingOccurrences(of: "\n", with: "") as String
        let jsStr = "onlyRefreshTheChartDataWithSeries('\(str)');"
        evaluateJavaScriptWithFunctionNameString(jsStr)
    }
    
    public func aa_refreshChartWholeContentWithChartOptions(_ options: NSMutableDictionary) {
        configureTheJavaScriptStringWithOptions(options)
        drawChart()
    }
    
    /// Show the series element content with index
    ///
    /// - Parameter elementIndex: elementIndex element index
    public func aa_showTheSeriesElementContentWithSeriesElementIndex(_ elementIndex: NSInteger) {
        let jsStr = "showTheSeriesElementContentWithIndex('\(elementIndex)');"
        evaluateJavaScriptWithFunctionNameString(jsStr)
    }
    
    ///  Hide the series element content with index
    ///
    /// - Parameter elementIndex: element index
    public func aa_hideTheSeriesElementContentWithSeriesElementIndex(_ elementIndex: NSInteger) {
        let jsStr = "hideTheSeriesElementContentWithIndex('\(elementIndex)');"
        evaluateJavaScriptWithFunctionNameString(jsStr as String)
    }
    
    ///  Evaluate JavaScript string function body
    ///
    /// - Parameter JSFunctionBodyString: JavaScript function body string
    public func evaluateJavaScriptStringFunction(JSFunctionString: String) {
        if optionsJson != nil {
            var pureJSFunctionStr = JSFunctionString
            pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\\", with: "\\\\")
            pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\"", with: "\\\"")
            pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\'", with: "\\\'")
            pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\n", with: "\\n")
            pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\r", with: "\\r")
            pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\u{000C}", with: "\\f")
            pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\u{2028}", with: "\\u2028")
            pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\u{2029}", with: "\\u2029")
            
            let jsFunctionNameStr = "evaluateTheJavaScriptStringFunction('\(pureJSFunctionStr)')"
            evaluateJavaScriptWithFunctionNameString(jsFunctionNameStr)
        }
    }
}


extension AAChartView: WKUIDelegate {
    open func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: "FBI WARNING", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (action) in
            completionHandler()
        }))
        let rootVC = UIApplication.shared.keyWindow?.rootViewController
        rootVC!.present(alert, animated: true, completion: nil)
        print(message)
    }
}

extension AAChartView:  WKNavigationDelegate, UIWebViewDelegate {
    open func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        drawChart()
        self.delegate?.aaChartViewDidFinishedLoad!()
    }
    
    open func webViewDidFinishLoad(_ webView: UIWebView) {
        drawChart()
        self.delegate?.aaChartViewDidFinishedLoad!()
    }
}

extension AAChartView: WKScriptMessageHandler {
    open func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == kUserContentMessageNameMouseOver {
            if self.delegate != nil {
                let eventMessageModel = AAMoveOverEventMessageModel()
                let messageBody = message.body as! [String: Any]
                eventMessageModel.name = messageBody["name"] as? String
                eventMessageModel.x = messageBody["x"] as? Float
                eventMessageModel.y = messageBody["y"] as? Float
                eventMessageModel.category = messageBody["category"] as? String
                eventMessageModel.offset = messageBody["offset"] as? [String: Any]
                eventMessageModel.index = messageBody["index"] as? Int
                self.delegate?.aaChartView?(self, moveOverEventMessage: eventMessageModel)
            }
        }
    }
}
