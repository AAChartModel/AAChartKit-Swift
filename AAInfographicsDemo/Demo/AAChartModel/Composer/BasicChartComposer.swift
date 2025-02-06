//
//  BasicChartComposer.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/3/14.
//  Copyright © 2024 An An. All rights reserved.
//

import AAInfographics

class BasicChartComposer {
    
    private static func configureBasicOptions() -> AAChartModel {
        return AAChartModel()
            .colorsTheme(["#1e90ff","#ef476f","#ffd066","#04d69f","#25547c",])//Colors theme
            .xAxisLabelsStyle(AAStyle(color: AAColor.white))
            .dataLabelsEnabled(false)
            .tooltipValueSuffix("℃")
            .animationType(.bounce)
            .legendItemStyle(AAStyle(color: AAColor.lightGray))
    }
    
    static func configureAreaChart() -> AAChartModel {
        let element1 = AASeriesElement()
            .name("Tokyo")
            .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
        
        let element2 = AASeriesElement()
            .name("NewYork")
            .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5])
        
        let element3 = AASeriesElement()
            .name("London")
            .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0])
        
        let element4 = AASeriesElement()
            .name("Berlin")
            .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8])
        
        return configureBasicOptions()
            .chartType(.area)
            .categories(["Java","Swift","Python","Ruby", "PHP","Go","C","C#","C++"])
            .series([element1, element2, element3, element4])
    }
    
    static func configureStepAreaChartAndStepLineChart() -> AAChartModel {
        let element1 = AASeriesElement()
            .name("Tokyo")
            .step(true)
            .data([149.9, 171.5, 106.4, 129.2, 144.0, 176.0, 135.6, 188.5, 276.4, 214.1, 95.6, 54.4])
        
        let element2 = AASeriesElement()
            .name("NewYork")
            .step(true)
            .data([83.6, 78.8, 188.5, 93.4, 106.0, 84.5, 105.0, 104.3, 131.2, 153.5, 226.6, 192.3])
        
        let element3 = AASeriesElement()
            .name("London")
            .step(true)
            .data([48.9, 38.8, 19.3, 41.4, 47.0, 28.3, 59.0, 69.6, 52.4, 65.2, 53.3, 72.2])
        
        return configureBasicOptions()
            .chartType(.area)
            .series([element1, element2, element3])
    }
    
    static func configureColumnChartAndBarChart() -> AAChartModel {
        return configureAreaChart()
            .categories([
                "Jan", "Feb", "Mar", "Apr", "May", "Jun",
                "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
            ])
            .legendEnabled(true)
            .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])
            .animationType(.easeOutCubic)
            .animationDuration(1200)
    }
    
    static func configureAreaChartAndAreasplineChartStyle(_ chartType: AAChartType) -> AAChartModel {
        let aaChartModel = configureAreaChart()
            .animationType(.easeOutQuart)
            .legendEnabled(true)
            .markerRadius(6)
            .markerSymbol(.circle)
            .markerSymbolStyle(.innerBlank)
        
        if chartType == .areaspline {
            let gradientColorDic = AAGradientColor.linearGradient(
                direction: .toBottomRight,
                startColor: "rgba(138,43,226,1)",
                endColor: "rgba(30,144,255,1)"
            )
            
            let element1 = AASeriesElement()
                .name("Predefined symbol")
                .fillColor(gradientColorDic)
                .data([0.45, 0.43, 0.50, 0.55, 0.58, 0.62, 0.83, 0.39, 0.56, 0.67, 0.50, 0.34, 0.50, 0.67, 0.58, 0.29, 0.46, 0.23, 0.47, 0.46, 0.38, 0.56, 0.48, 0.36])
            
            let element2 = AASeriesElement()
                .name("Image symbol")
                .data([0.38, 0.31, 0.32, 0.32, 0.64, 0.66, 0.86, 0.47, 0.52, 0.75, 0.52, 0.56, 0.54, 0.60, 0.46, 0.63, 0.54, 0.51, 0.58, 0.64, 0.60, 0.45, 0.36, 0.67])
            
            let element3 = AASeriesElement()
                .name("Base64 symbol (*)")
                .data([0.46, 0.32, 0.53, 0.58, 0.86, 0.68, 0.85, 0.73, 0.69, 0.71, 0.91, 0.74, 0.60, 0.50, 0.39, 0.67, 0.55, 0.49, 0.65, 0.45, 0.64, 0.47, 0.63, 0.64])
            
            let element4 = AASeriesElement()
                .name("Custom symbol")
                .data([0.60, 0.51, 0.52, 0.53, 0.64, 0.84, 0.65, 0.68, 0.63, 0.47, 0.72, 0.60, 0.65, 0.74, 0.66, 0.65, 0.71, 0.59, 0.65, 0.77, 0.52, 0.53, 0.58, 0.53])
            
            aaChartModel
                .animationType(.easeFrom)
                .series([element1, element2, element3, element4])
        }
        return aaChartModel
    }
    
    static func configureLineChartAndSplineChartStyle(_ chartType: AAChartType) -> AAChartModel {
        let aaChartModel = configureAreaChart()
            .chartType(chartType)
            .markerSymbolStyle(.borderBlank)
            .markerRadius(6)
        
        if chartType == .spline {
            let element1 = AASeriesElement()
                .name("Tokyo")
                .lineWidth(7)
                .data([50, 320, 230, 370, 230, 400])
            
            let element2 = AASeriesElement()
                .name("Berlin")
                .lineWidth(7)
                .data([80, 390, 210, 340, 240, 350])
            
            let element3 = AASeriesElement()
                .name("New York")
                .lineWidth(7)
                .data([100, 370, 180, 280, 260, 300])
            
            let element4 = AASeriesElement()
                .name("London")
                .lineWidth(7)
                .data([130, 350, 160, 310, 250, 268])
            
            aaChartModel
                .animationType(.swingFromTo)
                .series([element1, element2, element3, element4])
        }
        return aaChartModel
    }
}
