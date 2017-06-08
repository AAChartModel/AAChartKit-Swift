//
//  ViewController.swift
//  AAChartKit-Swift
//
//  Created by An An  on 17/4/18.
//  Copyright © 2017年 An An . All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit-Swift ***--- source code
//
//


import UIKit

class CommonChartVC: UIViewController,UIWebViewDelegate {
    open var chartType:String?
    open var chartModel: AAChartModel?
    open var globalWebview2: AAChartView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        globalWebview2 = AAChartView()
        globalWebview2?.frame = CGRect(x:0,y:0,width:self.view.frame.size.width,height:self.view.frame.size.height)
        globalWebview2?.contentHeight = self.view.frame.size.height;
        self.view.addSubview(globalWebview2!)
        
        chartModel = AAChartModel.init()
            .chartTypeSet(self.chartType!)
            .animationTypeSet(AAChartAnimationType.AAChartAnimationTypeSwing.rawValue)
            .titleSet("donghua")
            .subtitleSet("subtitle")
            .pointHollowSet(true)
            .dataLabelEnabledSet(false)
            .markerRadiusSet(15)
            .seriesSet([
                [
                    "name": "Tokyo",
                    "data": [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
                ], [
                    "name": "New York",
                    "data": [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
                ], [
                    "name": "Berlin",
                    "data": [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
                ], [
                    "name": "London",
                    "data": [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
                ]]);
        
        globalWebview2?.aa_drawChartWithChartModel(chartModel!)
        
    }
    
    
    
    
    
}

