//
//  BubbleChartOptionsComposer.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/4/24.
//  Copyright © 2025 An An. All rights reserved.
//

import UIKit
import AAInfographics // Ensure AAInfographics is imported

class BubbleChartOptionsComposer {
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


     const highchartsYAxes = [];
     const highchartsSeries = [];
     const axisMarginLeft = 150; // Space for day labels, similar to ECharts left: 150

     days.forEach(function (day, idx) {
         // Configure the Y Axis for this day
         highchartsYAxes.push({
             // Title will act as the day label
             title: {
                 text: day,
                 rotation: 0,       // Horizontal text
                 reserveSpace: false, // Don't reserve space in plot area
                 textAlign: 'right', // Align relative to position
                 x: -10, // Position left of the axis line (adjust as needed)
                  style: {
                      // Match Echarts styling if needed
                     // fontWeight: 'bold'
                  }
             },
             // Position the axis strip vertically
             top: ((idx * 100) / 7 + 5) + '%',    // Echarts: top: (idx * 100) / 7 + 5 + '%'
             height: (100 / 7 - 10) + '%',  // Echarts: height: 100 / 7 - 10 + '%'
             // Style the axis - make it mostly invisible
             opposite: false,      // Keep axis on the left
             offset: 0,           // Keep axis close to the edge defined by chart.marginLeft
             lineWidth: 1,        // Show axis line
             tickWidth: 1,        // Show tick mark where line ends
             tickLength: 5,
             gridLineWidth: 0,    // No grid lines from this axis
             labels: {
                 enabled: false   // No numeric labels on this axis
             },
             // Set a small fixed range (e.g., -1 to 1) so points with y=0 appear on the line
             min: -1,
             max: 1,
             startOnTick: false,
             endOnTick: false
         });

         // Filter and map data for this day's series
         const seriesData = data
             .filter(dataItem => dataItem[0] === idx && dataItem[2] > 0) // Filter for current day and commits > 0
             .map(dataItem => {
                 const hourIndex = dataItem[1];
                 const commitCount = dataItem[2];
                 return {
                     x: hourIndex,           // Hour index maps to x category axis
                     y: 0,                   // Plot directly on the axis line (relative to this yAxis)
                     // Use marker radius for size. Echarts used value * 4 for symbolSize.
                     // Highcharts radius is generally smaller pixel value than Echarts symbolSize, adjust multiplier.
                     marker: {
                         radius: commitCount * 2 // Experiment with multiplier (e.g., 2 or 2.5)
                     },
                     // Store original values for tooltip
                     originalCommitCount: commitCount,
                     hourName: hours[hourIndex],
                     dayName: day
                 };
             });

         // Configure the scatter series for this day
         highchartsSeries.push({
             type: 'scatter',
             name: day,           // Series name (useful for potential legend/tooltip)
             yAxis: idx,          // Link this series to the corresponding yAxis index
             data: seriesData,
             marker: {
                 symbol: 'circle', // Ensure circle markers
                 states: {
                     hover: {
                         enabled: true,
                         lineWidthPlus: 1, // Make hover more visible
                         radiusPlus: 2
                     }
                 }
             }
         });
     });

     // Create the Highcharts chart
     Highcharts.chart('container', { // Assumes you have a <div id="container"></div>
         chart: {
             // Set left margin to accommodate the day labels (yAxis titles)
             marginLeft: axisMarginLeft,
             // Default type, although overridden in series
             // type: 'scatter'
         },
         title: {
             text: null // No main chart title, similar to ECharts setup
         },
         xAxis: {
             categories: hours,
             opposite: true,      // Place hour labels at the top
             lineWidth: 1,        // Show main X axis line
             gridLineWidth: 1,    // Show vertical grid lines separating hours
             gridLineDashStyle: 'dot', // Optional styling for grid lines
             tickInterval: 3,     // Show label every 3 hours (0, 3, 6...) like ECharts interval: 2
             tickWidth: 1,
             tickLength: 5
         },
         yAxis: highchartsYAxes,  // Use the array of configured y-axes
         legend: {
             enabled: false       // Disable legend, day names are on the axes
         },
         tooltip: {
             // Use pointFormatter for easy access to point properties
             pointFormatter: function () {
                 return '<b>' + this.dayName + '</b> ' + this.hourName + '<br/>Commits: ' + this.originalCommitCount;
             },
             positioner: function (labelWidth, labelHeight, point) {
                  // Position tooltip above the point, similar to ECharts 'top'
                  return {
                      x: point.plotX + this.chart.plotLeft - labelWidth / 2,
                      y: point.plotY + this.chart.plotTop - labelHeight - 10 // 10px spacing above point
                  };
              }
             // Alternatively using formatter:
             // formatter: function() {
             //     return '<b>' + this.point.dayName + '</b> ' + this.point.hourName + '<br/>Commits: ' + this.point.originalCommitCount;
             // },
         },
          plotOptions: {
             scatter: {
                 // Inherited marker options if not set per-series/per-point
                 marker: {
                      // Optional: set line width for markers if desired
                      // lineWidth: 1,
                      // lineColor: '#666666'
                 },
                 // Dim other series on hover for better focus
                 states: {
                     inactive: {
                         opacity: 0.15
                     }
                 }
             }
         },
         series: highchartsSeries // Use the array of configured series
     });
     */

