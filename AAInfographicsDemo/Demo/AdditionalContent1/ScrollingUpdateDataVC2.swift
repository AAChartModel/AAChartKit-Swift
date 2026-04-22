//
//  ScrollingUpdateDataVC2.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/8/1.
//  Copyright © 2025 An An. All rights reserved.
//

import UIKit
import AAInfographics

class XAxis: AAObject {
    var max: Any? // 使用 Any? 允许传入 NSNull() 或 Double 值
}

class ScrollingUpdateDataVC2: AABaseChartVC {
    public var step: Bool?

    // 记录 data 数组中的元素个数
    private var dataCount: Int = 0
    // data 数组中的元素最多能同时显示的数量
    private let maxDataCount: Int = 20
    // 用于判断是否已经达到最多能同时显示的数量
    private var isDataFull: Bool = false

    private var timer: Timer?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupChartView()
        setupRefreshingChartTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        timer?.invalidate()
        timer = nil
    }
    
    private func setupChartView() {
        let elements = getChartElement()

        let chartModel = AAChartModel()
            .chartType(.areaspline)
            .legendEnabled(false) // 是否启用图表的图例(图表底部的可点击的小圆点)
            .zoomType(.none) // 是否允许缩放
            .xAxisLabelsEnabled(true) // x 轴是否显示数据
            .xAxisGridLineWidth(0) // x 轴网格线的宽度
            .xAxisVisible(true) // x 轴是否显示
            .yAxisVisible(true) // y 轴是否显示
            .yAxisAllowDecimals(false) // y 轴是否允许小数
            .yAxisGridLineWidth(1) // y 轴网格线的宽度
            .dataLabelsEnabled(false) // 是否显示数据标签
            .markerRadius(0) // 不显示点
            .tooltipEnabled(true) // 是否显示浮动提示框(默认显示)
            .backgroundColor("#00000000")
            .legendEnabled(false) // 是否显示图例
            .animationType(.linear)
            .animationDuration(1000)
            .yAxisMin(0)
            .yAxisMax(200)
            .series(elements)

        let aaOptions = chartModel.aa_toAAOptions()
        
        aaOptions.yAxis?
            .gridLineColor(AAColor.lightGray)
            .gridLineWidth(1)
            .gridLineDashStyle(.longDashDotDot)
            .labels?.style(AAStyle()
                .color(AAColor.gray)
                .fontSize(10))
        
        //解开注释则可以测试详细自定义 dataLabels 和 marker 的样式
        /*
        aaOptions.plotOptions?.series?
            .dataLabels(AADataLabels()
                .enabled(true)
                .style(AAStyle()
                    .color(AAColor.white)
                    .fontSize(10)
                    .fontWeight(.thin))
                .format("{y:.2f}元"))
            .marker(AAMarker()
                .radius(5)
                .symbol((AAChartSymbolType.circle.rawValue))
                .fillColor(AAColor.black)
                .lineWidth(1)
                .lineColor(AAColor.red))
        */
        
        aaOptions.xAxis?.max(Double(maxDataCount)) // 设置 x 轴的最大值为 maxDataCount

        aaChartView?.aa_drawChartWithChartOptions(aaOptions)
    }
    
    private func setupRefreshingChartTimer() {
        // 设置定时器，延迟一秒后开始每秒添加一个数据点
        print("⏱️ 设置定时器，每秒添加一个数据点")
        let time: TimeInterval = 1.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0,
                                              target: self,
                                              selector: #selector(self.addPointToChartSeriesElement),
                                              userInfo: nil,
                                              repeats: true)
            self.timer?.fire()
        }
    }

    @objc private func addPointToChartSeriesElement() {
        print("📊 添加新数据点并刷新图表")
        // 1. 生成新数据点
        let randomY = Float.random(in: (0 + 5) ... (200 - 5))
        let radomYDataElement = AADataElement()
            .y(randomY)
        
        
        // 2. 根据数据是否已满，决定是否在添加新点时移除旧点
        if dataCount == maxDataCount {
            let customXAxis = XAxis()
            customXAxis.max = NSNull() // 设置 x 轴的最大值为自动计算
            
            aaChartView?.aa_updateChart(options: customXAxis, redraw: false)
            isDataFull = true
        }
        

        // 3. 调用“添加并滚动”的专用方法来更新图表
        aaChartView?.aa_addPointToChartSeriesElement(
            elementIndex: 0,
            options: radomYDataElement,
            redraw: true,
            shift: isDataFull, // 关键：仅在数据满时才滚动
            animation: true
        )
        print("🟢 当前数据点数量: \(dataCount)")

        // 4. 更新数据计数
        dataCount = dataCount + 1
    }

    private func getChartElement() -> [AASeriesElement] {
        let gradientColor = AAGradientColor.linearGradient(
            direction: .toBottom,
            startColor: "#16D998fD",
            endColor: "#17E5A100"
        )
        
        let pointElement = AASeriesElement()
            .data([]) // 初始数据为空
            .color("#16D998")
            .fillColor(gradientColor)
            .lineWidth(4)
            .fillOpacity(1)

        return [pointElement]
    }

}
