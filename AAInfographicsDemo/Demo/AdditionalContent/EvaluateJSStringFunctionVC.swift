//
//  EvaluateJSStringFunctionVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2018/12/6.
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

class EvaluateJSStringFunctionVC: UIViewController, AAChartViewDelegate {
    public var sampleChartTypeIndex: NSInteger?
    
    private var aaChartView: AAChartView!    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        setUpTheAAChartViewOne()
    }
    
   private func setUpTheAAChartViewOne() {
        let chartViewWidth  = view.frame.size.width
        let screenHeight = view.frame.size.height - 60
        
        aaChartView = AAChartView()
        aaChartView.frame = CGRect(x: 0,
                                   y: 60,
                                   width: chartViewWidth,
                                   height: screenHeight)
        aaChartView.scrollEnabled = false
        aaChartView.contentHeight = screenHeight - 20
        aaChartView.delegate = self
        view.addSubview(aaChartView)
        
        let  aaChartModel = AAChartModel()
            .title("执行由 JavaScript 字符串映射转换成的 js function 函数")//图形标题
            .subtitle("巧妙地将JavaScript字符串转换为function并执行")//图形副标题
            .dataLabelsEnabled(true)//是否显示数字
            .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])
        
        if self.sampleChartTypeIndex == 0 || self.sampleChartTypeIndex == 1 {
            aaChartModel
                .chartType(.line)//图形类型
                .symbolStyle(.borderBlank)
                .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun","Jul", "Aug", "Sep", "Oct", "Nov", "Dec"])
                .series([
                    AASeriesElement()
                        .name("Tokyo")
                        .data([29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4])
                        ,
                    ])
        } else {
            aaChartModel
                .chartType(.column)
                .stacking(.normal)
                .dataLabelsEnabled(true)
                .tooltipEnabled(false)
                .categories([
                    "孤<br>岛<br>危<br>机",
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
                    "忍<br>者<br>之<br>印"
                    ])
                .series([
                    AASeriesElement()
                        .name("伦敦")
                        .data([82.89,67.54,62.07,59.43,67.02,67.09,35.66,71.78,81.61,78.85,79.12,72.30])
                        .dataLabels(AADataLabels()
                            .enabled(true)
                            .style(AAStyle()
                                .color("#555555")
                                .fontSize(11)
                            )
                        )
                        ,
                    AASeriesElement()
                        .name("东京")
                        .dataLabels(AADataLabels()
                            .enabled(true)
                            .style(AAStyle()
                                .color("#555555")
                                .fontSize(11)
                            )
                        )
                        .data([198.66,330.81,151.95,160.12,222.56,229.05,128.53,250.91,224.47,473.99,126.85,260.50])
                        ,
                    AASeriesElement()
                        .name("总销量")
                        .type(.line)
                        .dataLabels(AADataLabels()
                            .enabled(true)
                            .style(AAStyle()
                                .color("#555555")
                                .fontSize(15)
                            )
                        )
                        .data([281.55,398.35,214.02,219.55,289.57,296.14,164.18,322.69,306.08,552.84,205.97,332.79])
                        ,
                    ])
    
        }
        
        aaChartView.aa_drawChartWithChartModel(aaChartModel)
        
    }
    
    func aaChartViewDidFinishedLoad (_ aaChartView: AAChartView) {
        print("🚀🚀🚀AAChartView did finished load")
        
        var jsFunctionStr:String
        if self.sampleChartTypeIndex == 0 {
            jsFunctionStr = configureMaxMiniDataLabelJSFunctionString()
        } else if self.sampleChartTypeIndex == 1 {
            jsFunctionStr = configureFirstSecondThirdDataLabelJSFunctionString()
        } else {
            jsFunctionStr = configureFirstSecondThirdStackLabelJSFunctionString()
        }
        //图表加载完成后调用,避免WebView还没有获得JavaScript上下文,致使调用失败
        self.aaChartView!.aa_evaluateJavaScriptStringFunction(jsFunctionStr)
    }

    
    func configureMaxMiniDataLabelJSFunctionString() -> String {
        //refer to highcharts sample  https://jshare.com.cn/hcharts.cn/hhhhov
        let jsFunctionStr =
        """
        function render(aaGlobalChart, point, text) {
        return aaGlobalChart.renderer.label(text + ': ' + point.y,  point.plotX + aaGlobalChart.plotLeft -20 , point.plotY + aaGlobalChart.plotTop - 45, 'callout', point.plotX + aaGlobalChart.plotLeft, point.plotY + aaGlobalChart.plotTop)
        .css({
        color: '#FFFFFF',
        align: 'center',
        })
        .attr({
        fill: 'rgba(0, 0, 0, 0.75)',
        padding: 8,
        r: 5,
        zIndex: 6
        })
        .add();
        }
        function renderMinMaxLabel(aaGlobalChart) {
        var min = 1000,
        max = 0,
        pointsToShow = [0, 0],
        points = aaGlobalChart.series[0].points;
        Highcharts.each(points, function(p) {
        if(p.y>max) {
        pointsToShow[0] = p.index;
        max = p.y;
        }
        if(p.y<min) {
        pointsToShow[1] = p.index;
        min = p.y;
        }
        });
        render(aaGlobalChart, points[pointsToShow[0]], 'Max');
        render(aaGlobalChart, points[pointsToShow[1]], 'Min');
        }
        
        renderMinMaxLabel(aaGlobalChart);
        """
        
        return jsFunctionStr
    }
    
    func configureFirstSecondThirdDataLabelJSFunctionString() -> String {
        let firstMaxNumberIndex = 8
        let secondMaxNumberIndex = 9
        let thirdMaxNumberIndex = 5
        
        let jsFunctionStr2 =
        """
        function render(aaGlobalChart, point, text) {
        return aaGlobalChart.renderer.label(text + ': ' + point.y,  point.plotX + aaGlobalChart.plotLeft -20 , point.plotY + aaGlobalChart.plotTop - 45, 'callout', point.plotX + aaGlobalChart.plotLeft, point.plotY + aaGlobalChart.plotTop)
        .css({
        color: '#FFFFFF',
        align: 'center',
        })
        .attr({
        fill: 'rgba(0, 0, 0, 0.75)',
        padding: 8,
        r: 5,
        zIndex: 6
        })
        .add();
        }
        function renderFirstSecondThirdLabel(aaGlobalChart) {
        var points = aaGlobalChart.series[0].points;
        render(aaGlobalChart, points[\(firstMaxNumberIndex)], '第一名');
        render(aaGlobalChart, points[\(secondMaxNumberIndex)], '第二名');
        render(aaGlobalChart, points[\(thirdMaxNumberIndex)], '第三名');
        }
        
        renderFirstSecondThirdLabel(aaGlobalChart);
        """
        return jsFunctionStr2
    }
    
    func configureFirstSecondThirdStackLabelJSFunctionString() -> String {
        let firstMaxNumberIndex = 9
        let secondMaxNumberIndex = 1
        let thirdMaxNumberIndex = 11
        
        let jsFunctionStr2 =
        """
        function render(aaGlobalChart, point, text,colorIndex) {
        var colorsArray = ["#1e90ff","#ef476f","#ffd066",];
        var colorHexString = colorsArray[colorIndex];
        return aaGlobalChart.renderer.label('   '+text,  point.plotX + aaGlobalChart.plotLeft -20 , point.plotY + aaGlobalChart.plotTop - 60, 'callout', point.plotX + aaGlobalChart.plotLeft, point.plotY + aaGlobalChart.plotTop)
        .css({
        color: '#FFFFFF',
        align: 'center',
        weight: 'bold',
        })
        .attr({
        fill: colorHexString,
        padding: 8,
        r: 5,
        zIndex: 6
        })
        .add();
        }
        function renderFirstSecondThirdLabel(aaGlobalChart) {
        var points = aaGlobalChart.series[0].points;
        render(aaGlobalChart, points[\(firstMaxNumberIndex)], '第一名',0);
        render(aaGlobalChart, points[\(secondMaxNumberIndex)], '第二名',1);
        render(aaGlobalChart, points[\(thirdMaxNumberIndex)], '第三名',2);
        }
        
        renderFirstSecondThirdLabel(aaGlobalChart);
        """
        return jsFunctionStr2
    }
    
   
}
