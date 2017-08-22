//
//  AAChartView.swift
//  AAChartKit-Swift
//
//  Created by An An on 2017/5/23.
//  Copyright © 2017年 An An . All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit-Swift ***--- source code
//

import UIKit

class AAChartView: UIView,UIWebViewDelegate {
    
    /// Content width of AAChartView
    open var contentWidth:CGFloat?
    
    /// Content height of AAChartView
    open var contentHeight:CGFloat?
    
    /// Hide chart series content or not
    open var chartSeriesHidden:Bool?
    
    var globalWebview: UIWebView?
    var optionsJson: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentWidth = 0
        self.contentHeight = 0
        self.backgroundColor =  UIColor.cyan
        globalWebview = UIWebView()
        globalWebview?.backgroundColor = UIColor.white
        globalWebview?.delegate=self
        self.addSubview(globalWebview!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /// Function of drawing chart view
    ///
    /// - Parameter chartModel: The instance object of chart model
    public func aa_drawChartWithChartModel(_ chartModel: AAChartModel){
        
        self.configureTheJavaScriptString(chartModel)
        //检查 AAChartView是否存在
        if  let htmlFile = Bundle.main.path(forResource: "AAChartView", ofType: "html"){
            let htmlData = NSData(contentsOfFile: htmlFile)
            let baseURL = NSURL.fileURL(withPath: Bundle.main.bundlePath)
            globalWebview?.load(htmlData! as Data, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            
         }
    }
    
    ///  Function of refreshing whole chart view content
    ///
    /// - Parameter chartModel: The instance object of chart model
    public func aa_refreshChartWithChartModel(_ chartModel:AAChartModel) {
        
        self.configureTheJavaScriptString(chartModel)
        self.drawChart()
    }
    
    /// Function of only refresh the chart data
    ///
    /// - Parameter chartModel: The instance object of chart model
    public func aa_onlyRefreshTheChartDataWithChartModel(_ chartModel:AAChartModel) {
        let modelString = chartModel.toJSON()
        let jsString = NSString.localizedStringWithFormat("loadTheHighChartView('%@');", modelString!)
        globalWebview?.stringByEvaluatingJavaScript(from: jsString as String)
    }
    
    /// Show the series element content with index
    ///
    /// - Parameter elementIndex: elementIndex element index
    public func aa_showTheSeriesElementContentWithSeriesElementIndex(_ elementIndex:NSInteger) {
        
    }
    
    open func webViewDidFinishLoad(_ webView: UIWebView) {
       self.drawChart()
    }
    
    func drawChart() {
        globalWebview?.stringByEvaluatingJavaScript(from: optionsJson!)
    }
    
    func configureTheJavaScriptString(_ chartModel:AAChartModel) {
        let modelString = chartModel.toJSON()
        
        let chartViewContentWidth = self.contentWidth
        
        var chartViewContentHeight = self.contentHeight
        if (self.contentHeight == 0) {
            chartViewContentHeight = self.frame.size.height
        }
        
        globalWebview?.frame = CGRect(x:0,y:0,width:self.frame.size.width,height:self.frame.size.height)
        let jsString = NSString.localizedStringWithFormat("loadTheHighChartView('%@','%f','%f');", modelString!,chartViewContentWidth!,chartViewContentHeight!)
        optionsJson = jsString as String;
    }
    

    
}
