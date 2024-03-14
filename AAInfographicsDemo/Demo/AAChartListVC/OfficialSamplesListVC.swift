//
//  OfficialSamplesListVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/1/5.
//  Copyright © 2024 An An. All rights reserved.
//

import UIKit
import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class OfficialSamplesListVC: AABaseListVC {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "AAInfographics"
        
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

            //  case 0: return BarOrColumnChartOptionsComposer.basicBarChart()//基础柱状图
            //        case 1: return BarOrColumnChartOptionsComposer.stackingBarChart()//堆积柱状图
            //        case 2: return BarOrColumnChartOptionsComposer.populationPyramidChart()//人口金字塔图
            //        case 3: return BarOrColumnChartOptionsComposer.basicColumnChart()//基础条形图
            //        case 4: return BarOrColumnChartOptionsComposer.basicColumnChartWithNegativeValue()//带有负值的条形图
            //        case 5: return BarOrColumnChartOptionsComposer.basicColumnChartWithStackedDataLabels()//带有数据标签的堆积条形图
            //        case 6: return BarOrColumnChartOptionsComposer.basicColumnChartWithStackedDataLabels2()//带有数据标签的堆积条形图2
            //        case 7: return BarOrColumnChartOptionsComposer.percentStackedColumnChart()//百分比堆积条形图
            //        case 8: return BarOrColumnChartOptionsComposer.columnChartWithRotatedLabels()//带有旋转标签的条形图
            //        case 9: return BarOrColumnChartOptionsComposer.columnChartWithNestedColumn()//嵌套条形图
            //        case 10:return BarOrColumnChartOptionsComposer.columnRangeChart()//条形范围图
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

            //    case 0: return PieChartOptionsComposer.basicPieChart()//基本饼状图
            //        case 1: return PieChartOptionsComposer.basicPieChartWithLegend()//带有图例的基本饼状图
            //        case 2: return PieChartOptionsComposer.basicPieChartWithGradientColor()//带有渐变色的基本饼状图
            //        case 3: return PieChartOptionsComposer.basicPieChartWithGradientColor2()//带有渐变色的基本饼状图
            //        case 4: return PieChartOptionsComposer.basicPieChartWithMonochromeColor()//带有单色的基本饼状图
            //        case 5: return PieChartOptionsComposer.customPieChartTitlePosition()//自定义饼状图标题位置

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
}

@available(macCatalyst 13.1, *)
extension OfficialSamplesListVC {
    
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

