//
//  SortAlgorithmVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/2/5.
//  Copyright © 2025 An An. All rights reserved.
//

import AAInfographics
import UIKit

@available(iOS 10.0, macCatalyst 13.1, *)
class SortAlgorithmVC: UIViewController {
    
    var chartView: AAChartView!
//    var numbers = [5, 2, 9, 3, 7, 1, 4, 15, 18, 25, 1, 50]
    //随机生成 100 个 100 以内的数值
    var numbers = (0..<200).map { _ in Int.random(in: 0...100) }
    var chartSeries = [AASeriesElement]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChart()
        
        //首次开始动画前, 延迟 1 秒钟
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.bubbleSortAndUpdateChart()
        }
        
    }
    
    func setupChart() {
        chartView = AAChartView()
        chartView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.size.height)
        self.view.addSubview(chartView)
        
        // 初始化图表
        drawChartData()
    }
    
    func bubbleSortAndUpdateChart() {
        performBubbleSortStep(currentPass: 0)
    }
    
    func performBubbleSortStep(currentPass: Int) {
        guard currentPass < numbers.count - 1 else {
            print("排序完成!")
            return
        }
        
        var swapped = false
        
        // 执行一次冒泡排序遍历
        for j in 0..<numbers.count - currentPass - 1 {
            if numbers[j] > numbers[j + 1] {
                numbers.swapAt(j, j + 1)
                swapped = true
            }
        }
        
        // 更新图表
        updateChartData()
        
        // 延迟后继续下一轮排序
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { [weak self] in
            guard let self = self else { return }
            self.performBubbleSortStep(currentPass: currentPass + 1)
        }
        
        // 如果没有发生交换，说明已经排序完成
        if !swapped {
            print("提前完成排序!")
            return
        }
    }
    
    func drawChartData() {
        let aaChartModel = AAChartModel()
            .chartType(.column)
            .title("冒泡排序可视化")
            .subtitle("数值变化过程")
            .categories(Array(0..<numbers.count).map { "位置\($0)" })
            .yAxisGridLineWidth(0)
            .dataLabelsEnabled(true)  // 启用数据标签
            .animationDuration(800)  // 设置动画时长
            .series([
                AASeriesElement()
                    .name("数值")
                    .data(numbers.map {
                        AADataElement()
                            .y(Float($0))
                            .color(generateColor(value: $0)) // 根据数值生成颜色
                    })
            ])
        
        chartView.aa_drawChartWithChartModel(aaChartModel)
    }

    // 添加一个根据数值生成颜色的辅助函数
    private func generateColor(value: Int) -> String {
        let max = numbers.max() ?? 1
        let hue = CGFloat(value) / CGFloat(max)
        let color = UIColor(hue: hue, saturation: 0.8, brightness: 0.8, alpha: 1.0)
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return String(format: "#%02X%02X%02X",
            Int(red * 255),
            Int(green * 255),
            Int(blue * 255)
        )
    }

    func updateChartData() {
        let seriesElement = AASeriesElement()
            .name("数值")
            .data(numbers.map {
                AADataElement()
                    .y(Float($0))
                    .color(generateColor(value: $0))
            })
        
        chartView.aa_onlyRefreshTheChartDataWithChartModelSeries(
            [seriesElement],
            animation: false)
        print("当前数组排序状态: \(numbers)")
    }
}

