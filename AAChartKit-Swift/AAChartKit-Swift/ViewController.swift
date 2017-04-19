//
//  ViewController.swift
//  AAChartKit-Swift
//
//  Created by Danny boy on 17/4/18.
//  Copyright © 2017年 Danny boy. All rights reserved.
//
//


import UIKit

class ViewController: UIViewController,UIWebViewDelegate {
  open var globalWebview: UIWebView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //检查 AAChartView是否存在
        
        if let htmlFile = Bundle.main.path(forResource: "AAChartView", ofType: "html"){
            
            let htmlData = NSData(contentsOfFile: htmlFile)
            
            let baseURL = NSURL.fileURL(withPath: Bundle.main.bundlePath)
            
            globalWebview = UIWebView()
            globalWebview?.frame = CGRect(x:0,y:0,width:self.view.frame.size.width,height:self.view.frame.size.height)
 
            globalWebview?.delegate=self;
            self.view.addSubview(globalWebview!)

            
            globalWebview?.load(htmlData as! Data, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            
     
            
        }
        
        
     
        
//        var person2 = Person.init(name: "jiushizheyang", age: 99);
//        person2.name = "hahha,zhizhongyubeiwogaibainle";
//        print(person2.name);
//        var aachartV = AAChartView();
////        aachartV.addSet(num: "jiangshanmeiren").subSet(num: "shijianjianshi").mulSet(num: "meiyoushenmegnenggouzudang")
//        aachartV.addSet("shijianjianshi").mulSet("jiangherixiangrenxinbugu");
//        print(aachartV.add)
//        print(aachartV.mul)
//        
//        let student = NSCStudent()
//        student.study().playWith("Girl")
        
        
        
//        var chartModel = AAChartModel.init();
//        chartModel.title = "你是人间四月天";
//        chartModel.subtitle="你是爱是暖";
//        print(chartModel);
        

    }

    open func webViewDidFinishLoad(_ webView: UIWebView) {
                var chartModel = AAChartModel.init();
                chartModel.title = "你是人间四月天";
                chartModel.subtitle="你是爱是暖";
//                print(chartModel);
        let modelString = chartModel.toJSON();
//        print(modelString ?? <#default value#>);
        
        let jsString = NSString.localizedStringWithFormat("loadTheHighChartView('%@','%f','%f');", modelString!,self.view.frame.size.width,self.view.frame.size.height);
        
        //            NSString *javaScriptStr = [NSString stringWithFormat:;@"loadTheHighChartView('%@','%@','%@');",self.json,[NSNumber numberWithFloat:chartViewContentWidth],[NSNumber numberWithFloat:charViewContentHeight]];
        
        globalWebview?.stringByEvaluatingJavaScript(from: jsString as String);
    }
 
    
}

