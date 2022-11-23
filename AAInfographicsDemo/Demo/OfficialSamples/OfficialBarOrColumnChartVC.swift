//
//  OfficialBarOrColumnChartVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2022/11/23.
//  Copyright © 2022 An An. All rights reserved.
//

import UIKit
import AAInfographics

class OfficialBarOrColumnChartVC: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func chartConfigurationWithSelectedIndex(_ selectedIndex: Int) -> Any? {
        switch selectedIndex {
        case 0: return BarOrColumnChartOptionsComposer.basicBarChart()//基础柱状图
        case 1: return BarOrColumnChartOptionsComposer.stackingBarChart()//堆积柱状图
        case 2: return BarOrColumnChartOptionsComposer.populationPyramidChart()//人口金字塔图
        case 3: return BarOrColumnChartOptionsComposer.basicColumnChart()//基础条形图
        case 4: return BarOrColumnChartOptionsComposer.basicColumnChartWithNegativeValue()//带有负值的条形图
        case 5: return BarOrColumnChartOptionsComposer.basicColumnChartWithStackedDataLabels()//带有数据标签的堆积条形图
        case 6: return BarOrColumnChartOptionsComposer.basicColumnChartWithStackedDataLabels2()//带有数据标签的堆积条形图2
        case 7: return BarOrColumnChartOptionsComposer.percentStackedColumnChart()//百分比堆积条形图
        case 8: return BarOrColumnChartOptionsComposer.columnChartWithRotatedLabels()//带有旋转标签的条形图
        case 9: return BarOrColumnChartOptionsComposer.columnChartWithNestedColumn()//嵌套条形图
        case 10:return BarOrColumnChartOptionsComposer.columnRangeChart()//条形范围图
        default:
            return AAOptions()
        }
    }

}
