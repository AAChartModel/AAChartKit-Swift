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
     // 注意：保持这个顺序，因为 Highcharts category 轴默认将 index 0 放在最顶部/最左侧
     const days = [
         'Saturday', 'Friday', 'Thursday',
         'Wednesday', 'Tuesday', 'Monday', 'Sunday'
     ];
     // prettier-ignore
     const data = [[0, 0, 5], [0, 1, 1], [0, 2, 0], [0, 3, 0], [0, 4, 0], [0, 5, 0], [0, 6, 0], [0, 7, 0], [0, 8, 0], [0, 9, 0], [0, 10, 0], [0, 11, 2], [0, 12, 4], [0, 13, 1], [0, 14, 1], [0, 15, 3], [0, 16, 4], [0, 17, 6], [0, 18, 4], [0, 19, 4], [0, 20, 3], [0, 21, 3], [0, 22, 2], [0, 23, 5], [1, 0, 7], [1, 1, 0], [1, 2, 0], [1, 3, 0], [1, 4, 0], [1, 5, 0], [1, 6, 0], [1, 7, 0], [1, 8, 0], [1, 9, 0], [1, 10, 5], [1, 11, 2], [1, 12, 2], [1, 13, 6], [1, 14, 9], [1, 15, 11], [1, 16, 6], [1, 17, 7], [1, 18, 8], [1, 19, 12], [1, 20, 5], [1, 21, 5], [1, 22, 7], [1, 23, 2], [2, 0, 1], [2, 1, 1], [2, 2, 0], [2, 3, 0], [2, 4, 0], [2, 5, 0], [2, 6, 0], [2, 7, 0], [2, 8, 0], [2, 9, 0], [2, 10, 3], [2, 11, 2], [2, 12, 1], [2, 13, 9], [2, 14, 8], [2, 15, 10], [2, 16, 6], [2, 17, 5], [2, 18, 5], [2, 19, 5], [2, 20, 7], [2, 21, 4], [2, 22, 2], [2, 23, 4], [3, 0, 7], [3, 1, 3], [3, 2, 0], [3, 3, 0], [3, 4, 0], [3, 5, 0], [3, 6, 0], [3, 7, 0], [3, 8, 1], [3, 9, 0], [3, 10, 5], [3, 11, 4], [3, 12, 7], [3, 13, 14], [3, 14, 13], [3, 15, 12], [3, 16, 9], [3, 17, 5], [3, 18, 5], [3, 19, 10], [3, 20, 6], [3, 21, 4], [3, 22, 4], [3, 23, 1], [4, 0, 1], [4, 1, 3], [4, 2, 0], [4, 3, 0], [4, 4, 0], [4, 5, 1], [4, 6, 0], [4, 7, 0], [4, 8, 0], [4, 9, 2], [4, 10, 4], [4, 11, 4], [4, 12, 2], [4, 13, 4], [4, 14, 4], [4, 15, 14], [4, 16, 12], [4, 17, 1], [4, 18, 8], [4, 19, 5], [4, 20, 3], [4, 21, 7], [4, 22, 3], [4, 23, 0], [5, 0, 2], [5, 1, 1], [5, 2, 0], [5, 3, 3], [5, 4, 0], [5, 5, 0], [5, 6, 0], [5, 7, 0], [5, 8, 2], [5, 9, 0], [5, 10, 4], [5, 11, 1], [5, 12, 5], [5, 13, 10], [5, 14, 5], [5, 15, 7], [5, 16, 11], [5, 17, 6], [5, 18, 0], [5, 19, 5], [5, 20, 3], [5, 21, 4], [5, 22, 2], [5, 23, 0], [6, 0, 1], [6, 1, 0], [6, 2, 0], [6, 3, 0], [6, 4, 0], [6, 5, 0], [6, 6, 0], [6, 7, 0], [6, 8, 0], [6, 9, 0], [6, 10, 1], [6, 11, 0], [6, 12, 2], [6, 13, 1], [6, 14, 3], [6, 15, 4], [6, 16, 0], [6, 17, 0], [6, 18, 0], [6, 19, 0], [6, 20, 1], [6, 21, 2], [6, 22, 2], [6, 23, 6]];

     // --- 数据部分 (hours, days, data) 保持不变 ---
     // --- 数据部分 (hours, days, data) 保持不变 ---

     const highchartsYAxes = [];
     const highchartsSeries = [];
     const axisMarginLeft = 150; // 为日期标签保留空间

     // 计算最大和最小（>0）的 commit 数，用于设定气泡大小范围
     let minCommit = Infinity;
     let maxCommit = 0;
     data.forEach(item => {
         if (item[2] > 0) {
             minCommit = Math.min(minCommit, item[2]);
             maxCommit = Math.max(maxCommit, item[2]);
         }
     });
     // 如果没有大于0的数据，设置默认值
     minCommit = minCommit === Infinity ? 1 : minCommit;
     maxCommit = maxCommit === 0 ? 1 : maxCommit;

     // 定义大小映射关系：直径 = commitCount * 4 (与 Scatter 保持一致)
     const minDiameter = Math.max(2, minCommit * 4); // 最小直径至少为 2px
     const maxDiameter = maxCommit * 4;

     days.forEach(function (day, idx) {
         // 1. 配置 Y 轴 (与 Scatter 方案完全一致)
         highchartsYAxes.push({
             title: {
                 text: day,
                 rotation: 0,
                 textAlign: 'right',
                 x: -10,
                 style: { fontWeight: 'normal' }
             },
             top: ((idx * 100) / 7 + 5) + '%',
             height: (100 / 7 - 10) + '%',
             opposite: false,
             offset: 0,
             lineWidth: 1,
             tickWidth: 0,
             gridLineWidth: 0,
             labels: { enabled: false },
             min: -1,
             max: 1,
             startOnTick: false,
             endOnTick: false
         });

         // 2. 为当天准备 Bubble 系列数据 (与之前 Bubble+多系列 方案一致)
         const seriesData = data
             .filter(dataItem => dataItem[0] === idx && dataItem[2] > 0)
             .map(dataItem => {
                 const hourIndex = dataItem[1];
                 const commitCount = dataItem[2];
                 return {
                     x: hourIndex,
                     y: 0,           // 在对应的 Y 轴线上绘制
                     z: commitCount, // z 值用于大小映射
                     commitCount: commitCount, // 保存原始值
                     hourName: hours[hourIndex],
                     dayName: day
                 };
             });

         // 3. 创建 Bubble 系列 (与之前 Bubble+多系列 方案一致)
         highchartsSeries.push({
             type: 'bubble',
             name: day,
             yAxis: idx,
             data: seriesData,
             // marker: { symbol: 'circle' } // 确保是圆形
         });
     });

     // 4. 创建 Highcharts 图表
     // --- 数据部分 (hours, days, data) 和 Y 轴/系列生成部分 保持不变 ---
     // ... (之前的代码，包括 minCommit/maxCommit 和 minDiameter/maxDiameter 计算) ...

     // 4. 创建 Highcharts 图表
     Highcharts.chart('container', {
         chart: {
             marginLeft: axisMarginLeft,
         },
         title: { text: null },
         xAxis: { // X 轴配置 (与 Scatter 方案完全一致)
             categories: hours,
             opposite: true,
             lineWidth: 1,
             gridLineWidth: 1,
             gridLineDashStyle: 'dot',
             tickInterval: 3,
             tickWidth: 1,
             tickLength: 5
         },
         yAxis: highchartsYAxes, // 使用配置好的多个 Y 轴
         legend: { enabled: false }, // 禁用图例
         tooltip: { // Tooltip 配置 (与 Scatter 方案完全一致)
             pointFormatter: function () {
                 return this.commitCount + ' commits in ' + this.hourName + ' of ' + this.dayName;
             },
             positioner: function (labelWidth, labelHeight, point) {
                  return {
                      x: point.plotX + this.chart.plotLeft - labelWidth / 2,
                      y: point.plotY + this.chart.plotTop - labelHeight - 10
                  };
              }
         },
         plotOptions: {
             bubble: {
                 // *** 关键调整：匹配 Scatter 的大小映射 ***
                 sizeBy: 'width',     // 直径 与 z 值成正比
                 minSize: minDiameter, // 最小直径 (像素)
                 maxSize: maxDiameter, // 最大直径 (像素)

                 // -----------> 添加这一行 <-----------
                 clip: false,         // 允许气泡绘制到绘图区域之外
                 // ------------------------------------

                 // 可选的视觉效果
                 marker: {
                     fillOpacity: 0.8, // 可以设置透明度
                     states: { hover: { lineWidthPlus: 1 } }
                 },
                 states: { inactive: { opacity: 0.15 } } // 悬浮时其他点变暗
             }
         },
         series: highchartsSeries // 使用配置好的多个 Bubble 系列
     });
     */

    // MARK: - Punch Card Chart (Multiple Y-Axes Bubble)
    
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
        let rawData: [[Double]] = [[0, 0, 5], [0, 1, 1], [0, 2, 0], [0, 3, 0], [0, 4, 0], [0, 5, 0], [0, 6, 0], [0, 7, 0], [0, 8, 0], [0, 9, 0], [0, 10, 0], [0, 11, 2], [0, 12, 4], [0, 13, 1], [0, 14, 1], [0, 15, 3], [0, 16, 4], [0, 17, 6], [0, 18, 4], [0, 19, 4], [0, 20, 3], [0, 21, 3], [0, 22, 2], [0, 23, 5], [1, 0, 7], [1, 1, 0], [1, 2, 0], [1, 3, 0], [1, 4, 0], [1, 5, 0], [1, 6, 0], [1, 7, 0], [1, 8, 0], [1, 9, 0], [1, 10, 5], [1, 11, 2], [1, 12, 2], [1, 13, 6], [1, 14, 9], [1, 15, 11], [1, 16, 6], [1, 17, 7], [1, 18, 8], [1, 19, 12], [1, 20, 5], [1, 21, 5], [1, 22, 7], [1, 23, 2], [2, 0, 1], [2, 1, 1], [2, 2, 0], [2, 3, 0], [2, 4, 0], [2, 5, 0], [2, 6, 0], [2, 7, 0], [2, 8, 0], [2, 9, 0], [2, 10, 3], [2, 11, 2], [2, 12, 1], [2, 13, 9], [2, 14, 8], [2, 15, 10], [2, 16, 6], [2, 17, 5], [2, 18, 5], [2, 19, 5], [2, 20, 7], [2, 21, 4], [2, 22, 2], [2, 23, 4], [3, 0, 7], [3, 1, 3], [3, 2, 0], [3, 3, 0], [3, 4, 0], [3, 5, 0], [3, 6, 0], [3, 7, 0], [3, 8, 1], [3, 9, 0], [3, 10, 5], [3, 11, 4], [3, 12, 7], [3, 13, 14], [3, 14, 13], [3, 15, 12], [3, 16, 9], [3, 17, 5], [3, 18, 5], [3, 19, 10], [3, 20, 6], [3, 21, 4], [3, 22, 4], [3, 23, 1], [4, 0, 1], [4, 1, 3], [4, 2, 0], [4, 3, 0], [4, 4, 0], [4, 5, 1], [4, 6, 0], [4, 7, 0], [4, 8, 0], [4, 9, 2], [4, 10, 4], [4, 11, 4], [4, 12, 2], [4, 13, 4], [4, 14, 4], [4, 15, 14], [4, 16, 12], [4, 17, 1], [4, 18, 8], [4, 19, 5], [4, 20, 3], [4, 21, 7], [4, 22, 3], [4, 23, 0], [5, 0, 2], [5, 1, 1], [5, 2, 0], [5, 3, 3], [5, 4, 0], [5, 5, 0], [5, 6, 0], [5, 7, 0], [5, 8, 2], [5, 9, 0], [5, 10, 4], [5, 11, 1], [5, 12, 5], [5, 13, 10], [5, 14, 5], [5, 15, 7], [5, 16, 11], [5, 17, 6], [5, 18, 0], [5, 19, 5], [5, 20, 3], [5, 21, 4], [5, 22, 2], [5, 23, 0], [6, 0, 1], [6, 1, 0], [6, 2, 0], [6, 3, 0], [6, 4, 0], [6, 5, 0], [6, 6, 0], [6, 7, 0], [6, 8, 0], [6, 9, 0], [6, 10, 1], [6, 11, 0], [6, 12, 2], [6, 13, 1], [6, 14, 3], [6, 15, 4], [6, 16, 0], [6, 17, 0], [6, 18, 0], [6, 19, 0], [6, 20, 1], [6, 21, 2], [6, 22, 2], [6, 23, 6]]
        
        var highchartsYAxes: [AAYAxis] = []
        var highchartsSeries: [AASeriesElement] = []
        let axisMarginLeft: Double = 150 // Space for day labels
        
        // Calculate min/max commit count for size mapping
        var minCommit: Double = Double.infinity
        var maxCommit: Double = 0
        rawData.forEach { item in
            if item[2] > 0 {
                minCommit = min(minCommit, item[2])
                maxCommit = max(maxCommit, item[2])
            }
        }
        minCommit = (minCommit == Double.infinity) ? 1 : minCommit
        maxCommit = (maxCommit == 0) ? 1 : maxCommit
        
        // Define size mapping: diameter = commitCount * 4
        let minDiameter = max(2.0, minCommit * 4.0) // Min diameter 2px
        let maxDiameter = maxCommit * 4.0
        
        for (idx, day) in days.enumerated() {
            // 1. Configure Y Axis (same as scatter version)
            let yAxis = AAYAxis()
                .title(AATitle()
                    .text(day)
//                    .rotation(0)
//                    .textAlign(.right)
                    .x(-10)
//                    .style(AAStyle().fontWeight(.normal)) // Match JS style
                )
                .top("\((Double(idx) * 100.0) / 7.0 + 5.0)%")
                .height("\((100.0 / 7.0 - 10.0))%")
                .opposite(false)
                .offset(0)
                .lineWidth(1)
                .tickWidth(0) // Match JS tickWidth
                .gridLineWidth(0)
                .labels(AALabels().enabled(false))
                .min(-1)
                .max(1)
                .startOnTick(false)
                .endOnTick(false)
            highchartsYAxes.append(yAxis)
            
            // 2. Prepare Bubble series data for the day
            let seriesData = rawData
                .filter { $0[0] == Double(idx) && $0[2] > 0 }
                .map { dataItem -> [String: Any] in
                    let hourIndex = Int(dataItem[1])
                    let commitCount = dataItem[2]
                    return [
                        "x": hourIndex,
                        "y": 0,           // Plot on the Y axis line
                        "z": commitCount, // z value for size mapping
                        "commitCount": commitCount, // Store original value for tooltip
                        "hourName": hours[hourIndex],
                        "dayName": day
                    ]
                }
            
            // 3. Create Bubble series
            let seriesElement = AASeriesElement()
                .type(.bubble)
                .name(day)
                .yAxis(idx) // Link to the correct Y axis
                .data(seriesData)
                .clip(false) // Allow bubbles outside plot area

                // .marker(AAMarker().symbol(.circle)) // Bubble is circle by default
            highchartsSeries.append(seriesElement)
        }
        
        // Tooltip formatter function (JavaScript) - Use commitCount from options
        let tooltipFormatter = """
        function () {
            return this.point.options.commitCount + ' commits in ' + this.point.options.hourName + ' of ' + this.point.options.dayName;
        }
        """
        
        // Tooltip positioner function (JavaScript) - Same as scatter version
        let tooltipPositioner = """
        function (labelWidth, labelHeight, point) {
            return {
                x: point.plotX + this.chart.plotLeft - labelWidth / 2,
                y: point.plotY + this.chart.plotTop - labelHeight - 10
            };
        }
        """

        // 4. Create Highcharts options
        return AAOptions()
            .chart(AAChart()
//                .marginLeft(axisMarginLeft)
            )
            .title(AATitle()
                .text("Punch Card")) // No main title
            .xAxis(AAXAxis() // X Axis config (same as scatter version)
                .categories(hours)
                .opposite(true)
                .lineWidth(1)
                .gridLineWidth(1)
                .gridLineDashStyle(.dot)
                .tickInterval(3)
                .tickWidth(1)
                .tickLength(5)
            )
            .yAxisArray(highchartsYAxes) // Use the array of Y axes
            .legend(AALegend()
                .enabled(false)) // Disable legend
            .tooltip(AATooltip() // Tooltip config (same as scatter version)
                .pointFormatter(tooltipFormatter)
                .positioner(tooltipPositioner)
            )
            .plotOptions(AAPlotOptions()
                .bubble(AABubble()
                    // *** Key adjustments for bubble size mapping ***
//                    .sizeBy(.width)     // Diameter proportional to z value
                    .minSize(minDiameter) // Min diameter in pixels
                    .maxSize(maxDiameter) // Max diameter in pixels
//                    .clip(false)         // Allow bubbles outside plot area
                    // Optional visual effects
//                    .marker(AAMarker()
////                        .fillOpacity(0.8) // Set opacity
//                        .states(AAStates()
//                            .hover(AAHover().lineWidthPlus(1))
//                        )
//                    )
//                    .states(AAStates()
//                        .inactive(AAInactive().opacity(0.15)) // Dim others on hover
//                    )
                )
            )
            .series(highchartsSeries) // Use the array of Bubble series
    }
    
}
