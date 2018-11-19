//
//  ShowManyChartViewVC.swift
//  AAInfographicsDemo
//
//  Created by An An on 2017/11/6.
//  Copyright © 2017年 An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 *********************************************************************************
 *
 *  🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
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
        
        title = "同时显示多个图表"
        view.backgroundColor = .white
        
        setUpTheAAChartViewOne()
        setUpTheAAChartViewTwo()
        
    }
    
    func setUpTheAAChartViewOne() {
        let chartViewWidth  = view.frame.size.width
        let screenHeight = view.frame.size.height - 60
        
        let aaChartView = AAChartView()
        aaChartView.frame = CGRect(x: 0,
                                   y: 60,
                                   width: chartViewWidth,
                                   height: screenHeight / 2)
        aaChartView.scrollEnabled = false
        aaChartView.contentHeight = (screenHeight / 2) - 20
        view.addSubview(aaChartView)
        
        let  aaChartModel = AAChartModel()
            .chartType(.bar)//图形类型
            .animationType(.bounce)//图形渲染动画类型为"bounce"
            .title("都市天气")//图形标题
            .subtitle("2020年08月08日")//图形副标题
            .dataLabelEnabled(false)//是否显示数字
            .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])
            .stacking(.percent)
            .series(([
                AASeriesElement()
                    .name("Tokyo")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
                    .toDic()!,
                AASeriesElement()
                    .name("New York")
                    .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5])
                    .toDic()!,
                AASeriesElement()
                    .name("Berlin")
                    .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0])
                    .toDic()!,
                AASeriesElement()
                    .name("London")
                    .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8])
                    .toDic()!,]))
        
        aaChartView.aa_drawChartWithChartModel(aaChartModel)
        
    }
    
    func setUpTheAAChartViewTwo() {
        let chartViewWidth  = view.frame.size.width
        let screenHeight = view.frame.size.height - 60
        
        let aaChartView2 = AAChartView()
        aaChartView2.frame = CGRect(x:0,
                                    y:screenHeight / 2 + 60,
                                    width:chartViewWidth,
                                    height:screenHeight / 2)
        aaChartView2.scrollEnabled = false
        view.addSubview(aaChartView2)
        
        let  aaChartModel2 = AAChartModel()
            .chartType(.area)//图形类型
            .animationType(.bounce)//图形渲染动画类型为"bounce"
            .title("都市天气")//图形标题
            .subtitle("2020年08月08日")//图形副标题
            .dataLabelEnabled(false)//是否显示数字
            .markerRadius(4)//折线连接点半径长度,为0时相当于没有折线连接点
            .symbolStyle(.innerBlank)
            .gradientColorEnable(true)
            .legendEnabled(true)
            .tooltipEnabled(false)
            .categories(["孤<br>岛<br>危<br>机",
                         "使<br>命<br>召<br>唤",
                         "荣<br>誉<br>勋<br>章",
                         "狙<br>击<br>精<br>英",
                         "神<br>秘<br>海<br>域",
                         "最<br>后<br>生<br>还<br>者",
                         "巫<br>师<br>3<br>狂<br>猎",
                         "对<br>马<br>之<br>魂",
                         "蝙<br>蝠<br>侠<br>阿<br>甘<br>骑<br>士<br> .",
                         "地<br>狱<br>边<br>境",
                         "闪<br>客",
                         "忍<br>者<br>之<br>印"])
            .series([
                AASeriesElement()
                    .name("Tokyo")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
                    .toDic()!,
                AASeriesElement()
                    .name("New York")
                    .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5])
                    .toDic()!,
                AASeriesElement()
                    .name("Berlin")
                    .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0])
                    .toDic()!,
                AASeriesElement()
                    .name("London")
                    .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8])
                    .toDic()!,])
        
        aaChartView2.aa_drawChartWithChartModel(aaChartModel2)

    }
 
 }
