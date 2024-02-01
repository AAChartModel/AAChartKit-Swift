//
//  CustomStyleForLineChartComposer.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/2/1.
//  Copyright © 2024 An An. All rights reserved.
//

import AAInfographics

class CustomStyleForLineChartComposer {    
    
    //https://github.com/AAChartModel/AAChartKit/issues/1291
    static func customLineChartWithColorfulMarkersAndLines() -> AAChartModel {
        AAChartModel()
            .chartType(.line)
            .title("Custom Line Chart With Colorful Markers And Lines")
            .markerRadius(18.0)//marker点半径为8个像素
            .yAxisLineWidth(0)
            .legendEnabled(false)
            .series([
                AASeriesElement()
                    .name("Tokyo Hot")
                    .lineWidth(5.0)
                    .marker(AAMarker()
                        .states(AAMarkerStates()
                            .hover(AAMarkerHover()
                                .radius(40)
                                .lineWidth(5))))
                    .data([
                        2, 4, 8, 16, 32, 64, 128,
                        AADataElement()
                            .y(256.0)
                            .color(AAColor.red)
                            .toDic() as Any
                    ])
                    .zoneAxis("x")
                    .zones([
                        AAZonesElement()
                            .value(1)
                            .color(AAColor.red),
                        AAZonesElement()
                            .value(2)
                            .color(AAColor.orange),
                        AAZonesElement()
                            .value(3)
                            .color(AAColor.yellow),
                        AAZonesElement()
                            .value(4)
                            .color(AAColor.green),
                        AAZonesElement()
                            .value(5)
                            .color(AAColor.cyan),
                        AAZonesElement()
                            .value(6)
                            .color(AAColor.blue),
                        AAZonesElement()
                            .value(7)
                            .color(AAColor.purple),
                    ])
                ,
            ])
    }
    
    //https://github.com/AAChartModel/AAChartKit/issues/1291
    //https://github.com/AAChartModel/AAChartKit/issues/1293
    static func customLineChartWithColorfulMarkersAndLines2() -> AAChartModel {
        AAChartModel()
            .chartType(.line)
            .title("Custom Line Chart With Colorful Markers And Lines")
            .markerRadius(25.0)//marker点半径为8个像素
            .markerSymbol(.circle)
            .yAxisLineWidth(0)
            .legendEnabled(true)
            .stacking(.normal)
            .series([
                AASeriesElement()
                    .name(AAColor.blue)
                    .lineWidth(20.0)
                    .data([
                        2048, 1024, 1024, 1024, 1024,
                        AADataElement()
                            .y(2048)
                            .color(AARgba(30, 144, 255, 1.0))
                            .toDic() as Any,
                    ])
                    .zoneAxis("x")
                    .zones([
                        AAZonesElement()
                            .value(1)
                            .color(AARgba(30, 144, 255, 1.0)),
                        AAZonesElement()
                            .value(2)
                            .color(AARgba(30, 144, 255, 0.8)),
                        AAZonesElement()
                            .value(3)
                            .color(AARgba(30, 144, 255, 0.6)),
                        AAZonesElement()
                            .value(4)
                            .color(AARgba(30, 144, 255, 0.4)),
                        AAZonesElement()
                            .value(5)
                            .color(AARgba(30, 144, 255, 0.2)),
                    ])
                ,
                AASeriesElement()
                    .name(AAColor.red)
                    .lineWidth(20.0)
                    .data([
                        2048, 1024, 1024, 1024, 1024,
                        AADataElement()
                            .y(2048)
                            .color(AARgba(255, 0, 0, 1.0))
                            .toDic() as Any,
                    ])
                    .zoneAxis("x")
                    .zones([
                        AAZonesElement()
                            .value(1)
                            .color(AARgba(255, 0, 0, 1.0)),
                        AAZonesElement()
                            .value(2)
                            .color(AARgba(255, 0, 0, 0.8)),
                        AAZonesElement()
                            .value(3)
                            .color(AARgba(255, 0, 0, 0.6)),
                        AAZonesElement()
                            .value(4)
                            .color(AARgba(255, 0, 0, 0.4)),
                        AAZonesElement()
                            .value(5)
                            .color(AARgba(255, 0, 0, 0.2)),
                    ])
                ,
                AASeriesElement()
                    .name(AAColor.yellow)
                    .lineWidth(20.0)
                    .data([
                        2048, 1024, 1024, 1024, 1024,
                        AADataElement()
                            .y(2048)
                            .color(AARgba(255, 215, 0, 1.0))
                            .toDic() as Any,
                    ])
                    .zoneAxis("x")
                    .zones([
                        AAZonesElement()
                            .value(1)
                            .color(AARgba(255, 215, 0, 1.0)),
                        AAZonesElement()
                            .value(2)
                            .color(AARgba(255, 215, 0, 0.8)),
                        AAZonesElement()
                            .value(3)
                            .color(AARgba(255, 215, 0, 0.6)),
                        AAZonesElement()
                            .value(4)
                            .color(AARgba(255, 215, 0, 0.4)),
                        AAZonesElement()
                            .value(5)
                            .color(AARgba(255, 215, 0, 0.2)),
                    ])
                ,
                AASeriesElement()
                    .name(AAColor.green)
                    .lineWidth(20.0)
                    .data([
                        2048, 1024, 1024, 1024, 1024,
                        AADataElement()
                            .y(2048)
                            .color(AARgba(50, 205, 50, 1.0))
                            .toDic() as Any,
                    ])
                    .zoneAxis("x")
                    .zones([
                        AAZonesElement()
                            .value(1)
                            .color(AARgba(50, 205, 50, 1.0)),
                        AAZonesElement()
                            .value(2)
                            .color(AARgba(50, 205, 50, 0.8)),
                        AAZonesElement()
                            .value(3)
                            .color(AARgba(50, 205, 50, 0.6)),
                        AAZonesElement()
                            .value(4)
                            .color(AARgba(50, 205, 50, 0.4)),
                        AAZonesElement()
                            .value(5)
                            .color(AARgba(50, 205, 50, 0.2)),
                    ])
                ,
                AASeriesElement()
                    .name(AAColor.purple)
                    .lineWidth(20.0)
                    .data([
                        2048, 1024, 1024, 1024, 1024,
                        AADataElement()
                            .y(2048)
                            .color(AARgba(138, 43, 226, 1.0))
                            .toDic() as Any,
                    ])
                    .zoneAxis("x")
                    .zones([
                        AAZonesElement()
                            .value(1)
                            .color(AARgba(138, 43, 226, 1.0)),
                        AAZonesElement()
                            .value(2)
                            .color(AARgba(138, 43, 226, 0.8)),
                        AAZonesElement()
                            .value(3)
                            .color(AARgba(138, 43, 226, 0.6)),
                        AAZonesElement()
                            .value(4)
                            .color(AARgba(138, 43, 226, 0.4)),
                        AAZonesElement()
                            .value(5)
                            .color(AARgba(138, 43, 226, 0.2)),
                    ])
                ,
            ])
    }
    
