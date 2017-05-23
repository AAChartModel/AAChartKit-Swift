//
//  AAChartView.swift
//  AAChartKit-Swift
//
//  Created by 金银岛 on 2017/4/18.
//  Copyright © 2017年 Danny boy. All rights reserved.
//

import UIKit
import WebKit
class AAChartView: UIWebView,UIWebViewDelegate {
    open var optionsJson:String?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func drawChartWithChartModel(_ chartModel: AAChartModel) {
        if let htmlFile = Bundle.main.path(forResource: "AAChartView", ofType: "html"){
            let htmlData = NSData(contentsOfFile: htmlFile)
            let baseURL = NSURL.fileURL(withPath: Bundle.main.bundlePath)
            self.load(htmlData! as Data, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            
            let modelString = chartModel.toJSON();
            let jsString = NSString.localizedStringWithFormat("loadTheHighChartView('%@','%f','%f');", modelString!,self.frame.size.width,self.frame.size.height);
            optionsJson = jsString as String
            
        }
        
        
        
        func webViewDidFinishLoad(_ webView: UIWebView) {
            self.stringByEvaluatingJavaScript(from: optionsJson!);
        }
        
    }
    
    
}
