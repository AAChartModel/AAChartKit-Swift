//
// Created by AnAn on 2023/7/21.
// Copyright (c) 2023 An An. All rights reserved.
//

import UIKit
import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class LineChartOptionsVC: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func chartConfigurationWithSelectedIndex(_ selectedIndex: Int) -> Any? {
        switch selectedIndex {
        case 0: return fancySplineChart()
        case 1: return fancyLineChart()


        default:
            return AAOptions()
        }
    }

    //Highcharts.chart('container', {
    //  chart: {
    //    type: 'spline',
    //    backgroundColor: '#1b1b1b',
    //    marginBottom: 40
    //  },
    //  title: {
    //    text: 'Top 10 largest economies by average values of GDP',
    //    style: {
    //      color: '#FFFFFF',
    //      fontWeight: 'bold'
    //    }
    //  },
    //
    //  subtitle: {
    //    text:
    //    'Source: <a href="https://en.wikipedia.org/wiki/List_of_countries_by_largest_historical_GDP" target="_blank" style="color:white">Wikipedia</a>',
    //    align: 'left',
    //    style: {
    //      color: '#FFFFFF',
    //      fontWeight: 'bold'
    //    }
    //  },
    //
    //  yAxis: {
    //    reversed: true,
    //    gridLineWidth: 0,
    //    tickInterval: 1,
    //    startOnTick: false,
    //    endOnTick: false,
    //    labels: {
    //      style: {
    //        color: '#FFFFFF',
    //        fontWeight: 'bold'
    //      }
    //    },
    //    title: {
    //      text: null,
    //      style: {
    //        color: '#FFFFFF',
    //        fontWeight: 'bold'
    //      }
    //    }
    //  },
    //
    //  xAxis: {
    //    opposite: true,
    //    offset: 10,
    //    labels: {
    //      style: {
    //        color: '#FFFFFF',
    //        fontWeight: 'bold'
    //      }
    //    },
    //
    //  },
    //
    //  legend: {
    //    align: 'right',
    //    verticalAlign: 'middle',
    //    layout: 'proximate',
    //    itemStyle: {
    //      color: '#FFFFFF',
    //      fontWeight: 'bold'
    //    }
    //  },
    //
    //  plotOptions: {
    //    series: {
    //
    //      marker: {
    //        enabled: false,
    //        symbol: 'circle'
    //      },
    //      pointStart: 1980,
    //      pointInterval: 5,
    //      lineWidth: 4
    //    }
    //  },
    //  colors: [
    //    '#FF0200',
    //    '#7CB4EC',
    //    '#008001',
    //    '#faf0be',
    //    '#FFB6C1',
    //    '#2C908F',
    //    '#91EE7D',
    //    '#F7A35B',
    //    '#8185E8',
    //    '#F15C80',
    //    '#ffffff',
    //    '#A19642'
    //  ],
    //
    //  series: [
    //    {
    //      name: 'China',
    //      data: [10, 9, 7, 3, 2, 2, 2, 1, 1]
    //    },
    //    {
    //      name: 'USA',
    //      data: [1, 2, 1, 1, 1, 1, 1, 2, 2]
    //    },
    //    {
    //      name: 'India',
    //      data: [9, 10, 10, 5, 5, 4, 3, 3, 3]
    //    },
    //    {
    //      name: 'Germany',
    //      data: [4, 4, 4, 4, 4, 5, 5, 5, 5]
    //    },
    //    {
    //      name: 'Japan',
    //      data: [3, 3, 3, 2, 3, 3, 4, 4, 4]
    //    },
    //    {
    //      name: 'Russia',
    //      data: [null, null, null, 6, 7, 6, 6, 6, 6]
    //    },
    //    {
    //      name: 'Indonesia',
    //      data: [null, null, null, null, null, null, null, 8, 7]
    //    },
    //    {
    //      name: 'Brazil',
    //      data: [7, 7, 9, 9, 9, 7, 7, 7, 8]
    //    },
    //    {
    //      name: 'France',
    //      data: [6, 6, 6, 8, 6, 8, 8, 10, 9]
    //    },
    //    {
    //      name: 'UK',
    //      data: [8, 8, 8, 10, 10, 9, 9, 9, 10]
    //    },
    //    {
    //      name: 'Soviet Union',
    //      data: [2, 1, 2, null],
    //      showInLegend: false
    //    },
    //    {
    //      name: 'Italy',
    //      data: [5, 5, 5, null],
    //      showInLegend: false
    //    }
    //  ]
    //});

    //https://www.highcharts.com/blog/tutorials/line-chart/
    private func fancySplineChart() -> AAOptions {
        AAOptions()
                .chart(AAChart()
                        .type(.spline)
                        .backgroundColor("#1b1b1b")
                        .marginBottom(40))
                .title(AATitle()
                        .text("Top 10 largest economies by average values of GDP")
                        .style(AAStyle()
                                .color("#FFFFFF")
                                .fontWeight(.bold)))
                .subtitle(AASubtitle()
//                        .text("Source: <a href=\"https://en.wikipedia.org/wiki/List_of_countries_by_largest_historical_GDP\" target=\"_blank\" style=\"color:white\">Wikipedia</a>")
                        .align(.left)
                        .style(AAStyle()
                                .color("#FFFFFF")
                                .fontWeight(.bold)))
                .yAxis(AAYAxis()
//                        .reversedStacks(true)
                        .gridLineWidth(0)
                        .tickInterval(1)
                        .startOnTick(false)
                        .endOnTick(false)
                        .labels(AALabels()
                                .style(AAStyle()
                                        .color("#FFFFFF")
                                        .fontWeight(.bold)))
                        .title(AATitle()
                                .text(nil)
                                .style(AAStyle()
                                        .color("#FFFFFF")
                                        .fontWeight(.bold))))
                .xAxis(AAXAxis()
                        .opposite(true)
                        .offset(10)
                        .labels(AALabels()
                                .style(AAStyle()
                                        .color("#FFFFFF")
                                        .fontWeight(.bold))))
                .legend(AALegend()
                        .align(.right)
                        .verticalAlign(.middle)
                        .layout(.vertical)
                        .itemStyle(AAItemStyle()
                                .color("#FFFFFF")
                                .fontWeight(.bold)))
                .plotOptions(AAPlotOptions()
                        .series(AASeries()
                                .marker(AAMarker()
                                        .enabled(false)
                                        .symbol(.circle))
                                .pointStart(1980)
                                .pointInterval(5)
//                                .lineWidth(4)
                        ))
                .colors([
                    "#FF0200",
                    "#7CB4EC",
                    "#008001",
                    "#faf0be",
                    "#FFB6C1",
                    "#2C908F",
                    "#91EE7D",
                    "#F7A35B",
                    "#8185E8",
                    "#F15C80",
                    "#ffffff",
                    "#A19642"
                ])
                .series([
                    AASeriesElement()
                            .name("China")
                            .data([10, 9, 7, 3, 2, 2, 2, 1, 1]),
                    AASeriesElement()
                            .name("USA")
                            .data([1, 2, 1, 1, 1, 1, 1, 2, 2]),
                    AASeriesElement()
                            .name("India")
                            .data([9, 10, 10, 5, 5, 4, 3, 3, 3]),
                    AASeriesElement()
                            .name("Germany")
                            .data([4, 4, 4, 4, 4, 5, 5, 5, 5]),
                    AASeriesElement()
                            .name("Japan")
                            .data([3, 3, 3, 2, 3, 3, 4, 4, 4]),
                    AASeriesElement()
                            .name("Russia")
                            .data([nil, nil, nil, 6, 7, 6, 6, 6, 6]),
                    AASeriesElement()
                            .name("Indonesia")
                            .data([nil, nil, nil, nil, nil, nil, nil, 8, 7]),
                    AASeriesElement()
                            .name("Brazil")
                            .data([7, 7, 9, 9, 9, 7, 7, 7, 8]),
                    AASeriesElement()
                            .name("France")
                            .data([6, 6, 6, 8, 6, 8, 8, 10, 9]),
                    AASeriesElement()
                            .name("UK")
                            .data([8, 8, 8, 10, 10, 9, 9, 9, 10]),
                    AASeriesElement()
                            .name("Soviet Union")
                            .data([2, 1, 2, nil])
                            .showInLegend(false),
                    AASeriesElement()
                            .name("Italy")
                            .data([5, 5, 5, nil])
                            .showInLegend(false)
                ])
    }
    
    private func fancyLineChart() -> AAOptions {
       let aaOptions = fancySplineChart()
        aaOptions.chart?.type(.line)
        
        return aaOptions
    }


    }
