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
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

import UIKit
import WebKit
public class AAChartView: UIView {
    
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
                let jsStr = "setChartSeriesHidden(`\(newValue!)`)"
                evaluateJavaScriptWithFunctionNameString(jsStr)
                print(jsStr)
                
            }
        }
    }
    
    /// Content width of AAChartView
    public var contentWidth: CGFloat? {
        willSet {
            if optionsJson != nil {
                let jsStr = "setTheChartViewContentWidth(`\(newValue!)`)"
                evaluateJavaScriptWithFunctionNameString(jsStr)
            }
        }
    }
    
    /// Content height of AAChartView
    public var contentHeight: CGFloat? {
        willSet {
            if optionsJson != nil {
                let jsStr = "setTheChartViewContentHeight(`\(newValue!)`)"
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
            wkWebView = WKWebView()
            wkWebView?.backgroundColor = .white
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
    
    private func configureTheJavaScriptString(_ chartModel: AAChartModel) {
        let modelString = chartModel.toJSON()
        let chartViewContentWidth = contentWidth
        
        var chartViewContentHeight = contentHeight
        if contentHeight == 0 {
            chartViewContentHeight = frame.size.height
        }
        
        let jsString = NSString.localizedStringWithFormat("loadTheHighChartView('%@','%f','%f');",
                                                          modelString!,
                                                          chartViewContentWidth!,
                                                          chartViewContentHeight!)
        optionsJson = jsString as String;
    }
}

extension AAChartView: WKNavigationDelegate,UIWebViewDelegate {
    open func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        drawChart()
    }
    
    open func webViewDidFinishLoad(_ webView: UIWebView) {
        drawChart()
    }
    
    private func evaluateJavaScriptWithFunctionNameString (_ jsString: String) {
        if #available(iOS 9.0, *) {
            wkWebView?.evaluateJavaScript(jsString, completionHandler: { (item, error) in
                if ((error) != nil) {
                    let errorInfo =
                    """
                    
                    ☠️☠️💀☠️☠️WARNING!!!!!!!!!!!!!!!!!!!! FBI WARNING !!!!!!!!!!!!!!!!!!!! WARNING☠️☠️💀☠️☠️
                    ==========================================================================================
                    ------------------------------------------------------------------------------------------
                    \(error! as CVarArg)
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
}


extension AAChartView {
    /// Function of drawing chart view
    ///
    /// - Parameter chartModel: The instance object of chart model
    public func aa_drawChartWithChartModel(_ chartModel: AAChartModel) {
        if optionsJson == nil {
            configureTheJavaScriptString(chartModel)
            let path = Bundle.main.path(forResource: "AAChartView",
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
            configureTheJavaScriptString(chartModel)
            drawChart()
        }
    }
    
    /// Function of only refresh the chart data
    ///
    /// - Parameter chartModel: The instance object of chart model
    public func aa_onlyRefreshTheChartDataWithChartModelSeries(_ chartModelSeries: [[String: AnyObject]]) {
        let jsonData = try! JSONSerialization.data(withJSONObject: chartModelSeries,
                                                   options: JSONSerialization.WritingOptions.prettyPrinted)
        var str = String(data: jsonData, encoding: String.Encoding.utf8)!
        str = str.replacingOccurrences(of: "\n", with: "") as String
        let jsStr = "onlyRefreshTheChartDataWithSeries('\(str)');"
        evaluateJavaScriptWithFunctionNameString(jsStr)
    }
    
    ///  Function of refreshing whole chart view content
    ///
    /// - Parameter chartModel: The instance object of chart model
    public func aa_refreshChartWholeContentWithChartModel(_ chartModel: AAChartModel) {
        configureTheJavaScriptString(chartModel)
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
}

