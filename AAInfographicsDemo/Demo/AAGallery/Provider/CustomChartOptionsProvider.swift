//
//  CustomChartOptionsProvider.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/10/28.
//  Copyright © 2025 An An. All rights reserved.
//

import AAInfographics

class CustomChartOptionsProvider: NSObject {
    static func aaOptionsItems() -> [AAOptions] {
        var originalItems = [AAOptions]()
        
        // XAxisYAxisTypeOptionsComposer
        originalItems += xAxisYAxisTypeOptionsItems()
        
        // MixedTypesChartOptionsComposer
        originalItems += mixedTypesChartOptionsItems()
        
        // BubbleLegendChartOptionsComposer
        originalItems += bubbleLegendChartOptionsItems()
        
        // BubbleChartOptionsComposer
        originalItems += bubbleChartOptionsItems()
        
        // AreaChartOptionsVC
        originalItems += areaChartOptionsItems()
        
        // LineChartOptionsVC
        originalItems += lineChartOptionsItems()
        
        // PolarChartOptionsVC
        originalItems += polarChartOptionsItems()
        
        // ColumnChartOptionsVC
        originalItems += columnChartOptionsItems()
        
        // ScatterChartOptionsVC
        originalItems += scatterChartOptionsItems()
        
        // PieChartOptionsVC
        originalItems += pieChartOptionsItems()
        
        // MultiYAxesChartOptionsVC
        originalItems += multiYAxesChartOptionsItems()
        
        // DrawChartWithAAOptionsVC
        originalItems += drawChartWithAAOptionsItems()
        
        //遍历 originalItems 数组,将其中的每个 AAChartModel 实例转化为 AAOptions 实例
        let finalItems = originalItems.map { (aaOptions) -> AAOptions in
            let aaOptions = aaOptions
//            aaOptions.chart?.polar(true)
            return aaOptions
        }
        
        return finalItems
    }
    
    // MARK: - XAxisYAxisTypeOptionsComposer
    
    private static func xAxisYAxisTypeOptionsItems() -> [AAOptions] {
        return [
            XAxisYAxisTypeOptionsComposer.datatimeTypeLineAndColumnMixedChart(),
        ]
    }
    
    // MARK: - MixedTypesChartOptionsComposer
    
    private static func mixedTypesChartOptionsItems() -> [AAOptions] {
        return [
            MixedTypesChartOptionsComposer.columnrangeAndScatterMixedTypesChart(),
            MixedTypesChartOptionsComposer.invertedColumnrangeAndScatterMixedTypesChart(),
            MixedTypesChartOptionsComposer.customThermometerChart(),
            MixedTypesChartOptionsComposer.customInvertedThermometerChart(),
            MixedTypesChartOptionsComposer.customLollipopChart(),
            MixedTypesChartOptionsComposer.customInvertedLollipopChart(),
            MixedTypesChartOptionsComposer.polarThermometerChart(),
            MixedTypesChartOptionsComposer.polarLollipopChart(),
        ]
    }
    
    // MARK: - BubbleLegendChartOptionsComposer
    
    private static func bubbleLegendChartOptionsItems() -> [AAOptions] {
        return [
            BubbleLegendChartOptionsComposer.bubbleLegendChart(),
            BubbleLegendChartOptionsComposer.customBubbleLegendChart(),
            BubbleLegendChartOptionsComposer.packedbubbleChart(),
            BubbleLegendChartOptionsComposer.packedbubbleSplitChart(),
            BubbleLegendChartOptionsComposer.packedbubbleSpiralChart(),
        ]
    }
    
    // MARK: - BubbleChartOptionsComposer
    
    private static func bubbleChartOptionsItems() -> [AAOptions] {
        return [
            BubbleChartOptionsComposer.punchCardChart(),
            BubbleChartOptionsComposer.punchCardChart2(),
            BubbleChartOptionsComposer.punchCardChart3(),
        ]
    }
    
    // MARK: - AreaChartOptionsVC
    
    private static func areaChartOptionsItems() -> [AAOptions] {
        return [
            AreaChartOptionsVC.configureComplicatedCustomAreasplineChart(),//复杂自定义曲线填充图 1
            AreaChartOptionsVC.configureComplicatedCustomAreasplineChart2(),//复杂自定义曲线填充图 2
            AreaChartOptionsVC.configureComplicatedCustomAreasplineChart3(),//复杂自定义曲线填充图 3
            AreaChartOptionsVC.configureComplicatedCustomAreaChart(),//复杂自定义折线填充图 1
            AreaChartOptionsVC.configureComplicatedCustomAreaChart2(),//复杂自定义折线填充图 2
            AreaChartOptionsVC.configureComplicatedCustomAreaChart3(),//复杂自定义折线填充图 3
            AreaChartOptionsVC.configureComplicatedCustomStepAreaChart(),//复杂自定义阶梯折线填充图 1
            AreaChartOptionsVC.configureComplicatedCustomStepAreaChart2(),//复杂自定义阶梯折线填充图 2
            AreaChartOptionsVC.configureComplicatedCustomStepAreaChart3(),//复杂自定义阶梯折线填充图 3
        ]
    }
    
