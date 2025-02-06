//
//  AdvancedFeaturesListVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/1/5.
//  Copyright © 2024 An An. All rights reserved.
//

import UIKit
import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class AdvancedFeaturesListVC: AABaseListVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Advanced Features"
        
        sectionTitleArr = [
            "Only Refresh data | 单纯刷新数据",
            "Double Chart View | 同时显示多个图表",
            "Rendering Animation types | 渲染动画示例",
            "Hide Or Show Chart Series | 隐藏或显示内容",
            "Evaluate JS String Function | 执行js函数",
            "Scrolling update chart data | 滚动刷新图表数据",
            "Scrollable chart | 可滚动の图表",
            //                  "Scrollable chart |可滚动の图表",
            "Data Sorting Chart With Animation| 图表动态排序",
            "Chart Options Advanced Updating | 图表高级更新",
            "XIB AAChartView | 在 XIB 中创建 AAChartView",
            "Custom Chart Event Callback | 自定义交互事件回调",
            //排序算法演示
            "Sort Algorithm Demo | 排序算法演示",
        ]
        
        chartTypeTitleArr = [
            /*Only update chart data*/
            [  "Column Chart---柱形图",
               "Bar Chart---条形图",
               "Area Chart---折线填充图",
               "Areaspline Chart---曲线填充图",
               "Step Area Chart---直方折线填充图",
               "Step Line Chart---直方折线图",
               "Line Chart---折线图",
               "Spline Chart---曲线图",
               "Scatter Chart---散点图",
            ],
            /*Show double chart as the same time*/
            [
                "在同一个页面同时添加多个 AAChartView",
                "Double Charts Linkedwork 双表联动(没有刷新动画)",
                "Double Charts Linkedwork 双表联动(有刷新动画)",
                "Quadra Charts Linkedwork---四表联动(多个 AAChartView)",
                "Quadra Charts Linkedwork2---四表联动2(单个 AAChartView, 多个 div)",
            ],
            /*Animation types*/
            [  "Column Chart---柱形图",
               "Bar Chart---条形图",
               "Area Chart---折线填充图",
               "Areaspline Chart---曲线填充图",
               "Step Area Chart---直方折线填充图",
               "Step Line Chart---直方折线图",
               "Line Chart---折线图",
               "Spline Chart---曲线图",
            ],
            /*Hide or show the chart series element*/
            [  "Column Chart---柱形图",
               "Bar Chart---条形图",
               "Area Chart---折线填充图",
               "Areaspline Chart---曲线填充图",
               "Step Area Chart---直方折线填充图",
               "Step Line Chart---直方折线图",
               "Line Chart---折线图",
               "Spline Chart---曲线图",
            ],
            /*Evaluate JavaScript function string*/
            [
                "Custom Chart DataLabel Sample One",
                "Custom Chart DataLabel Sample Two",
                "Custom Chart StackLabel Sample ",
                "Support Dragging Chart On X Axis",
            ],
            /*Scrolling update chart data*/
            [  "Column Chart---柱形图",
               "Bar Chart---条形图",
               "Area Chart---折线填充图",
               "Areaspline Chart---曲线填充图",
               "Step Area Chart---直方折线填充图",
               "Step Line Chart---直方折线图",
               "Line Chart---折线图",
               "Spline Chart---曲线图",
               "Scatter Chart---散点图",
            ],
            /*Scrollable  chart */
            [  "Column Chart---柱形图",
               "Bar Chart---条形图",
               "Area Chart---折线填充图",
               "Areaspline Chart---曲线填充图",
               "Step Area Chart---直方折线填充图",
               "Step Line Chart---直方折线图",
               "Line Chart---折线图",
               "Spline Chart---曲线图",
               "Scatter Chart---散点图",
            ],
            /*Data Sorting With Animation Charts*/
            [  "Column Chart---柱形图",
               "Bar Chart---条形图",
               "Scatter Chart---散点图",
               "Polar Column Chart---极化柱形图",
               "Polar Bar Chart---极化条形图",
               "Polar Scatter Chart---极化散点图",
            ],
            /*Advanced Updating Feature*/
            [
                "Column Chart---柱形图",
                "Bar Chart---条形图",
                "Area Chart---折线填充图",
                "Areaspline Chart---曲线填充图",
                "Step Area Chart---直方折线填充图",
                "Step Line Chart---直方折线图",
                "Line Chart---折线图",
                "Spline Chart---曲线图",
            ],
            /*XIB AAChartView*/
            [
                "XIB AAChartView---在 XIB 中创建 AAChartView"
            ],
            /*Custom event callback*/
            [
                "CustomTouchEndEventCallbackVC---自定义监听触摸结束事件回调",
                
                "CustomXAxisLabelsClickEventCallbackVC---自定义X轴文字点击事件回调",
                
                "CustomTooltipEventCallbackVC---自定义tooltip事件回调",
                
                "CustomTooltipIsHiddenEventCallbackVC---自定义 tooltip 点击事件",
                
                "CustomLargeDateSeriesClickEventCallbackVC---自定义大数据量的 series 点击事件",
            ],
            /*Sort Algorithm Demo*/
            [
                //冒泡🫧排序
                "Bubble Sort---冒泡🫧排序"
            ],
        ]
        
        chartTypeArr = [
            /*Only update chart data*/
            [
                AAChartType.column,
                AAChartType.bar,
                AAChartType.area,
                AAChartType.areaspline,
                AAChartType.area,
                AAChartType.line,
                AAChartType.line,
                AAChartType.spline,
                AAChartType.scatter
            ],
            /*Show Many Charts In the Same View*/
            [//Empty Array,just for holding place
            ],
            /*Chart Rendering Animation Types*/
            [
                AAChartType.column,
                AAChartType.bar,
                AAChartType.area,
                AAChartType.areaspline,
                AAChartType.area,
                AAChartType.line,
                AAChartType.line,
                AAChartType.spline,
            ],
            /*Hide Or Show Chart Series Element*/
            [
                AAChartType.column,
                AAChartType.bar,
                AAChartType.area,
                AAChartType.areaspline,
                AAChartType.area,
                AAChartType.line,
                AAChartType.line,
                AAChartType.spline,
            ],
            /*Evaluate JavaScript String Function*/
            [//Empty Array,just for holding place
            ],
            /*Scrolling update chart data*/
            [
                AAChartType.column,
                AAChartType.bar,
                AAChartType.area,
                AAChartType.areaspline,
                AAChartType.area,
                AAChartType.line,
                AAChartType.line,
                AAChartType.spline,
                AAChartType.scatter
            ],
            /*Scrollable chart*/
            [
                AAChartType.column,
                AAChartType.bar,
                AAChartType.area,
                AAChartType.areaspline,
                AAChartType.area,
                AAChartType.line,
                AAChartType.line,
                AAChartType.spline,
                AAChartType.scatter
            ],
            /*Data Sorting With Animation Charts*/
            [
                AAChartType.column,
                AAChartType.bar,
                AAChartType.scatter,
                AAChartType.column,
                AAChartType.bar,
                AAChartType.scatter,
            ],
            /*Advanced Updating Feature*/
            [
                AAChartType.column,
                AAChartType.bar,
                AAChartType.area,
                AAChartType.areaspline,
                AAChartType.area,
                AAChartType.line,
                AAChartType.line,
                AAChartType.spline,
            ],
        ]
        
        
        view.backgroundColor = .white
        
        setUpMainTableView()
    }
}

