//
//  OfficialPieChartVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2022/11/25.
//  Copyright © 2022 An An. All rights reserved.
//

import UIKit
import AAInfographics

class OfficialPieChartVC: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    override func chartConfigurationWithSelectedIndex(_ selectedIndex: Int) -> Any? {
        switch selectedIndex {
        case 0: return PieChartOptionsComposer.basicPieChart()//基本饼状图
        case 1: return PieChartOptionsComposer.basicPieChartWithLegend()//带有图例的基本饼状图
        case 2: return PieChartOptionsComposer.basicPieChartWithGradientColor()//带有渐变色的基本饼状图
        case 3: return PieChartOptionsComposer.basicPieChartWithGradientColor2()//带有渐变色的基本饼状图
        case 4: return PieChartOptionsComposer.basicPieChartWithMonochromeColor()//带有单色的基本饼状图
        case 5: return PieChartOptionsComposer.customPieChartTitlePosition()//自定义饼状图标题位置

        default:
            return AAOptions()
        }
    }
    
}