    // MARK: - LineChartOptionsVC
    
    private static func lineChartOptionsItems() -> [AAOptions] {
        return [
            LineChartOptionsVC.fancySplineChart(),
            LineChartOptionsVC.fancyLineChart(),
            LineChartOptionsVC.fancySplineChartWithInnerBlankMarkerSymbol(),
            LineChartOptionsVC.fancyLineChartWithInnerBlankMarkerSymbol(),
            LineChartOptionsVC.fancySplineChartWithBorderBlankMarkerSymbol(),
            LineChartOptionsVC.fancyLineChartWithBorderBlankMarkerSymbol(),
        ]
    }
    
    // MARK: - PolarChartOptionsVC
    
    private static func polarChartOptionsItems() -> [AAOptions] {
        return [
            PolarChartOptionsVC.configureTriangleRadarChart(),//带有颜色标志带の三角形雷达图
            PolarChartOptionsVC.configureQuadrangleRadarChart(),//带有颜色标志带の四角形雷达图
            PolarChartOptionsVC.configurePentagonRadarChart(),//带有颜色标志带の五角形雷达图
            PolarChartOptionsVC.configureHexagonRadarChart(),//带有颜色标志带の六角形雷达图
            PolarChartOptionsVC.configureSpiderWebRadarChart(),//带有颜色标志带の🕸蜘蛛网状雷达图
            PolarChartOptionsVC.configureSpiderWebRadarChart2(),//带有颜色标志带の🕸蜘蛛网状雷达图
        ]
    }
    
    // MARK: - ColumnChartOptionsVC
    
    private static func columnChartOptionsItems() -> [AAOptions] {
        return [
            ColumnChartOptionsVC.disableGroupingColumnChart(),
            ColumnChartOptionsVC.disableGroupingBarChart(),
        ]
    }
    
    // MARK: - ScatterChartOptionsVC
    
    private static func scatterChartOptionsItems() -> [AAOptions] {
        return [
            ScatterChartOptionsVC.scatterChartWithJitter(),
            ScatterChartOptionsVC.boxPlotMixedScatterChartWithJitter(),
        ]
    }
    
    // MARK: - PieChartOptionsVC
    
    private static func pieChartOptionsItems() -> [AAOptions] {
        return [
            PieChartOptionsVC.pieDonutChart(),
        ]
    }
    
    // MARK: - MultiYAxesChartOptionsVC
    
    private static func multiYAxesChartOptionsItems() -> [AAOptions] {
        return [
            MultiYAxesChartOptionsVC.doubleXAxesAndDoubleYAxesChart(),
            MultiYAxesChartOptionsVC.doubleXAxesAndDoubleYAxesChart2(),
            MultiYAxesChartOptionsVC.doubleXAxesAndDoubleYAxesChart3(),
            MultiYAxesChartOptionsVC.doubleXAxesAndDoubleYAxesChart4(),
            MultiYAxesChartOptionsVC.disableGroupingBoxplotMixedScatterChart(),
        ]
    }
    
    // MARK: - DrawChartWithAAOptionsVC
    