@available(macCatalyst 13.1, *)
extension AdvancedFeaturesListVC {
    
    fileprivate func customEventCallback(_ indexPath: IndexPath) {
        /*Custom Event Callback*/
        switch indexPath.row {
        case 0:
            let vc = CustomTouchEndEventCallbackVC()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = CustomXAxisLabelsClickEventCallbackVC()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = CustomTooltipEventCallbackVC()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = CustomTooltipClickEventCallbackVC()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = CustomLargeDateSeriesClickEventCallbackVC()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        default: break
        }
    }
    
    fileprivate func showManyChartsInSameView(_ indexPath: IndexPath) {
        /*Show Many Charts In the Same View*/
        switch indexPath.row {
        case 0:
            let vc = ShowManyChartViewVC()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = DoubleChartsLinkedWorkVC()
            vc.isRefreshAnimation = false
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = DoubleChartsLinkedWorkVC()
            vc.isRefreshAnimation = true
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = TripleChartsLinkedWorkVC()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
//        case 4:
//            let vc = TripleChartsLinkedWorkVC2()
//            vc.hidesBottomBarWhenPushed = true
//            navigationController?.pushViewController(vc, animated: true)
            // ChartListVC *vc = ChartListVC.new;
//            vc.hidesBottomBarWhenPushed = YES;
//            [self.navigationController pushViewController:vc animated:YES];
        case 4:
            let vc = ChartListVC()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        default: break
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
            
        case 0:
            /*Only Refresh Chart Data Dynamiclly*/
            let vc = OnlyRefreshChartDataVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            vc.step = false
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            showManyChartsInSameView(indexPath)
            
        case 2:
            /*Chart Rendering Animation Types*/
            let vc = AnimationTypeVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            vc.step = false
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 3:
            /*Hide Or Show Chart Series Element*/
            let vc = HideOrShowChartSeriesVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            vc.step = false
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 4:
            /*Evaluate JavaScript String Function*/
            let vc = EvaluateJSStringFunctionVC()
            vc.sampleChartTypeIndex = indexPath.row
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
         
        case 5:
            /*Scrolling update Chart Data Dynamiclly*/
            let vc = ScrollingUpdateDataVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            vc.step = false
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 6:
            /*Scrollable Charts*/
            let vc = ScrollableChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 7:
            /*Data Sorting With Animation Charts*/
            let vc = DataSortingWithAnimationChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            if indexPath.row >= 3 {
                vc.polar = true
            }
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 8:
            /*Advanced Updating Feature*/
            let vc = AdvancedUpdatingFeatureVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 9:
            /*Test AAChartView For Xib VC*/
            let vc = TestAAChartViewForXibVC()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 10:
            customEventCallback(indexPath)
            
        case 11:
            let vc = SortAlgorithmVC()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        default:
            break
        }
    }
    
}

