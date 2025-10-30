//
//  CommonChartViewController.swift
//  AAChartKit-Swift
//
//  Created by An An on 2017/5/23.
//  Copyright © 2017年 An An . All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 *********************************************************************************
 *
 *  🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit-Swift/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 *********************************************************************************
 
 */

import UIKit
import AAInfographics

@available(iOS 14.0, macCatalyst 14.0, *)
class AAChartModelListVC: AABaseListVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "AAChartModel"
        
        sectionTitleArr = [
            "Basic Type Chart | 基础类型图表",
            "Special Type Chart | 特殊类型图表",
            "Custom Style Chart| 一些自定义风格样式图表",
            "Mixed Chart | 混合图形",
            "Mixed Chart2 | 混合图形2",
            "Pie Chart With Custom Style | 一些自定义风格样式饼图",
            "Column Chart With Custom Style | 一些自定义风格样式柱状图",
            "Bar Chart With Custom Style | 一些自定义风格样式条形图",
            "Line Chart With Custom Style | 一些自定义风格样式折线图",
            "Spine Chart With Custom Style | 一些自定义风格样式曲线图",
            "Area Chart With Custom Style | 一些自定义风格样式折线填充图",
            "Areaspline Chart With Custom Style | 一些自定义风格样式曲线填充图",
            "Scatter Chart With Custom Style | 一些自定义风格样式散点图",
            "Bubble Chart With Custom Style | 一些自定义风格样式气泡图",
            "Line Chart With Custom Style2 | 一些自定义风格样式折线图2",

            "全部显示所有样式的图表",
        ]
        
        chartTypeTitleArr = [
            /*Basic types chart*/
            [
                "Column Chart---柱状图",
                "Bar Chart---条形图",
                "Area Chart---折线填充图",
                "Areaspline Chart---曲线填充图",
                "Step Area Chart---直方折线填充图",
                "Step Line Chart---直方折线图",
                "Line Chart---折线图",
                "Spline Chart---曲线图",
            ],
            /*Special types chart*/
            [
                "Polar Column Chart---玫瑰图",
                "Polar Bar Chart---径向条形图",
                "Polar Line Chart---蜘蛛图",
                "Polar Area Chart---雷达图",
                "Step Line Chart---直方折线图",
                "Step Area Chart---直方折线填充图",
                "Pie Chart---扇形图",
                "Bubble Chart---气泡图",
                "Packedbubble Chart---密集气泡图",
                "Scatter Chart---散点图",
                "Arearange Chart---折线区域范围图",
                "Area Spline range Chart--曲线区域范围图",
                "Columnrange Chart---柱形范围图",
                "Boxplot Chart---箱线图",
                "Waterfall Chart---瀑布图",
                "Pyramid Chart---金字塔图",
                "Funnel Chart---漏斗图",
                "Error Bar Chart---误差图",
                "Gauge Chart---仪表图",
                "Polygon Chart---多边形图",
                "Columnpyramid Chart---金字塔柱状图",
            ],
            /*Custom chart style by AAChartModel*/
            [
                "upsideDownPyramidChart",
                "customVerticalXAxisCategoriesLabelsByHTMLBreakLineTag"
//                "Colorful Column Chart---多彩条形图",
//                "Colorful Gradient Color Chart---多彩颜色渐变条形图",
//                "Discontinuous Data Chart---数值不连续の图表",
//                "Mixed Line Chart---虚实线混合折线图",
//                "Random Colors Colorful Column Chart---随机颜色の多彩柱状图",
//                "Gradient Color Bar Chart---颜色渐变条形图",
//                "Stacking polar chart---百分比堆积效果の极地图",
//                "Area Chart with minus--带有负数の区域填充图",
//                "Step Line Chart--直方折线图",
//                "Step Area Chart--直方折线填充图",
//                "Nightingale Rose Chart---南丁格尔玫瑰图",
//                "Specific Data Customize Datalabel",
//                "Chart With Shadow Style---带有阴影效果の图表",
//                "Colorful gradient Areaspline Chart---多层次渐变区域填充图",
//                "Colorful gradient Spline Chart---多层次渐变曲线图",
//                "Gradient Color Areaspline Chart---半透明渐变效果区域填充图",
//                "Special Style Marker Of Single Data Element Chart",
//                "Special Style Column Of Single Data Element Chart",
//                "configure Area Chart Threshold---自定义阈值",
//                "custom Scatter Chart Marker Symbol Content---自定义散点图の标志点内容",
//                "custom Line Chart Marker Symbol Content---自定义折线图の标志点内容",
//                "Triangle Radar Chart---三角形雷达图",
//                "Quadrangle Radar Chart---四角形雷达图",
//                "Pentagon Radar Chart---五角形雷达图",
//                "Hexagon Radar Chart----六角形雷达图",
//                "Draw Line Chart With Points Coordinates----通过点坐标来绘制折线图",
//                "custom Special Style DataLabel Of Single Data Element Chart",
//                "custom Bar Chart Hover Color and Select Color---自定义条形图手指滑动颜色和单个长条被选中颜色",
//                "custom Line Chart Chart Hover And Select Halo Style",
//                "custom Spline Chart Marker States Hover Style",
//                "customNormalStackingChartDataLabelsContentAndStyle---自定义堆积柱状图 DataLabels の内容及样式",
//                "upsideDownPyramidChart---倒立の金字塔图",
//                "doubleLayerPieChart---双层嵌套扇形图",
//                "doubleLayerDoubleColorsPieChart---双层嵌套双颜色主题扇形图",
//                "disableSomeOfLinesMouseTrackingEffect---针对部分数据列关闭鼠标或手指跟踪行为",
//                "configureColorfulShadowChart---彩色阴影效果の曲线图",
//                "configureColorfulDataLabelsStepLineChart---彩色 DataLabels の直方折线图",
//                "configureColorfulGradientColorAndColorfulDataLabelsStepAreaChart---彩色渐变效果且彩色 DataLabels の直方折线填充图",
//                "disableSplineChartMarkerHoverEffect---禁用曲线图の手指滑动 marker 点の光圈变化放大の效果",
//                "configureMaxAndMinDataLabelsForChart---为图表最大值最小值添加 DataLabels 标记",
//                "customVerticalXAxisCategoriesLabelsByHTMLBreakLineTag---通过 HTML 的换行标签来实现图表的 X 轴的 分类文字标签的换行效果",
//                "noMoreGroupingAndOverlapEachOtherColumnChart---不分组的相互重叠柱状图📊",
//                "noMoreGroupingAndNestedColumnChart---不分组的嵌套柱状图📊",
//                "topRoundedCornersStackingColumnChart---顶部为圆角的堆积柱状图📊",
//                "freeStyleRoundedCornersStackingColumnChart---各个圆角自由独立设置的堆积柱状图📊",
//                "customColumnChartBorderStyleAndStatesHoverColor---自定义柱状图 border 样式及手指掠过图表 series 元素时的柱形颜色",
//                
//                "customLineChartWithColorfulMarkersAndLines---彩色连接点和连接线的折线图📈",
//                "customLineChartWithColorfulMarkersAndLines2---彩色连接点和连接线的多组折线的折线图📈",
//                "drawLineChartWithPointsCoordinates---通过点坐标来绘制折线图",
//                "configureSpecialStyleColumnForNegativeDataMixedPositiveData---为正负数混合的柱状图自定义特殊样式效果",
//                "configureMultiLevelStopsArrGradientColorAreasplineMixedLineChart---多层次半透明渐变效果的曲线填充图混合折线图📈",
//                "connectNullsForSingleAASeriesElement---为单个 AASeriesElement 单独设置是否断点重连",
//                "lineChartsWithLargeDifferencesInTheNumberOfDataInDifferentSeriesElement---测试有多组数据时, 数据量较大时, 不同组数据量差距较大时的折线图📈",
//                "customAreasplineChartWithColorfulGradientColorZones---彩色渐变色区域填充图",
            ],
            /*Mixed Chart*/
            [
                "arearangeMixedLineChart---面积范围均线图",
                "columnrangeMixedLineChart---柱形范围图混合折线图",
                "stackingColumnMixedLineChart---堆积柱状图混合折线图",
                "scatterMixedLineChart---多种类型曲线混合图",
                "polygonMixedScatterChart---多边形混合散点图",
                "polarChartMixedChart---极地混合图",
                "columnMixedScatterChart---柱状图混合散点图",
                "aerasplinerangeMixedColumnrangeMixedLineChart---曲线面积范围混合柱形范围混合折线图",
                "boxplotMixedScatterChartWithJitterChart---带有抖动的箱线混合散点图",
                "multiLevelStopsArrGradientColorAreasplineMixedLineChart---多层次半透明渐变效果的曲线填充图混合折线图",
            ],
            /*Mixed Chart 2*/
            [
                "scatterPlotWithTrendLine---带有趋势线的散点图",
                "scatterPlotWithTrendLine2---带有趋势线的散点图 2",
                "pieMixedLineMixedColumnChart---扇形折线柱形混合图",
                "pieMixedLineMixedColumnChart2---扇形折线柱形混合图2",
                "scatterWithMultipleLinearRegressionChart---多元线性回归散点图",
                "rangeSplineAreaSplineAndMarkerChart---范围曲线图、曲线填充图和标记图混合图",
            ],
            /*Custom chart style by AAChartModel*/
            [
                "pieChart---扇形图",
                "doubleLayerPieChart---双层扇形图",
                "doubleLayerDoubleColorsPieChart---双层双色扇形图",

                "pieChartWithSoftCorners---弱圆角扇形图",
                "doubleLayerPieChartWithSoftCorners---弱圆角双层扇形图",
                "doubleLayerDoubleColorsPieChartWithSoftCorners---弱圆角双层双色扇形图",

                "pieChartWithRoundedCorners---圆角扇形图",
                "doubleLayerPieChartWithRoundedCorners---圆角双层扇形图",
                "doubleLayerDoubleColorsPieChartWithRoundedCorners---圆角双层双色扇形图",
            ],
            /*Custom Style For Column Chart*/
            [
                "colorfulColumnChart---多彩柱状图",
                "colorfulGradientColorColumnChart---多彩颜色渐变柱状图",
                "discontinuousDataColumnChart---数值不连续の柱状图",
                "randomColorfulColumnChart---随机颜色の多彩柱状图",

                "noneStackingPolarColumnChart---无堆积效果の极化柱状图",
                "normalStackingPolarColumnChart---常规堆积效果の极化柱状图",
                "percentStackingPolarColumnChart---百分比堆积效果の极化柱状图",

                "specialStyleForTheSingleDataElementOfColumnChart---单个数据元素特别风格柱状图",
                "noMoreGroupingAndOverlapEachOtherColumnChart---不分组的相互重叠柱状图",
                "noMoreGroupingAndNestedColumnChart---不分组的嵌套柱状图",
                "topRoundedCornersStackingColumnChart---顶部为圆角的堆积柱状图",
                "freeStyleRoundedCornersStackingColumnChart---各个圆角自由独立设置的堆积柱状图",

                "customBorderStyleAndStatesHoverColorColumnChart---自定义柱状图 border 样式及手指掠过图表 series 元素时的柱形颜色",
                "negativeDataMixedPositiveDataColumnChart---正负数混合的柱状图",
                "customAnimationForColumnChart---自定义柱状图动画效果",
            ],
            /*Custom Style For Bar Chart*/
            [
                "colorfulBarChart---多彩条形图",
                "colorfulGradientColorBarChart---多彩颜色渐变条形图",
                "discontinuousDataBarChart---数值不连续の条形图",
                "randomColorfulBarChart---随机颜色の多彩条形图",

                "noneStackingPolarBarChart---无堆积效果の极化条形图",
                "normalStackingPolarBarChart---常规堆积效果の极化条形图",
                "percentStackingPolarBarChart---百分比堆积效果の极化条形图",

                "specialStyleForTheSingleDataElementOfColumnChart---单个数据元素特别风格条形图",
                "noMoreGroupingAndOverlapEachOtherBarChart---不分组的相互重叠条形图",
                "noMoreGroupingAndNestedBarChart---不分组的嵌套条形图",
                "topRoundedCornersStackingBarChart---顶部为圆角的堆积条形图",
                "freeStyleRoundedCornersStackingBarChart---各个圆角自由独立设置的堆积条形图",

                "customBorderStyleAndStatesHoverColorBarChart---自定义条形图 border 样式及手指掠过图表 series 元素时的条形颜色",
                "negativeDataMixedPositiveDataBarChart---正负数混合的条形图",
                "customAnimationForBarChart---自定义条形图动画效果",
                
                "noMoreGroupingAndNestedBarChart---不分组的嵌套条形图",
                "configureNegativeColorMixedBarChart---正负数混合的条形图",
                "customSingleDataElementSpecialStyleForBarChart---单个数据元素特别风格条形图",
                "customHoverColorAndSelectColorForBarChart---自定义手指掠过图表 series 元素时的条形颜色以及选中状态下的条形颜色",
                "customNormalStackingChartDataLabelsContentAndStyleForBarChart---常规堆积图数据标签内容及样式自定义",
            ],
            /*Custom Style For Line Chart*/
            [
                "mixedLineChart",
                "stepLineChart",
                "stepAreaChart",
                "customSingleDataLabelForLineChart",
                "shadowStyleLineChart",
                "colorfulGradientLineChart",
                "customMarkerSymbolContentLineChart",
                "drawPointsWithCoordinatesForLineChart",
                "customHoverAndSelectHaloStyleForLineChart",
                "disableSomeOfLinesMouseTrackingEffectForLineChart",
                "colorfulShadowLineChart",
                "colorfulDataLabelsStepLineChart",
                "disableMarkerHoverEffectForLineChart",
                "maxAndMinDataLabelsForLineChart",
                "dashStyleTypesMixedLineChart",
                "allLineDashStyleTypesMixedLineChart",
                "shadowLineChart",
                "colorfulMarkersAndLinesLineChart",
                "colorfulMarkersAndLinesLineChart2",
                "connectNullsForSingleAASeriesElementLineChart",
                "largeDifferencesInTheNumberOfDataInDifferentSeriesElementLineChart",
                "customDifferentDataLabelsShapeForLineChart",
                "clipForAASeriesElementLineChart",
            ],
            /*Custom Style For Spline Chart*/
            [
                "mixedSplineChart",
                "stepSplineChart",
                "stepAreaChart",
                "customSingleDataLabelForSplineChart",
                "shadowStyleSplineChart",
                "colorfulGradientSplineChart",
                "customMarkerSymbolContentSplineChart",
                "drawPointsWithCoordinatesForSplineChart",
                "customHoverAndSelectHaloStyleForSplineChart",
                "disableSomeOfLinesMouseTrackingEffectForSplineChart",
                "colorfulShadowSplineChart",
                "colorfulDataLabelsStepSplineChart",
                "disableMarkerHoverEffectForSplineChart",
                "maxAndMinDataLabelsForSplineChart",
                "dashStyleTypesMixedSplineChart",
                "allLineDashStyleTypesMixedSplineChart",
                "shadowSplineChart",
                "colorfulMarkersAndLinesSplineChart",
                "colorfulMarkersAndLinesSplineChart2",
                "connectNullsForSingleAASeriesElementSplineChart",
                "largeDifferencesInTheNumberOfDataInDifferentSeriesElementSplineChart",
                "customDifferentDataLabelsShapeForSplineChart",
            ],
            /*Custom Style For Area Chart*/
            [
                "withMinusNumberAreaChart",
                "colorfulGradientAreaChart",
                "gradientColorAreaChart",
                "thresholdForAreaChart",
                "customSpecialStyleDataLabelOfSingleDataElementForAreaChart",
                "customMarkerStatesHoverStyleForAreaChart",
                "colorfulGradientColorAndColorfulDataLabelsStepAreaChart",
                "negativeColorMixedAreaChart",
                "customColorfulGradientColorZonesForAreaChart",
            ],
            /*Custom Style For Areaspline Chart*/
            [
                "withMinusNumberAreasplineChart",
                "colorfulGradientAreasplineChart",
                "gradientColorAreasplineChart",
                "thresholdForAreasplineChart",
                "customSpecialStyleDataLabelOfSingleDataElementForAreasplineChart",
                "customMarkerStatesHoverStyleForAreasplineChart",
                "colorfulGradientColorAndColorfulDataLabelsStepAreasplineChart",
                "negativeColorMixedAreasplineChart",
                "customColorfulGradientColorZonesForAreasplineChart",
            ],
            /*Custom Style For Scatter Chart*/
            [
                "customScatterChartMarkerSymbolContent",
                "drawLineMixedScatterChartWithPointsCoordinates2",
                "ScatterChartWithScrollablePlotArea",
            ],
            /*Custom Style For Bubble Chart*/
            [
                "negativeColorMixedBubbleChart",
                "showAARadialGradientPositionAllEnumValuesWithBubbleChart",
            ],
            
            /*Custom Style For Line Chart 2*/
            [
                "colorfulMarkerWithZonesChart",
             
            ],
            [
                "所有 AAChartModel 图表",
                "所有 AAOptions 图表",
                "所有 Official Sample AAOptions 图表",
                "所有类型 Random Value Data 图表",
                "ChartListTableViewVC---所有 AAChartModel 图表 TableView",
            ],

        ]
        
        chartTypeArr = [
            /*Basic types chart*/
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
            /*Special Types chart*/
            [
                AAChartType.column,
                AAChartType.bar,
                AAChartType.line,
                AAChartType.area,
                AAChartType.spline,
                AAChartType.areaspline,
                AAChartType.pie,
                AAChartType.bubble,
                AAChartType.packedbubble,
                AAChartType.scatter,
                AAChartType.arearange,
                AAChartType.areasplinerange,
                AAChartType.columnrange,
                AAChartType.boxplot,
                AAChartType.waterfall,
                AAChartType.pyramid,
                AAChartType.funnel,
                AAChartType.errorbar,
                AAChartType.gauge,
                AAChartType.polygon,
                AAChartType.columnpyramid,
            ],
            [//Empty Array,just for holding place
            ],
            /*Mixed Chart*/
            [
                "arearangeMixedLineChart",
                "columnrangeMixedLineChart",
                "stackingColumnMixedLineChart",
                "scatterMixedLineChart",
                "polygonMixedScatterChart",
                "polarChartMixedChart",
                "columnMixedScatterChart",
                "aerasplinerangeMixedColumnrangeMixedLineChart",
                "boxplotMixedScatterChartWithJitterChart",
                "multiLevelStopsArrGradientColorAreasplineMixedLineChart",
            ],
            /*Mixed Chart 2*/
            [
                "scatterPlotWithTrendLine",
                "scatterPlotWithTrendLine2",
                "pieMixedLineMixedColumnChart",
                "pieMixedLineMixedColumnChart2",
                "scatterWithMultipleLinearRegressionChart",
                "rangeSplineAreaSplineAndMarkerChart",
            ],
            /*Custom Style For Pie Chart*/
            [
                "pieChart",
                "doubleLayerPieChart",
                "doubleLayerDoubleColorsPieChart",

                "pieChartWithSoftCorners",
                "doubleLayerPieChartWithSoftCorners",
                "doubleLayerDoubleColorsPieChartWithSoftCorners",

                "pieChartWithRoundedCorners",
                "doubleLayerPieChartWithRoundedCorners",
                "doubleLayerDoubleColorsPieChartWithRoundedCorners",
            ],
            /*Custom Style For Column Chart*/
            [
                "colorfulColumnChart",
                "colorfulGradientColorColumnChart",
                "discontinuousDataColumnChart",
                "randomColorfulColumnChart",

                "noneStackingPolarColumnChart",
                "normalStackingPolarColumnChart",
                "percentStackingPolarColumnChart",

                "specialStyleForTheSingleDataElementOfColumnChart",
                "noMoreGroupingAndOverlapEachOtherColumnChart",
                "noMoreGroupingAndNestedColumnChart",
                "topRoundedCornersStackingColumnChart",
                "freeStyleRoundedCornersStackingColumnChart",

                "customBorderStyleAndStatesHoverColorColumnChart",
                "negativeDataMixedPositiveDataColumnChart",
                "customAnimationForColumnChart",
            ],
            /*Custom Style For Bar Chart*/
            [
                "colorfulBarChart",
                "colorfulGradientColorBarChart",
                "discontinuousDataBarChart",
                "randomColorfulBarChart",

                "noneStackingPolarBarChart",
                "normalStackingPolarBarChart",
                "percentStackingPolarBarChart",

                "specialStyleForTheSingleDataElementOfBarChart",
                "noMoreGroupingAndOverlapEachOtherBarChart",
                "noMoreGroupingAndNestedBarChart",
                "topRoundedCornersStackingBarChart",
                "freeStyleRoundedCornersStackingBarChart",

                "customBorderStyleAndStatesHoverColorBarChart",
                "negativeDataMixedPositiveDataBarChart",
                "customAnimationForBarChart",
                
                "noMoreGroupingAndNestedBarChart",
                "configureNegativeColorMixedBarChart",
                "customSingleDataElementSpecialStyleForBarChart",
                "customHoverColorAndSelectColorForBarChart",
                "customNormalStackingChartDataLabelsContentAndStyleForBarChart",
            ],
            /*Custom Style For Line Chart*/
            [
                "mixedLineChart",
                "stepLineChart",
                "stepAreaChart",
                "customSingleDataLabelForLineChart",
                "shadowStyleLineChart",
                "colorfulGradientLineChart",
                "customMarkerSymbolContentLineChart",
                "drawPointsWithCoordinatesForLineChart",
                "customHoverAndSelectHaloStyleForLineChart",
                "disableSomeOfLinesMouseTrackingEffectForLineChart",
                "colorfulShadowLineChart",
                "colorfulDataLabelsStepLineChart",
                "disableMarkerHoverEffectForLineChart",
                "maxAndMinDataLabelsForLineChart",
                "dashStyleTypesMixedLineChart",
                "allLineDashStyleTypesMixedLineChart",
                "shadowLineChart",
                "colorfulMarkersAndLinesLineChart",
                "colorfulMarkersAndLinesLineChart2",
                "connectNullsForSingleAASeriesElementLineChart",
                "largeDifferencesInTheNumberOfDataInDifferentSeriesElementLineChart",
                "customDifferentDataLabelsShapeForLineChart",
                "clipForAASeriesElementLineChart",
            ],
     
            
            /*Custom Style For Spline Chart*/
            [
                "mixedSplineChart",
                "stepSplineChart",
                "stepAreaChart",
                "customSingleDataLabelForSplineChart",
                "shadowStyleSplineChart",
                "colorfulGradientSplineChart",
                "customMarkerSymbolContentSplineChart",
                "drawPointsWithCoordinatesForSplineChart",
                "customHoverAndSelectHaloStyleForSplineChart",
                "disableSomeOfLinesMouseTrackingEffectForSplineChart",
                "colorfulShadowSplineChart",
                "colorfulDataLabelsStepSplineChart",
                "disableMarkerHoverEffectForSplineChart",
                "maxAndMinDataLabelsForSplineChart",
                "dashStyleTypesMixedSplineChart",
                "allLineDashStyleTypesMixedSplineChart",
                "shadowSplineChart",
                "colorfulMarkersAndLinesSplineChart",
                "colorfulMarkersAndLinesSplineChart2",
                "connectNullsForSingleAASeriesElementSplineChart",
                "largeDifferencesInTheNumberOfDataInDifferentSeriesElementSplineChart",
                "customDifferentDataLabelsShapeForSplineChart",
            ],
            /*Custom Style For Area Chart*/
            [
                "withMinusNumberAreaChart",
                "colorfulGradientAreaChart",
                "gradientColorAreaChart",
                "thresholdForAreaChart",
                "customSpecialStyleDataLabelOfSingleDataElementForAreaChart",
                "customMarkerStatesHoverStyleForAreaChart",
                "colorfulGradientColorAndColorfulDataLabelsStepAreaChart",
                "negativeColorMixedAreaChart",
                "customColorfulGradientColorZonesForAreaChart",
            ],
            /*Custom Style For Areaspline Chart*/
            [
                "withMinusNumberAreasplineChart",
                "colorfulGradientAreasplineChart",
                "gradientColorAreasplineChart",
                "thresholdForAreasplineChart",
                "customSpecialStyleDataLabelOfSingleDataElementForAreasplineChart",
                "customMarkerStatesHoverStyleForAreasplineChart",
                "colorfulGradientColorAndColorfulDataLabelsStepAreasplineChart",
                "negativeColorMixedAreasplineChart",
                "customColorfulGradientColorZonesForAreasplineChart",
            ],
    
            
            /*Custom Style For Scatter Chart*/
            [
                "customScatterChartMarkerSymbolContent",
                "drawLineMixedScatterChartWithPointsCoordinates2",
                "ScatterChartWithScrollablePlotArea",
            ],
            /*Custom Style For Bubble Chart*/
            [
                "negativeColorMixedBubbleChart",
                "showAARadialGradientPositionAllEnumValuesWithBubbleChart",
            ],
            
            /*Custom Style For Line Chart 2*/
            [
                "colorfulMarkerWithZonesChart",
             
            ],
            
            [
            ],
            
         
        ]
         
        setUpMainTableView()
    }
    
   
    private func pushToOfficalChartSampleVC(indexPathRow: Int) {
        /*OfficialChartSampleVC*/
        if #available(macCatalyst 14.0, *) {
            if #available(iOS 14.0, *) {
                if indexPathRow == 0 {
                    let myVC = ChartModelSampleListVC()
                    navigationController?.pushViewController(myVC, animated: true)
                } else if indexPathRow == 1 {
                    let vc = OfficialChartSampleVC()
                    vc.optionsItems = ChartSampleProvider.aaOptionsItems()
                } else if indexPathRow == 2 {
                    let vc = OfficialChartSampleVC()
                    vc.optionsItems = ChartSampleProvider.officalChartSampleItems()
                } else if indexPathRow == 3 {
                    let vc = OfficialChartSampleVC()
                    vc.optionsItems = ChartSampleProvider.randomValueDataItems()
                } else if indexPathRow == 4 {
                    let vc = ChartListTableViewVC()
                    navigationController?.pushViewController(vc, animated: true)
                    return
                }
                
            } else {
                // Fallback on earlier versions
            }
            
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
            
        case 0:
            let vc = BasicChartVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            let vc = SpecialChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 2:
            let vc = CustomStyleChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 3:
            let vc = MixedChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 4:
            let vc = MixedChartVC2()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)

        case 5:
            let vc = CustomStyleForPieChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)

        case 6:
            let vc = CustomStyleForColumnChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)

        case 7:
            let vc = CustomStyleForBarChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)

        case 8:
            let vc = CustomStyleForLineChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 9:
            let vc = CustomStyleForSplineChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 10:
            let vc = CustomStyleForAreaChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 11:
            let vc = CustomStyleForAreasplineChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
            
        case 12:
            let vc = CustomStyleForScatterChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 13:
            let vc = CustomStyleForBubbleChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 14:
            let vc = CustomStyleForLineChartVC2()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 15:
            pushToOfficalChartSampleVC(indexPathRow: indexPath.row)

        default:
            break
        }
    }
    
}
