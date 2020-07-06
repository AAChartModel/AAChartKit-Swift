//
//  ScrollableChartVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2020/4/24.
//  Copyright © 2020 An An. All rights reserved.
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

class ScrollableChartVC: UIViewController {
    private var aaChartModel: AAChartModel?
    private var aaChartView: AAChartView?
    private var aaOptions: AAOptions?
    public var chartType: AAChartType!
    public var step: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        configureChartView()
        configureDiffrentStyleChart()
        
        if (aaOptions == nil) {
            aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel!);
        }
        
        aaChartView?.aa_drawChartWithChartOptions(aaOptions!)
    }
    
    
    private func configureChartView()  {
        let chartViewWidth  = view.frame.size.width
        let chartViewHeight = view.frame.size.height - 60
        
        aaChartView = AAChartView()
        aaChartView?.frame = CGRect(x: 0,
                                    y: 60,
                                    width: chartViewWidth,
                                    height: chartViewHeight)
        aaChartView?.scrollEnabled = false
        ///AAChartViewd的内容高度(内容高度默认和 AAChartView 等高)
        aaChartView?.contentHeight = chartViewHeight - 20
        view.addSubview(aaChartView!)
    }
    
    
    private func configureDiffrentStyleChart() {
        if chartType == AAChartType.bar {
            configureBarChart()
        } else if (chartType == AAChartType.line && self.step != true)
               || (chartType == AAChartType.spline) {
            configureLineAndSplineChart()
        } else {
            configureNormalChart()
        }
    }
    
    private func configureBarChart() {
        let pureJSStr = AAJSStringPurer.pureJavaScriptFunctionString(
            "Source: <a href=\"https://highcharts.uservoice.com/forums/55896-highcharts-javascript-api\">UserVoice</a>");
        
        let aaOptions = AAOptions()
            .chart(AAChart()
                .type(AAChartType.bar)
                .scrollablePlotArea(
                    AAScrollablePlotArea()
                        .minHeight(1300)
            ))
            .title(AATitle()
                .text("Most popular ideas by April 2016"))
            .subtitle(AASubtitle()
                .text(pureJSStr))
            .xAxis(AAXAxis()
                .type("category"))
            .series([
                AASeriesElement()
                    .name("hahha")
                    .data([
                        ["Gantt chart", 1000],
                        ["Autocalculation and plotting of trend lines", 575],
                        ["Allow navigator to have multiple data series", 523],
                        ["Implement dynamic font size", 427],
                        ["Multiple axis alignment control", 399],
                        ["Stacked area (spline etc) in irregular datetime series", 309],
                        ["Adapt chart height to legend height", 278],
                        ["Export charts in excel sheet", 239],
                        ["Toggle legend box", 235],
                        ["Venn Diagram", 203],
                        ["Add ability to change Rangeselector position", 182],
                        ["Draggable legend box", 157],
                        ["Sankey Diagram", 149],
                        ["Add Navigation bar for Y-Axis in Highstock", 144],
                        ["Grouped x-axis", 143],
                        ["ReactJS plugin", 137],
                        ["3D surface charts", 134],
                        ["Draw lines over a stock chart, for analysis purpose", 118],
                        ["Data module for database tables", 118],
                        ["Draggable points", 117]
                    ])])
        self.aaOptions = aaOptions
    }
    
    private func configureLineAndSplineChart() {
        let element1 = AASeriesElement()
            .name("Hestavollane")
            .data([0.2, 0.8, 0.8, 0.8, 1, 1.3, 1.5, 2.9, 1.9, 2.6, 1.6, 3, 4, 3.6,
                   5.5, 6.2, 5.5, 4.5, 4, 3.1, 2.7, 4, 2.7, 2.3, 2.3, 4.1, 7.7, 7.1,
                   5.6, 6.1, 5.8, 8.6, 7.2, 9, 10.9, 11.5, 11.6, 11.1, 12, 12.3, 10.7,
                   9.4, 9.8, 9.6, 9.8, 9.5, 8.5, 7.4, 7.6])
        
        let element2 = AASeriesElement()
            .name("Vik")
            .data([0, 0, 0.6, 0.9, 0.8, 0.2, 0, 0, 0, 0.1, 0.6, 0.7, 0.8, 0.6, 0.2,
                   0, 0.1, 0.3, 0.3, 0, 0.1, 0, 0, 0, 0.2, 0.1, 0, 0.3, 0, 0.1, 0.2,
                   0.1, 0.3, 0.3, 0, 3.1, 3.1, 2.5, 1.5, 1.9, 2.1, 1, 2.3, 1.9, 1.2,
                   0.7, 1.3, 0.4, 0.3])
        
        aaChartModel = AAChartModel()
            .markerSymbolStyle(AAChartSymbolStyleType.borderBlank)//设置折线连接点样式为:边缘白色
            .markerRadius(6)
            .scrollablePlotArea(
                AAScrollablePlotArea()
                .minWidth(1800)
                .scrollPositionX(1))
            .series([element1,element2])
    }
    
    private func configureNormalChart() {
        let gradientColorDic1 = AAGradientColor.linearGradient(
            direction: .toBottom,
            startColor: "#00BFFF",
            endColor: "#00FA9A"//颜色字符串设置支持十六进制类型和 rgba 类型
        )
        
        let gradientColorDic2 = AAGradientColor.linearGradient(
            direction: .toBottom,
            startColor: "rgba(138,43,226,1)",
            endColor: "rgba(30,144,255,1)"//颜色字符串设置支持十六进制类型和 rgba 类型
        )
        
        aaChartModel = AAChartModel()
            .chartType(chartType!)
            .title("")
            .stacking(.normal)
            .dataLabelsEnabled(false)
            .colorsTheme([gradientColorDic1,gradientColorDic2])
            .scrollablePlotArea(AAScrollablePlotArea()
                .minWidth(3000)
                .scrollPositionX(1))
            .series(configureSeriesDataArray())
    }
    
    private func configureSeriesDataArray() -> [AASeriesElement] {
        var randomNumArrA = [Any]()
        var randomNumArrB = [Any]()
        var y1 = 0.0
        var y2 = 0.0
        
        let Q = Int(arc4random() % 38)
        
        for  x in 0 ..< 100 {
            y1 = sin(Double(Q) * (Double(x) * Double.pi / 180)) + Double(x) * 2.0 * 0.01 - 1
            y2 = cos(Double(Q) * (Double(x) * Double.pi / 180)) + Double(x) * 3.0 * 0.01 - 1
            randomNumArrA.append(y1)
            randomNumArrB.append(y2)
        }
        
        let chartSeriesArr = [
            AASeriesElement()
                .name("2019")
                .lineWidth(5)
                .step(self.step ?? false)
                .data(randomNumArrA),
            AASeriesElement()
                .name("2018")
                .lineWidth(5)
                .step(self.step ?? false)
                .data(randomNumArrB)
        ]
        return chartSeriesArr
    }
}
