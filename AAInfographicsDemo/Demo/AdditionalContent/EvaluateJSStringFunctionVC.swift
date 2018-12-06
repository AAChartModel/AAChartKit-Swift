//
//  EvaluateJSStringFunctionVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2018/12/6.
//  Copyright © 2018 An An. All rights reserved.
//

import UIKit

class EvaluateJSStringFunctionVC: UIViewController, AAChartViewDelegate {
    private var aaChartView: AAChartView! 

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        setUpTheAAChartViewOne()
        
       
      
    }
    
    func configureJavaScriptFunctionString() -> String {
        //refer to highcharts sample  https://jshare.com.cn/hcharts.cn/hhhhov
        let jsFunctionStr =
        """
var minLabel = null,
    maxLabel = null;
function render(aaGlobalChart, point, text) {
//alert(point);
//alert("就是为了测试一下这个函数是否被成功执行了"+text);
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
    if(minLabel) {
        minLabel.destroy();
    }
    if(maxLabel) {
        maxLabel.destroy();
    }
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
    minLabel = render(aaGlobalChart, points[pointsToShow[0]], 'Max');
    maxLabel = render(aaGlobalChart, points[pointsToShow[1]], 'Min');
}

    renderMinMaxLabel(aaGlobalChart);
"""
        return jsFunctionStr
    }
    
    func setUpTheAAChartViewOne() {
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
            .chartType(.line)//图形类型
            .title("执行由 JavaScript 字符串映射转换成的 js function 函数")//图形标题
            .subtitle("巧妙地将JavaScript字符串转换为function并执行")//图形副标题
            .dataLabelEnabled(false)//是否显示数字
            .symbolStyle(.borderBlank)
            .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])
            .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"])
            .series([
                AASeriesElement()
                    .name("Tokyo")
                    .data([29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4])
                    .toDic()!,
                ])
        
        aaChartView.aa_drawChartWithChartModel(aaChartModel)
        
    }
    
    func AAChartViewDidFinishedLoad () {
        print("🚀🚀🚀AAChartView did finished load")
        
        //图表加载完成后调用,避免WebView还没有获得JavaScript上下文,致使调用失败
        let jsFunctionStr = configureJavaScriptFunctionString()
        self.aaChartView!.evaluateJavaScriptStringFunctionBody(jsFunctionStr)
    }

}
