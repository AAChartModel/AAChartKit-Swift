//
//  MultiYAxesChartOptionsVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2023/7/24.
//  Copyright © 2023 An An. All rights reserved.
//

import UIKit
import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class MultiYAxesChartOptionsVC: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func chartConfigurationWithSelectedIndex(_ selectedIndex: Int) -> Any? {
        switch selectedIndex {
        case 0: return doubleXAxesAndDoubleYAxesChart()
//        case 1: return fancyLineChart()
//        case 2: return fancySplineChartWithInnerBlankMarkerSymbol()
//        case 3: return fancyLineChartWithInnerBlankMarkerSymbol()
//        case 4: return fancySplineChartWithBorderBlankMarkerSymbol()
//        case 5: return fancyLineChartWithBorderBlankMarkerSymbol()

        default:
            return AAOptions()
        }
    }

    //Highcharts.chart('container', {
    //    chart: {
    //        type: 'column'
    //    },
    //
    //    title: {
    //        text: 'Different xAxis.reversedStacks behaviour.'
    //    },
    //
    //    xAxis: [{
    //        height: '50%',
    //        opposite: true,
    //        reversed: true,
    //        reversedStacks: false,
    //        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    //    }, {
    //        top: '50%',
    //        height: '50%',
    //        reversed: true,
    //        reversedStacks: true,
    //        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    //    }],
    //
    //    yAxis: [{
    //        height: '50%',
    //        offset: 0,
    //        title: {
    //            text: 'reversedStacks: <br>false'
    //        }
    //    }, {
    //        height: '50%',
    //        top: '50%',
    //        offset: 0,
    //        title: {
    //            text: 'reversedStacks: <br>true'
    //        }
    //    }],
    //
    //    plotOptions: {
    //        series: {
    //            stacking: 'normal'
    //        }
    //    },
    //
    //    series: [{
    //        stack: 'first',
    //        color: Highcharts.getOptions().colors[0],
    //        data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
    //    }, {
    //        stack: 'second',
    //        color: Highcharts.getOptions().colors[1],
    //        data: [144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4, 29.9, 71.5, 106.4, 129.2]
    //    }, {
    //        xAxis: 1,
    //        yAxis: 1,
    //        stack: 'third',
    //        color: Highcharts.getOptions().colors[0],
    //        data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
    //    }, {
    //        xAxis: 1,
    //        yAxis: 1,
    //        stack: 'fourth',
    //        color: Highcharts.getOptions().colors[1],
    //        data: [144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4, 29.9, 71.5, 106.4, 129.2]
    //    }]
    //});
    
    //https://api.highcharts.com/highcharts/xAxis.reversedStacks
    private func doubleXAxesAndDoubleYAxesChart() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.column))
            .title(AATitle()
                .text("Different xAxis.reversedStacks behaviour."))
            .xAxisArray([
                AAXAxis()
                    .height("50%")
                    .opposite(true)
                    .reversed(true)
                    .reversedStacks(false)
                    .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct",
                                 "Nov", "Dec"]),
                AAXAxis()
                    .top("50%")
                    .height("50%")
                    .reversed(true)
                    .reversedStacks(true)
                    .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct",
                                 "Nov", "Dec"])
            ])
            .yAxisArray([
                AAYAxis()
                    .height("50%")
                    .offset(0)
                    .reversed(true)
                    .title(AATitle()
                        .text("reversedStacks: <br>false")),
                AAYAxis()
                    .height("50%")
                    .top("50%")
                    .offset(0)
                    .title(AATitle()
                        .text("reversedStacks: <br>true"))
            ])
            .plotOptions(AAPlotOptions()
                .series(AASeries()
                    .stacking(.normal)))
            .series([
                AASeriesElement()
                    .stack("first")
                    .color(AAColor.red)
                    .data([29.9, 71.5, 106.4, 129.2, 144.0, 176.0,
                           135.6, 148.5, 216.4, 194.1, 95.6, 54.4]),
                AASeriesElement()
                    .stack("second")
                    .color(AAColor.green)
                    .data([144.0, 176.0, 135.6, 148.5, 216.4, 194.1,
                           95.6, 54.4, 29.9, 71.5, 106.4, 129.2]),
                AASeriesElement()
                    .xAxis(1)
                    .yAxis(1)
                    .stack("third")
                    .color(AAColor.red)
                    .data([29.9, 71.5, 106.4, 129.2, 144.0, 176.0,
                           135.6, 148.5, 216.4, 194.1, 95.6, 54.4]),
                AASeriesElement()
                    .xAxis(1)
                    .yAxis(1)
                    .stack("fourth")
                    .color(AAColor.green)
                    .data([144.0, 176.0, 135.6, 148.5, 216.4, 194.1,
                           95.6, 54.4, 29.9, 71.5, 106.4, 129.2])
            ])
    }

}
