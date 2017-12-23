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
        //检查 AAChartView是否存在
        if  let htmlFile = Bundle.main.path(forResource: "AAChartView", ofType: "html") {
            let htmlData = NSData(contentsOfFile: htmlFile)
            let baseURL = NSURL.fileURL(withPath: Bundle.main.bundlePath)
            if #available(iOS 9.0, *) {
                wkWebView?.load(htmlData! as Data, mimeType: "text/html", characterEncodingName: "UTF-8", baseURL: baseURL)
            } else {
                // Fallback on earlier versions
                uiWebView?.load(htmlData! as Data, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            }
        }
    }
    
    
    // ToDo:此处性能需要优化,因为仅仅刷新数据的话,其实只要是传递 series 里面的字符串数据就可以了,不需要传递整个序列化为字符串之后的 AAChartModel,这样操作实际上是传递了冗余信息,造成了不必要的计算资源的浪费 参见 issue #13
    /// Function of only refresh the chart data
    ///
    /// - Parameter chartModel: The instance object of chart model
    public func aa_onlyRefreshTheChartDataWithChartModel(_ chartModel:AAChartModel) {
        let modelString = chartModel.toJSON()
        let jsString = NSString.localizedStringWithFormat("onlyRefreshTheChartDataWithAAChartModel('%@');", modelString!)
        optionsJson = jsString as String
        self.drawChart()
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
        if #available(iOS 9.0, *) {
            wkWebView?.evaluateJavaScript(optionsJson!, completionHandler: { (item, error) in
            })
        } else {
            // Fallback on earlier versions
            uiWebView?.stringByEvaluatingJavaScript(from: optionsJson!)
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
