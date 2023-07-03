//
//  DoubleChartsLinkedWorkVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/6/29.
//  Copyright © 2019 An An. All rights reserved.
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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 *********************************************************************************
 
 */

import UIKit
import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class DoubleChartsLinkedWorkVC: UIViewController, AAChartViewDelegate {
    
    private var aaChartView1 = AAChartView()
    private var aaChartView2 = AAChartView()
    private var aaChartModel2 = AAChartModel()
    private var colorsArr: [String]?
    private var selectedColor: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpTheAAChartViewOne()
        setUpTheAAChartViewTwo()
    }
    
    private func setUpTheAAChartViewOne() {
        let chartViewWidth  = view.frame.size.width
        let screenHeight = view.frame.size.height - 60
        
        aaChartView1.frame = CGRect(x: 0,
                                    y: 60,
                                    width: chartViewWidth,
                                    height: screenHeight / 2 - 80)
        aaChartView1.isScrollEnabled = false
        aaChartView1.delegate = self
//        aaChartView1.contentHeight = (screenHeight / 2) - 20
        view.addSubview(aaChartView1)
        
        colorsArr = ["#fe117c","#ffc069","#06caf4","#7dffc0","#1e90ff","#ef476f","#ffd066","#04d69f","#25547c",]
        
        let  aaChartModel1 = AAChartModel()
            .chartType(.column)//图形类型
            .animationType(.bounce)//图形渲染动画类型为"bounce"
            .dataLabelsEnabled(false)//是否显示数字
            .legendEnabled(false)
            .colorsTheme(colorsArr!)
            .tooltipEnabled(true)
            .borderRadius(3)
            .inverted(true)
            .yAxisReversed(true)
            .categories(colorsArr!)
            .series([
                AASeriesElement()
                    .colorByPoint(true)
                    .data(getRandomNumbersArr(numbers: 9))
                ,
            ])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel1)
        
        aaOptions.xAxis?
            .crosshair(AACrosshair()
                .dashStyle(AAChartLineDashStyleType.longDashDot)
                .color(AAColor.black)
                .width(1))
        
        aaOptions.plotOptions?.column?.groupPadding(0)
        
        aaChartView1.aa_drawChartWithChartOptions(aaOptions)
    }
    
    private func setUpTheAAChartViewTwo() {
        let chartViewWidth  = view.frame.size.width
        let screenHeight = view.frame.size.height - 60
        
        aaChartView2.frame = CGRect(x:0,
                                    y:screenHeight / 2 + 60 - 80,
                                    width:chartViewWidth,
                                    height:screenHeight / 2 + 80)
        aaChartView2.isScrollEnabled = false
        view.addSubview(aaChartView2)
        
        aaChartModel2
            .chartType(.column)//图形类型
            .animationType(.easeOutQuart)//图形渲染动画类型为"bounce"
            .dataLabelsEnabled(false)//是否显示数字
            .markerRadius(4)//折线连接点半径长度,为0时相当于没有折线连接点
            .markerSymbolStyle(.innerBlank)
            .legendEnabled(false)
            .tooltipEnabled(true)
            .series([
                AASeriesElement()
                    .color("#fe117c")
                    .data(getRandomNumbersArr(numbers: 12))
                ,
            ])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel2)
        aaOptions.plotOptions?.column?.groupPadding(0)
        
        aaChartView2.aa_drawChartWithChartOptions(aaOptions)
    }
    
    func aaChartView(_ aaChartView: AAChartView, moveOverEventMessage: AAMoveOverEventMessageModel) {
        selectedColor = colorsArr?[moveOverEventMessage.index ?? 0] ?? "#ff000"
        
        aaChartView2.aa_onlyRefreshTheChartDataWithChartModelSeries([
            AASeriesElement()
                .data(configureSeriesDataArray())
            ])
        
        //https://github.com/AAChartModel/AAChartKit-Swift/issues/434
        let defaultSelectedIndex = moveOverEventMessage.index ?? 0
        
        let jsFunc = ("""
                     function syncRefreshTooltip() {
                            const points = [];
                            const chart = aaGlobalChart;
                            const series = chart.series;
                            const length = series.length;
                                       
                            for (let i = 0; i < length; i++) {
                                const pointElement = series[i].data[\(defaultSelectedIndex)];
                                pointElement.onMouseOver();
                                points.push(pointElement);
                            }
                            chart.xAxis[0].drawCrosshair(null, points[0]);
                            chart.tooltip.refresh(points);
                     }
                     syncRefreshTooltip();
""")
        
        //图表加载完成后调用,避免WebView还没有获得JavaScript上下文,致使调用失败
        aaChartView2.evaluateJavaScript(jsFunc)
    }
    
    
    private func getRandomNumbersArr(numbers: Int) -> [Float] {
        let randomNumArr = NSMutableArray()
        for _ in 0 ..< numbers {
            print(Float(arc4random() % 100))
            randomNumArr.add(Float(arc4random() % 1000 + 500))
        }
        return randomNumArr as! [Float]
    }
    
    private func configureSeriesDataArray() -> [Any] {
        let randomNumArrA = NSMutableArray()
        var y1 = 0.0
        let Q = arc4random() % 38
        for  x in 0 ..< 40 {
            y1 = sin(Double(Q) * (Double(x) * Double.pi / 180)) + Double(x) * 2.0 * 0.01 - 1 
            randomNumArrA.add(
                AADataElement()
                    .color(selectedColor as Any)
                    .y(Float(y1)))
        }
        return randomNumArrA as! [Any]
    }
    
    
}
