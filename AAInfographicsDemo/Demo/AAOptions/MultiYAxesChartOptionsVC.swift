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
        case 0: return MultiYAxesChartOptionsVC.doubleXAxesAndDoubleYAxesChart()
        case 1: return MultiYAxesChartOptionsVC.disableGroupingBoxplotMixedScatterChart()

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
    static func doubleXAxesAndDoubleYAxesChart() -> AAOptions {
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
                    .color(AAColor.yellow)
                    .data([29.9, 71.5, 106.4, 129.2, 144.0, 176.0,
                           135.6, 148.5, 216.4, 194.1, 95.6, 54.4]),
                AASeriesElement()
                    .xAxis(1)
                    .yAxis(1)
                    .stack("fourth")
                    .color(AAColor.blue)
                    .data([144.0, 176.0, 135.6, 148.5, 216.4, 194.1,
                           95.6, 54.4, 29.9, 71.5, 106.4, 129.2])
            ])
    }
    
    static func doubleXAxesAndDoubleYAxesChart2() -> AAOptions {
       let aaOptions = doubleXAxesAndDoubleYAxesChart()
        aaOptions.chart?.type(.bar)
        return aaOptions
    }
    
    static func doubleXAxesAndDoubleYAxesChart3() -> AAOptions {
       let aaOptions = doubleXAxesAndDoubleYAxesChart()
        aaOptions.chart?.type(.areaspline)
        return aaOptions
    }
    
    static func doubleXAxesAndDoubleYAxesChart4() -> AAOptions {
       let aaOptions = doubleXAxesAndDoubleYAxesChart()
        aaOptions.chart?.type(.spline)
        return aaOptions
    }

    //Highcharts.chart('container', {
    //  chart: {
    //    type: 'boxplot'
    //  },
    //
    //  title: {
    //    text: 'Highcharts Box Plot Example'
    //  },
    //
    //  legend: {
    //    enabled: false
    //  },
    //
    //  xAxis: {
    //    categories: ['1', '2', '3', '4', '5'],
    //    title: {
    //      text: 'Experiment No.'
    //    }
    //  },
    //
    //  yAxis: {
    //    title: {
    //      text: 'Observations'
    //    }
    //  },
    //
    //  tooltip: {
    //    shared: true
    //  },
    //
    //  plotOptions: {
    //    series: {
    //      grouping: false,
    //      pointRange: 1,
    //      pointPadding: 0.4,
    //      groupPadding: 0,
    //      states: {
    //        hover: {
    //          lineWidthPlus: 0
    //        }
    //      }
    //    }
    //  },
    //
    //  series: [{
    //      name: 'S1',
    //      data: [
    //        [-0.2, 755, 811, 838, 885, 955],
    //        [0.8, 725, 863, 930, 980, 1050],
    //        [1.8, 704, 752, 827, 870, 915],
    //        [2.8, 714, 812, 825, 871, 945],
    //        [3.8, 780, 826, 852, 882, 950]
    //      ],
    //      tooltip: {
    //        headerFormat: '<em>Experiment No {point.key}</em><br/>'
    //      }
    //    },
    //    {
    //      name: 'S2',
    //      data: [
    //        [0.2, 760, 801, 848, 895, 965],
    //        [1.2, 733, 853, 939, 980, 1080],
    //        [2.2, 714, 762, 817, 870, 918],
    //        [3.2, 724, 802, 816, 871, 950],
    //        [4.2, 775, 836, 864, 882, 970]
    //      ],
    //      tooltip: {
    //        headerFormat: '<em>Experiment No {point.key}</em><br/>'
    //      }
    //    },
    //    {
    //      name: 'Means 1',
    //      color: Highcharts.getOptions().colors[0],
    //      type: 'line',
    //      lineWidth: 0,
    //      data: [ // x, y positions where 0 is the first category
    //        [-0.2, 850],
    //        [0.8, 935],
    //        [1.8, 825],
    //        [2.8, 840],
    //        [3.8, 850]
    //      ],
    //      marker: {
    //        fillColor: Highcharts.getOptions().colors[0],
    //        symbol: 'diamond',
    //        lineWidth: 1,
    //        lineColor: Highcharts.getOptions().colors[0]
    //      },
    //      tooltip: {
    //        pointFormat: 'Mean: {point.y}'
    //      }
    //    },
    //    {
    //      name: 'Means 2',
    //      color: Highcharts.getOptions().colors[1],
    //      type: 'line',
    //      lineWidth: 0,
    //      data: [ // x, y positions where 0 is the first category
    //        [0.2, 860],
    //        [1.2, 945],
    //        [2.2, 805],
    //        [3.2, 850],
    //        [4.2, 860]
    //      ],
    //      marker: {
    //        fillColor: Highcharts.getOptions().colors[1],
    //        symbol: 'diamond',
    //        lineWidth: 1,
    //        lineColor: Highcharts.getOptions().colors[1]
    //      },
    //      tooltip: {
    //        pointFormat: 'Mean: {point.y}'
    //      }
    //    }
    //  ]
    //
    //});

    //https://github.com/AAChartModel/AAChartKit-Swift/issues/440
    static func disableGroupingBoxplotMixedScatterChart() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.boxplot))
            .title(AATitle()
                .text("Highcharts Box Plot Example"))
            .legend(AALegend()
                .enabled(false))
            .xAxis(AAXAxis()
                .categories(["1", "2", "3", "4", "5"])
                .title(AATitle()
                    .text("Experiment No.")))
            .yAxis(AAYAxis()
                .title(AATitle()
                    .text("Observations")))
            .tooltip(AATooltip()
                .shared(true))
            .plotOptions(AAPlotOptions()
                .boxplot(AABoxplot()
                    .grouping(false)
                    .pointRange(1))
                .series(AASeries()
//                    .grouping(false)
//                    .pointRange(1)
                    .pointPadding(0.4)
                    .groupPadding(0)
                    .states(AAStates()
                        .hover(AAHover()
                            .lineWidthPlus(0)))))
            .series([
                AASeriesElement()
                    .name("S1")
                    .data([
                        [-0.2, 755, 811, 838, 885, 955],
                        [0.8, 725, 863, 930, 980, 1050],
                        [1.8, 704, 752, 827, 870, 915],
                        [2.8, 714, 812, 825, 871, 945],
                        [3.8, 780, 826, 852, 882, 950]
                    ])
                    .tooltip(AATooltip()
                        .headerFormat("<em>Experiment No {point.key}</em><br/>")),
                AASeriesElement()
                    .name("S2")
                    .data([
                        [0.2, 760, 801, 848, 895, 965],
                        [1.2, 733, 853, 939, 980, 1080],
                        [2.2, 714, 762, 817, 870, 918],
                        [3.2, 724, 802, 816, 871, 950],
                        [4.2, 775, 836, 864, 882, 970]
                    ])
                    .tooltip(AATooltip()
                        .headerFormat("<em>Experiment No {point.key}</em><br/>")),
                AASeriesElement()
                    .name("Means 1")
                    .color(AAColor.red)
                    .type(.line)
                    .lineWidth(0)
                    .data([
                        [-0.2, 850],
                        [0.8, 935],
                        [1.8, 825],
                        [2.8, 840],
                        [3.8, 850]
                    ])
                    .marker(AAMarker()
                        .fillColor(AAColor.red)
                        .symbol(.diamond)
                        .lineWidth(1)
                        .lineColor(AAColor.red))
                    .tooltip(AATooltip()
                        .pointFormat("Mean: {point.y}")),
                AASeriesElement()
                    .name("Means 2")
                    .color(AAColor.blue)
                    .type(.line)
                    .lineWidth(0)
                    .data([
                        [0.2, 860],
                        [1.2, 945],
                        [2.2, 805],
                        [3.2, 850],
                        [4.2, 860]
                    ])
                    .marker(AAMarker()
                        .fillColor(AAColor.blue)
                        .symbol(.diamond)
                        .lineWidth(1)
                        .lineColor(AAColor.blue))
                    .tooltip(AATooltip()
                        .pointFormat("Mean: {point.y}"))
            ])
        
    }


    }
