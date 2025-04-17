//
// Created by AnAn on 2024/1/16.
// Copyright (c) 2024 An An. All rights reserved.
//

import Foundation
import AAInfographics


class BubbleLegendChartOptionsComposer {
    
    /*
    Highcharts.chart('container', {
    
        chart: {
            type: 'bubble'
        },
    
        legend: {
            enabled: true,
            floating: true,
            align: 'right',
            y: -40,
            bubbleLegend: {
                enabled: true,
                borderColor: '#000000',
                borderWidth: 3,
                color: '#8bbc21',
                connectorColor: '#000000'
            }
        },
    
        series: [{
            color: '#8bbc21',
            showInLegend: false,
            marker: {
                fillOpacity: 1,
                lineWidth: 3,
                lineColor: '#000000'
            },
            data: [
                { x: 95, y: 95, z: 13.8 },
                { x: 86.5, y: 102.9, z: 14.7 },
                { x: 80.8, y: 91.5, z: 15.8 },
                { x: 80.4, y: 102.5, z: 12 },
                { x: 80.3, y: 86.1, z: 11.8 },
                { x: 78.4, y: 70.1, z: 16.6 },
                { x: 74.2, y: 68.5, z: 14.5 },
                { x: 73.5, y: 83.1, z: 10 },
                { x: 71, y: 93.2, z: 24.7 },
                { x: 69.2, y: 57.6, z: 10.4 },
                { x: 68.6, y: 20, z: 16 },
                { x: 65.5, y: 126.4, z: 35.3 },
                { x: 65.4, y: 50.8, z: 28.5 },
                { x: 63.4, y: 51.8, z: 15.4 },
                { x: 64, y: 82.9, z: 31.3 }
            ]
        }]
    
    });
     */
    class func bubbleLegendChart() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.bubble))
            .legend(AALegend()
                .enabled(true)
                .floating(true)
                .align(.right)
                .y(-40)
                .bubbleLegend(AABubbleLegend()
                    .enabled(true)
                    .borderColor("#000000")
                    .borderWidth(3)
                    .color("#8bbc21")
                    .connectorColor("#000000")))
            .series([
                AASeriesElement()
                    .color("#8bbc21")
                    .showInLegend(false)
                    .marker(AAMarker()
                      //.fillOpacity(1)
                        .lineWidth(3)
                        .lineColor("#000000"))
                    .data([
                        ["x": 95, "y": 95, "z": 13.8],
                        ["x": 86.5, "y": 102.9, "z": 14.7],
                        ["x": 80.8, "y": 91.5, "z": 15.8],
                        ["x": 80.4, "y": 102.5, "z": 12],
                        ["x": 80.3, "y": 86.1, "z": 11.8],
                        ["x": 78.4, "y": 70.1, "z": 16.6],
                        ["x": 74.2, "y": 68.5, "z": 14.5],
                        ["x": 73.5, "y": 83.1, "z": 10],
                        ["x": 71, "y": 93.2, "z": 24.7],
                        ["x": 69.2, "y": 57.6, "z": 10.4],
                        ["x": 68.6, "y": 20, "z": 16],
                        ["x": 65.5, "y": 126.4, "z": 35.3],
                        ["x": 65.4, "y": 50.8, "z": 28.5],
                        ["x": 63.4, "y": 51.8, "z": 15.4],
                        ["x": 64, "y": 82.9, "z": 31.3]
                    ])
            ])
        
    }
    
    /*
    Highcharts.chart('container', {
    
        chart: {
            type: 'bubble'
        },
    
        legend: {
            enabled: true,
            y: -40,
            bubbleLegend: {
                enabled: true,
                borderWidth: 2,
                ranges: [{
                    borderColor: '#1aadce',
                    connectorColor: '#1aadce'
                }, {
                    borderColor: '#0d233a',
                    connectorColor: '#0d233a'
                }, {
                    borderColor: '#f28f43',
                    connectorColor: '#f28f43'
                }]
            }
        },
    
        series: [{
            data: [
                { x: 95, y: 95, z: 13.8 },
                { x: 86.5, y: 102.9, z: 14.7 },
                { x: 80.8, y: 91.5, z: 15.8 }
            ]
        }, {
            data: [
                { x: 74.2, y: 68.5, z: 14.5 },
                { x: 73.5, y: 83.1, z: 10 },
                { x: 71, y: 93.2, z: 24.7 },
                { x: 69.2, y: 57.6, z: 10.4 }
            ]
        }, {
            data: [
                { x: 80.4, y: 102.5, z: 12 },
                { x: 80.3, y: 86.1, z: 11.8 },
                { x: 78.4, y: 70.1, z: 16.6 }
            ]
        }, {
            data: [
                { x: 68.6, y: 20, z: 16 },
                { x: 65.5, y: 126.4, z: 35.3 },
                { x: 65.4, y: 50.8, z: 28.5 },
                { x: 63.4, y: 51.8, z: 15.4 },
                { x: 64, y: 82.9, z: 31.3 }
            ]
        }]
    
    });
    */
    class func customBubbleLegendChart() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.bubble))
            .legend(AALegend()
                .enabled(true)
                .y(-40)
                .bubbleLegend(AABubbleLegend()
                    .enabled(true)
                    .borderWidth(2)
                    .ranges([
                        AARangesElement()
                            .borderColor("#1aadce")
                            .connectorColor("#1aadce"),
                        AARangesElement()
                            .borderColor("#0d233a")
                            .connectorColor("#0d233a"),
                        AARangesElement()
                            .borderColor("#f28f43")
                            .connectorColor("#f28f43")
                    ])))
            .series([
                AASeriesElement()
                    .data([
                        ["x": 95, "y": 95, "z": 13.8],
                        ["x": 86.5, "y": 102.9, "z": 14.7],
                        ["x": 80.8, "y": 91.5, "z": 15.8]
                    ]),
                AASeriesElement()
                    .data([
                        ["x": 74.2, "y": 68.5, "z": 14.5],
                        ["x": 73.5, "y": 83.1, "z": 10],
                        ["x": 71, "y": 93.2, "z": 24.7],
                        ["x": 69.2, "y": 57.6, "z": 10.4]
                    ]),
                AASeriesElement()
                    .data([
                        ["x": 80.4, "y": 102.5, "z": 12],
                        ["x": 80.3, "y": 86.1, "z": 11.8],
                        ["x": 78.4, "y": 70.1, "z": 16.6]
                    ]),
                AASeriesElement()
                    .data([
                        ["x": 68.6, "y": 20, "z": 16],
                        ["x": 65.5, "y": 126.4, "z": 35.3],
                        ["x": 65.4, "y": 50.8, "z": 28.5],
                        ["x": 63.4, "y": 51.8, "z": 15.4],
                        ["x": 64, "y": 82.9, "z": 31.3]
                    ])
            ])
    }
    
    class func packedbubbleChart() -> AAOptions {
        let aaOptions = SpecialChartComposer
            .packedbubbleChart()
            .aa_toAAOptions()
        
        aaOptions.plotOptions?
            .packedbubble(AAPackedbubble()
                .minSize("30%")
                .maxSize("120%")
                .zMin(0)
                .zMax(1000)
                .layoutAlgorithm(AALayoutAlgorithm() //packedbubbleChart 和 packedbubbleSplitChart 只有layoutAlgorithm这一段不一样
                    .gravitationalConstant(0.02)
                    .splitSeries(false))
                    .dataLabels(AADataLabels()
                        .enabled(true)
                        .format("{point.name}")
                        .filter(AAFilter()
                            .property("y")
                            .operator(">")
                            .value(250))))
        
        return aaOptions
    }
    
    static func packedbubbleSplitChart() -> AAOptions {
        let aaOptions = SpecialChartComposer
            .packedbubbleChart()
            .aa_toAAOptions()
        
        aaOptions.plotOptions?
            .packedbubble(AAPackedbubble()
                .minSize("30%")
                .maxSize("120%")
                .zMin(0)
                .zMax(1000)
                .layoutAlgorithm(AALayoutAlgorithm() //packedbubbleChart 和 packedbubbleSplitChart 只有layoutAlgorithm这一段不一样
                    .gravitationalConstant(0.05)
                    .splitSeries(true)
                    .seriesInteraction(false)
                    .dragBetweenSeries(true)
                    .parentNodeLimit(true))
                    .dataLabels(AADataLabels()
                        .enabled(true)
                        .format("{point.name}")
                        .filter(AAFilter()
                            .property("y")
                            .operator(">")
                            .value(250))))
        
        return aaOptions
    }
    
    static func packedbubbleSpiralChart() -> AAOptions {
        let aaOptions = SpecialChartComposer
            .packedbubbleChart()
            .aa_toAAOptions()
        
        aaOptions.plotOptions?
            .packedbubble(AAPackedbubble()
                .useSimulation(false)
                .minSize("20%")
                .maxSize("80%")
                .dataLabels(AADataLabels()
                    .enabled(true)
                    .format("{point.name}")
                    .filter(AAFilter()
                        .property("y")
                        .operator(">")
                        .value(250))
                        .style(AAStyle()
                            .color(AAColor.black)
                            .textOutline("none")
                            .fontWeight(.regular))))
        
        return aaOptions
    }
}
