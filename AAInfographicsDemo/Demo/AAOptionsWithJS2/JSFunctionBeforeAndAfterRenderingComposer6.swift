//
//  JSFunctionBeforeAndAfterRenderingComposer6.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/7/31.
//  Copyright © 2025 An An. All rights reserved.
//

import AAInfographics

class JSFunctionBeforeAndAfterRenderingComposer6 {
    
    //https://github.com/AAChartModel/AAChartKit-Swift/issues/546
    static func customXAxisLabelsWithBase64ImageChart() -> AAOptions {
        let aaOptions = AAOptions()
            .beforeDrawChartJavaScript("""
            Highcharts.AST.allowedReferences = [
                ...Highcharts.AST.allowedReferences,
                'data:image/png;base64',
                'data:image/svg+xml;base64'
            ];
""")
            .chart(AAChart()
                .type(.spline)
            )
            .title(AATitle()
                .text("Custom X Axis Labels with Base64 Image")
            )
            .xAxis(AAXAxis()
                .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun","Jul", "Aug", "Sep", "Oct", "Nov", "Dec"])
                .labels(AALabels()
                    .useHTML(true)
                    .formatter("""
                           function() {
                               const redDot = "\(base64ImageStr)";
                               return `<img src="data:image/png;base64,${redDot}" style="width:32px; height:32px; vertical-align:middle;" /> ${this.value}`;
                           }
                           """)
                )
            )
            .series([
                AASeriesElement()
                    .name("Monthly Data")
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
            ])
        
        return aaOptions
    }
}
