//
//  TestChartView.swift
//  AAChartKit-Swift
//
//  Created by An An on 2017/5/23.
//  Copyright © 2017年 An An . All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit-Swift ***--- source code
//

import UIKit

class TestChartView: UIView,UIWebViewDelegate {
open var globalWebview: UIWebView?
  open var model: AAChartModel?
 open var optionsJson: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     self.backgroundColor =  UIColor.cyan
            globalWebview = UIWebView()
            globalWebview?.delegate=self;
            self.addSubview(globalWebview!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func aa_drawChartWithChartModel(_ chartModel: AAChartModel){
        //检查 AAChartView是否存在
        if let htmlFile = Bundle.main.path(forResource: "AAChartView", ofType: "html"){
            let htmlData = NSData(contentsOfFile: htmlFile)
            let baseURL = NSURL.fileURL(withPath: Bundle.main.bundlePath)
             globalWebview?.load(htmlData! as Data, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            
            let modelString = chartModel.toJSON();
                let jsString = NSString.localizedStringWithFormat("loadTheHighChartView('%@','%f','%f');", modelString!,self.frame.size.width,self.frame.size.height);
             optionsJson = jsString as String;
             globalWebview?.frame = CGRect(x:0,y:0,width:self.frame.size.width,height:self.frame.size.height)
        }
    }
    open func webViewDidFinishLoad(_ webView: UIWebView) {
        globalWebview?.stringByEvaluatingJavaScript(from: optionsJson!);
    }
    

}
