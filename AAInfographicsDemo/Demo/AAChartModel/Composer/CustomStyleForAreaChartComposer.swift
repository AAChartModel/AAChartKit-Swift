//
// Created by AnAn on 2024/2/1.
// Copyright (c) 2024 An An. All rights reserved.
//

import AAInfographics

class CustomStyleForAreaChartComposer {

    static func withMinusNumberAreaChart() -> AAChartModel {
        AAChartModel()
            .chartType(.area)
            .title("带有负数的区域填充图")
            .markerRadius(0)//设置折线连接点宽度为0,即是隐藏连接点
            .subtitle("横屏查看效果更佳")
            .yAxisGridLineWidth(0)
            .dataLabelsEnabled(false)
            .categories(["Java", "Swift", "Python", "Ruby", "PHP", "Go",
                         "C", "C#", "C++", "Objective-C", "Kotlin", "Rust",])
            .colorsTheme(["#49C1B6", "#FDC20A", "#F78320", "#068E81", "#EA007B"])
            .series([
                AASeriesElement()
                    .name("2021")
                    .data([0, (-7.5), (-1.0), 3.7, 0, (-3), 8, 0,(-3.6), 4, (-2), 0]),
                AASeriesElement()
                    .name("2022")
                    .data([0, (-2.2), 2, (-2.2), 0, (-1.5), 0, 2.4, (-1), 3, (-1), 0]),
                AASeriesElement()
                    .name("2023")
                    .data([0, 2.3, 0, 1.2, (-1), 3, 0, (-3.3), 0, 2, (-0.3), 0]),
                AASeriesElement()
                    .name("2024")
                    .data([0, 10, 0.13,2,0, 2, 0, 3.7, 0, 1, (-3), 0]),
                AASeriesElement()
                    .name("2025")
                    .data([0, (-4.5), (-0.9), 5.5, (-1.9), 1.3, (-2.8), 0, (-1.7), 0, 3, 0, ]),
            ])
    }

