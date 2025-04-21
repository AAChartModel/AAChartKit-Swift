//
//  MixedTypesChartOptionsComposer.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/4/21.
//  Copyright © 2025 An An. All rights reserved.
//

import AAInfographics

class MixedTypesChartOptionsComposer {

     /*
     // --- 配置变量 ---
     const colorGreen = '#55a655';
     const colorRed = '#e65550';
     const connectorWidth = 4;
     const markerRadius = 6;
     const markerLineWidth = 4;
     const numberOfPoints = 35; // 增加数据点数量

     // --- 生成更多随机数据 ---
     const pointsData = [];
     for (let i = 0; i < numberOfPoints; i++) {
         // 随机生成 low 值 (例如在 10 到 60 之间)
         const lowValue = Math.random() * 50 + 10;
         // 随机生成线条长度 (例如在 20 到 80 之间)
         const range = Math.random() * 60 + 20;
         // 计算 high 值
         const highValue = lowValue + range;
         // 随机决定颜色 (例如，大约 20% 的概率为红色)
         const pointColor = Math.random() < 0.2 ? colorRed : colorGreen;

         pointsData.push({
             low: Math.round(lowValue), // 取整让数值更干净
             high: Math.round(highValue),
             color: pointColor
         });
     }
     // 可选：根据 low 值或 high 值对数据进行排序，产生一种趋势感
     // pointsData.sort((a, b) => a.low - b.low);

     // --- 数据处理 (为每个系列准备数据) ---
     const columnRangeData = pointsData.map((point, index) => ({ x: index, low: point.low, high: point.high, color: point.color }));
     const scatterLowData = pointsData.map((point, index) => ({ x: index, y: point.low, color: point.color }));
     const scatterHighData = pointsData.map((point, index) => ({ x: index, y: point.high, color: point.color }));


     // --- Highcharts 图表配置 ---
     Highcharts.chart('container', {

         chart: {
             // backgroundColor: null // 可以保持透明
             backgroundColor: '#f9f9f9' // 或者给一个非常浅的背景色，增加质感
         },

         title: { text: null },
         legend: { enabled: false },
         credits: { enabled: false },

         tooltip: {
             enabled: true,
             shared: true,
             useHTML: true,
             formatter: function () {
                 if (!this.points || !Array.isArray(this.points)) return false;
                 const rangePointContext = this.points.find(p => p.series && p.series.type === 'columnrange');
                 if (rangePointContext && rangePointContext.point) {
                     const originalPoint = rangePointContext.point;
                     if (typeof originalPoint.low !== 'undefined' && typeof originalPoint.high !== 'undefined') {
                         // 让 tooltip 内容更丰富一点，加上颜色标记
                         const pointColor = rangePointContext.point.color || rangePointContext.series.color; // 获取点的颜色
                         return `<span style="color:${pointColor}">●</span> Range: <b>${originalPoint.low} - ${originalPoint.high}</b>`;
                     }
                 }
                 return false;
             },
             headerFormat: '',
             pointFormat: '',
             // 调整 tooltip 外观使其更精致
             backgroundColor: 'rgba(0, 0, 0, 0.75)', // 半透明黑色背景
             style: {
                 color: '#F0F0F0' // 浅色文字
             },
             borderWidth: 0, // 去掉边框
             shadow: false   // 去掉阴影
         },

         xAxis: {
             visible: false,
             // 稍微增加一点边距，避免点太贴边
             minPadding: 0.08,
             maxPadding: 0.08
         },

         yAxis: {
             visible: false
         },

         plotOptions: {
             series: {
                 // animation: false, // 移除这行，启用默认动画
                 grouping: false,
                 pointPadding: 0,
                 groupPadding: 0,
                 borderWidth: 0,
                 enableMouseTracking: true,
                  // 恢复一点 Highcharts 的查找和跟踪能力，但保持视觉简洁
                  findNearestPointBy: 'x', // 按 x 轴查找
                  stickyTracking: true,    // 开启粘性跟踪，提升空白区域体验
                 states: {
                     hover: {
                        enabled: false // 仍然禁用元素本身的视觉高亮
                     },
                     inactive: {
                         opacity: 1 // 其他点不暗淡
                     }
                 }
             },
             columnrange: {
                 pointWidth: connectorWidth,
                 stickyTracking: false // columnrange 不参与粘性查找
             },
             scatter: {
                 marker: {
                     symbol: 'circle',
                     radius: markerRadius,
                     states: { hover: { enabled: false } } // marker 也不高亮
                 },
                 stickyTracking: true // scatter 参与粘性查找
             }
         },

         series: [
             {
                 type: 'columnrange',
                 name: 'Connectors',
                 data: columnRangeData,
                 keys: ['x', 'low', 'high', 'color'],
                 zIndex: 1,
                 stickyTracking: false // 明确关闭
             },
             {
                 type: 'scatter',
                 name: 'Low Points',
                 data: scatterLowData,
                 keys: ['x', 'y', 'color'],
                 marker: {
                     lineWidth: markerLineWidth,
                     fillColor: 'white',
                     lineColor: null,
                 },
                 zIndex: 2,
                 stickyTracking: true // 确保开启
             },
             {
                 type: 'scatter',
                 name: 'High Points',
                 data: scatterHighData,
                 keys: ['x', 'y', 'color'],
                 marker: {
                     lineWidth: markerLineWidth,
                     fillColor: 'white',
                     lineColor: null,
                 },
                 zIndex: 2,
                 stickyTracking: true // 确保开启
             }
         ]

     });
     */
    class func columnrangeAndScatterMixedTypesChart() -> AAOptions {
        // --- 配置变量 ---
        let colorGreen = "#55a655"
        let colorRed = "#e65550"
        let connectorWidth = 4
        let markerRadius = 6
        let markerLineWidth = 4
        let numberOfPoints = 35 // 增加数据点数量

