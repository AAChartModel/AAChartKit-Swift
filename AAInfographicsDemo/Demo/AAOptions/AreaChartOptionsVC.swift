//
//  AreaChartOptionsVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2023/7/21.
//  Copyright © 2023 An An. All rights reserved.
//

import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class AreaChartOptionsVC: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func chartConfigurationWithSelectedIndex(_ selectedIndex: Int) -> Any? {
        switch selectedIndex {
        case 0: return configureComplicatedCustomAreasplineChart()//复杂自定义曲线填充图 1
        case 1: return configureComplicatedCustomAreasplineChart2()//复杂自定义曲线填充图 2
        case 2: return configureComplicatedCustomAreasplineChart3()//复杂自定义曲线填充图 3
        case 3: return configureComplicatedCustomAreaChart()//复杂自定义折线填充图 1
        case 4: return configureComplicatedCustomAreaChart2()//复杂自定义折线填充图 2
        case 5: return configureComplicatedCustomAreaChart3()//复杂自定义折线填充图 3
        case 6: return configureComplicatedCustomStepAreaChart()//复杂自定义阶梯折线填充图 1
        case 7: return configureComplicatedCustomStepAreaChart2()//复杂自定义阶梯折线填充图 2
        case 8: return configureComplicatedCustomStepAreaChart3()//复杂自定义阶梯折线填充图 3

        default:
            return AAOptions()
        }
    }
    
    
    
    private func configureComplicatedCustomAreasplineChart() -> AAOptions {
        let aaChart = AAChart()
            .type(.areaspline)
            .backgroundColor(AAColor.black)
        
        let aaTitle = AATitle()
            .text("")
        
        let aaXAxis = AAXAxis()
            .categories([
                "一月", "二月", "三月", "四月", "五月", "六月",
                "七月", "八月", "九月", "十月", "十一月", "十二月"
            ])
            .tickWidth(0)//X轴刻度线宽度
            .lineWidth(1.5)//X轴轴线宽度
            .lineColor(AAColor.white)//X轴轴线颜色
            .gridLineColor(AAColor.white)
            .gridLineWidth(0.5)//X轴网格线宽度
            .gridLineDashStyle(.dash)
            .labels(AALabels()
                    .style(AAStyle()
                            .color(AAColor.white))//X轴文字颜色
            )
        
        let aaYAXis = AAYAxis()
            .title(AATitle()
                    .text(""))
            .tickPositions([0, 20, 40, 60, 80, 100])
            .lineWidth(1.5)//Y轴轴线颜色
            .lineColor(AAColor.white)//Y轴轴线颜色
            .gridLineWidth(0)//Y轴网格线宽度
            .gridLineDashStyle(.dash)
            .labels(AALabels()
                    .format("{value} %")//给y轴添加单位
                    .style(AAStyle()
                            .color(AAColor.white))//Y轴文字颜色
            )
        
        
        let aaPlotOptions = AAPlotOptions()
            .series(AASeries()
                    .marker(AAMarker()
                            .symbol(.circle)
                            .radius(0)))
        
        let aaLegend = AALegend()
            .enabled(true)
            .itemStyle(AAItemStyle()
                        .color(AAColor.white))
            .align(.left)//设置图例位于水平方向上的右侧
            .layout(.horizontal)//设置图例排列方式为垂直排布
            .verticalAlign(.top)//设置图例位于竖直方向上的顶部
        
        let blueStopsArr = [
            [0.0, AARgba(30, 144, 255, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
            [0.6, AARgba(30, 144, 255, 0.2)],
            [1.0, AARgba(30, 144, 255, 0.0)]
        ]
        let gradientBlueColorDic = AAGradientColor.linearGradient(
            direction: .toBottom,
            stops: blueStopsArr
        )
        
        let redStopsArr = [
            [0.0, AARgba(255, 0, 0, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
            [0.6, AARgba(255, 0, 0, 0.2)],
            [1.0, AARgba(255, 0, 0, 0.0)]
        ]
        let gradientRedColorDic = AAGradientColor.linearGradient(
            direction: .toBottom,
            stops: redStopsArr
        )
        
        let singleSpecialData1 = AADataElement()
            .marker(
                AAMarker()
                    .radius(8)//曲线连接点半径
                    .symbol(.circle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                    .fillColor(AAColor.white)//点的填充色(用来设置折线连接点的填充色)
                    .lineWidth(5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                    //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
                    .lineColor("#1e90ff")
            )
            .dataLabels(
                AADataLabels()
                    .enabled(true)
                    .useHTML(true)
                    .backgroundColor("#1e90ff")
                    .borderRadius(5)
                    .shape(.callout)
                    .format("{point.category}<br>{series.name}: {point.y} %")
                    .style(AAStyle()
                            .fontWeight(.bold)
                            .color(AAColor.white)
                            .fontSize(16)
                            .fontWeight(.thin))
                    .y((-75))
                    .align(.center)
                    .verticalAlign(.top)
                    .overflow(.none)
                    .crop(false)
            )
            .y(51.5)
            .toDic()
        
        let singleSpecialData2 = AADataElement()
            .marker(
                AAMarker()
                    .radius(8)//曲线连接点半径
                    .symbol(.circle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                    .fillColor(AAColor.white)//点的填充色(用来设置折线连接点的填充色)
                    .lineWidth(5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                    //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
                    .lineColor("#ef476f")
            )
            .dataLabels(
                AADataLabels()
                    .enabled(true)
                    .useHTML(true)
                    .backgroundColor(AAColor.red)
                    .borderRadius(5)
                    .shape(.callout)
                    .format("{point.category}<br>{series.name}: {point.y} %")
                    .style(AAStyle()
                            .fontWeight(.bold)
                            .color(AAColor.white)
                            .fontSize(16)
                            .fontWeight(.thin))
                    .y((-75))
                    .align(.center)
                    .verticalAlign(.top)
                    .overflow(.none)
                    .crop(false)
            )
            .y(26.5)
            .toDic()

        
        let aaSeriesArr = [
            AASeriesElement()
                .name("空气湿度")
                .fillColor(gradientBlueColorDic)
                .lineWidth(6)
                .data([17.0, 16.9, 8.5, 34.5, 28.2, singleSpecialData1, 15.2, 56.5, 33.3, 85.3, 23.9, 29.6]),
            AASeriesElement()
                .name("土壤湿度")
                .fillColor(gradientRedColorDic)
                .lineWidth(6)
                .data([7.0, 6.9, 2.5, 14.5, 18.2, singleSpecialData2, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6]),
        ]
        
        let aaOptions = AAOptions()
            .chart(aaChart)
            .title(aaTitle)
            .colors(["#1e90ff",AAColor.red,])
            .xAxis(aaXAxis)
            .yAxis(aaYAXis)
            .plotOptions(aaPlotOptions)
            .legend(aaLegend)
            .series(aaSeriesArr)
        
        
        return aaOptions
    }
    
    private func configureComplicatedCustomAreasplineChart2() -> AAOptions {
        let aaOptions = configureComplicatedCustomAreasplineChart()
        
        aaOptions.chart!.backgroundColor = AAGradientColor.linearGradient(
            direction: .toTop,
            startColor: AARgba(113, 180, 185, 1.0),
            endColor: AARgba(115, 183, 166, 1.0)
        )
        
        aaOptions.colors = [
            AARgba(204, 150, 103, 1.0),
            AARgba(154, 243, 247, 1.0),
        ]
        
        aaOptions.tooltip = AATooltip()
            .shared(true)
            .backgroundColor(AAColor.white)
            .valueSuffix(" %")
        
        let aaDataLabelsStyle = AAStyle()
            .fontWeight(.bold)
            .color(AAColor.white)
            .fontSize(16)
            .fontWeight(.thin)
        
        let singleSpecialData1 = AADataElement()
            .marker(
                AAMarker()
                    .radius(8)//曲线连接点半径
                    .symbol(.circle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                    .fillColor(AAColor.white)//点的填充色(用来设置折线连接点的填充色)
                    .lineWidth(5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                    //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
                    .lineColor(AARgba(204, 150, 103, 1.0))
            )
            .dataLabels(
                AADataLabels()
                    .enabled(true)
                    .allowOverlap(true)
                    .useHTML(true)
                    .backgroundColor(AARgba(219, 148, 111, 1.0))
                    .borderRadius(10)
                    .shape(.callout)
                    .format("{point.category}<br>{series.name}: {point.y} %")
                    .style(aaDataLabelsStyle)
                    .y((-75))
                    .align(.center)
                    .verticalAlign(.top)
                    .overflow(.none)
                    .crop(false)
            )
            .y(51.5)
            .toDic()
        
        let singleSpecialData2 = AADataElement()
            .marker(
                AAMarker()
                    .radius(8)//曲线连接点半径
                    .symbol(.circle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                    .fillColor(AAColor.white)//点的填充色(用来设置折线连接点的填充色)
                    .lineWidth(5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                    //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
                    .lineColor(AARgba(154, 243, 247, 1.0))
            )
            .dataLabels(
                AADataLabels()
                    .enabled(true)
                    .allowOverlap(true)
                    .useHTML(true)
                    .backgroundColor(AARgba(65, 111, 166, 1.0))
                    .borderRadius(10)
                    .shape(.callout)
                    .format("{point.category}<br>{series.name}: {point.y} %")
                    .style(aaDataLabelsStyle)
                    .y((-75))
                    .align(.center)
                    .verticalAlign(.top)
                    .overflow(.none)
                    .crop(false)
            )
            .y(26.5)
            .toDic()
        
        let aaSeriesArr = [
            AASeriesElement()
                .name("空气湿度")
                .lineWidth(3)
                .zoneAxis(.x)
                .zones([
                    AAZonesElement()
                        .value(5)
                        .fillColor(
                            AAGradientColor.linearGradient(
                                direction: .toTop,
                                stops: [
                                    [0.0, AAColor.clear],//颜色字符串设置支持十六进制类型和 rgba 类型
                                    [0.6, AARgba(219, 148, 111, 0.6)],
                                    [1.0, AARgba(219, 148, 111, 1.0)]
                                ])
                        ),
                    AAZonesElement()
                        .fillColor(AAColor.clear),
                ])
                .data([17.0, 16.9, 8.5, 34.5, 28.2, singleSpecialData1, 15.2, 56.5, 33.3, 85.3, 23.9, 29.6]),
            
            AASeriesElement()
                .name("土壤湿度")
                .lineWidth(3)
                .zoneAxis(.x)
                .zones([
                    AAZonesElement()
                        .value(5)
                        .fillColor(AAGradientColor.linearGradient(
                                    direction: .toTop,
                                    stops: [
                                        [0.0, AAColor.clear],//颜色字符串设置支持十六进制类型和 rgba 类型
                                        [0.6, AARgba(65, 111, 166, 0.6)],
                                        [1.0, AARgba(65, 111, 166, 1.0)]
                                    ])),
                    AAZonesElement()
                        .fillColor(AAColor.clear),
                ])
                .data([7.0, 6.9, 2.5, 14.5, 18.2, singleSpecialData2, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6]),
        ]
        
        aaOptions.series = aaSeriesArr
        
        return aaOptions
    }
    
    private func configureComplicatedCustomAreasplineChart3() -> AAOptions {
        let aaDataLabelsStyle = AAStyle()
            .fontWeight(.bold)
            .color(AAColor.white)
            .fontSize(16)
            .fontWeight(.thin)
        
        let singleSpecialData1 = AADataElement()
            .marker(
                AAMarker()
                    .radius(8)//曲线连接点半径
                    .symbol(.circle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                    .fillColor(AAColor.white)//点的填充色(用来设置折线连接点的填充色)
                    .lineWidth(5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                    //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
                    .lineColor(AARgba(204, 150, 103, 1.0))
            )
            .dataLabels(
                AADataLabels()
                    .enabled(true)
                    .allowOverlap(true)
                    .useHTML(true)
                    .backgroundColor(AARgba(219, 148, 111, 1.0))
                    .borderRadius(10)
                    .shape(.callout)
                    .format("{point.category}<br>{series.name}: {point.y} %")
                    .style(aaDataLabelsStyle)
                    .y((-75))
                    .align(.center)
                    .verticalAlign(.top)
                    .overflow(.none)
                    .crop(false)
            )
            .y(34.5)
            .toDic()

        
        let singleSpecialData2 = AADataElement()
            .marker(
                AAMarker()
                    .radius(8)//曲线连接点半径
                    .symbol(.circle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                    .fillColor(AAColor.white)//点的填充色(用来设置折线连接点的填充色)
                    .lineWidth(5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                    //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
                    .lineColor(AARgba(154, 243, 247, 1.0))
            )
            .dataLabels(
                AADataLabels()
                    .enabled(true)
                    .allowOverlap(true)
                    .useHTML(true)
                    .backgroundColor(AARgba(65, 111, 166, 1.0))
                    .borderRadius(10)
                    .shape(.callout)
                    .format("{point.category}<br>{series.name}: {point.y} %")
                    .style(aaDataLabelsStyle)
                    .y((-75))
                    .align(.center)
                    .verticalAlign(.top)
                    .overflow(.none)
                    .crop(false)
            )
            .y(14.5)
            .toDic()

        
        let aaSeriesArr = [
            AASeriesElement()
                .name("空气湿度")
                .lineWidth(3)
                .zoneAxis(.x)
                .zones([
                    AAZonesElement()
                        .value(3)
                        .fillColor(AAColor.clear),
                    AAZonesElement()
                        .fillColor(AAGradientColor.linearGradient(
                                    direction: .toTop,
                                    stops: [
                                        [0.0, AAColor.clear],//颜色字符串设置支持十六进制类型和 rgba 类型
                                        [0.6, AARgba(65, 111, 166, 0.6)],
                                        [1.0, AARgba(65, 111, 166, 1.0)]
                                    ])),
                ])
                .data([17.0, 16.9, 8.5, singleSpecialData1, 28.2, 51.5, 15.2, 56.5, 33.3, 85.3, 23.9, 29.6]),
            
            AASeriesElement()
                .name("土壤湿度")
                .lineWidth(3)
                .zoneAxis(.x)
                .zones([
                    AAZonesElement()
                        .value(3)
                        .fillColor(AAColor.clear),
                    AAZonesElement()
                        .fillColor(AAGradientColor.linearGradient(
                                    direction: .toTop,
                                    stops: [
                                        [0.0, AAColor.clear],//颜色字符串设置支持十六进制类型和 rgba 类型
                                        [0.6, AARgba(65, 111, 166, 0.6)],
                                        [1.0, AARgba(65, 111, 166, 1.0)]
                                    ])),
                ])
                .data([7.0, 6.9, 2.5, singleSpecialData2, 18.2, 26.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6]),
        ]
        
        let aaOptions = configureComplicatedCustomAreasplineChart2()
        
        aaOptions.series = aaSeriesArr
        
        return aaOptions
    }
    
    
    private func configureComplicatedCustomAreaChart() -> AAOptions {
        let aaOptions = configureComplicatedCustomAreasplineChart()
        
        aaOptions.chart?.type(.area)
        
        return aaOptions
    }
    
    private func configureComplicatedCustomAreaChart2() -> AAOptions {
        let aaOptions = configureComplicatedCustomAreasplineChart2()
        
        aaOptions.chart?.type(.area)
        
        return aaOptions
    }
    
    private func configureComplicatedCustomAreaChart3() -> AAOptions {
        let aaOptions = configureComplicatedCustomAreasplineChart3()
        
        aaOptions.chart?.type(.area)
        
        return aaOptions
    }

    private func configureComplicatedCustomStepAreaChart() -> AAOptions {
        let aaOptions = configureComplicatedCustomAreaChart()
    
        aaOptions.series?.forEach({ seriesElement in
            let aaSeriesElement = seriesElement as! AASeriesElement
            aaSeriesElement.step(true)
        })

        return aaOptions
    }

    private func configureComplicatedCustomStepAreaChart2() -> AAOptions {
        let aaOptions = configureComplicatedCustomAreaChart2()

        aaOptions.series?.forEach({ seriesElement in
            let aaSeriesElement = seriesElement as! AASeriesElement
            aaSeriesElement.step(true)
        })

        return aaOptions
    }

    private func configureComplicatedCustomStepAreaChart3() -> AAOptions {
        let aaOptions = configureComplicatedCustomAreaChart3()

        aaOptions.series?.forEach({ seriesElement in
            let aaSeriesElement = seriesElement as! AASeriesElement
            aaSeriesElement.step(true)
        })
        
        return aaOptions
    }

}
