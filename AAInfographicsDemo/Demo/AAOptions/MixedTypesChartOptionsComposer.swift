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
     以下代码由 Gemini 2.5 Pro AI 工具辅助生成
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
        for _ in 0..<numberOfPoints {
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
//        // 可选：根据 low 值或 high 值对数据进行排序，产生一种趋势感
//        pointsData.sort { ($0["low"] as! Int) < ($1["low"] as! Int) }

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
                    .pointPadding(0)
                    .groupPadding(0)
                    .borderWidth(0)
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
                    .pointWidth(Float(connectorWidth)) // Specific to columnrange
                )
                .scatter(AAScatter()
                    .marker(AAMarker()
                        .symbol(.circle)
                        .radius(Float(markerRadius))
                        .states(AAMarkerStates()
                            .hover(AAMarkerHover()
                                .enabled(false) // marker 也不高亮
                            )
                        )
                    )
                )
            )
            .series([
                AASeriesElement()
                    .type(.columnrange)
                    .name("Connectors")
                    .data(columnRangeData)
                    .keys(["x", "low", "high", "color"])
                    .zIndex(1)
                ,
                AASeriesElement()
                    .type(.scatter)
                    .name("Low Points")
                    .data(scatterLowData)
                    .keys(["x", "y", "color"])
                    .marker(AAMarker()
                        .lineWidth(Float(markerLineWidth))
                        .fillColor("white")
                        .lineColor(NSNull()) // 设置 marker 外沿线颜色关键代码(明确指示 Highcharts 将数据点中定义的 color (#55a655 或 #e65550) 应用于 marker 的边框)
                    )
                    .zIndex(2)
                ,
                AASeriesElement()
                    .type(.scatter)
                    .name("High Points")
                    .data(scatterHighData)
                    .keys(["x", "y", "color"])
                    .marker(AAMarker()
                        .lineWidth(Float(markerLineWidth))
                        .fillColor("white")
                        .lineColor(NSNull()) // 设置 marker 外沿线颜色关键代码(明确指示 Highcharts 将数据点中定义的 color (#55a655 或 #e65550) 应用于 marker 的边框)
                    )
                    .zIndex(2)
            ])

        return aaOptions
    }
    
    class func invertedColumnrangeAndScatterMixedTypesChart() -> AAOptions {
        // --- 配置变量 ---
        let colorGreen = AAGradientColor.deepSea.toDic()
        let colorRed = AAGradientColor.sanguine.toDic()
//        let connectorWidth = 4
//        let markerRadius = 6
//        let markerLineWidth = 4
        let numberOfPoints = 35 // 增加数据点数量

        // --- 生成更多随机数据 ---
        var pointsData: [[String: Any]] = []
        for _ in 0..<numberOfPoints {
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
//        // 可选：根据 low 值或 high 值对数据进行排序，产生一种趋势感
//         pointsData.sort { ($0["low"] as! Int) < ($1["low"] as! Int) }

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
        
        let aaOptions = columnrangeAndScatterMixedTypesChart()
        aaOptions.chart?.inverted = true // 反转图表
        
        //为 series 中的每个元素设置数值
        let aaSeriesArr = aaOptions.series as! [AASeriesElement]
        aaSeriesArr[0].data = columnRangeData
        aaSeriesArr[1].data = scatterLowData
        aaSeriesArr[2].data = scatterHighData
        
        return aaOptions
    }
    
    /*
     // --- 配置变量 ---
     const colorGreen = '#55a655'; // 绿色 (例如表示适中或较低温度)
     const colorRed = '#e65550';   // 红色 (例如表示较高温度)
     const columnWidth = 12;       // “温度柱”的宽度 (可以适当加宽)
     const bulbRadius = 10;        // “温度计底部圆球”的半径 (可以适当增大)
     const bulbLineWidth = 3;     // 圆球边框宽度
     const numberOfPoints = 20;    // 数据点数量 (温度计数量)
     const baseline = 0;           // 温度计的起始基线 (通常是 0 度)

     // --- 生成随机数据 ---
     const pointsData = [];
     for (let i = 0; i < numberOfPoints; i++) {
         // 随机生成温度值 (例如在 10 到 90 之间)
         const temperatureValue = Math.random() * 80 + 10;
         // 根据温度决定颜色 (例如，高于 60 度为红色)
         const pointColor = temperatureValue > 60 ? colorRed : colorGreen;

         pointsData.push({
             value: Math.round(temperatureValue), // 温度值
             color: pointColor                   // 对应的颜色
         });
     }
     // 可选：根据 value 值对数据进行排序
     // pointsData.sort((a, b) => a.value - b.value);

     // --- 数据处理 (为每个系列准备数据) ---
     // column 数据: 代表温度柱的高度
     const columnData = pointsData.map((point, index) => ({
         x: index,
         y: point.value,     // 柱子高度为温度值
         color: point.color  // 柱子颜色
     }));

     // scatter 数据: 代表底部的圆球，y 坐标固定在基线
     const scatterData = pointsData.map((point, index) => ({
         x: index,
         y: baseline,        // !!! 关键改动：圆球的 Y 坐标在基线处
         color: point.color  // 圆球边框颜色继承此颜色
     }));


     // --- Highcharts 图表配置 ---
     Highcharts.chart('container', {

         chart: {
             backgroundColor: '#f9f9f9',
         },

         title: {
             text: '自定义 Highcharts 温度计图 🌡️'
         },
         subtitle: {
             text: '使用 Column 和 Scatter 系列模拟'
         },
         legend: {
             enabled: false
         },
         credits: {
             enabled: false
         },

         tooltip: {
             enabled: true,
             shared: true,
             useHTML: true,
             formatter: function () {
                 // 查找柱状图的点来获取【实际温度值】
                 const pointContext = this.points.find(p => p.series && p.series.type === 'column');
                 if (pointContext && pointContext.point) {
                     const currentPoint = pointContext.point;
                     if (typeof currentPoint.y !== 'undefined') {
                         // 获取点的颜色 (可以从 column 点获取，因为颜色是一致的)
                         const pointColor = currentPoint.color || pointContext.series.color;
                         // 显示【温度值】，并用颜色标记
                         return `<span style="color:${pointColor}">●</span> 温度值: <b>${currentPoint.y}</b>`;
                     }
                 }
                 return false; // 无法获取数据则不显示
             },
             headerFormat: '索引: {point.key}<br/>',
             pointFormat: '',
             // Tooltip 外观样式
             backgroundColor: 'rgba(0, 0, 0, 0.75)',
             style: {
                 color: '#F0F0F0'
             },
             borderWidth: 0,
             shadow: false
         },

         xAxis: {
              visible: false,
              minPadding: 0.1, // 稍微增加边距，给圆球留出空间
              maxPadding: 0.1
         },

         yAxis: {
              visible: false,
              min: baseline, // 确保柱子从基线开始
              // 可以考虑设置一个 max 值，或者让 Highcharts 自动计算
              // max: 100 // 例如设置一个最大刻度
              startOnTick: false, // Y 轴不强制从刻度线开始
              endOnTick: false    // Y 轴不强制在刻度线结束
         },

         plotOptions: {
             series: {
                 grouping: false,
                 pointPadding: 0,
                 groupPadding: 0.2, // 调整温度计之间的间距
                 borderWidth: 0,
                 enableMouseTracking: true,
                 findNearestPointBy: 'x',
                 stickyTracking: true,
                 states: {
                     hover: {
                         enabled: false
                     },
                     inactive: {
                         opacity: 1
                     }
                 }
             },
             column: {
                 pointWidth: columnWidth, // 设置“温度柱”的宽度
                 colorByPoint: true,
                 zIndex: 1,
                 stickyTracking: true, // 让柱子也能触发 Tooltip
                 // 可以给柱子顶部加一点圆角，更像液体柱
                  borderRadius: columnWidth / 4
             },
             scatter: {
                 marker: {
                     symbol: 'circle',
                     radius: bulbRadius,
                     lineWidth: bulbLineWidth,
                     fillColor: 'white', // 圆球填充色
                     lineColor: null,    // 圆球边框颜色继承数据点颜色
                     states: {
                         hover: { enabled: false }
                     }
                 },
                 zIndex: 2,             // 圆球在柱子之上
                 stickyTracking: true   // 让圆球区域也能触发 Tooltip
             }
         },

         series: [
             // 顺序很重要：先绘制柱子，再绘制圆球覆盖底部
             {
                 type: 'column',
                 name: '温度柱',
                 data: columnData,
                 keys: ['x', 'y', 'color'],
                 zIndex: 1
                 // borderRadius 已在 plotOptions 中设置
             },
             {
                 type: 'scatter',
                 name: '底部圆球',
                 data: scatterData, // 使用修改后的 scatter 数据（y 在基线）
                 keys: ['x', 'y', 'color'],
                 zIndex: 2
             }
         ]

     });
     */
    class func customThermometerChart() -> AAOptions {
        // --- 配置变量 ---
        let colorGreen = AAGradientColor.newLeaf.toDic() // 绿色 (例如表示适中或较低温度)
        let colorRed = AAGradientColor.sanguine.toDic()   // 红色 (例如表示较高温度)
        let columnWidth: Float = 8 // “温度柱”的宽度 (可以适当加宽)
        let bulbRadius: Float = 12 // “温度计底部圆球”的半径 (可以适当增大)
        let bulbLineWidth: Float = 5 // 圆球边框宽度
        let numberOfPoints = 20 // 数据点数量 (温度计数量)
        let baseline = 0 // 温度计的起始基线 (通常是 0 度)

        // --- 生成随机数据 ---
        var pointsData: [[String: Any]] = []
        for _ in 0..<numberOfPoints {
            // 随机生成温度值 (例如在 10 到 90 之间)
            let temperatureValue = Double.random(in: 10..<90)
            // 根据温度决定颜色 (例如，高于 60 度为红色)
            let pointColor = temperatureValue > 60 ? colorRed : colorGreen

            pointsData.append([
                "value": Int(round(temperatureValue)), // 温度值
                "color": pointColor                   // 对应的颜色
            ])
        }
//        // 可选：根据 value 值对数据进行排序
//         pointsData.sort { ($0["value"] as! Int) < ($1["value"] as! Int) }

        // --- 数据处理 (为每个系列准备数据) ---
        // column 数据: 代表温度柱的高度
        let columnData = pointsData.enumerated().map { (index, point) in
            [
                "x": index,
                "y": point["value"]!,
                "color": point["color"]!
            ]
        }

        // scatter 数据: 代表底部的圆球，y 坐标固定在基线
        let scatterData = pointsData.enumerated().map { (index, point) in
            [
                "x": index,
                "y": baseline,
                "color": point["color"]!
            ]
        }

        // --- Highcharts 图表配置 ---
        let aaOptions = AAOptions()
            .chart(AAChart()
                .backgroundColor("#f9f9f9")
                .marginBottom(42) // 底部留出空间给圆球
            )
            .title(AATitle()
                .text("自定义 AAInfographics 温度计图 🌡️")
            )
            .subtitle(AASubtitle()
                .text("使用 Column 和 Scatter 系列模拟")
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
                .headerFormat("索引: {point.key}<br/>")
                .pointFormat("")
                .backgroundColor("rgba(0, 0, 0, 0.75)")
                .style(AAStyle()
                    .color("#F0F0F0")
                )
                .borderWidth(0)
                .shadow(false)
            )
            .xAxis(AAXAxis()
                .visible(false)
                .minPadding(0.1) // 稍微增加边距，给圆球留出空间
                .maxPadding(0.1)
            )
            .yAxis(AAYAxis()
                .visible(false)
                .min(Double(baseline)) // 确保柱子从基线开始
                .startOnTick(false) // Y 轴不强制从刻度线开始
                .endOnTick(false)   // Y 轴不强制在刻度线结束
            )
            .plotOptions(AAPlotOptions()
                .series(AASeries()
                    .pointPadding(0)
                    .groupPadding(0.2) // 调整温度计之间的间距
                    .borderWidth(0)
                    .states(AAStates()
                        .hover(AAHover()
                            .enabled(false)
                        )
                        .inactive(AAInactive()
                            .opacity(1)
                        )
                    )
                )
                .column(AAColumn()
                    .borderWidth(0.5) // 设置柱子边框宽度
                    .borderColor(AAColor.white) // 设置柱子边框颜色
                    .grouping(false)
                    .pointWidth(columnWidth) // 设置“温度柱”的宽度
                    .colorByPoint(true)
                    .borderRadius("50%") // 设置柱子边框圆角
                )
                .scatter(AAScatter()
                    .marker(AAMarker()
                        .symbol(.circle)
                        .radius(bulbRadius)
                        .lineWidth(bulbLineWidth)
                        .fillColor("white") // 圆球填充色
                        .lineColor(NSNull())    // 圆球边框颜色继承数据点颜色
                        .states(AAMarkerStates()
                            .hover(AAMarkerHover()
                                .enabled(false)
                            )
                        )
                    )
                )
            )
            .series([
                AASeriesElement()
                    .type(.column)
                    .name("温度柱")
                    .data(columnData)
                    .keys(["x", "y", "color"])
                    .zIndex(1),
                AASeriesElement()
                    .type(.scatter)
                    .name("底部圆球")
                    .data(scatterData)
                    .keys(["x", "y", "color"])
                    .zIndex(2)
            ])

        return aaOptions
    }
    
    class func customInvertedThermometerChart() -> AAOptions {
        // --- 配置变量 ---
        let colorGreen = AAGradientColor.reflexSilver.toDic()
        let colorRed = AAGradientColor.wroughtIron.toDic()
//        let columnWidth: Float = 8 // “温度柱”的宽度 (可以适当加宽)
//        let bulbRadius: Float = 12 // “温度计底部圆球”的半径 (可以适当增大)
//        let bulbLineWidth: Float = 5 // 圆球边框宽度
        let numberOfPoints = 20 // 数据点数量 (温度计数量)
        let baseline = 0 // 温度计的起始基线 (通常是 0 度)
        
        // --- 生成随机数据 ---
        var pointsData: [[String: Any]] = []
        for _ in 0..<numberOfPoints {
            // 随机生成温度值 (例如在 10 到 90 之间)
            let temperatureValue = Double.random(in: 10..<90)
            // 根据温度决定颜色 (例如，高于 60 度为红色)
            let pointColor = temperatureValue > 60 ? colorRed : colorGreen
            
            pointsData.append([
                "value": Int(round(temperatureValue)), // 温度值
                "color": pointColor                   // 对应的颜色
            ])
        }
//        // 可选：根据 value 值对数据进行排序
//        pointsData.sort { ($0["value"] as! Int) < ($1["value"] as! Int) }
        
        // --- 数据处理 (为每个系列准备数据) ---
        // column 数据: 代表温度柱的高度
        let columnData = pointsData.enumerated().map { (index, point) in
            [
                "x": index,
                "y": point["value"]!,
                "color": point["color"]!
            ]
        }
        
        // scatter 数据: 代表底部的圆球，y 坐标固定在基线
        let scatterData = pointsData.enumerated().map { (index, point) in
            [
                "x": index,
                "y": baseline,
                "color": point["color"]!
            ]
        }
        
        let aaOptions = customThermometerChart()
        aaOptions.chart?.inverted = true // 反转图表
        aaOptions.chart?.marginLeft = 42 // 左侧留出空间给圆球
        
        //为 series 中的每个元素设置数值
        let aaSeriesArr = aaOptions.series as! [AASeriesElement]
        aaSeriesArr[0].data = columnData
        aaSeriesArr[1].data = scatterData
        
        return aaOptions
    }
    
    /*
     // --- 配置变量 ---
        const colorGreen = '#55a655'; // 绿色
        const colorRed = '#e65550';   // 红色
        const stickWidth = 3;         // “棒子”的宽度 (列宽)
        const markerRadius = 7;       // “糖果”的半径 (散点标记半径)
        const markerLineWidth = 3;    // “糖果”边框宽度
        const numberOfPoints = 30;    // 数据点数量
        const baseline = 0;           // 棒棒糖“棒子”的起始基线

        // --- 生成随机数据 ---
        const pointsData = [];
        for (let i = 0; i < numberOfPoints; i++) {
            // 随机生成 value (例如在 20 到 150 之间)
            const dataValue = Math.random() * 130 + 20;
            // 随机决定颜色 (例如，大约 20% 的概率为红色)
            const pointColor = Math.random() < 0.2 ? colorRed : colorGreen;

            pointsData.push({
                value: Math.round(dataValue), // 取整让数值更干净
                color: pointColor
            });
        }
        // 可选：根据 value 值对数据进行排序，产生一种趋势感
        // pointsData.sort((a, b) => a.value - b.value);

        // --- 数据处理 (为每个系列准备数据) ---
        // column 数据: 每个点是一个柱子，高度为 value
        const columnData = pointsData.map((point, index) => ({
            x: index,
            y: point.value,     // 柱子的高度就是数据值
            color: point.color  // 柱子的颜色
        }));

        // scatter 数据: 每个点是一个标记，位置在 value 处
        const scatterData = pointsData.map((point, index) => ({
            x: index,
            y: point.value,     // 标记点的 Y 坐标也是数据值
            color: point.color  // 标记点边框的颜色将来源于此
        }));


        // --- Highcharts 图表配置 ---
        Highcharts.chart('container', {

            chart: {
                // backgroundColor: null // 透明背景
                backgroundColor: '#f9f9f9', // 浅灰色背景
                // 可以不指定默认类型，因为我们在 series 中明确指定
            },

            title: {
                text: '自定义 Highcharts 棒棒糖图'
            },
            subtitle: {
                text: '使用 Column 和 Scatter 系列实现'
            },
            legend: {
                enabled: false // 不显示图例
            },
            credits: {
                enabled: false // 不显示 Highcharts logo
            },

            tooltip: {
                enabled: true,
                shared: true,       // 共享 Tooltip，同时显示柱状和散点信息（虽然值一样）
                useHTML: true,
           
                headerFormat: '索引: {point.key}<br/>', // 在 tooltip 头部显示 x 轴索引
                pointFormat: '', // 具体格式由 formatter 控制
                // Tooltip 外观样式
                backgroundColor: 'rgba(0, 0, 0, 0.75)',
                style: {
                    color: '#F0F0F0'
                },
                borderWidth: 0,
                shadow: false
            },

            xAxis: {
                 visible: false, // 隐藏 X 轴
                 minPadding: 0.08, // 左右留白，防止标记贴边
                 maxPadding: 0.08
            },

            yAxis: {
                 visible: false, // 隐藏 Y 轴
                 min: baseline   // !!! 关键：确保柱子从指定的基线开始绘制
                 // 如果你的数据可能有负值，并且希望棒棒糖向下，则不需要设置 min，或者需要更复杂的逻辑
            },

            plotOptions: {
                series: {
                    // animation: false, // 可以启用默认动画
                    grouping: false,    // 不对系列进行分组
                    pointPadding: 0,    // 同一 x 轴位置的点之间没有内边距
                    groupPadding: 0.1,  // 不同 x 轴位置的点（柱子）之间的距离，调整这个值来控制棒棒糖间距
                    borderWidth: 0,     // 无边框
                    enableMouseTracking: true, // 启用鼠标跟踪
                    findNearestPointBy: 'x',   // 按 x 轴查找最近点
                    stickyTracking: true,      // 粘性跟踪，鼠标在空白区域也能触发 tooltip
                    states: {
                        hover: {
                            enabled: false // 禁用元素本身的鼠标悬浮高亮效果
                        },
                        inactive: {
                            opacity: 1 // 其他点在某个点悬浮时，不降低透明度
                        }
                    }
                },
                column: {
                    pointWidth: stickWidth, // 设置“棒子”的宽度
                    colorByPoint: true,    // 让每个柱子根据其数据点的 color 属性着色 (虽然我们在数据映射里也指定了)
                    zIndex: 1,             // 将柱子放在散点标记的后面 (层级较低)
                    stickyTracking: false  // 让细的柱子本身不那么容易触发 tooltip，主要靠散点标记触发
                },
                scatter: {
                    marker: {
                        symbol: 'circle',       // 标记形状：圆形
                        radius: markerRadius,   // 标记半径
                        lineWidth: markerLineWidth, // 标记边框宽度
                        fillColor: 'white',     // 标记填充色：白色
                        lineColor: null,        // !!! 关键：标记边框颜色，设置为 null 会继承数据点的 color 属性
                        states: {
                            hover: { enabled: false } // 禁用标记的鼠标悬浮效果
                        }
                    },
                    zIndex: 2,             // 将散点标记放在柱子的前面 (层级较高)
                    stickyTracking: true   // 让散点标记更容易触发 tooltip
                }
            },

            series: [
                {
                    type: 'column',
                    name: '棒子 (Stick)', // 系列名称
                    data: columnData,
                    keys: ['x', 'y', 'color'], // 告知 Highcharts 数据结构
                    zIndex: 1,
                    stickyTracking: false
                },
                {
                    type: 'scatter',
                    name: '糖果 (Candy)', // 系列名称
                    data: scatterData,
                    keys: ['x', 'y', 'color'], // 告知 Highcharts 数据结构
                    // marker 样式在 plotOptions.scatter.marker 中定义
                    zIndex: 2,
                    stickyTracking: true
                }
            ]

        });
     */
    class func customLollipopChart() -> AAOptions {
        // --- 配置变量 ---
        let colorGreen = "#55a655" // 绿色
        let colorRed = "#e65550"   // 红色
        let stickWidth: Float = 3 // “棒子”的宽度 (列宽)
        let markerRadius: Float = 7 // “糖果”的半径 (散点标记半径)
        let markerLineWidth: Float = 3 // “糖果”边框宽度
        let numberOfPoints = 30 // 数据点数量
        let baseline = 0 // 棒棒糖“棒子”的起始基线

        // --- 生成随机数据 ---
        var pointsData: [[String: Any]] = []
        for _ in 0..<numberOfPoints {
            // 随机生成 value (例如在 20 到 150 之间)
            let dataValue = Double.random(in: 20..<150)
            // 随机决定颜色 (例如，大约 20% 的概率为红色)
            let pointColor = Double.random(in: 0..<1) < 0.2 ? colorRed : colorGreen

            pointsData.append([
                "value": Int(round(dataValue)), // 取整让数值更干净
                "color": pointColor
            ])
        }
        // 可选：根据 value 值对数据进行排序，产生一种趋势感
        // pointsData.sort { ($0["value"] as! Int) < ($1["value"] as! Int) }

        // --- 数据处理 (为每个系列准备数据) ---
        // column 数据: 每个点是一个柱子，高度为 value
        let columnData = pointsData.enumerated().map { (index, point) in
            [
                "x": index,
                "y": point["value"]!,
                "color": point["color"]!
            ]
        }

        // scatter 数据: 每个点是一个标记，位置在 value 处
        let scatterData = pointsData.enumerated().map { (index, point) in
            [
                "x": index,
                "y": point["value"]!,
                "color": point["color"]!
            ]
        }

        // --- Highcharts 图表配置 ---
        let aaOptions = AAOptions()
            .chart(AAChart()
                .backgroundColor("#f9f9f9") // 浅灰色背景
            )
            .title(AATitle()
                .text("自定义 AAInfographics 棒棒糖图")
            )
            .subtitle(AASubtitle()
                .text("使用 Column 和 Scatter 系列实现")
            )
            .legend(AALegend()
                .enabled(false) // 不显示图例
            )
            .credits(AACredits()
                .enabled(false) // 不显示 Highcharts logo
            )
            .tooltip(AATooltip()
                .enabled(true)
                .shared(true) // 共享 Tooltip，同时显示柱状和散点信息（虽然值一样）
                .useHTML(true)
                .headerFormat("索引: {point.key}<br/>") // 在 tooltip 头部显示 x 轴索引
                .pointFormat("") // 具体格式由 formatter 控制
                .backgroundColor("rgba(0, 0, 0, 0.75)") // Tooltip 外观样式
                .style(AAStyle()
                    .color("#F0F0F0")
                )
                .borderWidth(0)
                .shadow(false)
            )
            .xAxis(AAXAxis()
                .visible(false) // 隐藏 X 轴
                .minPadding(0.08) // 左右留白，防止标记贴边
                .maxPadding(0.08)
            )
            .yAxis(AAYAxis()
                .visible(false) // 隐藏 Y 轴
                .min(Double(baseline)) // !!! 关键：确保柱子从指定的基线开始绘制
            )
            .plotOptions(AAPlotOptions()
                .series(AASeries()
                    .borderWidth(0) // 无边框
                    .states(AAStates()
                        .hover(AAHover()
                            .enabled(false) // 禁用元素本身的鼠标悬浮高亮效果
                        )
                        .inactive(AAInactive()
                            .opacity(1) // 其他点在某个点悬浮时，不降低透明度
                        )
                    )
                )
                .column(AAColumn()
                    .pointPadding(0) // 同一 x 轴位置的点之间没有内边距
                    .groupPadding(0.1) // 不同 x 轴位置的点（柱子）之间的距离，调整这个值来控制棒棒糖间距
                    .grouping(false) // 不对系列进行分组
                    .pointWidth(stickWidth) // 设置“棒子”的宽度
                    .colorByPoint(true) // 让每个柱子根据其数据点的 color 属性着色
                )
                .scatter(AAScatter()
                    .marker(AAMarker()
                        .symbol(.circle) // 标记形状：圆形
                        .radius(markerRadius) // 标记半径
                        .lineWidth(markerLineWidth) // 标记边框宽度
                        .fillColor("white") // 标记填充色：白色
                        .lineColor(NSNull()) // !!! 关键：标记边框颜色，设置为 null 会继承数据点的 color 属性
                        .states(AAMarkerStates()
                            .hover(AAMarkerHover()
                                .enabled(false) // 禁用标记的鼠标悬浮效果
                            )
                        )
                    )
                )
            )
            .series([
                AASeriesElement()
                    .type(.column)
                    .name("棒子 (Stick)") // 系列名称
                    .data(columnData)
                    .keys(["x", "y", "color"]) // 告知 Highcharts 数据结构
                    .zIndex(1)
                ,
                AASeriesElement()
                    .type(.scatter)
                    .name("糖果 (Candy)") // 系列名称
                    .data(scatterData)
                    .keys(["x", "y", "color"]) // 告知 Highcharts 数据结构
                    .zIndex(2)
            ])

        return aaOptions
    }
    
    class func customInvertedLollipopChart() -> AAOptions {
        let aaOptions = customLollipopChart()
        aaOptions.chart?.inverted = true // 反转图表
        return aaOptions
    }
    
    class func polarThermometerChart() -> AAOptions {
        let aaOptions = customInvertedThermometerChart()
        aaOptions.title?.text = "极坐标系下的温度计图"
        
        aaOptions.chart?.margin(top: 0, right: 0, bottom: 0, left: 0) // 去除边距
        aaOptions.chart?.inverted = true // 反转图表
        aaOptions.chart?.polar = true // 极坐标图表
        return aaOptions
    }
    
    class func polarLollipopChart() -> AAOptions {
        let aaOptions = customInvertedLollipopChart()
        aaOptions.title?.text = "极坐标系下的棒棒糖图"
        
        aaOptions.chart?.margin(top: 0, right: 0, bottom: 0, left: 0) // 去除边距
        aaOptions.chart?.inverted = true // 反转图表
        aaOptions.chart?.polar = true // 极坐标图表
        return aaOptions
    }
}
