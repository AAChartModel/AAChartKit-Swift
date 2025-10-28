//
//  ChartModelSampleListVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/10/28.
//  Copyright © 2025 An An. All rights reserved.
//

import UIKit
import AAInfographics


@available(macCatalyst 14.0, *)
class ChartModelSampleListVC: AABaseListVC {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ChartModelSampleListVC"
        
        sectionTitleArr = [
            "CustomStyleChartModelSample---自定义风格图表示例",
        ]
        
        chartTypeTitleArr = [
  
            /*Official Samples For Area Chart*/
            [
//                "Basic Type Chart | 基础类型图表",

                "Special Type Chart | 特殊类型图表",
//                "Custom Style Chart| 一些自定义风格样式图表",
                "Mixed Chart | 混合图形",
                "Mixed Chart2 | 混合图形2",
                "Pie Chart With Custom Style | 一些自定义风格样式饼图",
                "Column Chart With Custom Style | 一些自定义风格样式柱状图",
                "Bar Chart With Custom Style | 一些自定义风格样式条形图",
                "Line Chart With Custom Style | 一些自定义风格样式折线图",
                "Spine Chart With Custom Style | 一些自定义风格样式曲线图",
                "Area Chart With Custom Style | 一些自定义风格样式折线填充图",
                "Areaspline Chart With Custom Style | 一些自定义风格样式曲线填充图",
                "Scatter Chart With Custom Style | 一些自定义风格样式散点图",
                "Bubble Chart With Custom Style | 一些自定义风格样式气泡图",
                "Line Chart With Custom Style2 | 一些自定义风格样式折线图2",
            ],



        ]
        
        
        view.backgroundColor = .white
        
        setUpMainTableView()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chartModels: [AAChartModel]
        
        switch indexPath.row {
        case 0:
            chartModels = CustomStyleChartModelProvider.specialChartItems()
        case 1:
            chartModels = CustomStyleChartModelProvider.mixedChartItems()
        case 2:
            chartModels = CustomStyleChartModelProvider.mixedChart2Items()
        case 3:
            chartModels = CustomStyleChartModelProvider.customStyleForColumnChartItems()
        default:
            return
        }
        
        showChartSample(with: chartModels)
    }
    
    // MARK: - Private Methods
    
    private func showChartSample(with chartModels: [AAChartModel]) {
        let vc = OfficialChartSampleVC()
        vc.optionsItems = chartModels.map { $0.aa_toAAOptions() }
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

