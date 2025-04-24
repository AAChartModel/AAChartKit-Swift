//
//  AARoundedCornersChartComposer.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/4/17.
//  Copyright © 2025 An An. All rights reserved.
//

import AAInfographics

class AARoundedCornersChartComposer {
    
    //https://github.com/AAChartModel/AAChartKit-Swift/issues/323
    //https://github.com/AAChartModel/AAChartKit-Swift/issues/346
    //https://github.com/highcharts/rounded-corners
    class func freeStyleRoundedCornersStackingColumnChart() -> AAChartModel {
        AAChartModel()
            .chartType(.column)
            .stacking(.percent)
            .title("Free-Style Rounded Corners Stacking Column Chart")
            .colorsTheme([
                AAGradientColor.linearGradient(startColor: AARgb(128, 255, 165), endColor: AARgb(1  , 191, 236)),
                AAGradientColor.linearGradient(startColor: AARgb(0  , 221, 255), endColor: AARgb(77 , 119, 255)),
                AAGradientColor.linearGradient(startColor: AARgb(55 , 162, 255), endColor: AARgb(116, 21 , 219)),
                AAGradientColor.linearGradient(startColor: AARgb(255, 0  , 135), endColor: AARgb(135, 0  , 157)),
                AAGradientColor.linearGradient(startColor: AARgb(255, 191, 0  ), endColor: AARgb(224, 62 , 76 )),
            ])
            .series([
                AARoundedCornersSeriesElement()
                    .name("Tokyo Hot")
                    .borderRadiusTopLeft("50%")
                    .borderRadiusTopRight("50%")
                    .data([2.10, 2.54, 2.78, 3.62, 4.41, 4.09, 3.83, 4.47, 4.20, 3.94, 3.80, 3.58, 3.19, 4.30, 3.69, 3.52, 3.02, 3.30]),
                
                AARoundedCornersSeriesElement()
                    .name("Berlin Hot")
                    .borderRadiusBottomLeft("50%")
                    .borderRadiusBottomRight("50%")
                    .data([1.56, 1.91, 2.45, 3.87, 3.24, 4.90, 4.61, 4.10, 4.17, 3.85, 4.17, 3.46, 3.46, 3.55, 3.50, 4.13, 2.58, 2.28]),
                
                AARoundedCornersSeriesElement()
                    .name("Beijing Hot")
                    .borderRadiusTopLeft("50%")
                    .borderRadiusBottomRight("50%")
                    .data([1.16, 1.67, 2.64, 2.86, 3.00, 3.21, 4.14, 4.07, 3.68, 3.11, 3.41, 3.25, 3.32, 3.07, 3.92, 3.05, 2.18, 3.24]),
                
                AARoundedCornersSeriesElement()
                    .name("London Hot")
                    .borderRadiusTopRight("50%")
                    .borderRadiusBottomLeft("50%")
                    .data([5.59, 3.09, 4.09, 6.14, 5.33, 6.05, 5.71, 6.22, 6.56, 4.75, 5.27, 6.02, 5.22, 5.77, 6.19, 5.68, 4.33, 5.48]),
                
                AARoundedCornersSeriesElement()
                    .name("NewYork Hot")
                    .borderRadius(20)
                    .data([2.10, 2.54, 2.78, 3.62, 4.41, 4.09, 3.83, 4.47, 4.20, 3.94, 3.80, 3.58, 3.19, 4.30, 3.69, 3.52, 3.02, 3.30]),
            ])
    }
    
    class func freeStyleRoundedCornersStackingBarChart() -> AAChartModel {
        freeStyleRoundedCornersStackingColumnChart()
            .chartType(.bar)
    }
    
}
