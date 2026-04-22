//
// Created by AnAn on 2024/1/18.
// Copyright (c) 2024 An An. All rights reserved.
//

import AAInfographics

class CustomStyleForBarChartComposer {
    
    //多彩条形图
    static func colorfulBarChart() -> AAChartModel {
        CustomStyleForColumnChartComposer.colorfulColumnChart().chartType(.bar)
    }
    
    //多彩颜色渐变条形图
    static func colorfulGradientColorBarChart() -> AAChartModel {
        CustomStyleForColumnChartComposer.colorfulGradientColorColumnChart().chartType(.bar)
    }
    
    //数值不连续の条形图
    static func discontinuousDataBarChart() -> AAChartModel {
        CustomStyleForColumnChartComposer.discontinuousDataColumnChart().chartType(.bar)
    }
    
    //随机颜色の多彩条形图
    static func randomColorfulBarChart() -> AAChartModel {
        CustomStyleForColumnChartComposer.randomColorfulColumnChart().chartType(.bar)
    }


    //无堆积效果の极化条形图
    static func noneStackingPolarBarChart() -> AAChartModel {
        CustomStyleForColumnChartComposer.noneStackingPolarColumnChart().chartType(.bar)
    }

    //常规堆积效果の极化条形图
    static func normalStackingPolarBarChart() -> AAChartModel {
        CustomStyleForColumnChartComposer.normalStackingPolarColumnChart().chartType(.bar)
    }

    //百分比堆积效果の极化条形图
    static func percentStackingPolarBarChart() -> AAChartModel {
        CustomStyleForColumnChartComposer.percentStackingPolarColumnChart().chartType(.bar)
    }

    
    
    //单个数据元素特别风格条形图
    static func specialStyleForTheSingleDataElementOfBarChart() -> AAChartModel {
        CustomStyleForColumnChartComposer.specialStyleForTheSingleDataElementOfColumnChart().chartType(.bar)
    }
    
    //不分组的相互重叠条形图
    static func noMoreGroupingAndOverlapEachOtherBarChart() -> AAChartModel {
        CustomStyleForColumnChartComposer.noMoreGroupingAndOverlapEachOtherColumnChart().chartType(.bar)
    }
    
    static func noMoreGroupingAndNestedBarChart() -> AAChartModel {
        CustomStyleForColumnChartComposer.noMoreGroupingAndNestedColumnChart().chartType(.bar)
    }
    
    static func topRoundedCornersStackingBarChart() -> AAChartModel {
        CustomStyleForColumnChartComposer.topRoundedCornersStackingColumnChart().chartType(.bar)
    }
    
    //各个圆角自由独立设置的堆积条形图
    static func freeStyleRoundedCornersStackingBarChart() -> AAChartModel {
        CustomStyleForColumnChartComposer.freeStyleRoundedCornersStackingColumnChart().chartType(.bar)
    }
    
    
    
    //自定义条形图 border 样式及手指掠过图表 series 元素时的条形颜色
    static func customBorderStyleAndStatesHoverColorBarChart() -> AAChartModel {
        CustomStyleForColumnChartComposer.customBorderStyleAndStatesHoverColorColumnChart().chartType(.bar)
    }
    
    //正负数混合的条形图
    static func negativeDataMixedPositiveDataBarChart() -> AAChartModel {
        CustomStyleForColumnChartComposer.negativeDataMixedPositiveDataColumnChart().chartType(.bar)
    }
    
    //自定义条形图动画效果
    static func customAnimationForBarChart() -> AAChartModel {
        CustomStyleForColumnChartComposer.customAnimationForColumnChart().chartType(.bar)
    }


    static func configureNegativeColorMixedBarChart() -> AAChartModel {
        CustomStyleForColumnChartComposer.configureNegativeColorMixedColumnChart().chartType(.bar)
    }

    static func customSingleDataElementSpecialStyleForBarChart() -> AAChartModel {
        CustomStyleForColumnChartComposer.customSingleDataElementSpecialStyleForColumnChart().chartType(.bar)
    }

    static func customHoverColorAndSelectColorForBarChart() -> AAChartModel {
        CustomStyleForColumnChartComposer.customHoverColorAndSelectColorForColumnChart().chartType(.bar)
    }

    static func customNormalStackingChartDataLabelsContentAndStyleForBarChart() -> AAChartModel {
        CustomStyleForColumnChartComposer.customNormalStackingChartDataLabelsContentAndStyleForColumnChart().chartType(.bar)
    }
    
}