    static func colorfulGradientAreaChart() -> AAChartModel {
        AAChartModel()
            .chartType(.area)
            .categories(["一月", "二月", "三月", "四月", "五月", "六月",
                         "七月", "八月", "九月", "十月", "十一月", "十二月"])
            .backgroundColor(AAColor.white)
            .markerRadius(0)
            .legendEnabled(false)
            .dataLabelsEnabled(false)
            .series([
                AASeriesElement()
                    .name("Tokyo Hot")
                    .color(AAGradientColor.linearGradient(
                        direction: .toRight,
                        stops: [
                            [0.0, "#febc0f"],//颜色字符串设置支持十六进制类型和 rgba 类型
                            [0.5, "#FF14d4"],
                            [1.0, "#0bf8f5"]
                        ]
                    ))
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6]),
            ])
    }

    static func gradientColorAreaChart() -> AAChartModel {
        AAChartModel()
            .chartType(.area)
            .categories(["一月", "二月", "三月", "四月", "五月", "六月",
                         "七月", "八月", "九月", "十月", "十一月", "十二月"])
            .markerRadius(8)//marker点半径为8个像素
            .markerSymbolStyle(.innerBlank)//marker点为空心效果
            .markerSymbol(.circle)//marker点为圆形点○
            .legendEnabled(false)
            .dataLabelsEnabled(false)
            .series([
                AASeriesElement()
                    .name("Tokyo Hot")
                    .lineWidth(5.0)
                    .color(AARgba(220, 20, 60, 1))//猩红色, alpha 透明度 1
                    .fillColor(AAGradientColor.linearGradient(
                        direction: .toBottom,
                        startColor: AARgba(255, 20, 147, 1),//深粉色, alpha 透明度 1
                        endColor: AARgba(255, 20, 147, 0.3)//热情的粉红, alpha 透明度 0.3
                    ))
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6]),
            ])
    }

    static func thresholdForAreaChart() -> AAChartModel {
        AAChartModel()
            .chartType(.area)
            .yAxisGridLineWidth(0)
            .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                         "July", "Aug", "Spe", "Oct", "Nov", "Dec"])
            .dataLabelsEnabled(false)//是否显示值
            .markerRadius(8)
            .markerSymbol(.circle)
            .markerSymbolStyle(.innerBlank)
            .legendEnabled(false)
            .series([
                AASeriesElement()
                    .threshold((-200))
                    .data([106.4, 129.2, 269.9, -100.5, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4])
                    .lineWidth(6)
                    .color(AARgba(30, 144, 255,1))
                    .fillColor(AAGradientColor.linearGradient(
                        direction: .toBottom,
                        startColor: AARgba(30, 144, 255, 1), //DodgerBlue, alpha 透明度 1
                        endColor: AARgba(30, 144, 255, 0.1)//DodgerBlue, alpha 透明度 0.1
                    ))
            ])
    }

    static func customSpecialStyleDataLabelOfSingleDataElementForAreaChart() -> AAChartModel {
        AAChartModel()
            .chartType(.area)
            .backgroundColor("#4b2b7f")
            .dataLabelsEnabled(false)//是否显示值
            .tooltipEnabled(true)
            .markerRadius(0)
            .xAxisVisible(false)
            .yAxisVisible(false)
            .series([
                AASeriesElement()
                    .name("Virtual Data")
                    .lineWidth(6)
                    .color(AARgba(255, 215, 0, 1))
                    .fillColor(AAGradientColor.linearGradient(
                        direction: .toBottom,
                        startColor: AARgba(255, 215, 0, 0.1),//gold color, alpha: 0.1
                        endColor: AARgba(255, 215, 0, 0.6)// gold color, alpha: 0.6
                    ))// gold color, alpha: 1.0
                    .data([
                        7.0, 6.9, 2.5, 14.5, 18.2,
                        AADataElement()
                            .dataLabels(AADataLabels()
                                .enabled(true)
                                .useHTML(true)
                                .format("<img src=https://www.highcharts.com/samples/graphics/sun.png>"
                                        + "<span style=color:#FFFFFF;font-weight:thin;font-size:25px>{y}</span>"
                                        + "<span style=color:#FFFFFF;font-weight:thin;font-size:17px> m</span>")
                                .style(AAStyle()
                                    .fontWeight(.bold)
                                    .color(AAColor.white)
                                    .fontSize(16))
                                .y(-35)
                                .align(.center)
                                .verticalAlign(.top)
                                .overflow(.none)
                                .crop(false))
                            .y(26.5)
                            .toDic(),
                        5.2, 26.5, 23.3, 45.3, 13.9, 9.6
                    ])
            ])
    }

    static func customMarkerStatesHoverStyleForAreaChart() -> AAChartModel {
        AAChartModel()
            .chartType(.area)
            .title("Custom Spline Chart Marker States Hover Style")
            .categories(["一月", "二月", "三月", "四月", "五月", "六月",
                         "七月", "八月", "九月", "十月", "十一月", "十二月"])
            .markerRadius(8.0)//marker点半径为8个像素
            .yAxisLineWidth(0)
            .yAxisGridLineWidth(0)
            .legendEnabled(false)
            .series([
                AASeriesElement()
                    .name("Tokyo Hot")
                    .lineWidth(5.0)
                    .color(AARgba(220, 20, 60, 1))//猩红色, alpha 透明度 1
                    .marker(AAMarker()
                        .states(AAMarkerStates()
                            .hover(AAMarkerHover()
                                .fillColor(AAColor.white)
                                .radius(40)
                                .lineColor(AAColor.green)
                                .lineWidth(20))
                        ))
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6]),
            ])
    }

    // GitHub issue https://github.com/AAChartModel/AAChartKit-Swift/issues/223
    static func colorfulGradientColorAndColorfulDataLabelsStepAreaChart() -> AAChartModel {
        AAChartModel()
            .chartType(.area)
            .yAxisVisible(false)
            .stacking(.normal)
            .colorsTheme(["#1e90ff", "#ef476f", "#ffd066", "#04d69f"])
            .markerSymbol(.circle)
            .markerRadius(5)
            .dataLabelsEnabled(true)
            .markerSymbolStyle(.innerBlank)
            .series([
                AASeriesElement()
                    .name("2017")
                    .fillColor(AAGradientColor.linearGradient(
                        direction: .toBottom,
                        stops: [
                            [0.0, AARgba(30, 144, 255, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
                            [0.6, AARgba(30, 144, 255, 0.2)],
                            [1.0, AARgba(30, 144, 255, 0.0)]
                        ]
                    ))
                    .lineWidth(6)
                    .step((true))
                    .dataLabels(AADataLabels()
                        .style(AAStyle(color: "#1e90ff", fontSize: 11)))
                    .data([2.10, 2.54, 2.78, 3.62, 4.41, 4.09, 3.83, 4.47, 4.20, 3.94, 3.80, 3.58, 3.19, 4.30, 3.69, 3.52, 3.02, 3.30]),
                AASeriesElement()
                    .name("2018")
                    .fillColor(AAGradientColor.linearGradient(
                        direction: .toBottom,
                        stops: [
                            [0.0, AARgba(255, 0, 0, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
                            [0.6, AARgba(255, 0, 0, 0.2)],
                            [1.0, AARgba(255, 0, 0, 0.0)]
                        ]
                    ))
                    .lineWidth(6)
                    .step((true))
                    .dataLabels(AADataLabels()
                        .style(AAStyle(color: "#ef476f", fontSize: 11)))
                    .data([1.56, 1.91, 2.45, 3.87, 3.24, 4.90, 4.61, 4.10, 4.17, 3.85, 4.17, 3.46, 3.46, 3.55, 3.50, 4.13, 2.58, 2.28]),
                AASeriesElement()
                    .name("2019")
                    .fillColor(AAGradientColor.linearGradient(
                        direction: .toBottom,
                        stops: [
                            [0.0, AARgba(255, 215, 0, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
                            [0.6, AARgba(255, 215, 0, 0.2)],
                            [1.0, AARgba(255, 215, 0, 0.0)]
                        ]
                    ))
                    .lineWidth(6)
                    .step((true))
                    .dataLabels(AADataLabels()
                        .style(AAStyle(color: "#ffd066", fontSize: 11)))
                    .data([1.16, 1.67, 2.64, 2.86, 3.00, 3.21, 4.14, 4.07, 3.68, 3.11, 3.41, 3.25, 3.32, 3.07, 3.92, 3.05, 2.18, 3.24]),
                AASeriesElement()
                    .name("2020")
                    .fillColor(AAGradientColor.linearGradient(
                        direction: .toBottom,
                        stops: [
                            [0.0, AARgba(50, 205, 50, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
                            [0.6, AARgba(50, 205, 50, 0.2)],
                            [1.0, AARgba(50, 205, 50, 0.0)]
                        ]
                    ))
                    .lineWidth(6)
                    .step((true))
                    .dataLabels(AADataLabels()
                        .style(AAStyle(color: "#04d69f", fontSize: 11)))
                    .data([5.59, 3.09, 4.09, 6.14, 5.33, 6.05, 5.71, 6.22, 6.56, 4.75, 5.27, 6.02, 5.22, 5.77, 6.19, 5.68, 4.33, 5.48]),
            ])
    }

    //https://github.com/AAChartModel/AAChartKit/issues/921
    static func negativeColorMixedAreaChart() -> AAChartModel {
        AAChartModel()
            .chartType(.area)
            .legendEnabled(false)
            .dataLabelsEnabled(false)
            .markerRadius(5)
            .markerSymbolStyle(.innerBlank)
            .yAxisGridLineWidth(0)
            .series([
                AASeriesElement()
                    .name("Column")
                    .data([
                        +7.0, +6.9, +2.5, +14.5, +18.2, +21.5, +5.2, +26.5, +23.3, +45.3, +13.9, +9.6,
                        -7.0, -6.9, -2.5, -14.5, -18.2, -21.5, -5.2, -26.5, -23.3, -45.3, -13.9, -9.6,
                    ])
                    .lineWidth(5)
                    .color(AARgba(30, 144, 255, 1.0))
                    .negativeColor(AARgba(255, 0, 0, 1.0))
                    .fillColor(AAGradientColor.linearGradient(
                        direction: .toTop,
                        stops: [
                            [0.0, AARgba(30, 144, 255, 0.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
                            [0.5, AARgba(30, 144, 255, 0.0)],
                            [1.0, AARgba(30, 144, 255, 0.6)]
                        ]
                    ))
                    .negativeFillColor(AAGradientColor.linearGradient(
                        direction: .toTop,
                        stops: [
                            [0.0, AARgba(255, 0, 0, 0.6)],//颜色字符串设置支持十六进制类型和 rgba 类型
                            [0.5, AARgba(255, 0, 0, 0.0)],
                            [1.0, AARgba(255, 0, 0, 0.0)]
                        ]
                    ))
                    .threshold(0)//default:0
            ])
    }

    //https://github.com/AAChartModel/AAChartCore-Kotlin/issues/149
    static func customColorfulGradientColorZonesForAreaChart() -> AAChartModel {
        AAChartModel()
            .chartType(.area)
            .backgroundColor(AAColor.black)
            .categories([
                "Jan", "Feb", "Mar", "Apr", "May", "Jun",
                "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
            ])
            .dataLabelsEnabled(false)
            .legendEnabled(false)
            .markerRadius(0)
            .xAxisLabelsStyle(AAStyle(color: AAColor.white, fontSize: 12, weight: .regular))
            .yAxisLabelsStyle(AAStyle(color: AAColor.lightGray, fontSize: 15, weight: .bold))
            .series([
                AASeriesElement()
                    .name("空气湿度")
                    .lineWidth(6)
                    .zoneAxis(.x)
                    .zones([
                        AAZonesElement()
                            .value(2)
                            .color(AAColor.red)
                            .fillColor(AAGradientColor.linearGradient(
                                direction: .toBottom,
                                stops: [
                                    [0.0, AARgba(255, 0, 0, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
                                    [1.0, AAColor.clear]
                                ])),
                        AAZonesElement()
                            .value(5)
                            .color(AAColor.green)
                            .fillColor(AAGradientColor.linearGradient(
                                direction: .toBottom,
                                stops: [
                                    [0.0, AARgba(0, 255, 0, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
                                    [1.0, AAColor.clear]
                                ])),
                        AAZonesElement()
                            .color(AAColor.blue)
                            .fillColor(AAGradientColor.linearGradient(
                                direction: .toBottom,
                                stops: [
                                    [0.0, AARgba(0, 0, 255, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
                                    [1.0, AAColor.clear]
                                ])),
                    ])
                    .data([
                        56.5, 33.3, 85.3, 23.9, 29.6, 34.5, 28.2, 26.5, 15.2, 56.5, 33.3,
                        AADataElement()
                            .marker(AAMarker()
                                .radius(8)//曲线连接点半径
                                .symbol(.circle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                                .fillColor(AAColor.white)//点的填充色(用来设置折线连接点的填充色)
                                .lineWidth(5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                                .lineColor("#1E90FF"))//道奇蓝色, 外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
                            .dataLabels(AADataLabels()
                                .enabled(true)
                                .allowOverlap(true)
                                .useHTML(true)
                                .backgroundColor(AARgba(65, 111, 166, 1.0))
                                .borderRadius(10)
                                .shape(.callout)
                                .format("{point.category}<br>{series.name}: {point.y} %")
                                .style(AAStyle(color: AAColor.white, fontSize: 12, weight: .bold))
                                .x(-80).y(5)
                                .align(.center)
                                .overflow(.none)
                                .verticalAlign(.top)
                                .crop(false))
                            .y(85.3)
                            .toDic() as Any
                    ]),
            ])
    }
}
