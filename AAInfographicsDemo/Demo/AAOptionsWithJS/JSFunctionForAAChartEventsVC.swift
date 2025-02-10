//
//  JSFunctionForAAChartEventsVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/2/10.
//  Copyright © 2025 An An. All rights reserved.
//

import UIKit

class JSFunctionForAAChartEventsVC: AABaseChartVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func chartConfigurationWithSelectedIndex(_ selectedIndex: Int) -> Any? {
        switch (selectedIndex) {
        case 0: return JSFunctionForAAChartEventsComposer.setCrosshairAndTooltipToTheDefaultPositionAfterLoadingChart() //图表加载完成后,设置默认的十字准星和数据提示框的位置
        case 1: return JSFunctionForAAChartEventsComposer.generalDrawingChart() //自由绘图
        case 2: return JSFunctionForAAChartEventsComposer.advancedTimeLineChart() //高级时间线图
        case 3: return JSFunctionForAAChartEventsComposer.configureBlinkMarkerChart() //配置标记点闪烁特效
        case 4: return JSFunctionForAAChartEventsComposer.configureSpecialStyleMarkerOfSingleDataElementChartWithBlinkEffect() //配置单个数据元素的特殊样式标记点的闪烁特效
        case 5: return JSFunctionForAAChartEventsComposer.configureScatterChartWithBlinkEffect() //配置散点图的闪烁特效
        case 6: return JSFunctionForAAChartEventsComposer.automaticallyHideTooltipAfterItIsShown() //浮动提示框显示一段时间后,自动隐藏
        case 7: return JSFunctionForAAChartEventsComposer.dynamicHeightGridLineAreaChart() //动态高度网格线的区域填充图
        case 8: return JSFunctionForAAChartEventsComposer.customizeYAxisPlotLinesLabelBeSpecialStyle() //自定义 Y 轴轴线上面的标签文字特殊样式
        case 9: return JSFunctionForAAChartEventsComposer.configureECGStyleChart() //配置心电图样式的图表
        case 10: return JSFunctionForAAChartEventsComposer.configureTheSizeOfTheSliceOfDonutAndPieChart() //配置环形图和饼图的扇区大小
        case 11: return JSFunctionForAAChartEventsComposer.configurePlotBackgroundClickEvent() //配置绘图区的点击事件

        default: return nil
        }
    }
    
}
