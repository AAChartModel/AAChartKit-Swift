//
//  PolarChartOptionsVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/1/4.
//  Copyright © 2024 An An. All rights reserved.
//

import UIKit
import AAInfographics

class PolarChartOptionsVC: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //三角形雷达图
    static func configureTriangleRadarChart() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.area)
            .backgroundColor(AAColor.white)
            .markerRadius(0)
            .yAxisMax(25)
            .yAxisGridLineWidth(1)
            .polar(true)
            .legendEnabled(false)
            .tooltipEnabled(false)
            .xAxisGridLineWidth(1)
            .yAxisGridLineWidth(1)
            .dataLabelsEnabled(true)
            .series([
                AASeriesElement()
                    .color(AAColor.white)
                    .fillOpacity(0.01)
                    .dataLabels(AADataLabels()
                        .color(AARgba(30, 144, 255, 1.0)))
                    .data([17.0, 16.9, 12.5,]),
            ])
        
        let aaOptions = aaChartModel.aa_toAAOptions()
        
        aaOptions.xAxis?
            .tickInterval(1)
            .lineWidth(0)//避免多边形外环之外有额外套了一层无用の外环
            .gridLineColor(AARgba(30, 144, 255, 0.6))
            .crosshair(AACrosshair()
                .width(1.5)
                .color(AAColor.white)
                .dashStyle(.longDashDotDot))
        
        aaOptions.yAxis?
            .gridLineInterpolation("polygon")
            .lineWidth(0)
            .gridLineColor(AARgba(30, 144, 255, 1.0))
            .crosshair(AACrosshair()
                .width(1.5)
                .color(AAColor.white)
                .dashStyle(.longDashDotDot))
            .tickPositions([5,10,15,20,25,])
        
        let aaPlotBandsArr = [
            AAPlotBandsElement()
                .from(0)
                .to(5)
                .color(AARgba(30, 144, 255, 1.0)),
            AAPlotBandsElement()
                .from(5)
                .to(10)
                .color(AARgba(30, 144, 255, 0.8)),
            AAPlotBandsElement()
                .from(10)
                .to(15)
                .color(AARgba(30, 144, 255, 0.6)),
            AAPlotBandsElement()
                .from(15)
                .to(20)
                .color(AARgba(30, 144, 255, 0.4)),
            AAPlotBandsElement()
                .from(20)
                .to(25)
                .color(AARgba(30, 144, 255, 0.2)),
        ]
        
        let aaYAxis = aaOptions.yAxis
        aaYAxis?.plotBands = aaPlotBandsArr
        
        return aaOptions
    }
    
    //四边形雷达图
    static func configureQuadrangleRadarChart() -> AAOptions {
        let aaOptions: AAOptions = configureTriangleRadarChart()
        aaOptions.yAxis?.plotBands = [
            AAPlotBandsElement()
                .from(0)
                .to(5)
                .color(AARgba(255, 0, 0, 1.0)),
            AAPlotBandsElement()
                .from(5)
                .to(10)
                .color(AARgba(255, 0, 0, 0.8)),
            AAPlotBandsElement()
                .from(10)
                .to(15)
                .color(AARgba(255, 0, 0, 0.6)),
            AAPlotBandsElement()
                .from(15)
                .to(20)
                .color(AARgba(255, 0, 0, 0.4)),
            AAPlotBandsElement()
                .from(20)
                .to(25)
                .color(AARgba(255, 0, 0, 0.2)),
        ]
        
        aaOptions.xAxis?.gridLineColor = AARgba(255, 0, 0, 0.6)
        aaOptions.yAxis?.gridLineColor = AARgba(255, 0, 0, 1.0)
        
        let element = aaOptions.series![0] as! AASeriesElement
        element
            .data([17.0, 16.9, 12.5, 14.5,])
            .dataLabels(AADataLabels()
                .color(AARgba(255, 0, 0, 1.0)))
        
        return aaOptions
    }
    
    //五边形雷达图
    static func configurePentagonRadarChart() -> AAOptions {
        let aaOptions = configureTriangleRadarChart()
        aaOptions.yAxis?.plotBands = [
            AAPlotBandsElement()
                .from(0)
                .to(5)
                .color(AARgba(255, 215, 0, 1.0)),
            AAPlotBandsElement()
                .from(5)
                .to(10)
                .color(AARgba(255, 215, 0, 0.8)),
            AAPlotBandsElement()
                .from(10)
                .to(15)
                .color(AARgba(255, 215, 0, 0.6)),
            AAPlotBandsElement()
                .from(15)
                .to(20)
                .color(AARgba(255, 215, 0, 0.4)),
            AAPlotBandsElement()
                .from(20)
                .to(25)
                .color(AARgba(255, 215, 0, 0.2)),
        ]
        
        aaOptions.xAxis?.gridLineColor = AARgba(255, 215, 0, 0.6)
        aaOptions.yAxis?.gridLineColor = AARgba(255, 215, 0, 1.0)
        
        let element = aaOptions.series![0] as! AASeriesElement
        element
            .data([17.0, 16.9, 12.5, 14.5, 18.2,])
            .dataLabels(AADataLabels()
                .color(AARgba(255, 215, 0, 1.0)))
        
        return aaOptions
    }
    
    //六边形雷达图
    static func configureHexagonRadarChart() -> AAOptions {
        let aaOptions = configureTriangleRadarChart()
        aaOptions.yAxis?.plotBands = [
            AAPlotBandsElement()
                .from(0)
                .to(5)
                .color(AARgba(50, 205, 50, 1.0)),
            AAPlotBandsElement()
                .from(5)
                .to(10)
                .color(AARgba(50, 205, 50, 0.8)),
            AAPlotBandsElement()
                .from(10)
                .to(15)
                .color(AARgba(50, 205, 50, 0.6)),
            AAPlotBandsElement()
                .from(15)
                .to(20)
                .color(AARgba(50, 205, 50, 0.4)),
            AAPlotBandsElement()
                .from(20)
                .to(25)
                .color(AARgba(50, 205, 50, 0.2)),
        ]
        
        aaOptions.xAxis?.gridLineColor = AARgba(50, 205, 50, 0.6)
        aaOptions.yAxis?.gridLineColor = AARgba(50, 205, 50, 1.0)
        
        let element = aaOptions.series![0] as! AASeriesElement
        element
            .data([17.0, 16.9, 12.5, 14.5, 18.2, 21.5,])
            .dataLabels(AADataLabels()
                .color(AARgba(50, 205, 50, 1.0)))
        
        return aaOptions
    }
    
    //🕸蜘蛛网状雷达图
    static func configureSpiderWebRadarChart() -> AAOptions {
        let aaOptions = configureTriangleRadarChart()
        aaOptions.yAxis?.plotBands = [
            AAPlotBandsElement()
                .from(0)
                .to(5)
                .color(AARgba(138, 43, 226, 1.0)),
            AAPlotBandsElement()
                .from(5)
                .to(10)
                .color(AARgba(138, 43, 226,  0.8)),
            AAPlotBandsElement()
                .from(10)
                .to(15)
                .color(AARgba(138, 43, 226,  0.6)),
            AAPlotBandsElement()
                .from(15)
                .to(20)
                .color(AARgba(138, 43, 226, 0.4)),
            AAPlotBandsElement()
                .from(20)
                .to(25)
                .color(AARgba(138, 43, 226, 0.2)),
        ]
        
        aaOptions.xAxis?.gridLineColor = AARgba(138, 43, 226,  0.6)
        aaOptions.yAxis?.gridLineColor = AARgba(138, 43, 226,  1.0)
        
        let element = aaOptions.series![0] as! AASeriesElement
        element
            .data([2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24])
            .dataLabels(AADataLabels()
                .color(AARgba(138, 43, 226, 1.0)))
        
        return aaOptions
    }
    
    //🕸蜘蛛网状雷达图
    static func configureSpiderWebRadarChart2() -> AAOptions {
        let aaOptions = configureTriangleRadarChart()
        aaOptions.yAxis?.plotBands = [
            AAPlotBandsElement()
                .from(0)
                .to(5)
                .color(AARgba(138, 43, 226, 1.0)),
            AAPlotBandsElement()
                .from(5)
                .to(10)
                .color(AARgba(138, 43, 226,  0.8)),
            AAPlotBandsElement()
                .from(10)
                .to(15)
                .color(AARgba(138, 43, 226,  0.6)),
            AAPlotBandsElement()
                .from(15)
                .to(20)
                .color(AARgba(138, 43, 226, 0.4)),
            AAPlotBandsElement()
                .from(20)
                .to(25)
                .color(AARgba(138, 43, 226, 0.2)),
        ]
        

        aaOptions.xAxis?
            .labels(AALabels()
                .enabled(false))
            .gridLineDashStyle(.solid)
            .gridLineWidth(3)
            .gridLineColor(AARgba(138, 43, 226,  0.6))
        
        aaOptions.xAxis?
            .lineWidth(10)
            .lineColor(AAColor.blue)
        
        aaOptions.yAxis?
            .gridLineDashStyle(.dash)
            .gridLineWidth(3)
            .gridLineColor(AARgba(138, 43, 226,  1.0))
        
        aaOptions.yAxis?
            .plotLines([
                AAPlotLinesElement()
                    .color("#1e90ff")//颜色值(16进制)
                    .dashStyle(.solid)//样式：Dash,Dot,Solid等,默认Solid
                    .width((10.0)) //标示线粗细
                    .value((25)) //所在位置
                    .zIndex((1)) //层叠,标示线在图表中显示の层叠级别，值越大，显示越向前
            ])
        
        let element = aaOptions.series![0] as! AASeriesElement
        element
            .data([2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24])
            .dataLabels(AADataLabels()
                .color(AARgba(138, 43, 226, 1.0)))
        
        return aaOptions
    }
    
    //https://github.com/AAChartModel/AAChartKit-Swift/issues/555
    static func configureCircularRadarChartWithDashedGridAndImageLabels() -> AAOptions {
        // chart
        let aaChart = AAChart()
            .type(.area)
            .polar(true)
        
        // title
        let aaTitle = AATitle()
            .text("圆形雷达图（x / y 双虚线网格 + 图片标签）")
        
        // pane
        let aaPane = AAPane()
            .size("80%")
        
        // xAxis with HTML image labels and dashed radial grid lines
        let xLabelsFormatter = """
        function () {
            const imgMap = {
                '苹果': 'https://cdn-icons-png.flaticon.com/512/415/415733.png',
                '香蕉': 'https://cdn-icons-png.flaticon.com/512/415/415734.png',
                '橙子': 'https://cdn-icons-png.flaticon.com/512/415/415732.png',
                '冰棍': 'https://cdn-icons-png.flaticon.com/512/415/415739.png',
                '棒棒糖': 'https://cdn-icons-png.flaticon.com/512/415/415736.png'
            };
            const imgURL = imgMap[this.value];
            return `
                <div style="text-align:center;">
                    <img src="${imgURL}" style="width:28px;height:28px;"><br>
                    <span style="font-size:11px;">${this.value}</span>
                </div>
            `;
        }
        """
        
        let aaXAxis = AAXAxis()
            .categories(["苹果", "香蕉", "橙子", "冰棍", "棒棒糖"]) // categories
            .tickmarkPlacement(.on) // tickmarkPlacement: 'on'
            .lineWidth(0) // lineWidth: 0
            .gridLineColor("#999") // gridLineColor: '#999'
            .gridLineWidth(1) // gridLineWidth: 1
            .gridLineDashStyle(.dash) // gridLineDashStyle: 'Dash'
            .labels(AALabels()
                .distance(15) // distance: 15
                .useHTML(true) // useHTML: true
                .formatter(xLabelsFormatter) // formatter: function () { ... }
            )
        
        // yAxis with circular grid and dashed lines
        let aaYAxis = AAYAxis()
            .gridLineInterpolation("circle") // gridLineInterpolation: 'circle'
            .gridLineDashStyle(.dash) // gridLineDashStyle: 'Dash'
            .gridLineColor("#999")
            .lineWidth(0)
            .min(0)
            .max(10)
            .tickInterval(2)
        
        // tooltip
        let aaTooltip = AATooltip()
            .shared(true)
            .pointFormat("<span style=\"color:{series.color}\">{series.name}: <b>{point.y}</b><br/>".aa_toPureHTMLString())
        
        // series
        let series = [
            AASeriesElement()
                .name("水果甜食评分")
                .data([8, 6, 7, 5, 9])
                .pointPlacement("on") // pointPlacement: 'on'
        ]
        
        // assemble options
        let aaOptions = AAOptions()
            .chart(aaChart)
            .title(aaTitle)
            .pane(aaPane)
            .xAxis(aaXAxis)
            .yAxis(aaYAxis)
            .tooltip(aaTooltip)
            .series(series)
        
        return aaOptions
    }
    
    /**
     
     */

}
