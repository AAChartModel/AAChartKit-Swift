//
//  AAOptionsWithJSListVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/1/4.
//  Copyright © 2024 An An. All rights reserved.
//

import UIKit
import AAInfographics

@available(iOS 14.0, macCatalyst 14.0, *)
class AAOptionsWithJSListVC: AABaseListVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "AAOptionsWithJS"
        
        sectionTitleArr = [
            "JS Function For AATooltip 1 | 通过带有 JS 函数的自定义 AATooltip 浮动提示框 1",
            "JS Function For AATooltip 2 | 通过带有 JS 函数的自定义 AATooltip 浮动提示框 2",

         
            "JS Function For AAAxis Labels 1| 通过带有 JS 函数的自定义 AAAxis 的文字标签 1",
            "JS Function For AAAxis Labels 2| 通过带有 JS 函数的自定义 AAAxis 的文字标签 2",

            "JS Function For AALegend | 通过带有 JS 函数的自定义 AALegend",
            "JS Function For AAOptions---通过 JSFunction 自定义 AAOptions 内容",
            "JSFunctionForAAChartEventsVC---通过 JSFunction 自定义 AAChartEvents 的事件",
            "JSFunctionForAAChartEventsVC2---通过 JSFunction 自定义 AAChartEvents 的事件2",
            "JSFunctionBeforeAndAfterRenderingVC---在图表渲染前后添加 JS 函数",
        ]
        
        chartTypeTitleArr = [
            /*JS Function For AATooltip 1*/
            [
                "customAreaChartTooltipStyleWithSimpleFormatString---简单字符串拼接",
                "customAreaChartTooltipStyleWithDifferentUnitSuffix---自定义不同单位后缀",
                "customAreaChartTooltipStyleWithColorfulHtmlLabels---自定义多彩颜色文字",
                "customLineChartTooltipStyleWhenValueBeZeroDoNotShow---值为0时,在tooltip中不显示",
                "customBoxplotTooltipContent---自定义箱线图の浮动提示框头部内容",
                "customStackedAndGroupedColumnChartTooltip---自定义分组堆积柱状图tooltip内容",
                "custom Arearange Chart Tooltip---自定义面积范围图浮动提示框",
                "customLineChartOriginalPointPositionByConfiguringXAxisFormatterAndTooltipFormatter---调整折线图の X 轴左边距",
                "customTooltipWhichDataSourceComeFromOutSideRatherThanSeries---通过来自外部の数据源来自定义 tooltip (而非常规の来自图表の series)",
                "customAreasplineChartTooltipStyleByDivWithCSS---通过自定义 div 的 css 样式来自定义复杂效果的 tooltip 浮动提示框",
            ],
            /*JS Function For AATooltip 2*/
            [
                "customColumnChartBorderStyleAndStatesHoverColor---自定义📊柱状图的 border 样式和手指或鼠标 hover 时的显示效果",
                "customTooltipPositionerFunction---自定义浮动提示框 Positioner 函数",
                "fixedTooltipPositionByCustomPositionerFunction---通过 Positioner 函数来实现一个位置固定的提示框",
                "customPlotAreaOutsideComplicatedTooltipStyle---通过 Positioner 函数来实现绘图区外的复杂浮动提示框样式",
                "makePieChartShow0Data---使饼图显示为 0 的数据",
                "customizeTooltipShapeAndShadowBeSpecialStyle---自定义浮动提示框的形状和阴影样式",
                "formatTimeInfoForTooltip---浮动提示框 tooltip 时间信息格式化显示",
                "doublePointsSplineChart---双点之间的曲线"
            ],
            
            /*JS Function For AAAXis Labels 1*/
            [
                "customYAxisLabels---自定义Y轴文字",
                "customYAxisLabels2---自定义Y轴文字2",
                "customAreaChartXAxisLabelsTextUnitSuffix1---自定义X轴文字单位后缀(通过 formatter 函数)",
                "customAreaChartXAxisLabelsTextUnitSuffix2---自定义X轴文字单位后缀(不通过 formatter 函数)",
                "configureTheAxesLabelsFormattersOfDoubleYAxesChart---配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数 示例 1",
                "configureTheAxesLabelsFormattersOfDoubleYAxesChart2---配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数 示例 2",
                "configureTheAxesLabelsFormattersOfDoubleYAxesChart3---配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数 示例 3",
                "customColumnChartXAxisLabelsTextByInterceptTheFirstFourCharacters---通过截取前四个字符来自定义 X 轴 labels",
                "customSpiderChartStyle---自定义蜘蛛🕷🕸图样式",
                "customizeEveryDataLabelSinglelyByDataLabelsFormatter---通过 DataLabels 的 formatter 函数来实现单个数据标签🏷自定义",
                "customXAxisLabelsBeImages---自定义 X轴 labels 为一组图片",
            ],
            /*JS Function For AAAXis Labels 2*/
            [
                "customWidthForXAxisLabels---自定义 X 轴文字标签的宽度",
                "customSimpleXAxisLabelsBeImages---自定义简单的X轴文字标签为图片"
            ],
            
            /*JS Function For AALegend*/
            [
                "disableLegendClickEventForNormalChart---禁用常规图表 legend 点击事件",
                "disableLegendClickEventForPieChart---禁用饼图 legend 点击事件",
                "customLegendItemClickEvent---自定义图例 legend 的点击事件",
            ],
            /*JS Function For AAOptions*/
            [
                "customDoubleXAxesChart---自定义双 X 轴图表",
                "disableColumnChartUnselectEventEffectBySeriesPointEventClickFunction---通过 Series 的 Point 的选中事件函数来禁用条形图反选效果",
                "customizeEveryDataLabelSinglelyByDataLabelsFormatter---通过 formatter 来自定义单个 dataLabels 元素",
                "configureColorfulDataLabelsForPieChart---为饼图配置多彩 dataLabels"
            ],
            /*JSFunctionForAAChartEventsVC*/
            [
                "setCrosshairAndTooltipToTheDefaultPositionAfterLoadingChart---图表加载完成后设置 crosshair 和 tooltip 到默认位置",
                "generalDrawingChart---普通绘图",
                "advancedTimeLineChart---高级时间轴绘图",
                "configureBlinkMarkerChart---配置闪烁特效的 marker 图表",
                "configureSpecialStyleMarkerOfSingleDataElementChartWithBlinkEffect---配置闪烁特效的 marker 图表2",
                "addEventForLabelClick---为 X 轴文字标签添加点击事件",
                "automaticallyHideTooltipAfterItIsShown---在浮动提示框显示后自动隐藏",
                "dynamicHeightGridLineAreaChart---动态高度的网格线区域填充图",
                "customizeYAxisPlotLinesLabelBeSpecialStyle---自定义 Y 轴轴线上面的标签文字特殊样式",
                "configureECGStyleChart---配置心电图样式的图表",
                "configureTheSizeOfTheSliceOfDonutAndPieChart---配置环形图和饼图的扇区大小",
                "configurePlotBackgroundClickEvent---配置绘图区的点击事件",
            ],
            /*JJSFunctionForAAChartEventsVC2*/
            [
                "disableHoverEventTooltipEffect---禁用折线图的 hover 事件的 tooltip 效果",
                "addClickEventToXAxisLabelAndAccessData---给 X 轴标签添加点击事件并获取数据",
                "defaultSelectedAPointForLineChart---折线图默认选中一个点",
                "configureBlinkMarkerChart---配置闪烁特效的 marker 图表",
                "toggleDataLabelsOnTouch---点击后切换数据标签显示",
                "autoCrosshairAndTooltip---自动十字准星与 tooltip",
                "simpleZoomingChart---简单放大缩小图表",
                "simpleZoomingChart2---简单放大缩小图表2",
            ],
            /*JSFunctionBeforeAndAfterRenderingVC*/
            [
                "clockChart",
                "synchronizedChart",
                "sparklineChart",
                "customXAxisLabelsWithBase64ImageChart",
                "customXAxisLabelsWithBase64ImageChart2",
            ]

        ]
        
        
        view.backgroundColor = .white
        
        setUpMainTableView()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
     
        case 0:
            /*Custom Tooltip With JavaScript Formatter Function */
            let vc = JSFunctionForAATooltipVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            /*Custom Tooltip With JavaScript Formatter Function */
            let vc = JSFunctionForAATooltipVC2()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)

        case 2:
            /*JS Function For AAAxis Labels*/
            let vc = JSFunctionForAAAxisVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 3:
            /*JS Function For AAAxis Labels 2*/
            let vc = JSFunctionForAAAxisVC2()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 4:
            /*JS Function For AALegend*/
            let vc = JSFunctionForAALegendVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 5:
            /*JS Function For AAOptions*/
            let vc = JSFunctionForAAOptionsVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 6:
            /*JS Function For AAChartEventsVC*/
            let vc = JSFunctionForAAChartEventsVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 7:
            /*JS Function For AAChartEventsVC2*/
            let vc = JSFunctionForAAChartEventsVC2()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)

            
        case 8:
            /*JSFunctionBeforeAndAfterRenderingVC*/
            let vc = JSFunctionBeforeAndAfterRenderingVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        
        default:
            break
        }
    }
    
}
