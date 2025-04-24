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
    /*
     // prettier-ignore
     const hours = [
         '12a', '1a', '2a', '3a', '4a', '5a', '6a',
         '7a', '8a', '9a', '10a', '11a',
         '12p', '1p', '2p', '3p', '4p', '5p',
         '6p', '7p', '8p', '9p', '10p', '11p'
     ];
     // prettier-ignore
     const days = [
         'Saturday', 'Friday', 'Thursday',
         'Wednesday', 'Tuesday', 'Monday', 'Sunday'
     ];
     // prettier-ignore
     const data = [[0, 0, 5], [0, 1, 1], [0, 2, 0], [0, 3, 0], [0, 4, 0], [0, 5, 0], [0, 6, 0], [0, 7, 0], [0, 8, 0], [0, 9, 0], [0, 10, 0], [0, 11, 2], [0, 12, 4], [0, 13, 1], [0, 14, 1], [0, 15, 3], [0, 16, 4], [0, 17, 6], [0, 18, 4], [0, 19, 4], [0, 20, 3], [0, 21, 3], [0, 22, 2], [0, 23, 5], [1, 0, 7], [1, 1, 0], [1, 2, 0], [1, 3, 0], [1, 4, 0], [1, 5, 0], [1, 6, 0], [1, 7, 0], [1, 8, 0], [1, 9, 0], [1, 10, 5], [1, 11, 2], [1, 12, 2], [1, 13, 6], [1, 14, 9], [1, 15, 11], [1, 16, 6], [1, 17, 7], [1, 18, 8], [1, 19, 12], [1, 20, 5], [1, 21, 5], [1, 22, 7], [1, 23, 2], [2, 0, 1], [2, 1, 1], [2, 2, 0], [2, 3, 0], [2, 4, 0], [2, 5, 0], [2, 6, 0], [2, 7, 0], [2, 8, 0], [2, 9, 0], [2, 10, 3], [2, 11, 2], [2, 12, 1], [2, 13, 9], [2, 14, 8], [2, 15, 10], [2, 16, 6], [2, 17, 5], [2, 18, 5], [2, 19, 5], [2, 20, 7], [2, 21, 4], [2, 22, 2], [2, 23, 4], [3, 0, 7], [3, 1, 3], [3, 2, 0], [3, 3, 0], [3, 4, 0], [3, 5, 0], [3, 6, 0], [3, 7, 0], [3, 8, 1], [3, 9, 0], [3, 10, 5], [3, 11, 4], [3, 12, 7], [3, 13, 14], [3, 14, 13], [3, 15, 12], [3, 16, 9], [3, 17, 5], [3, 18, 5], [3, 19, 10], [3, 20, 6], [3, 21, 4], [3, 22, 4], [3, 23, 1], [4, 0, 1], [4, 1, 3], [4, 2, 0], [4, 3, 0], [4, 4, 0], [4, 5, 1], [4, 6, 0], [4, 7, 0], [4, 8, 0], [4, 9, 2], [4, 10, 4], [4, 11, 4], [4, 12, 2], [4, 13, 4], [4, 14, 4], [4, 15, 14], [4, 16, 12], [4, 17, 1], [4, 18, 8], [4, 19, 5], [4, 20, 3], [4, 21, 7], [4, 22, 3], [4, 23, 0], [5, 0, 2], [5, 1, 1], [5, 2, 0], [5, 3, 3], [5, 4, 0], [5, 5, 0], [5, 6, 0], [5, 7, 0], [5, 8, 2], [5, 9, 0], [5, 10, 4], [5, 11, 1], [5, 12, 5], [5, 13, 10], [5, 14, 5], [5, 15, 7], [5, 16, 11], [5, 17, 6], [5, 18, 0], [5, 19, 5], [5, 20, 3], [5, 21, 4], [5, 22, 2], [5, 23, 0], [6, 0, 1], [6, 1, 0], [6, 2, 0], [6, 3, 0], [6, 4, 0], [6, 5, 0], [6, 6, 0], [6, 7, 0], [6, 8, 0], [6, 9, 0], [6, 10, 1], [6, 11, 0], [6, 12, 2], [6, 13, 1], [6, 14, 3], [6, 15, 4], [6, 16, 0], [6, 17, 0], [6, 18, 0], [6, 19, 0], [6, 20, 1], [6, 21, 2], [6, 22, 2], [6, 23, 6]];

     // Process data for Highcharts bubble series
     const highchartsData = data
         .filter(item => item[2] > 0) // Filter out items with 0 commits
         .map(item => {
             const dayIndex = item[0];
             const hourIndex = item[1];
             const commitCount = item[2];
             return {
                 x: hourIndex,          // Angle axis category index (hour)
                 y: dayIndex,           // Radius axis category index (day)
                 z: commitCount * 2,    // Bubble size value (scaled commit count)
                 // Store original data for easy access in tooltip
                 commitCount: commitCount,
                 dayName: days[dayIndex],
                 hourName: hours[hourIndex]
             };
         });

     // Find max Z value to set maxSize appropriately (optional but good for scaling)
     const maxZ = highchartsData.reduce((max, p) => Math.max(max, p.z), 0);

     // Create the Highcharts chart
     Highcharts.chart('container', { // Assumes you have a <div id="container"></div> in your HTML
         chart: {
             polar: true,
             type: 'bubble',
              // Optional: Adjust plot area size if needed
             // marginBottom: 100 // Add space if labels overlap
         },

         title: {
             text: 'Punch Card of Github'
         },

         // Optional Pane configuration (circular plot area)
          pane: {
              startAngle: 0,
              endAngle: 360,
              // size: '85%' // Adjust size if needed
          },

         legend: {
             // Echarts example had legend on right, but it's less useful for single series
             // align: 'right',
             // verticalAlign: 'middle',
             // layout: 'vertical'
             enabled: false // Disable legend for cleaner look
         },

         xAxis: { // Angle Axis (Hours)
             categories: hours,
             tickmarkPlacement: 'on', // Place ticks on the category mark
             lineWidth: 0,            // Hide axis line (like ECharts)
             gridLineWidth: 1,        // Show radial grid lines (splitLine in ECharts)
             labels: {
                 // No rotation needed usually for angle axis
                 // rotation: 0 // Default
             },
             min: 0, // Ensure axis starts at the first category
             max: hours.length - 1 // Ensure axis ends at the last category
         },

         yAxis: { // Radius Axis (Days)
             categories: days,
             // Important: Highcharts category axis plots 0 index at the *center* in polar.
             // Since ECharts `days` array starts with Saturday (index 0) and plots it innermost,
             // `reversed: false` is correct here.
             reversed: false,
             min: 0, // Ensure axis starts at the first category (center)
             max: days.length - 1, // Ensure axis ends at the last category (outermost)
             lineWidth: 0,       // Hide axis line
             gridLineInterpolation: 'polygon', // Makes circular grid lines look better
             gridLineWidth: 1,   // Show circular grid lines
             labels: {
                 // Rotate labels like ECharts, adjust angle for best fit
                 rotation: -45, // Negative angle often looks better on radius axis
                 align: 'right',
                 reserveSpace: true, // Important for rotated labels
                  style: {
                      // textOverflow: 'none' // Prevent ellipsis if labels are long
                  },
                  distance: 5 // Adjust distance from axis if needed
             },
              // Optional: Define tick positions explicitly if needed, but categories usually handle this
              // tickPositions: days.map((_, i) => i)
         },

         tooltip: {
             useHTML: true, // Allows richer HTML formatting if needed
             // No header needed as we format the whole thing
             headerFormat: '',
             // Point formatter provides access to point data easily
             pointFormatter: function () {
                 // Access the custom properties stored on the point
                 return this.commitCount + ' commits in ' + this.hourName + ' of ' + this.dayName;
             }
             // Alternatively using the main formatter:
             // formatter: function() {
             //     return this.point.commitCount + ' commits in ' + this.point.hourName + ' of ' + this.point.dayName;
             // }
         },

         plotOptions: {
             bubble: {
                 minSize: 0,         // Bubbles with z=0 will have 0 size
                 maxSize: Math.max(maxZ, 20), // Scale max size based on data, ensure minimum reasonable size
                 // Using zThreshold: 0 might also help ensure 0 value isn't shown
                 zThreshold: 0.1, // Values below this are treated as minSize
                  dataLabels: { // Hide data labels on bubbles
                     enabled: false
                 },
                 // Optional: Animation like Echarts (Highcharts animates by default)
                 // animation: {
                 //     duration: 1000 // Adjust duration
                 // }
                 // Highcharts doesn't have a direct equivalent to ECharts' staggered animationDelay function
                 // without custom logic or plugins. Default animation applies to all points.
             },
             series: {
                  clip: false // Prevent bubbles near the edge from being clipped
             }
         },

         series: [{
             name: 'Punch Card', // Name for the series (used in tooltip header if not formatted out)
             data: highchartsData
         }]
     });
     */
    // MARK: - Polar Bubble Chart (Punch Card)
    static func polarBubbleChart() -> AAOptions {
        // Data from the JavaScript example
        let hours = [
            "12a", "1a", "2a", "3a", "4a", "5a", "6a",
            "7a", "8a", "9a", "10a", "11a",
            "12p", "1p", "2p", "3p", "4p", "5p",
            "6p", "7p", "8p", "9p", "10p", "11p"
        ]
        
        let days = [
            "Saturday", "Friday", "Thursday",
            "Wednesday", "Tuesday", "Monday", "Sunday"
        ]
        
        // Raw data [dayIndex, hourIndex, commitCount]
        let rawData: [[Double]] = [[0, 0, 5], [0, 1, 1], [0, 2, 0], [0, 3, 0], [0, 4, 0], [0, 5, 0], [0, 6, 0], [0, 7, 0], [0, 8, 0], [0, 9, 0], [0, 10, 0], [0, 11, 2], [0, 12, 4], [0, 13, 1], [0, 14, 1], [0, 15, 3], [0, 16, 4], [0, 17, 6], [0, 18, 4], [0, 19, 4], [0, 20, 3], [0, 21, 3], [0, 22, 2], [0, 23, 5], [1, 0, 7], [1, 1, 0], [1, 2, 0], [1, 3, 0], [1, 4, 0], [1, 5, 0], [1, 6, 0], [1, 7, 0], [1, 8, 0], [1, 9, 0], [1, 10, 5], [1, 11, 2], [1, 12, 2], [1, 13, 6], [1, 14, 9], [1, 15, 11], [1, 16, 6], [1, 17, 7], [1, 18, 8], [1, 19, 12], [1, 20, 5], [1, 21, 5], [1, 22, 7], [1, 23, 2], [2, 0, 1], [2, 1, 1], [2, 2, 0], [2, 3, 0], [2, 4, 0], [2, 5, 0], [2, 6, 0], [2, 7, 0], [2, 8, 0], [2, 9, 0], [2, 10, 3], [2, 11, 2], [2, 12, 1], [2, 13, 9], [2, 14, 8], [2, 15, 10], [2, 16, 6], [2, 17, 5], [2, 18, 5], [2, 19, 5], [2, 20, 7], [2, 21, 4], [2, 22, 2], [2, 23, 4], [3, 0, 7], [3, 1, 3], [3, 2, 0], [3, 3, 0], [3, 4, 0], [3, 5, 0], [3, 6, 0], [3, 7, 0], [3, 8, 1], [3, 9, 0], [3, 10, 5], [3, 11, 4], [3, 12, 7], [3, 13, 14], [3, 14, 13], [3, 15, 12], [3, 16, 9], [3, 17, 5], [3, 18, 5], [3, 19, 10], [3, 20, 6], [3, 21, 4], [3, 22, 4], [3, 23, 1], [4, 0, 1], [4, 1, 3], [4, 2, 0], [4, 3, 0], [4, 4, 0], [4, 5, 1], [4, 6, 0], [4, 7, 0], [4, 8, 0], [4, 9, 2], [4, 10, 4], [4, 11, 4], [4, 12, 2], [4, 13, 4], [4, 14, 4], [4, 15, 14], [4, 16, 12], [4, 17, 1], [4, 18, 8], [4, 19, 5], [4, 20, 3], [4, 21, 7], [4, 22, 3], [4, 23, 0], [5, 0, 2], [5, 1, 1], [5, 2, 0], [5, 3, 3], [5, 4, 0], [5, 5, 0], [5, 6, 0], [5, 7, 0], [5, 8, 2], [5, 9, 0], [5, 10, 4], [5, 11, 1], [5, 12, 5], [5, 13, 10], [5, 14, 5], [5, 15, 7], [5, 16, 11], [5, 17, 6], [5, 18, 0], [5, 19, 5], [5, 20, 3], [5, 21, 4], [5, 22, 2], [5, 23, 0], [6, 0, 1], [6, 1, 0], [6, 2, 0], [6, 3, 0], [6, 4, 0], [6, 5, 0], [6, 6, 0], [6, 7, 0], [6, 8, 0], [6, 9, 0], [6, 10, 1], [6, 11, 0], [6, 12, 2], [6, 13, 1], [6, 14, 3], [6, 15, 4], [6, 16, 0], [6, 17, 0], [6, 18, 0], [6, 19, 0], [6, 20, 1], [6, 21, 2], [6, 22, 2], [6, 23, 6]]
        
        // Process data for Highcharts bubble series
        var maxZ: Double = 0
        let highchartsData = rawData
            .filter { $0[2] > 0 } // Filter out items with 0 commits
            .map { item -> [String: Any] in
                let dayIndex = Int(item[0])
                let hourIndex = Int(item[1])
                let commitCount = item[2]
                let zValue = commitCount * 2 // Scale commit count for bubble size
                if zValue > maxZ {
                    maxZ = zValue
                }
                return [
                    "x": hourIndex,          // Angle axis category index (hour)
                    "y": dayIndex,           // Radius axis category index (day)
                    "z": zValue,             // Bubble size value
                    // Store original data for easy access in tooltip
                    "commitCount": commitCount,
                    "dayName": days[dayIndex],
                    "hourName": hours[hourIndex]
                ]
            }

        return AAOptions()
            .chart(AAChart()
//                .polar(true)
                .type(.bubble)
                // .marginBottom(100) // Optional: Adjust plot area size if needed
            )
            .colors([
                AAGradientColor.wroughtIron, // Default color for the series
            ])
            .title(AATitle()
                .text("Punch Card of Github"))
            .pane(AAPane()
                .startAngle(0)
                .endAngle(360)
                // .size("85%") // Adjust size if needed
            )
            .legend(AALegend()
                .enabled(false)) // Disable legend for cleaner look
            .xAxis(AAXAxis() // Angle Axis (Hours)
                .categories(hours)
                .tickmarkPlacement(.on) // Place ticks on the category mark
                .lineWidth(0)            // Hide axis line
                .gridLineWidth(1)        // Show radial grid lines
                .labels(AALabels()
                    // .rotation(0) // Default
                )
                .min(0) // Ensure axis starts at the first category
                .max(Double(hours.count - 1)) // Ensure axis ends at the last category
            )
            .yAxis(AAYAxis() // Radius Axis (Days)
                .categories(days)
                .reversed(false) // ECharts days[0] is outermost, Highcharts y=0 is center
                .min(0) // Ensure axis starts at the first category (center)
                .max(Double(days.count - 1)) // Ensure axis ends at the last category (outermost)
                .lineWidth(0)       // Hide axis line
//                .gridLineInterpolation(.polygon) // Makes circular grid lines look better
                .gridLineWidth(0)
                .labels(AALabels()
                    .rotation(-45) // Rotate labels like ECharts
                    .align(.right)
//                    .reserveSpace(true) // Important for rotated labels
                    .style(AAStyle()
                        // .textOverflow("none") // Prevent ellipsis if labels are long
                    )
                    .distance(5) // Adjust distance from axis if needed
                )
                // .tickPositions(days.indices.map { Double($0) }) // Optional: Define tick positions explicitly
            )
            .tooltip(AATooltip()
                .useHTML(true) // Allows richer HTML formatting if needed
                .headerFormat("") // No header needed as we format the whole thing
                .pointFormatter("""
        function () {
            return this.point.options.commitCount + ' commits in ' + this.point.options.hourName + ' of ' + this.point.options.dayName;
        }
        """) // Use the JS formatter function
            )
            .plotOptions(AAPlotOptions()
                .bubble(AABubble()
                    .minSize(0)         // Bubbles with z=0 will have 0 size
                    .maxSize(max(maxZ, 20)) // Scale max size based on data, ensure minimum reasonable size
//                    .zThreshold(0.1) // Values below this are treated as minSize
                    .dataLabels(AADataLabels() // Hide data labels on bubbles
                        .enabled(false))
                    // .animation(AAAnimation().duration(1000)) // Optional animation duration
                )
//                .series(AASeries()
//                    .clip(false) // Prevent bubbles near the edge from being clipped
//                )
            )
            .series([
                AASeriesElement()
                    .name("Punch Card") // Name for the series
                    .data(highchartsData) // Use the processed Swift data
            ])
    }
    
}
