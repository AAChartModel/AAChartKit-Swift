//
//  OfficialSamplesListVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/1/5.
//  Copyright © 2024 An An. All rights reserved.
//

import UIKit
import AAInfographics

@available(iOS 14.0, macCatalyst 14.0, *)
class OfficialSamplesListVC: AABaseListVC {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Offical Samples"
        
        sectionTitleArr = [
            "Official Samples For Area Chart---折线📈填充图官方示例",
            "Official Samples For Bar or Column Chart---条形图或柱状图📊官方示例",
            "Official Samples For Pie Chart---饼图🍕官方示例",
        ]
        
        chartTypeTitleArr = [
  
            /*Official Samples For Area Chart*/
            [
                "basicAreaChart---基础面积图",
                "areaWithNegativeValuesChart---带有负值的面积图",
                "stackedAreaChart---堆积面积图",
                "percentStackedAreaChart---百分比堆积面积图",
                "areaWithMissingPointsChart---带有缺失点的面积图",
                "invertedAreaChart---翻转面积图",
                "areasplineChart---曲线面积图",
                "arearangeChart---区域范围图",
                "arearangeAndLineChart---区域范围图和折线图混合图",
            ],

            [
                "basicBarChart---基础柱状图",
                "stackingBarChart---堆积柱状图",
                "populationPyramidChart---人口金字塔图",
                "basicColumnChart---基础条形图",
                "basicColumnChartWithNegativeValue---带有负值的条形图",
                "basicColumnChartWithStackedDataLabels---带有数据标签的堆积条形图",
                "basicColumnChartWithStackedDataLabels2---带有数据标签的堆积条形图2",
                "percentStackedColumnChart---百分比堆积条形图",
                "columnChartWithRotatedLabels---带有旋转标签的条形图",
                "columnChartWithNestedColumn---嵌套条形图",
                "columnRangeChart---条形范围图",
            ],

            [
                "basicPieChart---基本饼状图",
                "basicPieChartWithLegend---带有图例的基本饼状图",
                "basicPieChartWithGradientColor---带有渐变色的基本饼状图",
                "basicPieChartWithGradientColor2---带有渐变色的基本饼状图",
                "basicPieChartWithMonochromeColor---带有单色的基本饼状图",
                "customPieChartTitlePosition---自定义饼状图标题位置",
            ],


        ]
        
        
        view.backgroundColor = .white
        
        setUpMainTableView()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
            
        case 0:
            /*Official Samples For Area Chart*/
            let vc = OfficialAreaChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            /*Official Samples For Bar or Column Chart*/
            let vc = OfficialBarOrColumnChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)

        case 2:
            /*Official Samples For Pie Chart*/
            let vc = OfficialPieChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
              
        default:
            break
        }
    }
    
}

