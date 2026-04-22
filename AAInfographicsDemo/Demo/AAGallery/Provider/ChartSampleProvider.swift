//
//  AAOptionsItemComposer.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/2/6.
//  Copyright © 2025 An An. All rights reserved.
//

import AAInfographics

class ChartSampleProvider: NSObject {
    
    static func aaChartModelItems() -> [AAOptions] {
        let originalItems = [
            SpecialChartComposer.polarColumnChart(),
            SpecialChartComposer.polarBarChart(),
            SpecialChartComposer.polarLineChart(),
            SpecialChartComposer.polarAreaChart(),
            SpecialChartComposer.stepLineChart(),
            SpecialChartComposer.stepAreaChart(),
            SpecialChartComposer.pieChart(),
            SpecialChartComposer.bubbleChart(),
            SpecialChartComposer.packedbubbleChart(),
            SpecialChartComposer.scatterChart(),
            SpecialChartComposer.arearangeChart(),
            SpecialChartComposer.areasplinerangeChart(),
            SpecialChartComposer.columnrangeChart(),
            SpecialChartComposer.boxplotChart(),
            SpecialChartComposer.waterfallChart(),
            SpecialChartComposer.pyramidChart(),
            SpecialChartComposer.funnelChart(),
            SpecialChartComposer.errorbarChart(),
            SpecialChartComposer.gaugeChart(),
            SpecialChartComposer.polygonChart(),
            SpecialChartComposer.columnpyramidChart(),
            
//            MixedChartComposer.arearangeMixedLineChart(),
//            MixedChartComposer.columnrangeMixedLineChart(),
//            MixedChartComposer.stackingColumnMixedLineChart(),
//            MixedChartComposer.scatterMixedLineChart(),
//            MixedChartComposer.polygonMixedScatterChart(),
//            MixedChartComposer.polarChartMixedChart(),
//            MixedChartComposer.columnMixedScatterChart(),
//            MixedChartComposer.areasplinerangeMixedColumnrangeMixedLineChart(),
//            MixedChartComposer.boxplotMixedScatterChartWithJitter(),
//            MixedChartComposer.multiLevelStopsArrGradientColorAreasplineMixedLineChart(),
//            MixedChartComposer.arearangeMixedLineChart(),
//            
//            MixedChartComposer2.scatterPlotWithTrendLine(),
//            MixedChartComposer2.scatterPlotWithTrendLine2(),
//            MixedChartComposer2.pieMixedLineMixedColumnChart(),
//            MixedChartComposer2.pieMixedLineMixedColumnChart2(),
//            
//            CustomStyleForColumnChartComposer.colorfulColumnChart(),
//            CustomStyleForColumnChartComposer.colorfulGradientColorColumnChart(),
//            CustomStyleForColumnChartComposer.discontinuousDataColumnChart(),
//            CustomStyleForColumnChartComposer.randomColorfulColumnChart(),
//            
//            CustomStyleForColumnChartComposer.noneStackingPolarColumnChart(),
//            CustomStyleForColumnChartComposer.normalStackingPolarColumnChart(),
//            CustomStyleForColumnChartComposer.percentStackingPolarColumnChart(),
//            
//            CustomStyleForColumnChartComposer.specialStyleForTheSingleDataElementOfColumnChart(),
//            CustomStyleForColumnChartComposer.noMoreGroupingAndOverlapEachOtherColumnChart(),
//            CustomStyleForColumnChartComposer.noMoreGroupingAndNestedColumnChart(),
//            CustomStyleForColumnChartComposer.topRoundedCornersStackingColumnChart(),
//            CustomStyleForColumnChartComposer.freeStyleRoundedCornersStackingColumnChart(),
//            
//            CustomStyleForColumnChartComposer.customBorderStyleAndStatesHoverColorColumnChart(),
//            CustomStyleForColumnChartComposer.negativeDataMixedPositiveDataColumnChart(),
//            
//            
//            CustomStyleForLineChartComposer.mixedLineChart(),
//            CustomStyleForLineChartComposer.stepLineChart(),
//            CustomStyleForLineChartComposer.stepAreaChart(),
//            CustomStyleForLineChartComposer.customSingleDataLabelForLineChart(),
//            CustomStyleForLineChartComposer.shadowStyleLineChart(),
//            CustomStyleForLineChartComposer.colorfulGradientLineChart(),
//            CustomStyleForLineChartComposer.customMarkerSymbolContentLineChart(),
//            CustomStyleForLineChartComposer.drawPointsWithCoordinatesForLineChart(),
//            CustomStyleForLineChartComposer.customHoverAndSelectHaloStyleForLineChart(),
//            CustomStyleForLineChartComposer.disableSomeOfLinesMouseTrackingEffectForLineChart(),
//            CustomStyleForLineChartComposer.colorfulShadowLineChart(),
//            CustomStyleForLineChartComposer.colorfulDataLabelsStepLineChart(),
//            CustomStyleForLineChartComposer.disableMarkerHoverEffectForLineChart(),
//            CustomStyleForLineChartComposer.maxAndMinDataLabelsForLineChart(),
//            CustomStyleForLineChartComposer.dashStyleTypesMixedLineChart(),
//            CustomStyleForLineChartComposer.allLineDashStyleTypesMixedLineChart(),
//            CustomStyleForLineChartComposer.shadowLineChart(),
//            CustomStyleForLineChartComposer.colorfulMarkersAndLinesLineChart(),
//            CustomStyleForLineChartComposer.colorfulMarkersAndLinesLineChart2(),
//            CustomStyleForLineChartComposer.connectNullsForSingleAASeriesElementLineChart(),
//            CustomStyleForLineChartComposer.largeDifferencesInTheNumberOfDataInDifferentSeriesElementLineChart(),
//            CustomStyleForLineChartComposer.customDifferentDataLabelsShapeForLineChart(),
//            CustomStyleForLineChartComposer.clipForAASeriesElementLineChart(),
//            
//            
//            CustomStyleForAreasplineChartComposer.withMinusNumberAreasplineChart(),
//            CustomStyleForAreasplineChartComposer.colorfulGradientAreasplineChart(),
//            CustomStyleForAreasplineChartComposer.gradientColorAreasplineChart(),
//            CustomStyleForAreasplineChartComposer.thresholdForAreasplineChart(),
//            CustomStyleForAreasplineChartComposer.customSpecialStyleDataLabelOfSingleDataElementForAreasplineChart(),
//            CustomStyleForAreasplineChartComposer.customMarkerStatesHoverStyleForAreasplineChart(),
//            CustomStyleForAreasplineChartComposer.colorfulGradientColorAndColorfulDataLabelsStepAreasplineChart(),
//            CustomStyleForAreasplineChartComposer.negativeColorMixedAreasplineChart(),
//            CustomStyleForAreasplineChartComposer.customColorfulGradientColorZonesForAreasplineChart(),
//            
//            
//            CustomStyleForPieChartComposer.pieChart(),
//            CustomStyleForPieChartComposer.doubleLayerPieChart(),
//            CustomStyleForPieChartComposer.doubleLayerDoubleColorsPieChart(),
//            
//            CustomStyleForPieChartComposer.pieChartWithSoftCorners(),
//            CustomStyleForPieChartComposer.doubleLayerPieChartWithSoftCorners(),
//            CustomStyleForPieChartComposer.doubleLayerDoubleColorsPieChartWithSoftCorners(),
//            
//            CustomStyleForPieChartComposer.pieChartWithRoundedCorners(),
//            CustomStyleForPieChartComposer.doubleLayerPieChartWithRoundedCorners(),
//            CustomStyleForPieChartComposer.doubleLayerDoubleColorsPieChartWithRoundedCorners(),
        ]
        
        //遍历 originalItems 数组,将其中的每个 AAChartModel 实例转化为 AAOptions 实例
        let finalItems = originalItems.map { (aaChartModel) -> AAOptions in
            let aaOptions = aaChartModel.aa_toAAOptions()
//            aaOptions.chart?.polar(true)
            return aaOptions
        }
        
        return finalItems
    }
    
    
    static func aaOptionsItems() -> [AAOptions] {
        let originalItems = [
            XAxisYAxisTypeOptionsComposer.datatimeTypeLineAndColumnMixedChart(),
            MixedTypesChartOptionsComposer.columnrangeAndScatterMixedTypesChart(),
            MixedTypesChartOptionsComposer.invertedColumnrangeAndScatterMixedTypesChart(),
            MixedTypesChartOptionsComposer.customThermometerChart(),
            MixedTypesChartOptionsComposer.customInvertedThermometerChart(),
            MixedTypesChartOptionsComposer.customLollipopChart(),
            MixedTypesChartOptionsComposer.customInvertedLollipopChart(),
            MixedTypesChartOptionsComposer.polarThermometerChart(),
            MixedTypesChartOptionsComposer.polarLollipopChart(),
            
            BubbleLegendChartOptionsComposer.bubbleLegendChart(),
            BubbleLegendChartOptionsComposer.customBubbleLegendChart(),
            BubbleLegendChartOptionsComposer.packedbubbleChart(),
            BubbleLegendChartOptionsComposer.packedbubbleSplitChart(),
            BubbleLegendChartOptionsComposer.packedbubbleSpiralChart(),
            
            BubbleChartOptionsComposer.punchCardChart(),
            BubbleChartOptionsComposer.punchCardChart2(),
            BubbleChartOptionsComposer.punchCardChart3(),
            
            AreaChartOptionsVC.configureComplicatedCustomAreasplineChart(),//复杂自定义曲线填充图 1
            AreaChartOptionsVC.configureComplicatedCustomAreasplineChart2(),//复杂自定义曲线填充图 2
            AreaChartOptionsVC.configureComplicatedCustomAreasplineChart3(),//复杂自定义曲线填充图 3
            AreaChartOptionsVC.configureComplicatedCustomAreaChart(),//复杂自定义折线填充图 1
            AreaChartOptionsVC.configureComplicatedCustomAreaChart2(),//复杂自定义折线填充图 2
            AreaChartOptionsVC.configureComplicatedCustomAreaChart3(),//复杂自定义折线填充图 3
            AreaChartOptionsVC.configureComplicatedCustomStepAreaChart(),//复杂自定义阶梯折线填充图 1
            AreaChartOptionsVC.configureComplicatedCustomStepAreaChart2(),//复杂自定义阶梯折线填充图 2
            AreaChartOptionsVC.configureComplicatedCustomStepAreaChart3(),//复杂自定义阶梯折线填充图 3
            
            LineChartOptionsVC.fancySplineChart(),
            LineChartOptionsVC.fancyLineChart(),
            LineChartOptionsVC.fancySplineChartWithInnerBlankMarkerSymbol(),
            LineChartOptionsVC.fancyLineChartWithInnerBlankMarkerSymbol(),
            LineChartOptionsVC.fancySplineChartWithBorderBlankMarkerSymbol(),
            LineChartOptionsVC.fancyLineChartWithBorderBlankMarkerSymbol(),
            
            PolarChartOptionsVC.configureTriangleRadarChart(),//带有颜色标志带の三角形雷达图
            PolarChartOptionsVC.configureQuadrangleRadarChart(),//带有颜色标志带の四角形雷达图
            PolarChartOptionsVC.configurePentagonRadarChart(),//带有颜色标志带の五角形雷达图
            PolarChartOptionsVC.configureHexagonRadarChart(),//带有颜色标志带の六角形雷达图
            PolarChartOptionsVC.configureSpiderWebRadarChart(),//带有颜色标志带の🕸蜘蛛网状雷达图
            PolarChartOptionsVC.configureSpiderWebRadarChart2(),//带有颜色标志带の🕸蜘蛛网状雷达图
            
            ColumnChartOptionsVC.disableGroupingColumnChart(),
            ColumnChartOptionsVC.disableGroupingBarChart(),
            
            ScatterChartOptionsVC.scatterChartWithJitter(),
            ScatterChartOptionsVC.boxPlotMixedScatterChartWithJitter(),

            PieChartOptionsVC.pieDonutChart(),
            
            MultiYAxesChartOptionsVC.doubleXAxesAndDoubleYAxesChart(),
            MultiYAxesChartOptionsVC.doubleXAxesAndDoubleYAxesChart2(),
            MultiYAxesChartOptionsVC.doubleXAxesAndDoubleYAxesChart3(),
            MultiYAxesChartOptionsVC.doubleXAxesAndDoubleYAxesChart4(),

            MultiYAxesChartOptionsVC.disableGroupingBoxplotMixedScatterChart(),



            
            
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
        
        //遍历 originalItems 数组,将其中的每个 AAChartModel 实例转化为 AAOptions 实例
        let finalItems = originalItems.map { (aaOptions) -> AAOptions in
            let aaOptions = aaOptions
//            aaOptions.chart?.polar(true)
            return aaOptions
        }
        
        return finalItems
    }
    
    
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
    
    static func randomValueDataItemsChartModel() -> [AAChartModel] {
        return [
            AARandomValueDataComposer.configureChartModel(chartType: .column),          //Column series display one column per value along an X axis.
            AARandomValueDataComposer.configureChartModel(chartType: .bar),             //A bar series is a special type of column series where the columns are horizontal.
            AARandomValueDataComposer.configureChartModel(chartType: .area),            //The area series type.
            AARandomValueDataComposer.configureChartModel(chartType: .areaspline),      //The area spline series is an area series where the graph between the points is smoothed into a spline.
            AARandomValueDataComposer.configureChartModel(chartType: .line),            //A line series displays information as a series of data points connected by straight line segments.
            AARandomValueDataComposer.configureChartModel(chartType: .spline),          //A spline series is a special type of line series, where the segments between the data points are smoothed.
            AARandomValueDataComposer.configureChartModel(chartType: .scatter),         //A scatter plot uses cartesian coordinates to display values for two variables for a set of data.
            AARandomValueDataComposer.configureChartModel(chartType: .pie),             //A pie chart is a circular graphic which is divided into slices to illustrate numerical proportion.
            AARandomValueDataComposer.configureChartModel(chartType: .bubble),          //A bubble series is a three dimensional series type where each point renders an X, Y and Z value. Each points is drawn as a bubble where the position along the X and Y axes mark the X and Y values, and the size of the bubble relates to the Z value.
            AARandomValueDataComposer.configureChartModel(chartType: .packedbubble),    //A packed bubble series is a two dimensional series type, where each point renders a value in X, Y position. Each point is drawn as a bubble where the bubbles don't overlap with each other and the radius of the bubble relates to the value.
            AARandomValueDataComposer.configureChartModel(chartType: .pyramid),         //A pyramid series is a special type of funnel, without neck and reversed by default.
            AARandomValueDataComposer.configureChartModel(chartType: .funnel),          //Funnel charts are a type of chart often used to visualize stages in a sales project, where the top are the initial stages with the most clients. It requires that the modules/funnel.js file is loaded.
            AARandomValueDataComposer.configureChartModel(chartType: .columnrange),     //The column range is a cartesian series type with higher and lower Y values along an X axis. To display horizontal bars, set chart.inverted to true.
            AARandomValueDataComposer.configureChartModel(chartType: .arearange),       //The area range series is a carteseian series with higher and lower values for each point along an X axis, where the area between the values is shaded.
            AARandomValueDataComposer.configureChartModel(chartType: .areasplinerange), //The area spline range is a cartesian series type with higher and lower Y values along an X axis. The area inside the range is colored, and the graph outlining the area is a smoothed spline.
            AARandomValueDataComposer.configureChartModel(chartType: .boxplot),         //A box plot is a convenient way of depicting groups of data through their five-number summaries: the smallest observation (sample minimum), lower quartile (Q1), median (Q2), upper quartile (Q3), and largest observation (sample maximum).
            AARandomValueDataComposer.configureChartModel(chartType: .waterfall),       //A waterfall chart displays sequentially introduced positive or negative values in cumulative columns.
            AARandomValueDataComposer.configureChartModel(chartType: .polygon),         //A polygon series can be used to draw any freeform shape in the cartesian coordinate system. A fill is applied with the color option, and stroke is applied through lineWidth and lineColor options.
            AARandomValueDataComposer.configureChartModel(chartType: .gauge),           //Gauges are circular plots displaying one or more values with a dial pointing to values along the perimeter.
            AARandomValueDataComposer.configureChartModel(chartType: .errorbar),        //Error bars are a graphical representation of the variability of data and are used on graphs to indicate the error, or uncertainty in a reported measurement.
        ]
    }
    
    
    static func randomValueDataItems() -> [AAOptions] {
        let chartModelArr = ChartSampleProvider.randomValueDataItemsChartModel()
        //后面有时间转一下类型, 简化代码
        
        return [
            AARandomValueDataComposer.configureChartOptions(chartType: .column),          //Column series display one column per value along an X axis.
            AARandomValueDataComposer.configureChartOptions(chartType: .bar),             //A bar series is a special type of column series where the columns are horizontal.
            AARandomValueDataComposer.configureChartOptions(chartType: .area),            //The area series type.
            AARandomValueDataComposer.configureChartOptions(chartType: .areaspline),      //The area spline series is an area series where the graph between the points is smoothed into a spline.
            AARandomValueDataComposer.configureChartOptions(chartType: .line),            //A line series displays information as a series of data points connected by straight line segments.
            AARandomValueDataComposer.configureChartOptions(chartType: .spline),          //A spline series is a special type of line series, where the segments between the data points are smoothed.
            AARandomValueDataComposer.configureChartOptions(chartType: .scatter),         //A scatter plot uses cartesian coordinates to display values for two variables for a set of data.
            AARandomValueDataComposer.configureChartOptions(chartType: .pie),             //A pie chart is a circular graphic which is divided into slices to illustrate numerical proportion.
            AARandomValueDataComposer.configureChartOptions(chartType: .bubble),          //A bubble series is a three dimensional series type where each point renders an X, Y and Z value. Each points is drawn as a bubble where the position along the X and Y axes mark the X and Y values, and the size of the bubble relates to the Z value.
            AARandomValueDataComposer.configureChartOptions(chartType: .packedbubble),    //A packed bubble series is a two dimensional series type, where each point renders a value in X, Y position. Each point is drawn as a bubble where the bubbles don't overlap with each other and the radius of the bubble relates to the value.
            AARandomValueDataComposer.configureChartOptions(chartType: .pyramid),         //A pyramid series is a special type of funnel, without neck and reversed by default.
            AARandomValueDataComposer.configureChartOptions(chartType: .funnel),          //Funnel charts are a type of chart often used to visualize stages in a sales project, where the top are the initial stages with the most clients. It requires that the modules/funnel.js file is loaded.
            AARandomValueDataComposer.configureChartOptions(chartType: .columnrange),     //The column range is a cartesian series type with higher and lower Y values along an X axis. To display horizontal bars, set chart.inverted to true.
            AARandomValueDataComposer.configureChartOptions(chartType: .arearange),       //The area range series is a carteseian series with higher and lower values for each point along an X axis, where the area between the values is shaded.
            AARandomValueDataComposer.configureChartOptions(chartType: .areasplinerange), //The area spline range is a cartesian series type with higher and lower Y values along an X axis. The area inside the range is colored, and the graph outlining the area is a smoothed spline.
            AARandomValueDataComposer.configureChartOptions(chartType: .boxplot),         //A box plot is a convenient way of depicting groups of data through their five-number summaries: the smallest observation (sample minimum), lower quartile (Q1), median (Q2), upper quartile (Q3), and largest observation (sample maximum).
            AARandomValueDataComposer.configureChartOptions(chartType: .waterfall),       //A waterfall chart displays sequentially introduced positive or negative values in cumulative columns.
            AARandomValueDataComposer.configureChartOptions(chartType: .polygon),         //A polygon series can be used to draw any freeform shape in the cartesian coordinate system. A fill is applied with the color option, and stroke is applied through lineWidth and lineColor options.
            AARandomValueDataComposer.configureChartOptions(chartType: .gauge),           //Gauges are circular plots displaying one or more values with a dial pointing to values along the perimeter.
            AARandomValueDataComposer.configureChartOptions(chartType: .errorbar),        //Error bars are a graphical representation of the variability of data and are used on graphs to indicate the error, or uncertainty in a reported measurement.
        ]
    }

}