        // --- 生成更多随机数据 ---
        var pointsData: [[String: Any]] = []
        for i in 0..<numberOfPoints {
            // 随机生成 low 值 (例如在 10 到 60 之间)
            let lowValue = Double.random(in: 10..<60)
            // 随机生成线条长度 (例如在 20 到 80 之间)
            let range = Double.random(in: 20..<80)
            // 计算 high 值
            let highValue = lowValue + range
            // 随机决定颜色 (例如，大约 20% 的概率为红色)
            let pointColor = Double.random(in: 0..<1) < 0.2 ? colorRed : colorGreen

            pointsData.append([
                "low": Int(round(lowValue)), // 取整让数值更干净
                "high": Int(round(highValue)),
                "color": pointColor
            ])
        }
        // 可选：根据 low 值或 high 值对数据进行排序，产生一种趋势感
        // pointsData.sort { ($0["low"] as! Int) < ($1["low"] as! Int) }

        // --- 数据处理 (为每个系列准备数据) ---
        let columnRangeData = pointsData.enumerated().map { (index, point) in
            [
                "x": index,
                "low": point["low"]!,
                "high": point["high"]!,
                "color": point["color"]!
            ]
        }
        let scatterLowData = pointsData.enumerated().map { (index, point) in
            [
                "x": index,
                "y": point["low"]!,
                "color": point["color"]!
            ]
        }
        let scatterHighData = pointsData.enumerated().map { (index, point) in
            [
                "x": index,
                "y": point["high"]!,
                "color": point["color"]!
            ]
        }
        

