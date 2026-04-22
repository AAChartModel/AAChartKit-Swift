//
//  AAOptionsListVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/1/4.
//  Copyright © 2024 An An. All rights reserved.
//

import UIKit
import AAInfographics

@available(iOS 14.0, macCatalyst 14.0, *)
class AAOptionsListVC: AABaseListVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "AAOptions"
        
        sectionTitleArr = [
            "Draw Chart With AAOptions | 通过Options绘图",

            "LineChartOptions--- 通过 Options 绘制折线📈图",
            "AreaChartOptions--- 通过 Options 绘制折线填充图",
            "MultiYAxesChartOptionsVC---通过 Options 绘制多 Y 轴图",
            "ScatterChartOptionsVC---通过 Options 绘制散点图",
            "PieChartOptionsVC---通过 Options 绘饼图",
            "ColumnChartOptionsVC---通过 Options 绘制条形图",
            "MixedTypesChartOptionsVC---通过 Options 绘制混合图",
            "OfficialChartSample---官方图表📊示例",
        ]
        
        chartTypeTitleArr = [
            /*Draw Chart with AAOptions*/
            [
                "configureLegendStyle",
                "Custom Chart  Sample Two",
                "Custom Chart  Sample three",
                "Custom Chart  Sample 4",
                "customAreaChartYAxisLabelsAndGridLineStyle---自定义曲线填充图图的 Y 轴 的 Labels 和 网格线样式",
                "Adjust Y Axis Min value",
                "Mirror Chart",
                "Adjust The XAxis Labels",
                "Adjust GroupPadding Between Columns",
                "configureAAPlotBandsForChart || 值域颜色分割带🎀",
                "configureAAPlotLinesForChart || 值域颜色分割线🧶",
                "customAATooltipWithJSFuntion",
                "customXAxisCrosshairStyle",
                "configureXAxisLabelsFontColorWithHTMLString",
                "configureXAxisLabelsFontColorAndFontSizeWithHTMLString",
                "configure_DataLabels_XAXis_YAxis_Legend_Style",
                "configureXAxisPlotBand",
                "configureDoubleYAxisChartOptions",
                "configureTripleYAxesMixedChart || 三重 Y 轴混合图",
                "Double Y Axes And Column Line Mixed Chart || 双 Y 轴柱形曲线混合图",
                "Double Y Axes Market Depth Chart || 双 Y 轴市场深度图",
                "custom Area Chart Tooltip Style Like HTML Table || 自定义区域填充图浮动提示框为 HTML 表格样式",
                "custom Axes Grid Line Style || 自定义 X 轴和 Y 轴网格线の样式",
                "custom Radar Chart Style || 自定义雷达图样式",
                "customColumnrangeChartStyle---自定义柱形范围图样式",
                "self customXAxisLabelsBeImages---自定义曲线面积图 X 轴 labels 为一组图片🖼",
                "Triangle Radar Chart With PlotBands---带有颜色标志带の三角形雷达图",
                "Quadrangle Radar Chart With PlotBands---带有颜色标志带の四角形雷达图",
                "Pentagon Radar Chart With PlotBands---带有颜色标志带の五角形雷达图",
                "Hexagon Radar Char With PlotBands----带有颜色标志带の六角形雷达图",
                "Spider Web Radar Chart With PlotBands----带有颜色标志带の🕸蜘蛛网状雷达图",
                
                "configureComplicatedCustomAreasplineChart---复杂自定义曲线填充图 1",
                "configureComplicatedCustomAreasplineChart2---复杂自定义曲线填充图 2",
                "configureComplicatedCustomAreasplineChart3---复杂自定义曲线填充图 3",
                "yAxisOnTheRightSideChart---y轴在右侧的图表",
                "doubleLayerHalfPieChart---双层嵌套的玉阕图",
                "customAreasplineChartTooltipContentWithHeaderFormat---通过 tooltip 的 headerFormat 属性来自定义 曲线填充图的 tooltip",
                "customAreaChartTooltipStyleWithTotalValueHeader---浮动提示框 header 显示总值信息",
                "configureYAxisLabelsNumericSymbolsMagnitudeOfAerasplineChart---自定义 Y 轴的 Labels 国际单位符基数及国际单位符",
                "timeDataWithIrregularIntervalsChart---X 轴时间不连续的折线图",
                "logarithmicAxisLineChart---对数轴折线图📈",
                "logarithmicAxisScatterChart---对数轴散点图",
                
                "Disable Mixed Chart Inactive Animation Effect----禁用混合图表的 inactive 动画效果",
                "Adjust Bubble Chart Min And Max----调整气泡图的 min 和 max 相关属性",
                "customLineChartDataLabelsFormat---自定义曲线图的 DataLabels 的 format 属性",
                "customLineChartDataLabelsFormat2---自定义曲线图的 DataLabels 的 format 属性2(更简易方法)",
                "complicatedScatterChart---复杂的自定义散点图",
                "customColumnrangeChartGroupStyleAndSeriesStatesHoverColor---自定义柱形范围图的 group 样式和手指掠过图表 series 元素时的柱形颜色",
                "configureBoxplotChartWithSpecialStyle---自定义盒须图特殊样式",
                "configurePieChartWithSpecialStyleLegend---自定义饼图的 legend 为特殊样式",
                "disableAnimationForChart---禁用图表渲染动画"
            ],
           
            [
                "fancySplineChart---花式曲线图",
                "fancyLineChart---花式折线图",
                "fancySplineChartWithInnerBlankMarkerSymbol---",
                "fancyLineChartWithInnerBlankMarkerSymbol---",
                "fancySplineChartWithBorderBlankMarkerSymbol---",
                "fancyLineChartWithBorderBlankMarkerSymbol---",
            ],
            
            [
                "configureComplicatedCustomAreasplineChart---复杂自定义曲线填充图 1",
                "configureComplicatedCustomAreasplineChart2---复杂自定义曲线填充图 2",
                "configureComplicatedCustomAreasplineChart3---复杂自定义曲线填充图 3",
                "configureComplicatedCustomAreaChart---复杂自定义折线填充图 1",
                "configureComplicatedCustomAreaChart2---复杂自定义折线填充图 2",
                "configureComplicatedCustomAreaChart3---复杂自定义折线填充图 3",
                "configureComplicatedCustomStepAreaChart---复杂自定义阶梯折线填充图 1",
                "configureComplicatedCustomStepAreaChart2---复杂自定义阶梯折线填充图 2",
                "configureComplicatedCustomStepAreaChart3---复杂自定义阶梯折线填充图 3",
            ],
            
            [
                "doubleXAxesAndDoubleYAxesChart---",
                "disableGroupingBoxplotMixedScatterChart---",
            ],
            
            [
                "scatterChartWithJitter---",
                "boxPlotMixedScatterChartWithJitter---"
            ],
            
            [
                "pieDonutChart---",
            ],
            
            [
                "disableGroupingColumnChart---",
                "disableGroupingBarChart---"
            ],
            [
                "columnrangeAndScatterMixedTypesChart---柱形范围图和散点图混合类型图",
                "invertedColumnrangeAndScatterMixedTypesChart---倒置柱形范围图和散点图混合类型图",
            ],
            [
                "columnChart---",
            ],
        ]
        
        
        view.backgroundColor = .white
        
        setUpMainTableView()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
            
        case 0:
            /*Draw Chart With AAOptions Instance Object*/
            let vc = DrawChartWithAAOptionsVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            /*Line Chart Options*/
            let vc = LineChartOptionsVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 2:
            /*Area Chart Options*/
            let vc = AreaChartOptionsVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 3:
            /*Multi Y Axes Chart Options*/
            let vc = MultiYAxesChartOptionsVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)

        case 4:
            /*Scatter Chart Options*/
            let vc = ScatterChartOptionsVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 5:
            /*Pie Chart Options*/
            let vc = PieChartOptionsVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)

        case 6:
            /*Column Chart Options*/
            let vc = ColumnChartOptionsVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 7:
            /*Mixed Types Chart Options*/
//            let vc = MixedTypesChartOptionsVC()
//            vc.selectedIndex = indexPath.row
//            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
//            vc.hidesBottomBarWhenPushed = true
//            navigationController?.pushViewController(vc, animated: true)
            
            // Example: In your ChartListViewController or similar
            let vc = EmojiParticleAnimationVC()
            vc.title = "Emoji 粒子动画" // Set a title for the navigation bar
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 8:
            /*OfficialChartSampleVC*/
            if #available(macCatalyst 14.0, *) {
                if #available(iOS 14.0, *) {
                    let vc = OfficialChartSampleVC()
                    navigationController?.pushViewController(vc, animated: true)

                } else {
                    // Fallback on earlier versions
                }

            } else {
                // Fallback on earlier versions
            }
//            vc.selectedIndex = indexPath.row
//            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
//            vc.hidesBottomBarWhenPushed = true
//            navigationController?.pushViewController(vc, animated: true)
            
        default:
            break
        }
    }
}
