//
//  ShowManyChartViewVC.swift
//  AAInfographicsDemo
//
//  Created by An An on 2017/11/6.
//  Copyright © 2017年 An An. All rights reserved.
//

import UIKit

class ShowManyChartViewVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "同时显示多个图表"
        self.view.backgroundColor = UIColor.white
        
        self.setUpTheAAChartViewOne()
        self.setUpTheAAChartViewTwo()
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            self.setUpTheAAChartViewTwo()
//
//        }
    
    }
    
    func setUpTheAAChartViewOne() {
        let chartViewWidth  = self.view.frame.size.width;
        let screenHeight = self.view.frame.size.height;
        
        let aaChartView = AAChartView()
        aaChartView.frame = CGRect(x:0,y:60,width:chartViewWidth,height:screenHeight/2)
         self.view.addSubview(aaChartView)
        
        let  aaChartModel = AAChartModel.init()
            .chartTypeSet(AAChartType.Bar)//图形类型
            .animationTypeSet(AAChartAnimationType.Bounce)//图形渲染动画类型为"bounce"
            .titleSet("都市天气")//图形标题
            .subtitleSet("2020年08月08日")//图形副标题
            .dataLabelEnabledSet(false)//是否显示数字
            .markerRadiusSet(5)//折线连接点半径长度,为0时相当于没有折线连接点
            .seriesSet([
                [
                    "name": "Berlin",
                    "data": [0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
                ], ])
        
        aaChartView.aa_drawChartWithChartModel(aaChartModel)

    }
    
    func setUpTheAAChartViewTwo() {
        let chartViewWidth  = self.view.frame.size.width;
        let screenHeight = self.view.frame.size.height;
        
        let aaChartView2 = AAChartView()
        aaChartView2.frame = CGRect(x:0,y:screenHeight/2+60,width:chartViewWidth,height:screenHeight/2)
        self.view.addSubview(aaChartView2)
        
        let  aaChartModel2 = AAChartModel.init()
            .chartTypeSet(AAChartType.Area)//图形类型
            .animationTypeSet(AAChartAnimationType.Bounce)//图形渲染动画类型为"bounce"
            .titleSet("都市天气")//图形标题
            .subtitleSet("2020年08月08日")//图形副标题
            .dataLabelEnabledSet(false)//是否显示数字
            .markerRadiusSet(5)//折线连接点半径长度,为0时相当于没有折线连接点
            .seriesSet([
                [
                    "name": "New York",
                    "data": [0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
                ], ])
        
        aaChartView2.aa_drawChartWithChartModel(aaChartModel2)

    }
 
 }