        // --- Highcharts 图表配置 ---
        let aaOptions = AAOptions()
            .chart(AAChart()
                .backgroundColor("#f9f9f9") // 或者给一个非常浅的背景色，增加质感
            )
            .title(AATitle()
                .text("columnrangeAndScatterMixedTypesChart---柱形范围图和散点图混合类型图")
            )
            .legend(AALegend()
                .enabled(false)
            )
            .credits(AACredits()
                .enabled(false)
            )
            .tooltip(AATooltip()
                .enabled(true)
                .shared(true)
                .useHTML(true)
                .formatter("""
                function () {
                    if (!this.points || !Array.isArray(this.points)) return false;
                    const rangePointContext = this.points.find(p => p.series && p.series.type === 'columnrange');
                    if (rangePointContext && rangePointContext.point) {
                        const originalPoint = rangePointContext.point;
                        if (typeof originalPoint.low !== 'undefined' && typeof originalPoint.high !== 'undefined') {
                            const pointColor = rangePointContext.point.color || rangePointContext.series.color; 
                            return `<span style="color:${pointColor}">●</span> Range: <b>${originalPoint.low} - ${originalPoint.high}</b>`;
                        }
                    }
                    return false;
                }
                """)
                .headerFormat("")
                .pointFormat("")
                .backgroundColor("rgba(0, 0, 0, 0.75)") // 半透明黑色背景
                .style(AAStyle()
                    .color("#F0F0F0") // 浅色文字
                )
                .borderWidth(0) // 去掉边框
                .shadow(false)   // 去掉阴影
            )
            .xAxis(AAXAxis()
                .visible(false)
                .minPadding(0.08) // 稍微增加一点边距，避免点太贴边
                .maxPadding(0.08)
            )
            .yAxis(AAYAxis()
                .visible(false)
            )
            .plotOptions(AAPlotOptions()
                .series(AASeries()
//                    .grouping(false)
                    .pointPadding(0)
                    .pointWidth(Float(connectorWidth))
                    .groupPadding(0)
                    .borderWidth(0)
//                    .enableMouseTracking(true)
//                    .findNearestPointBy("x") // 按 x 轴查找
//                    .stickyTracking(true)    // 开启粘性跟踪，提升空白区域体验
                    .states(AAStates()
                        .hover(AAHover()
                            .enabled(false) // 仍然禁用元素本身的视觉高亮
                        )
                        .inactive(AAInactive()
                            .opacity(1) // 其他点不暗淡
                        )
                    )
                )
                .columnrange(AAColumnrange()
                                                 .grouping(false)

//                    .pointWidth(connectorWidth)
//                    .stickyTracking(false) // columnrange 不参与粘性查找
                )
                .scatter(AAScatter()
                         //                    .grouping(false)

                    .marker(AAMarker()
                        .symbol(.circle)
                        .radius(Float(markerRadius))
                        .states(AAMarkerStates()
                            .hover(AAMarkerHover()
                                .enabled(false) // marker 也不高亮
                            )
                        )
                    )
//                    .stickyTracking(true) // scatter 参与粘性查找
                )
            )
            .series([
                AASeriesElement()
                    .type(.columnrange)
                    .name("Connectors")
                    .data(columnRangeData)
                    .keys(["x", "low", "high", "color"])
                    .zIndex(1)
    //                .stickyTracking(false) // 明确关闭
                ,
                AASeriesElement()
                    .type(.scatter)
                    .name("Low Points")
                    .data(scatterLowData)
                    .keys(["x", "y", "color"])
                    .marker(AAMarker()
                        .lineWidth(Float(markerLineWidth))
                        .fillColor("white")
                        .lineColor(NSNull()) // 让外沿线颜色透明
                    )
                    .zIndex(2)
    //                .stickyTracking(true) // 确保开启
                ,
                AASeriesElement()
                    .type(.scatter)
                    .name("High Points")
                    .data(scatterHighData)
                    .keys(["x", "y", "color"])
                    .marker(AAMarker()
                        .lineWidth(Float(markerLineWidth))
                        .fillColor("white")
                        .lineColor(NSNull())
                    )
                    .zIndex(2)
    //                .stickyTracking(true) // 确保开启
            ])

        return aaOptions
    }
}
