//
//  JSFunctionForAATooltipVC2.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2022/10/13.
//  Copyright © 2022 An An. All rights reserved.
//

import UIKit

class JSFunctionForAATooltipVC2: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    //https://github.com/AAChartModel/AAChartKit/issues/1406
    //https://www.highcharts.com/forum/viewtopic.php?f=9&t=49629
    override func customAAOptions() -> AAOptions {
        let aaOptions = AAOptions()
            .chart(AAChart()
                .type(.spline)
                .backgroundColor("#f4f8ff"))
            .tooltip(AATooltip()
                .useHTML(true)
                .backgroundColor("transparent")
                .borderColor("transparent")
                .shadow(false)
                .padding(0)
                .shared(true)
                .formatter("""
                function() {
                    const points = this.points;

                    let htmlPoints = ``;

                    points.forEach(function(point) {
                        htmlPoints += `
                            <div>
                                <span style="color:${point.color}">\u25CF</span> ${point.y}
                            </div>
                        `;
                    });
                    
                    return `
                        <div style="
                            border-radius: 0.5rem 0.5rem 0.5rem 0;
                            background-color: white;
                            box-shadow: #b1c7ff 0px 3px 10px 0px;
                            padding: 0.5rem;
                            line-height: 18px;
                        ">
                            ${htmlPoints}
                        </div>
                    `;
                }
                """)
                .positioner("""
                function(labelWidth, labelHeight) {
                    const chart = this.chart,
                    point = chart.hoverPoint,
                    offset = 10,
                    pointX = chart.plotLeft + point.plotX + offset,
                    x = chart.chartWidth < pointX + labelWidth ? chart.chartWidth - labelWidth : pointX,
                    y = chart.plotTop + point.plotY - labelHeight - offset;
                    
                    return {x, y};
                """))
            .series([
                AASeriesElement()
                    .data([223.2, 312.1, 152.7, 161.9, 196.6]),
                AASeriesElement()
                    .data([122.2, 53.7, 300.0, 110.5, 320.4]),
            ])

        return aaOptions
    }
    
}
