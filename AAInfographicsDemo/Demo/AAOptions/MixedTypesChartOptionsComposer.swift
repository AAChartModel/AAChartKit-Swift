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
}
