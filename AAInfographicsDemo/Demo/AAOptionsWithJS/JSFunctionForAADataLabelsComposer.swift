//
//  JSFunctionForAADataLabelsComposer.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/8/26.
//  Copyright © 2024 An An. All rights reserved.
//

import AAInfographics

//https://github.com/AAChartModel/AAChartKit-Swift/issues/492
//https://api.highcharts.com/highcharts/series.pie.dataLabels.connectorShape
private func pieDataLabelsConnectorShapeFunction() -> AAOptions {
    AAOptions()
        .chart(AAChart()
//                .borderWidth(1)
//                .borderColor("#eee")
//                .plotBorderWidth(1)
//                .plotShadow(false)
            .type(.pie)
        )
        .title(AATitle()
            .text("Most World Cup Wins By Country (after 2018 tournament)")
        )
        .tooltip(AATooltip()
            .pointFormat("<b>{point.percentage:.1f}%</b> of all {series.total} cups")
        )
        .plotOptions(AAPlotOptions()
            .pie(AAPie()
//                    .size("60%")
                .allowPointSelect(true)
                .cursor("pointer")
                .dataLabels(AADataLabels()
                    .enabled(true)
                    .format(
                            ("<b>{point.name}</b><br><b>{point.y}</b> " +
                             "<span style=\"opacity: 0.5\">" +
                             "({point.percentage:.1f}%)</span>")
                             .aa_toPureJSString()
                    )
                    .style(AAStyle()
                        .fontWeight(.regular)
                    )
                    .connectorShape("""
            function (
                labelPosition,
                connectorPosition,
                options
            ) {
                const path = Highcharts.seriesTypes
                    .pie
                    .prototype
                    .pointClass
                    .prototype
                    .connectorShapes
                    .crookedLine
                    .call(this, labelPosition, connectorPosition, options);

                const labelWidth = this.dataLabel.getBBox().width;
                if (labelPosition.alignment === 'right') {
                    path[0][1] -= labelWidth;
                } else {
                    path[0][1] += labelWidth;
                }

                return path;

            }
            """.aa_toPureJSString())
                )
            )
        )
        .series([
            AASeriesElement()
                .name("Teams")
                .colorByPoint(true)
                .data([
                    ["Spain", 1],
                    ["Brazil", 5],
                    ["England", 1],
                    ["Germany", 4],
                    ["Italy", 4],
                    ["Uruguay", 2],
                    ["Argentina", 2],
                    ["France", 2]
                ])
        ])

}
