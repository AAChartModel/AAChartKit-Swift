//
//  OfficalSamplesChartProvider.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/10/28.
//  Copyright © 2025 An An. All rights reserved.
//

import AAInfographics

class OfficalSamplesChartProvider {

    static func officalChartSampleItems() -> [AAOptions] {
        let originalItems = [
            AreaChartOptionsComposer.basicAreaChart(),//基础面积图
            AreaChartOptionsComposer.areaWithNegativeValuesChart(),//带有负值的面积图
            AreaChartOptionsComposer.stackedAreaChart(),//堆积面积图
            AreaChartOptionsComposer.percentStackedAreaChart(),//百分比堆积面积图
            AreaChartOptionsComposer.areaWithMissingPointsChart(),//带有缺失点的面积图
            AreaChartOptionsComposer.invertedAreaChart(),//翻转面积图
            AreaChartOptionsComposer.areasplineChart(),//曲线面积图
            AreaChartOptionsComposer.arearangeChart(),//区域范围图
            AreaChartOptionsComposer.arearangeAndLineChart(),//区域范围图和折线图混合图
            
            BarOrColumnChartOptionsComposer.basicBarChart(),//基础柱状图
            BarOrColumnChartOptionsComposer.stackingBarChart(),//堆积柱状图
            BarOrColumnChartOptionsComposer.populationPyramidChart(),//人口金字塔图
            BarOrColumnChartOptionsComposer.basicColumnChart(),//基础条形图
            BarOrColumnChartOptionsComposer.basicColumnChartWithNegativeValue(),//带有负值的条形图
            BarOrColumnChartOptionsComposer.basicColumnChartWithStackedDataLabels(),//带有数据标签的堆积条形图
            BarOrColumnChartOptionsComposer.basicColumnChartWithStackedDataLabels2(),//带有数据标签的堆积条形图2
            BarOrColumnChartOptionsComposer.percentStackedColumnChart(),//百分比堆积条形图
            BarOrColumnChartOptionsComposer.columnChartWithRotatedLabels(),//带有旋转标签的条形图
            BarOrColumnChartOptionsComposer.columnChartWithNestedColumn(),//嵌套条形图
            BarOrColumnChartOptionsComposer.columnRangeChart(),//条形范围图
    
            PieChartOptionsComposer.basicPieChart(),//基本饼状图
            PieChartOptionsComposer.basicPieChartWithLegend(),//带有图例的基本饼状图
            PieChartOptionsComposer.basicPieChartWithGradientColor(),//带有渐变色的基本饼状图
            PieChartOptionsComposer.basicPieChartWithGradientColor2(),//带有渐变色的基本饼状图
            PieChartOptionsComposer.basicPieChartWithMonochromeColor(),//带有单色的基本饼状图
            PieChartOptionsComposer.customPieChartTitlePosition(),//自定义饼状图标题位置
        ]
        
        //遍历 originalItems 数组,将其中的每个 AAChartModel 实例转化为 AAOptions 实例
        let finalItems = originalItems.map { (aaOptions) -> AAOptions in
            let aaOptions = aaOptions
//            aaOptions.chart?.polar(true)
            return aaOptions
        }
        
        return finalItems
    }

}
