//
//  AAChartView.swift
//  AAChartKit-Swift
//
//  Created by An An on 2017/5/23.
//  Copyright © 2017年 An An . All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit-Swift ***--- source code
//

/*
 
 * -------------------------------------------------------------------------------
 *
 * ❀❀❀   WARM TIPS!!!   ❀❀❀
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
class AAChartView: UIView,WKNavigationDelegate,UIWebViewDelegate {
    
    /// Content width of AAChartView
    public var contentWidth:CGFloat?
    
    /// Content height of AAChartView
    public var contentHeight:CGFloat?
    
    /// Hide chart series content or not
    public var chartSeriesHidden:Bool?

    
    private var wkWebView: WKWebView?
    private var uiWebView: UIWebView?
    private var optionsJson: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentWidth = 0
        self.contentHeight = 0
        //        self.backgroundColor =  UIColor.white
        
        if #available(iOS 9.0, *) {
            wkWebView = WKWebView()
            wkWebView?.backgroundColor = UIColor.white
            wkWebView?.navigationDelegate = self
            self.addSubview(wkWebView!)
            wkWebView?.translatesAutoresizingMaskIntoConstraints = false
            wkWebView?.superview!.addConstraints(self.configureTheConstraintArray(childView: wkWebView!, fatherView: self))//Note:父控件添加约束
        } else {
            // Fallback on earlier versions
            uiWebView = UIWebView()
            uiWebView?.backgroundColor = UIColor.white
            uiWebView?.delegate = self
            self.addSubview(uiWebView!)
            uiWebView?.translatesAutoresizingMaskIntoConstraints = false
            uiWebView?.superview!.addConstraints(self.configureTheConstraintArray(childView: uiWebView!, fatherView: self))//Note:父控件添加约束
        }
    }
    
    func configureTheConstraintArray(childView:UIView, fatherView:UIView) -> [NSLayoutConstraint] {
        return [NSLayoutConstraint(item:childView,
                                   attribute:NSLayoutAttribute.left,
                                   relatedBy:NSLayoutRelation.equal,
                                   toItem:fatherView,
                                   attribute:NSLayoutAttribute.left,
                                   multiplier:1.0,
                                   constant:0),
                NSLayoutConstraint(item:childView,
                                   attribute:NSLayoutAttribute.right,
                                   relatedBy:NSLayoutRelation.equal,
                                   toItem:fatherView,
                                   attribute:NSLayoutAttribute.right,
                                   multiplier:1.0,
                                   constant:0),
                NSLayoutConstraint(item:childView,
                                   attribute:NSLayoutAttribute.top,
                                   relatedBy:NSLayoutRelation.equal,
                                   toItem:fatherView,
                                   attribute:NSLayoutAttribute.top,
                                   multiplier:1.0,
                                   constant:0),
                NSLayoutConstraint(item:childView,
                                   attribute:NSLayoutAttribute.bottom,
                                   relatedBy:NSLayoutRelation.equal,
                                   toItem:fatherView,
                                   attribute:NSLayoutAttribute.bottom,
                                   multiplier:1.0,
                                   constant:0)]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //
    
    /// Function of drawing chart view
    ///
    /// - Parameter chartModel: The instance object of chart model
    public func aa_drawChartWithChartModel(_ chartModel: AAChartModel) {
        
        self.configureTheJavaScriptString(chartModel)
        
        let path = Bundle.main.path(forResource: "AAChartView", ofType: "html")
        let urlStr = NSURL.fileURL(withPath: path!)
        let urlRequest = NSURLRequest(url: urlStr) as URLRequest
        if #available(iOS 9.0, *) {
            wkWebView?.load(urlRequest)
        } else {
            // Fallback on earlier versions
            uiWebView?.loadRequest(urlRequest)
        }
    }
    
    /// Function of only refresh the chart data
    ///
    /// - Parameter chartModel: The instance object of chart model
    public func aa_onlyRefreshTheChartDataWithChartModelSeries(_ chartModelSeries:Array<Any>) {
        let jsonData = try! JSONSerialization.data(withJSONObject: chartModelSeries, options: JSONSerialization.WritingOptions.prettyPrinted)
        var str = String(data: jsonData, encoding: String.Encoding.utf8)!
        str = (str.replacingOccurrences(of: "\n", with: "") as NSString) as String
        let jsString = NSString.localizedStringWithFormat("onlyRefreshTheChartDataWithSeries('%@');", str)
        self.evaluateJavaScriptWithFunctionNameString(jsString as String)
    }
    
    ///  Function of refreshing whole chart view content
    ///
    /// - Parameter chartModel: The instance object of chart model
    public func aa_refreshChartWholeContentWithChartModel(_ chartModel:AAChartModel) {
        
        self.configureTheJavaScriptString(chartModel)
        self.drawChart()
    }
    
    /// Show the series element content with index
    ///
    /// - Parameter elementIndex: elementIndex element index
    public func aa_showTheSeriesElementContentWithSeriesElementIndex(_ elementIndex:NSInteger) {
        
    }
    
    open func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.drawChart()
    }
    
    open func webViewDidFinishLoad(_ webView: UIWebView) {
        self.drawChart()
    }
    
    private func drawChart() {
        self.evaluateJavaScriptWithFunctionNameString(optionsJson!)
    }
    
    private func evaluateJavaScriptWithFunctionNameString (_ jsString:String) {
        if #available(iOS 9.0, *) {
            wkWebView?.evaluateJavaScript(jsString, completionHandler: { (item, error) in
                if ((error) != nil) {
                    let errorInfo = NSString.localizedStringWithFormat("💀💀💀WARNING!!!!! THERE ARE SOME ERROR INFOMATION_______%@", error! as CVarArg)
                    print(errorInfo)
                }
            })
        } else {
            // Fallback on earlier versions
            uiWebView?.stringByEvaluatingJavaScript(from: jsString)
        }
    }
    
    private func configureTheJavaScriptString(_ chartModel:AAChartModel) {
        let modelString = chartModel.toJSON()
        
        let chartViewContentWidth = self.contentWidth
        
        var chartViewContentHeight = self.contentHeight
        if (self.contentHeight == 0) {
            chartViewContentHeight = self.frame.size.height
        }
        
        let jsString = NSString.localizedStringWithFormat("loadTheHighChartView('%@','%f','%f');", modelString!,chartViewContentWidth!,chartViewContentHeight!)
        optionsJson = jsString as String;
    }
    
    
    
}

