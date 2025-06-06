//
//  MultiXAxesChartComposer.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/6/6.
//  Copyright © 2025 An An. All rights reserved.
//
import AAInfographics // Ensure AAInfographics is imported

class MultiXAxesChartComposer {
    
    class func doubleXAxesChart() -> AAOptions {
        // 生成 48 小时的数据（两天，每小时一个点）
        let hours = Array(0..<48)
        let data = hours.map { Double(sin(Double($0) * Double.pi / 12)) } // 正弦函数生成模拟数据
        let hourLabels = hours.map { "\($0 % 24):00" }
        let dayLabels = hours.map { "Day \($0 / 24 + 1)" }
        
        return AAOptions()
            .chart(AAChart()
                .type(.area))
            .title(AATitle()
                .text("多行 X 轴 - 小时 & 日期（正弦函数，渐变填充）"))
            .xAxisArray([
                // 第一个 X 轴
                AAXAxis()
                    .categories(hourLabels)
                    .labels(AALabels()
                        .style(AAStyle()
                            .color(AAColor.red)
                            .fontWeight(.thin)))
                    .lineWidth(2)
                    .lineColor(AAColor.red),
                
                // 第二个 X 轴
                AAXAxis()
                    .categories(dayLabels)
                    .linkedTo(0)
                    .opposite(false)
                    .labels(AALabels()
                        .y(40)
                        .style(AAStyle()
                            .color(AAColor.green)
                            .fontWeight(.bold)
                            .textOverflow("none") // 禁用文本溢出省略号
                            .whiteSpace("nowrap")) // 防止换行
                        .formatter("""
                        function() {
                            const totalLength = \(dayLabels.count);
                            const fifthIndex = 4; 
                            const fifthFromLastIndex = totalLength - 5; 
                            
                            if (this.pos === fifthIndex || this.pos === fifthFromLastIndex) {
                                return this.value;
                            }
                            return '';
                        }
                        """)
                        .autoRotation(false) // 禁用自动旋转
                        .step(1) // 强制显示所有标签位置
                        .useHTML(true)) // 启用HTML渲染，更好控制样式
                    .lineWidth(2)
                    .lineColor(AAColor.green)
                    .tickInterval(1) // 强制设置刻度间隔
                    .min(0)
                    .max(Double(dayLabels.count - 1))
            ])
            .yAxis(AAYAxis()
                .title(AATitle()
                    .text("正弦值")))
            .series([
                AASeriesElement()
                    .name("正弦波")
                    .data(data)
                    .xAxis(0)
                    .fillColor(AAGradientColor.linearGradient(
                        direction: .toBottom,
                        stops: [
                            [0, "rgba(30, 144, 255, 0.8)"],
                            [1, "rgba(30, 144, 255, 0.1)"]
                        ]))
                    .fillOpacity(1)
            ])
    }
    
}
