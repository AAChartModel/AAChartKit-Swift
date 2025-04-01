//
//  JSFunctionForAAAxisComposer2.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/4/1.
//  Copyright © 2025 An An. All rights reserved.
//

import AAInfographics

class JSFunctionForAAAxisComposer2 {
    
    //https://github.com/AAChartModel/AAChartCore-Kotlin/issues/246
    static func customWidthForXAxisLabels() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.column))
            .xAxis(AAXAxis()
                .categories([
                    "很长的标题1三国演义",
                    "很长的标题2水浒传",
                    "很长的标题3红楼梦",
                    "很长的标题4西游记",
                    "很长的标题5金瓶梅"
                ])
                .labels(AALabels()
                    .useHTML(true)
                    .autoRotation(false)
                    .formatter(#"""
                        function() {
                          return '<div style=\"width:50px; text-align:left; word-wrap:break-word; overflow-wrap:break-word; white-space:normal;\">' + this.value + '</div>';
                        }
                    """#)))
            .series([
                AASeriesElement()
                    .data([29.9, 71.5, 106.4, 129.2, 144.0])
            ])
    }
    
}
