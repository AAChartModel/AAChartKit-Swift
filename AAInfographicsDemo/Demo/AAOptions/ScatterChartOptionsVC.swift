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
        case 0: return boxPlotMixedScatterChartWithJitter()
     

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

    //// Generate test data with continuous Y values.
    //function getExperimentData() {
    //    var data = [],
    //        off = 0.3 + 0.2 * Math.random(),
    //        i;
    //    for (i = 0; i < 200; i++) {
    //        data.push(
    //            Math.round(1000 * (off + (Math.random() - 0.5) * (Math.random() - 0.5)))
    //        );
    //    }
    //    return data;
    //}
    //
    //function getBoxPlotData(values) {
    //    var sorted = values.sort(function (a, b) {
    //        return a - b;
    //    });
    //
    //    return {
    //        low: sorted[0],
    //        q1: sorted[Math.round(values.length * 0.25)],
    //        median: sorted[Math.round(values.length * 0.5)],
    //        q3: sorted[Math.round(values.length * 0.75)],
    //        high: sorted[sorted.length - 1]
    //    };
    //}
    //
    //var experiments = [
    //    getExperimentData(),
    //    getExperimentData(),
    //    getExperimentData(),
    //    getExperimentData(),
    //    getExperimentData()
    //];
    //
    //var scatterData = experiments
    //    .reduce(function (acc, data, x) {
    //        return acc.concat(data.map(function (value) {
    //            return [x, value];
    //        }));
    //    }, []);
    //
    //var boxplotData = experiments
    //    .map(getBoxPlotData);
    //
    //Highcharts.chart('container', {
    //
    //    title: {
    //        text: 'Highcharts Box Plot and Jittered Scatter Plot'
    //    },
    //
    //    legend: {
    //        enabled: false
    //    },
    //
    //    xAxis: {
    //        categories: ['1', '2', '3', '4', '5'],
    //        title: {
    //            text: 'Experiment No.'
    //        }
    //    },
    //
    //    yAxis: {
    //        title: {
    //            text: 'Observations'
    //        }
    //    },
    //
    //    series: [{
    //        type: 'boxplot',
    //        name: 'Summary',
    //        data: boxplotData,
    //        tooltip: {
    //            headerFormat: '<em>Experiment No {point.key}</em><br/>'
    //        }
    //    }, {
    //        name: 'Observation',
    //        type: 'scatter',
    //        data: scatterData,
    //        jitter: {
    //            x: 0.24 // Exact fit for box plot's groupPadding and pointPadding
    //        },
    //        marker: {
    //            radius: 1
    //        },
    //        color: 'rgba(100, 100, 100, 0.5)',
    //        tooltip: {
    //            pointFormat: 'Value: {point.y}'
    //        }
    //    }]
    //});

    private func boxPlotMixedScatterChartWithJitter() -> AAOptions {
        // Generate test data with continuous Y values.
        func getExperimentData() -> [Int] {
            var data = [Int]()
            let off = 0.3 + 0.2 * Double.random(in: 0..<1)
            
            for _ in 0..<200 {
                let y = Int(round(1000 * (off + (Double.random(in: 0..<1) - 0.5) * (Double.random(in: 0..<1) - 0.5))))
                data.append(y)
            }
            
            return data
        }

        func getBoxPlotData(values: [Int]) -> [String: Int] {
            let sorted = values.sorted()
            
            return [
                "low": sorted.first ?? 0,
                "q1": sorted[values.count / 4],
                "median": sorted[values.count / 2],
                "q3": sorted[3 * values.count / 4],
                "high": sorted.last ?? 0
            ]
        }

        var experiments = [
            getExperimentData(),
            getExperimentData(),
            getExperimentData(),
            getExperimentData(),
            getExperimentData()
        ]

        var scatterData = experiments.enumerated().flatMap { (x, data) in
            data.map { value in
                [x, value]
            }
        }

        var boxplotData = experiments.map { data in
            getBoxPlotData(values: data)
        }

        // Example usage:
        print(scatterData)
        print(boxplotData)


        return AAOptions()
            .title(AATitle()
                    .text("Highcharts Box Plot and Jittered Scatter Plot"))
//            .legend(AALegend()
//                    .enabled(false))
            .xAxis(AAXAxis()
                    .categories(["1", "2", "3", "4", "5"])
                    .title(AATitle()
                            .text("Experiment No.")))
            .yAxis(AAYAxis()
                    .title(AATitle()
                            .text("Observations")))
            .series([
                AASeriesElement()
                    .type(.boxplot)
                    .name("Summary")
                    .data(boxplotData)
                    .tooltip(AATooltip()
                                .headerFormat("<em>Experiment No {point.key}</em><br/>")),
                AASeriesElement()
                    .name("Observation")
                    .type(.scatter)
                    .data(scatterData)
                    .jitter(AAJitter()
                                .x(0.24))// Exact fit for box plot's groupPadding and pointPadding
                    .marker(AAMarker()
                                .radius(1))
                    .color("rgba(100, 100, 100, 0.5)")
                    .tooltip(AATooltip()
                                .pointFormat("Value: {point.y}"))
                ])

    }


    }
