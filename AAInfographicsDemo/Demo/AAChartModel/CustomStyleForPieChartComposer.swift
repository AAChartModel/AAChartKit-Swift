//
//  CustomStyleForPieChartComposer.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/1/12.
//  Copyright © 2024 An An. All rights reserved.
//

import AAInfographics

class CustomStyleForPieChartComposer {
    
    static func pieChart() -> AAChartModel {
         AAChartModel()
            .chartType(.pie)
            .backgroundColor(AAColor.white)
            .title("LANGUAGE MARKET SHARES JANUARY,2020 TO MAY")
            .subtitle("virtual data")
            .dataLabelsEnabled(true)//是否直接显示扇形图数据
            .yAxisTitle("℃")
            .series([
                AASeriesElement()
                    .name("Language market shares")
                    .innerSize("40%")//内部圆环半径大小占比(内部圆环半径/扇形图半径),
                    .allowPointSelect(true)
                    .states(AAStates()
                        .hover(AAHover()
                            .enabled(false)//禁用点击区块之后出现的半透明遮罩层
                    ))
                    .data([
                        ["Java"  ,67],
                        ["Swift",999],
                        ["Python",83],
                        ["OC"    ,11],
                        ["Go"    ,30],
                    ])
            ])
    }
    
    static func doubleLayerPieChart() -> AAChartModel {
        AAChartModel()
            .chartType(.pie)
            .title("浏览器市场占比历史对比")
            .subtitle("无任何可靠依据的虚拟数据")
            .dataLabelsEnabled(true)//是否直接显示扇形图数据
            .yAxisTitle("摄氏度")
            .series([
                AASeriesElement()
                    .name("Past")
                    .size("40%")//尺寸大小
                    .innerSize("30%")//内部圆环半径大小占比
                    .borderWidth(0)//描边的宽度
                    .allowPointSelect(false)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
                    .data([
                        ["Firefox Past",   3336.2],
                        ["Chrome Past",      26.8],
                        ["Safari Past",      88.5],
                        ["Opera Past",       46.0],
                        ["Others Past",     223.0],
                    ]),
                AASeriesElement()
                    .name("Now")
                    .size("80%")//尺寸大小
                    .innerSize("70%")//内部圆环半径大小占比
                    .borderWidth(0)//描边的宽度
                    .allowPointSelect(false)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
                    .data([
                        ["Firefox Now",    336.2],
                        ["Chrome Now",    6926.8],
                        ["Safari Now",     388.5],
                        ["Opera Now",      446.0],
                        ["Others Now",     223.0],
                    ])
            ])
    }
    
    //https://github.com/AAChartModel/AAChartKit/issues/1234
    static func doubleLayerDoubleColorsPieChart() -> AAChartModel {
        AAChartModel()
            .chartType(.pie)
            .title("浏览器市场占比历史对比")
            .subtitle("无任何可靠依据的虚拟数据")
            .dataLabelsEnabled(false)//是否直接显示扇形图数据
            .yAxisTitle("摄氏度")
            .legendEnabled(true)
            .series([
                AASeriesElement()
                    .name("Past")
                    .colors([
                        AARgba(255, 0, 0, 1.0),
                        AARgba(255, 0, 0, 0.8),
                        AARgba(255, 0, 0, 0.6),
                        AARgba(255, 0, 0, 0.4),
                        AARgba(255, 0, 0, 0.2),
                    ])
                    .dataLabels(AADataLabels()
                        .enabled(false))
                    .size("25%")//尺寸大小
                    .innerSize("20%")//内部圆环半径大小占比
                    .borderWidth(0)//描边的宽度
                    .allowPointSelect(false)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
                    .data([
                        ["Firefox Past",   1336.2],
                        ["Chrome Past",     126.8],
                        ["Safari Past",     188.5],
                        ["Opera Past",      146.0],
                        ["Others Past",     223.0],
                    ]),
                
                AASeriesElement()
                    .name("Now")
                    .colors([
                        AARgba(30, 144, 255, 1.0),
                        AARgba(30, 144, 255, 0.8),
                        AARgba(30, 144, 255, 0.6),
                        AARgba(30, 144, 255, 0.4),
                        AARgba(30, 144, 255, 0.2),
                    ])
                    .dataLabels(AADataLabels()
                        .enabled(true)
                        .format("<b>{point.name}</b> <br> {point.percentage:.1f} %")
                        .alignTo("plotEdges")
                        .connectorShape("crookedLine")
                        .crookDistance("90%")
                        .style(AAStyle(color: AARgba(30, 144, 255, 1.0))))
                    .size("40%")//尺寸大小
                    .innerSize("80%")//内部圆环半径大小占比
                    .borderWidth(0)//描边的宽度
                    .allowPointSelect(false)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
                    .data([
                        ["Firefox Now",    926.8],
                        ["Chrome Now",     336.2],
                        ["Safari Now",     388.5],
                        ["Opera Now",      446.0],
                        ["Others Now",     223.0],
                    ])
            ])
    }
    
    
    static func pieChartWithSoftCorners() -> AAChartModel {
        pieChart()
            .borderRadius(10)
    }
    
    static func doubleLayerPieChartWithSoftCorners() -> AAChartModel {
        doubleLayerPieChart()
            .borderRadius(10)
    }
    
    static func doubleLayerDoubleColorsPieChartWithSoftCorners() -> AAChartModel {
        doubleLayerDoubleColorsPieChart()
            .borderRadius(6)
    }
    
    
    static func pieChartWithRoundedCorners() -> AAChartModel {
        pieChart()
            .borderRadius("50%")
    }
    
    static func doubleLayerPieChartWithRoundedCorners() -> AAChartModel {
        doubleLayerPieChart()
            .borderRadius("50%")
    }
    
    static func doubleLayerDoubleColorsPieChartWithRoundedCorners() -> AAChartModel {
        doubleLayerDoubleColorsPieChart()
            .borderRadius("50%")
    }

}
