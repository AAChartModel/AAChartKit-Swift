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
  open var chartType:String?
    
    
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
             globalWebview?.load(htmlData! as Data, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
         }
        
        
     
        
//        var person2 = Person.init(name: "jiushizheyang", age: 99);
//        person2.name = "hahha,zhizhongyubeiwogaibainle";
//        print(person2.name);
        var aachartV = AAChartView();
//        aachartV.addSet(num: "jiangshanmeiren").subSet(num: "shijianjianshi").mulSet(num: "meiyoushenmegnenggouzudang")
        aachartV.addSet("shijianjianshi").mulSet("jiangherixiangrenxinbugu");
  
//
//        let student = NSCStudent()
//        student.study().playWith("Girl")
        
        
        
//        var chartModel = AAChartModel.init();
//        chartModel.title = "你是人间四月天";
//        chartModel.subtitle="你是爱是暖";
//        print(chartModel);
        

    }

    open func webViewDidFinishLoad(_ webView: UIWebView) {
        let chartModel = AAChartModel.init()
            .chartTypeSet("column")
            .animationTypeSet("donghualeixing")
            .titleSet("donghua")
            .animationTypeSet("jiushizheyang")
            .seriesSet([[
                "name":"东京",
                "data": [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
                ], [
                    "name": "纽约",
                    "data": [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
                ], [
                    "name": "柏林",
                    "data": [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
                ], [
                    "name": "伦敦",
                    "data": [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
                ]]);
//        chartModel.chartType = self.chartType;
//        chartModel.title = "你是人间四月天";
//        chartModel.subtitle="你是爱是暖";
//        chartModel.inverted = false;
//        chartModel.yAxisTitle = "千万公顷";
//        chartModel.legendEnabled = true;
//        chartModel.series = [[
//            "name":"东京",
//            "data": [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
//            ], [
//                "name": "纽约",
//                "data": [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
//            ], [
//                "name": "柏林",
//                "data": [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
//            ], [
//                "name": "伦敦",
//                "data": [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
//            ]];
        let modelString = chartModel.toJSON();
        
        let jsString = NSString.localizedStringWithFormat("loadTheHighChartView('%@','%f','%f');", modelString!,self.view.frame.size.width,self.view.frame.size.height);
        
        globalWebview?.stringByEvaluatingJavaScript(from: jsString as String);
    }
 
    
}

