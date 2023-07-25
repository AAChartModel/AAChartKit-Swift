//
//  ScatterChartOptionsVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2023/7/25.
//  Copyright © 2023 An An. All rights reserved.
//

import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class ScatterChartOptionsVC: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func chartConfigurationWithSelectedIndex(_ selectedIndex: Int) -> Any? {
        switch selectedIndex {
        case 0: return scatterChartWithJitter()
     

        default:
            return AAOptions()
        }
    }

    //// Generate test data with discrete X values and continuous Y values.
    //const getTestData = x => {
    //    const off = 0.2 + 0.2 * Math.random();
    //    return new Array(200).fill(1).map(() => [
    //        x,
    //        off + (Math.random() - 0.5) * (Math.random() - 0.5)
    //    ]);
    //};
    //
    //// Make all the colors semi-transparent so we can see overlapping dots
    //const colors = Highcharts.getOptions().colors.map(color =>
    //    Highcharts.color(color).setOpacity(0.5).get()
    //);
    //
    //Highcharts.chart('container', {
    //    chart: {
    //        type: 'scatter'
    //    },
    //
    //    colors,
    //
    //    title: {
    //        text: 'Scatter chart with jitter'
    //    },
    //
    //    xAxis: {
    //        categories: ['Run 1', 'Run 2', 'Run 3', 'Run 4', 'Run 5']
    //    },
    //
    //    yAxis: {
    //        title: {
    //            text: 'Measurements'
    //        }
    //    },
    //
    //    plotOptions: {
    //        scatter: {
    //            showInLegend: false,
    //            jitter: {
    //                x: 0.24,
    //                y: 0
    //            },
    //            marker: {
    //                radius: 2,
    //                symbol: 'circle'
    //            },
    //            tooltip: {
    //                pointFormat: 'Measurement: {point.y:.3f}'
    //            }
    //        }
    //    },
    //
    //    series: [{
    //        name: 'Run 1',
    //        data: getTestData(0)
    //    }, {
    //        name: 'Run 2',
    //        data: getTestData(1)
    //    }, {
    //        name: 'Run 3',
    //        data: getTestData(2)
    //    }, {
    //        name: 'Run 4',
    //        data: getTestData(3)
    //    }, {
    //        name: 'Run 5',
    //        data: getTestData(4)
    //    }]
    //});
    private func scatterChartWithJitter() -> AAOptions {
        //Generate test data with discrete X values and continuous Y values
        func getTestData(_ x: Float) -> [[Float]] {
            let off = 0.2 + 0.2 * Float.random(in: 0..<1)
            var testData: [[Float]] = []
            
            for _ in 1...200 {
                let y = off + (Float.random(in: 0..<1) - 0.5) * (Float.random(in: 0..<1) - 0.5)
                testData.append([x, y])
            }
            
            return testData
        }


        //Make all the colors semi-transparent so we can see overlapping dots
//        let colors = [
//
//        ]

        return AAOptions()
            .chart(AAChart()
                    .type(.scatter))
//            .colors(colors)
            .title(AATitle()
                    .text("Scatter chart with jitter"))
            .xAxis(AAXAxis()
                    .categories(["Run 1", "Run 2", "Run 3", "Run 4", "Run 5"]))
            .yAxis(AAYAxis()
                    .title(AATitle()
                            .text("Measurements")))
            .plotOptions(AAPlotOptions()
                            .scatter(AAScatter()
                                        .showInLegend(false)
                                        .jitter(AAJitter()
                                                    .x(0.24)
                                                    .y(0))
                                        .marker(AAMarker()
                                                    .radius(2)
                                                    .symbol(.circle))
                                        .tooltip(AATooltip()
                                                    .pointFormat("Measurement: {point.y:.3f}"))))
            .series([
                AASeriesElement()
                    .name("Run 1")
                    .data(getTestData(0)),
                AASeriesElement()
                    .name("Run 2")
                    .data(getTestData(1)),
                AASeriesElement()
                    .name("Run 3")
                    .data(getTestData(2)),
                AASeriesElement()
                    .name("Run 4")
                    .data(getTestData(3)),
                AASeriesElement()
                    .name("Run 5")
                    .data(getTestData(4))
            ])

    }

    }