    private static func drawChartWithAAOptionsItems() -> [AAOptions] {
        return [
            DrawChartWithAAOptionsVC.configureLegendStyle(),
            DrawChartWithAAOptionsVC.simpleGaugeChart(),
            DrawChartWithAAOptionsVC.gaugeChartWithPlotBand(),
            DrawChartWithAAOptionsVC.configureChartWithBackgroundImage(),
            DrawChartWithAAOptionsVC.customAreaChartYAxisLabelsAndGridLineStyle(),//自定义曲线填充图图的 Y 轴 的 Labels 和 网格线样式
            DrawChartWithAAOptionsVC.adjustYAxisMinValueForChart(),
            DrawChartWithAAOptionsVC.configureTheMirrorColumnChart(),
            DrawChartWithAAOptionsVC.adjustTheXAxisLabels(),
            DrawChartWithAAOptionsVC.adjustGroupPaddingBetweenColumns(),
            DrawChartWithAAOptionsVC.configureAAPlotBandsForChart(),
                
            DrawChartWithAAOptionsVC.configureAAPlotLinesForChart(),
            DrawChartWithAAOptionsVC.customAATooltipWithJSFuntion(),
            DrawChartWithAAOptionsVC.customXAxisCrosshairStyle(),
            DrawChartWithAAOptionsVC.configureXAxisLabelsFontColorWithHTMLString(),
            DrawChartWithAAOptionsVC.configureXAxisLabelsFontColorAndFontSizeWithHTMLString(),
            DrawChartWithAAOptionsVC.configure_DataLabels_XAXis_YAxis_Legend_Style(),
            DrawChartWithAAOptionsVC.configureXAxisPlotBand(),
            DrawChartWithAAOptionsVC.configureDoubleYAxisChartOptions(),
            DrawChartWithAAOptionsVC.configureTripleYAxesMixedChart(),
            DrawChartWithAAOptionsVC.configureDoubleYAxesAndColumnLineMixedChart(),
            DrawChartWithAAOptionsVC.configureDoubleYAxesMarketDepthChart(),
            DrawChartWithAAOptionsVC.customAreaChartTooltipStyleLikeHTMLTable(),
            DrawChartWithAAOptionsVC.customAxesGridLineStyle(),
            DrawChartWithAAOptionsVC.customRadarChartStyle(),
            DrawChartWithAAOptionsVC.customColumnrangeChartStyle(),
            DrawChartWithAAOptionsVC.customXAxisLabelsBeImages(),//自定义曲线面积图 X 轴 labels 为一组图片🖼
            DrawChartWithAAOptionsVC.configureTriangleRadarChart(),//带有颜色标志带の三角形雷达图
            DrawChartWithAAOptionsVC.configureQuadrangleRadarChart(),//带有颜色标志带の四角形雷达图
            DrawChartWithAAOptionsVC.configurePentagonRadarChart(),//带有颜色标志带の五角形雷达图
            DrawChartWithAAOptionsVC.configureHexagonRadarChart(),//带有颜色标志带の六角形雷达图
            DrawChartWithAAOptionsVC.configureSpiderWebRadarChart(),//带有颜色标志带の🕸蜘蛛网状雷达图
            
            DrawChartWithAAOptionsVC.configureComplicatedCustomAreasplineChart(),//复杂自定义曲线填充图 1
            DrawChartWithAAOptionsVC.configureComplicatedCustomAreasplineChart2(),//复杂自定义曲线填充图 2
            DrawChartWithAAOptionsVC.configureComplicatedCustomAreasplineChart3(),//复杂自定义曲线填充图 3
            DrawChartWithAAOptionsVC.yAxisOnTheRightSideChart(),//y轴在右侧的图表
            DrawChartWithAAOptionsVC.doubleLayerHalfPieChart(),//双层嵌套的玉阕图
            DrawChartWithAAOptionsVC.customAreasplineChartTooltipContentWithHeaderFormat(),//通过 tooltip 的 headerFormat 属性来自定义 曲线填充图的 tooltip
            DrawChartWithAAOptionsVC.customAreaChartTooltipStyleWithTotalValueHeader(),//浮动提示框 header 显示总值信息
            DrawChartWithAAOptionsVC.configureYAxisLabelsNumericSymbolsMagnitudeOfAerasplineChart(),//自定义 Y 轴的 Labels 国际单位符基数及国际单位符
            DrawChartWithAAOptionsVC.timeDataWithIrregularIntervalsChart(),//X 轴时间不连续的折线图
            DrawChartWithAAOptionsVC.logarithmicAxisLineChart(),//对数轴折线图📈
            DrawChartWithAAOptionsVC.logarithmicAxisScatterChart(),//对数轴散点图
            
            DrawChartWithAAOptionsVC.disableMixedChartInactiveAnimationEffect(),//禁用混合图表的 inactive 动画效果
            DrawChartWithAAOptionsVC.adjustBubbleChartMinAndMax(),//调整气泡图的 min 和 max 相关属性
            DrawChartWithAAOptionsVC.customLineChartDataLabelsFormat(),//自定义曲线图的 DataLabels 的 format 属性
            DrawChartWithAAOptionsVC.customLineChartDataLabelsFormat2(),//自定义曲线图的 DataLabels 的 format 属性(更简易方法)
            DrawChartWithAAOptionsVC.complicatedScatterChart(),//复杂的自定义散点图
            DrawChartWithAAOptionsVC.customColumnrangeChartGroupStyleAndSeriesStatesHoverColor(),
            DrawChartWithAAOptionsVC.configureBoxplotChartWithSpecialStyle(), //自定义盒须图特殊样式
            DrawChartWithAAOptionsVC.configurePieChartWithSpecialStyleLegend(),//自定义饼图的 legend 为特殊样式
            DrawChartWithAAOptionsVC.disableAnimationForChart(), //禁用图表渲染动画
        ]
    }
}
