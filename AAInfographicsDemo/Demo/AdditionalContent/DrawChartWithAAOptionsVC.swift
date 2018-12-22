//
//  DrawChartWithAAOptionsVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2018/12/19.
//  Copyright © 2018 An An. All rights reserved.
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
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 *********************************************************************************
 
 */
import UIKit

class DrawChartWithAAOptionsVC: UIViewController {
    private var aaChartModel: AAChartModel?
    private var aaChartView: AAChartView?
    public var chartType: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "DrawChartWithAAOptions"
        
        let aaChartView = setUpChartView()
        
        var aaOptions: NSMutableDictionary? = nil
        if self.chartType == 0 {
            aaOptions = setUpOptions0()
        } else if self.chartType == 1 {
            aaOptions = setUpOptions1()
        } else if self.chartType == 2 {
            aaOptions = setUpOptions2()
        }
        
        aaChartView.aa_drawChartWithChartOptions(aaOptions!)
    }
    
    private func setUpChartView() -> AAChartView {
        let aaChartView = AAChartView()
        let chartWidth = view.frame.size.width
        let chartHeight = view.frame.size.height
        aaChartView.frame = CGRect(x: 0,
                                   y: 60,
                                   width: chartWidth,
                                   height: chartHeight)
        aaChartView.contentHeight = view.frame.size.height - 80
        view.addSubview(aaChartView)
        aaChartView.scrollEnabled = false
        return aaChartView
    }
    
    private func setUpOptions0() -> NSMutableDictionary {
        let aaChartModel = AAChartModel()
            .chartType(.area)//图形类型
            .colorsTheme(["#1e90ff","#ef476f","#ffd066","#04d69f","#25547c",])//主题颜色数组
            .axisColor("#ffffff")
            .title("")//图形标题
            .subtitle("")//图形副标题
            .dataLabelEnabled(false)//是否显示数字
            .tooltipValueSuffix("℃")//浮动提示框单位后缀
            .animationType(.bounce)//图形渲染动画类型为"bounce"
            .series([
                AASeriesElement()
                    .name("Tokyo")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
                    .toDic()!,
                ])
        let aaOptions = AAOptionsConstructor.configureAAoptions(aaChartModel: aaChartModel)
        
        return aaOptions
    }
    
    private func setUpOptions1() -> NSMutableDictionary {
        let aaOptions = [
                "chart": [
                    "type": "gauge"
                ],
                "pane": [
                    "startAngle": -150,
                    "endAngle": 150
                ],
                "yAxis": [
                    "min": 0,
                    "max": 100,
                    "plotBands": [
                        [
                            "from": 0,
                            "to": 60,
                            "color": "#FF0000",
                            "outerRadius": "105%",
                            "thickness": "5%"
                        ]]
                ],
                "series": [[
                    "data": [80]
                    ]]
                ] as NSMutableDictionary
        return aaOptions
    }
    
    private func setUpOptions2() -> NSMutableDictionary {
        let aaOptions = [
            "chart": [
                "type": "gauge",
            ],
            "title": [
                "text": "速度仪"
            ],
            "pane": [
                "startAngle": -150,
                "endAngle": 150,
            ],
            // the value axis
            "yAxis": [
                "min": 0,
                "max": 200,
                
                "title": [
                    "text": "km/h"
                ],
                "plotBands": [[
                    "from": 0,
                    "to": 120,
                    "color": "#ffc069"
                    ], [
                        "from": 120,
                        "to": 160,
                        "color": "#fe117c"
                    ], [
                        "from": 160,
                        "to": 200,
                        "color": "#06caf4"
                    ]]
            ],
            "series": [[
                "name": "Speed",
                "data": [80],
                ]]
            ] as NSMutableDictionary
        return aaOptions
    }
    
}


