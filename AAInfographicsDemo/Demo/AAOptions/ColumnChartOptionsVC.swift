//
//  ColumnChartOptionsVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2023/7/28.
//  Copyright © 2023 An An. All rights reserved.
//

import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class ColumnChartOptionsVC: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func chartConfigurationWithSelectedIndex(_ selectedIndex: Int) -> Any? {
        switch selectedIndex {
        case 0: return ColumnChartOptionsVC.disableGroupingColumnChart()
        case 1: return ColumnChartOptionsVC.disableGroupingBarChart()

        default:
            return AAOptions()
        }
    }

    //Highcharts.chart('container', {
    //    chart: {
    //        type: 'column'
    //    },
    //    title: {
    //        text: 'Monthly Average Rainfall'
    //    },
    //    subtitle: {
    //        text: 'Source: WorldClimate.com'
    //    },
    //    xAxis: {
    //        categories: [
    //            'Jan',
    //            'Feb',
    //            'Mar',
    //            'Apr',
    //            'May',
    //            'Jun',
    //            'Jul',
    //            'Aug',
    //            'Sep',
    //            'Oct',
    //            'Nov',
    //            'Dec'
    //        ]
    //    },
    //    yAxis: {
    //        min: 0,
    //        title: {
    //            text: 'Rainfall (mm)'
    //        }
    //    },
    //    legend: {
    //        layout: 'vertical',
    //        backgroundColor: '#FFFFFF',
    //        align: 'left',
    //        verticalAlign: 'top',
    //        x: 100,
    //        y: 70,
    //        floating: true,
    //        shadow: true
    //    },
    //    tooltip: {
    //        shared: true,
    //        valueSuffix: ' mm'
    //    },
    //    plotOptions: {
    //        column: {
    //            grouping: false,
    //            shadow: false
    //        }
    //    },
    //    series: [{
    //        name: 'Tokyo',
    //        data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4],
    //        pointPadding: 0
    //
    //    }, {
    //        name: 'New York',
    //        data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3],
    //        pointPadding: 0.1
    //
    //    }, {
    //        name: 'London',
    //        data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2],
    //        pointPadding: 0.2
    //
    //    }, {
    //        name: 'Berlin',
    //        data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1],
    //        pointPadding: 0.3
    //
    //    }]
    //});

    //https://api.highcharts.com/highcharts/series.column.grouping
    static func disableGroupingColumnChart() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                    .type(.column))
            .title(AATitle()
                    .text("Monthly Average Rainfall"))
            .subtitle(AASubtitle()
                        .text("Source: WorldClimate.com"))
            .xAxis(AAXAxis()
                    .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                                 "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]))
            .yAxis(AAYAxis()
                    .min(0)
                    .title(AATitle()
                            .text("Rainfall (mm)")))
            .legend(AALegend()
                    .layout(.vertical)
                    .backgroundColor("#FFFFFF")
                    .align(.left)
                    .verticalAlign(.top)
                    .x(100)
                    .y(70)
                    .floating(true)
                    .shadow(true))
            .tooltip(AATooltip()
                        .shared(true)
                        .valueSuffix(" mm"))
            .plotOptions(AAPlotOptions()
                            .column(AAColumn()
                                    .grouping(false)
//                                    .shadow(false)
                            ))
            .series([
                AASeriesElement()
                    .name("Tokyo")
                    .data([49.9, 71.5, 106.4, 129.2, 144.0, 176.0,
                           135.6, 148.5, 216.4, 194.1, 95.6, 54.4])
                    .pointPadding(0),
                AASeriesElement()
                    .name("New York")
                    .data([83.6, 78.8, 98.5, 93.4, 106.0, 84.5,
                           105.0, 104.3, 91.2, 83.5, 106.6, 92.3])
                    .pointPadding(0.1),
                AASeriesElement()
                    .name("London")
                    .data([48.9, 38.8, 39.3, 41.4, 47.0, 48.3,
                           59.0, 59.6, 52.4, 65.2, 59.3, 51.2])
                    .pointPadding(0.2),
                AASeriesElement()
                    .name("Berlin")
                    .data([42.4, 33.2, 34.5, 39.7, 52.6, 75.5,
                           57.4, 60.4, 47.6, 39.1, 46.8, 51.1])
                    .pointPadding(0.3)
            ])
        
    }
    
    static func disableGroupingBarChart() -> AAOptions {
        let aaOptions = disableGroupingColumnChart()
        
        aaOptions.chart?.type(.bar)
        aaOptions.plotOptions?
            .bar((AABar()
                .grouping(false)
            ))
        
        return aaOptions
    }


}
