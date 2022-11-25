//
//  OfficialChartVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2022/11/23.
//  Copyright © 2022 An An. All rights reserved.
//

import UIKit
import AAInfographics

class OfficialAreaChartVC: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func chartConfigurationWithSelectedIndex(_ selectedIndex: Int) -> Any? {
        switch selectedIndex {
        case 0: return AreaChartOptionsComposer.basicAreaChart()//基础面积图
        case 1: return AreaChartOptionsComposer.areaWithNegativeValuesChart()//带有负值的面积图
        case 2: return AreaChartOptionsComposer.stackedAreaChart()//堆积面积图
        case 3: return AreaChartOptionsComposer.percentStackedAreaChart()//百分比堆积面积图
        case 4: return AreaChartOptionsComposer.areaWithMissingPointsChart()//带有缺失点的面积图
        case 5: return AreaChartOptionsComposer.invertedAreaChart()//翻转面积图
        case 6: return AreaChartOptionsComposer.areasplineChart()//曲线面积图
        case 7: return AreaChartOptionsComposer.arearangeChart()//区域范围图
        case 8: return AreaChartOptionsComposer.arearangeAndLineChart()//区域范围图和折线图混合图
        default:
            return AAOptions()
        }
    }

}