    //https://github.com/AAChartModel/AAChartKit/issues/1401
    static func connectNullsForSingleAASeriesElement() -> AAChartModel {
        let dataArr = [
            0.45, NSNull(), NSNull(),
            0.55, 0.58, 0.62, NSNull(), NSNull(),
            0.56, 0.67, 0.50, 0.34, 0.50, NSNull(), NSNull(), NSNull(), NSNull(),
            0.23, 0.47, 0.46, 0.38, 0.56, 0.48, 0.36, NSNull(), NSNull(), NSNull(), NSNull(), NSNull(), NSNull(), NSNull(), NSNull(),
            0.74, 0.66, 0.65, 0.71, 0.59, 0.65, 0.77, 0.52, 0.53, 0.58, 0.53,
        ] as [Any]

        return AAChartModel()
            .chartType(.spline)
            .subtitle("虚拟数据")
            .colorsTheme(["#1e90ff", "#ef476f", "#ffd066", "#04d69f"])
            .yAxisTitle("摄氏度")
            .dataLabelsEnabled(false)
            .yAxisGridLineWidth(0)
            .stacking(.normal)
            .markerRadius(8)
            .markerSymbolStyle(.borderBlank)
            .series([
                AASeriesElement()
                    .name("Do NOT Connect Nulls")
                    .lineWidth(5)
                    .connectNulls(false)
                    .data(dataArr),
                AASeriesElement()
                    .name("Connect Nulls")
                    .lineWidth(5)
                    .connectNulls(true)
                    .data(dataArr),
                AASeriesElement()
                    .name("Do NOT Connect Nulls")
                    .lineWidth(5)
                    .connectNulls(false)
                    .data(dataArr),
                AASeriesElement()
                    .name("Connect Nulls")
                    .lineWidth(5)
                    .connectNulls(true)
                    .data(dataArr)
            ])
    }



    //https://github.com/AAChartModel/AAChartKit/issues/1419
    static func lineChartsWithLargeDifferencesInTheNumberOfDataInDifferentSeriesElement() -> AAChartModel {
        func generateRandomNumberArrayWithLength(_ length: Int,
                                                 randomRange: Int,
                                                 minNum: Int) -> [Any] {
            var randomNumArrA = [Any]()
            for _ in 0 ..< length {
                let randomNum = Int(arc4random()) % randomRange + minNum
                randomNumArrA.append(randomNum)
            }
            return randomNumArrA
        }
        
        func generateRandomNumberMixedNullArrayWithLength(_ length: Int,
                                                          randomRange: Int,
                                                          minNum: Int) -> [Any] {
            var randomNumArrA = [Any]()
            for x in 0 ..< length {
                if (100 < x && x < 150) || (300 < x && x < 350) {
                    let randomNum = Int(arc4random()) % randomRange + minNum
                    randomNumArrA.append(randomNum)
                } else {
                    randomNumArrA.append(NSNull())
                }
            }
            return randomNumArrA
        }
        
        return AAChartModel()
            .chartType(.line)
            .backgroundColor(AAColor.black)
            .colorsTheme(["#1e90ff", "#04d69f", "#ef476f", "#ffd066"])
            .dataLabelsEnabled(false)
            .markerRadius(0)
            .series([
                AASeriesElement()
                    .name("2017")
                    .lineWidth(6)
                    .data(generateRandomNumberMixedNullArrayWithLength(3550, randomRange: 5, minNum: 100)),
                AASeriesElement()
                    .name("2018")
                    .lineWidth(6)
                    .data(generateRandomNumberArrayWithLength(3550, randomRange: 100, minNum: 200)),
                AASeriesElement()
                    .name("2019")
                    .lineWidth(6)
                    .data(generateRandomNumberArrayWithLength(3550, randomRange: 150, minNum: 400)),
                AASeriesElement()
                    .name("2020")
                    .lineWidth(6)
                    .data(generateRandomNumberArrayWithLength(3550, randomRange: 150, minNum: 600)),
            ])
    }
    
}