    // MARK: - Punch Card Chart (Multiple Y-Axes Scatter)
    
    static func punchCardChart() -> AAOptions {
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
        let rawData: [[Float]] = [[0, 0, 5], [0, 1, 1], [0, 2, 0], [0, 3, 0], [0, 4, 0], [0, 5, 0], [0, 6, 0], [0, 7, 0], [0, 8, 0], [0, 9, 0], [0, 10, 0], [0, 11, 2], [0, 12, 4], [0, 13, 1], [0, 14, 1], [0, 15, 3], [0, 16, 4], [0, 17, 6], [0, 18, 4], [0, 19, 4], [0, 20, 3], [0, 21, 3], [0, 22, 2], [0, 23, 5], [1, 0, 7], [1, 1, 0], [1, 2, 0], [1, 3, 0], [1, 4, 0], [1, 5, 0], [1, 6, 0], [1, 7, 0], [1, 8, 0], [1, 9, 0], [1, 10, 5], [1, 11, 2], [1, 12, 2], [1, 13, 6], [1, 14, 9], [1, 15, 11], [1, 16, 6], [1, 17, 7], [1, 18, 8], [1, 19, 12], [1, 20, 5], [1, 21, 5], [1, 22, 7], [1, 23, 2], [2, 0, 1], [2, 1, 1], [2, 2, 0], [2, 3, 0], [2, 4, 0], [2, 5, 0], [2, 6, 0], [2, 7, 0], [2, 8, 0], [2, 9, 0], [2, 10, 3], [2, 11, 2], [2, 12, 1], [2, 13, 9], [2, 14, 8], [2, 15, 10], [2, 16, 6], [2, 17, 5], [2, 18, 5], [2, 19, 5], [2, 20, 7], [2, 21, 4], [2, 22, 2], [2, 23, 4], [3, 0, 7], [3, 1, 3], [3, 2, 0], [3, 3, 0], [3, 4, 0], [3, 5, 0], [3, 6, 0], [3, 7, 0], [3, 8, 1], [3, 9, 0], [3, 10, 5], [3, 11, 4], [3, 12, 7], [3, 13, 14], [3, 14, 13], [3, 15, 12], [3, 16, 9], [3, 17, 5], [3, 18, 5], [3, 19, 10], [3, 20, 6], [3, 21, 4], [3, 22, 4], [3, 23, 1], [4, 0, 1], [4, 1, 3], [4, 2, 0], [4, 3, 0], [4, 4, 0], [4, 5, 1], [4, 6, 0], [4, 7, 0], [4, 8, 0], [4, 9, 2], [4, 10, 4], [4, 11, 4], [4, 12, 2], [4, 13, 4], [4, 14, 4], [4, 15, 14], [4, 16, 12], [4, 17, 1], [4, 18, 8], [4, 19, 5], [4, 20, 3], [4, 21, 7], [4, 22, 3], [4, 23, 0], [5, 0, 2], [5, 1, 1], [5, 2, 0], [5, 3, 3], [5, 4, 0], [5, 5, 0], [5, 6, 0], [5, 7, 0], [5, 8, 2], [5, 9, 0], [5, 10, 4], [5, 11, 1], [5, 12, 5], [5, 13, 10], [5, 14, 5], [5, 15, 7], [5, 16, 11], [5, 17, 6], [5, 18, 0], [5, 19, 5], [5, 20, 3], [5, 21, 4], [5, 22, 2], [5, 23, 0], [6, 0, 1], [6, 1, 0], [6, 2, 0], [6, 3, 0], [6, 4, 0], [6, 5, 0], [6, 6, 0], [6, 7, 0], [6, 8, 0], [6, 9, 0], [6, 10, 1], [6, 11, 0], [6, 12, 2], [6, 13, 1], [6, 14, 3], [6, 15, 4], [6, 16, 0], [6, 17, 0], [6, 18, 0], [6, 19, 0], [6, 20, 1], [6, 21, 2], [6, 22, 2], [6, 23, 6]]
        
        var highchartsYAxes: [AAYAxis] = []
        var highchartsSeries: [AASeriesElement] = []
        let axisMarginLeft: Float = 150 // Space for day labels
        
        for (idx, day) in days.enumerated() {
            // Configure the Y Axis for this day
            let yAxis = AAYAxis()
                .title(AATitle()
                    .text(day)
//                    .rotation(0)       // Horizontal text
//                    .reserveSpace(false) // Don't reserve space in plot area
//                    .textAlign(.right) // Align relative to position
                    .x(-10) // Position left of the axis line
                    // .style(AAStyle().fontWeight(.bold)) // Optional styling
                )
                .top("\((Float(idx) * 100.0) / 7.0 + 5.0)%") // Position the axis strip vertically (use String for %)
                .height("\((100.0 / 7.0 - 10.0))%") // (use String for %)
                .opposite(false)      // Keep axis on the left
                .offset(0)           // Keep axis close to the edge
                .lineWidth(1)        // Show axis line
                .tickWidth(1)        // Show tick mark where line ends
                .tickLength(5)
                .gridLineWidth(0)    // No grid lines from this axis
                .labels(AALabels()
                    .enabled(false))   // No numeric labels on this axis
                .min(-1) // Set a small fixed range
                .max(1)
                .startOnTick(false)
                .endOnTick(false)
            highchartsYAxes.append(yAxis)
            
            // Filter and map data for this day's series
            let seriesData = rawData
                .filter { $0[0] == Float(idx) && $0[2] > 0 } // Filter for current day and commits > 0
                .map { dataItem -> [String: Any] in
                    let hourIndex = Int(dataItem[1])
                    let commitCount = dataItem[2]
                    return [
                        "x": hourIndex,           // Hour index maps to x category axis
                        "y": 0,                   // Plot directly on the axis line
                        // Use marker radius for size
                        "marker": AAMarker().radius(commitCount * 2).toDic(), // Experiment with multiplier
                        // Store original values for tooltip
                        "originalCommitCount": commitCount,
                        "hourName": hours[hourIndex],
                        "dayName": day
                    ]
                }
            
            // Configure the scatter series for this day
            let seriesElement = AASeriesElement()
                .type(.scatter)
                .name(day)           // Series name
                .yAxis(idx)          // Link this series to the corresponding yAxis index
                .data(seriesData)
                .marker(AAMarker()
                    .symbol(.circle) // Ensure circle markers
                    .states(AAMarkerStates()
                        .hover(AAMarkerHover()
                            .enabled(true)
                            .lineWidthPlus(1) // Make hover more visible
                            .radiusPlus(2)
                        )
                    )
                )
            highchartsSeries.append(seriesElement)
        }
        
        // Tooltip formatter function (JavaScript)
        let tooltipFormatter = """
        function () {
            return '<b>' + this.point.options.dayName + '</b> ' + this.point.options.hourName + '<br/>Commits: ' + this.point.options.originalCommitCount;
        }
        """
        
        // Tooltip positioner function (JavaScript)
        let tooltipPositioner = """
        function (labelWidth, labelHeight, point) {
            return {
                x: point.plotX + this.chart.plotLeft - labelWidth / 2,
                y: point.plotY + this.chart.plotTop - labelHeight - 10 
            };
        }
        """

        return AAOptions()
            .chart(AAChart()
                .marginLeft(axisMarginLeft) // Set left margin
                // .type(.scatter) // Default type, overridden in series
            )
            .title(AATitle()
                .text(nil)) // No main chart title
            .xAxis(AAXAxis()
                .categories(hours)
                .opposite(true)      // Place hour labels at the top
                .lineWidth(1)        // Show main X axis line
                .gridLineWidth(1)    // Show vertical grid lines
                .gridLineDashStyle(.dot) // Optional styling
                .tickInterval(3)     // Show label every 3 hours
                .tickWidth(1)
                .tickLength(5)
            )
            .yAxisArray(highchartsYAxes) // Use the array of configured y-axes
            .legend(AALegend()
                .enabled(false))       // Disable legend
            .tooltip(AATooltip()
                .pointFormatter(tooltipFormatter) // Use the JS formatter function
                .positioner(tooltipPositioner)   // Use the JS positioner function
            )
            .plotOptions(AAPlotOptions()
                .scatter(AAScatter()
                    // .marker(AAMarker() // Inherited marker options
                    //     .lineWidth(1)
                    //     .lineColor("#666666")
                    // )
                    .states(AAStates()
                        .inactive(AAInactive() // Dim other series on hover
                            .opacity(0.15)
                        )
                    )
                )
            )
            .series(highchartsSeries) // Use the array of configured series
    }
    
}
