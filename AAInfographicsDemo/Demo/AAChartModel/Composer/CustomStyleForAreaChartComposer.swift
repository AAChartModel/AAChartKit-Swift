//
// Created by AnAn on 2024/2/1.
// Copyright (c) 2024 An An. All rights reserved.
//

import AAInfographics

class CustomStyleForAreaChartComposer {
    
    //https://github.com/AAChartModel/AAChartKit/issues/921
    static func configureNegativeColorMixedAreasplineChart() -> AAChartModel {
        AAChartModel()
            .chartType(.areaspline)
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
   static func customAreasplineChartWithColorfulGradientColorZones() -> AAChartModel {
        let redStopsArr = [
            [0.0, AARgba(255, 0, 0, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
            [1.0, AAColor.clear]
        ]

        let greenStopsArr = [
            [0.0, AARgba(0, 255, 0, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
            [1.0, AAColor.clear]
        ]

        let blueStopsArr = [
            [0.0, AARgba(0, 0, 255, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
            [1.0, AAColor.clear]
        ]

        let redGradientColorDic = AAGradientColor.linearGradient(direction: .toBottom, stops: redStopsArr)
        let greenGradientColorDic = AAGradientColor.linearGradient(direction: .toBottom, stops: greenStopsArr)
        let blueGradientColorDic = AAGradientColor.linearGradient(direction: .toBottom, stops: blueStopsArr)

        let singleSpecialData = AADataElement()
            .marker(AAMarker()
                .radius(8)//曲线连接点半径
                .symbol(.circle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                .fillColor(AAColor.white)//点的填充色(用来设置折线连接点的填充色)
                .lineWidth(5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
                .lineColor("#1E90FF")//道奇蓝
            )
            .dataLabels(AADataLabels()
                .enabled(true)
                .allowOverlap(true)
                .useHTML(true)
                .backgroundColor(AARgba(65, 111, 166, 1.0))
                .borderRadius(10)
                .shape("callout")
                .format("{point.category}<br>{series.name}: {point.y} %")
                .style(AAStyle(color: AAColor.white, fontSize: 12, weight: .bold))
                .x(-80).y(5)
                .align(.center)
                .verticalAlign(.top)
                .overflow("none")
                .crop(false)
            )
            .y(85.3)
            .toDic()!

        let axisLabelsStyle = AAStyle(color: AAColor.white, fontSize: 12, weight: .bold)

        return AAChartModel()
            .chartType(.areaspline)
            .backgroundColor(AAColor.black)
            .categories([
                "Jan", "Feb", "Mar", "Apr", "May", "Jun",
                "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
            ])
            .dataLabelsEnabled(false)
            .legendEnabled(false)
            .markerRadius(0)
            .xAxisLabelsStyle(axisLabelsStyle)
            .yAxisLabelsStyle(axisLabelsStyle)
            //            .xAxisGridLineStyle(AALineStyle()
            //                                    .color(AAColor.white)
            //                                    .dashStyle(.longDashDotDot)
            //                                    .width(0.5))
            //            .yAxisGridLineStyle(AALineStyle()
            //                                    .width(0))
            .series([
                AASeriesElement()
                    .name("空气湿度")
                    .lineWidth(6)
                    .zoneAxis("x")
                    .zones([
                        AAZonesElement()
                            .value(2)
                            .color(AAColor.red)
                            .fillColor(redGradientColorDic),
                        AAZonesElement()
                            .value(5)
                            .color(AAColor.green)
                            .fillColor(greenGradientColorDic),
                        AAZonesElement()
                            .color(AAColor.blue)
                            .fillColor(blueGradientColorDic),
                    ])
                    .data([
                        56.5, 33.3, 85.3, 23.9, 29.6, 34.5, 28.2, 26.5, 15.2, 56.5, 33.3, singleSpecialData
                    ]),
            ])
    }
}
