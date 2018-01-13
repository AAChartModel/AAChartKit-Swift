//
//  ShowManyChartViewVC.swift
//  AAInfographicsDemo
//
//  Created by An An on 2017/11/6.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit-Swift ***--- source code
//
//

/*
 
 *********************************************************************************
 *
 * ❤❤❤❤❤   WARM TIPS!!!   ❤❤❤❤❤
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit-Swift/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 *********************************************************************************
 
 */

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
        let chartViewWidth  = self.view.frame.size.width
        let screenHeight = self.view.frame.size.height-60
        
        let aaChartView = AAChartView()
        aaChartView.frame = CGRect(x:0,y:60,width:chartViewWidth,height:screenHeight/2)
         self.view.addSubview(aaChartView)
        
        let  aaChartModel = AAChartModel.init()
            .chartType(AAChartType.Bar)//图形类型
            .animationType(AAChartAnimationType.Bounce)//图形渲染动画类型为"bounce"
            .title("都市天气")//图形标题
            .subtitle("2020年08月08日")//图形副标题
            .dataLabelEnabled(false)//是否显示数字
            .stacking(AAChartStackingType.Normal)
            .markerRadius(5)//折线连接点半径长度,为0时相当于没有折线连接点
            .colorsTheme(["#bb250c","#f67210","#fde680","#257679","#f1c6c5"])
            .series([
                [
                    "name": "Tokyo",
                    "data": [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
                ], [
                    "name": "New York",
                    "data": [0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
                ], [
                    "name": "Berlin",
                    "data": [0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
                ],
                   [
                    "name": "London",
                    "data": [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
                ]
                
                ])
        
        aaChartView.aa_drawChartWithChartModel(aaChartModel)

    }
    
    func setUpTheAAChartViewTwo() {
        let chartViewWidth  = self.view.frame.size.width
        let screenHeight = self.view.frame.size.height-60
        
        let aaChartView2 = AAChartView()
        aaChartView2.frame = CGRect(x:0,y:screenHeight/2+60,width:chartViewWidth,height:screenHeight/2)
        self.view.addSubview(aaChartView2)
        
        let  aaChartModel2 = AAChartModel.init()
            .chartType(AAChartType.Area)//图形类型
            .animationType(AAChartAnimationType.Bounce)//图形渲染动画类型为"bounce"
            .title("都市天气")//图形标题
            .subtitle("2020年08月08日")//图形副标题
            .dataLabelEnabled(false)//是否显示数字
            .markerRadius(4)//折线连接点半径长度,为0时相当于没有折线连接点
            .symbolStyle(AAChartSymbolStyleType(rawValue: AAChartSymbolStyleType.InnerBlank.rawValue)!)
            .gradientColorEnable(true)
            .legendEnabled(true)
            .series([
                [
                    "name": "Tokyo",
                    "data": [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
                ], [
                    "name": "New York",
                    "data": [0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
                ], [
                    "name": "Berlin",
                    "data": [0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
                ],
                   [
                    "name": "London",
                    "data": [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
                ]
                
                ])
        
        aaChartView2.aa_drawChartWithChartModel(aaChartModel2)

    }
 
 }
