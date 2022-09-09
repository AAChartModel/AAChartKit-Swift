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

@available(iOS 10.0, macCatalyst 13.1, *)
class MainVC: UIViewController {
    private var sectionTitleArr = [String]()
    private var chartTypeTitleArr = [[String]]()
    private var chartTypeArr = [[Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "AAInfographics"
        
        sectionTitleArr = [
            "Basic Type Chart | 基础类型图表",
            "Special Type Chart | 特殊类型图表",
            "Custom Style Chart| 一些自定义风格样式图表",
            "Mixed Chart | 混合图形",
            "Only Refresh data | 单纯刷新数据",
            "Double Chart View | 同时显示多个图表",
            "Rendering Animation types | 渲染动画示例",
            "Hide Or Show Chart Series | 隐藏或显示内容",
            "Evaluate JS String Function | 执行js函数",
            "Draw Chart With AAOptions | 通过Options绘图",
            "JS Function For AAOptionns | 通过带有 JS 函数的 Options 绘图",
            "Scrolling update chart data | 滚动刷新图表数据",
            "Scrollable chart | 可滚动の图表",
            //                  "Scrollable chart |可滚动の图表",
            "Data Sorting Chart With Animation| 图表动态排序",
            "Chart Options Advanced Updating | 图表高级更新",
            "XIB AAChartView | 在 XIB 中创建 AAChartView",
            "Custom Chart Event Callback | 自定义交互事件回调",
            "JS Function For AAChartEvents---通过 JSFunction 自定义 AAChartEvents 的事件",
        ]
        
        chartTypeTitleArr = [
            /*Basic types chart*/
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
                "Polygon Chart---多边形图"
            ],
            /*Custom chart style by AAChartModel*/
            [
                "Colorful Column Chart---多彩条形图",
                "Colorful Gradient Color Chart---多彩颜色渐变条形图",
                "Discontinuous Data Chart---数值不连续の图表",
                "Mixed Line Chart---虚实线混合折线图",
                "Random Colors Colorful Column Chart---随机颜色の多彩柱形图",
                "Gradient Color Bar Chart---颜色渐变条形图",
                "Stacking polar chart---百分比堆积效果の极地图",
                "Area Chart with minus--带有负数の区域填充图",
                "Step Line Chart--直方折线图",
                "Step Area Chart--直方折线填充图",
                "Nightingale Rose Chart---南丁格尔玫瑰图",
                "Specific Data Customize Datalabel",
                "Chart With Shadow Style---带有阴影效果の图表",
                "Colorful gradient Areaspline Chart---多层次渐变区域填充图",
                "Colorful gradient Spline Chart---多层次渐变曲线图",
                "Gradient Color Areaspline Chart---半透明渐变效果区域填充图",
                "Special Style Marker Of Single Data Element Chart",
                "Special Style Column Of Single Data Element Chart",
                "configure Area Chart Threshold---自定义阈值",
                "custom Scatter Chart Marker Symbol Content---自定义散点图の标志点内容",
                "custom Line Chart Marker Symbol Content---自定义折线图の标志点内容",
                "Triangle Radar Chart---三角形雷达图",
                "Quadrangle Radar Chart---四角形雷达图",
                "Pentagon Radar Chart---五角形雷达图",
                "Hexagon Radar Chart----六角形雷达图",
                "Draw Line Chart With Points Coordinates----通过点坐标来绘制折线图",
                "custom Special Style DataLabel Of Single Data Element Chart",
                "custom Bar Chart Hover Color and Select Color---自定义条形图手指滑动颜色和单个长条被选中颜色",
                "custom Line Chart Chart Hover And Select Halo Style",
                "custom Spline Chart Marker States Hover Style",
                "customNormalStackingChartDataLabelsContentAndStyle---自定义堆积柱状图 DataLabels の内容及样式",
                "upsideDownPyramidChart---倒立の金字塔图",
                "doubleLayerPieChart---双层嵌套扇形图",
                "doubleLayerDoubleColorsPieChart---双层嵌套双颜色主题扇形图",
                "disableSomeOfLinesMouseTrackingEffect---针对部分数据列关闭鼠标或手指跟踪行为",
                "configureColorfulShadowChart---彩色阴影效果の曲线图",
                "configureColorfulDataLabelsStepLineChart---彩色 DataLabels の直方折线图",
                "configureColorfulGradientColorAndColorfulDataLabelsStepAreaChart---彩色渐变效果且彩色 DataLabels の直方折线填充图",
                "disableSplineChartMarkerHoverEffect---禁用曲线图の手指滑动 marker 点の光圈变化放大の效果",
                "configureMaxAndMinDataLabelsForChart---为图表最大值最小值添加 DataLabels 标记",
                "customVerticalXAxisCategoriesLabelsByHTMLBreakLineTag---通过 HTML 的换行标签来实现图表的 X 轴的 分类文字标签的换行效果",
                "noMoreGroupingAndOverlapEachOtherColumnChart---不分组的相互重叠柱状图📊",
                "noMoreGroupingAndNestedColumnChart---不分组的嵌套柱状图📊",
                "topRoundedCornersStackingColumnChart---顶部为圆角的堆积柱状图📊",
                "freeStyleRoundedCornersStackingColumnChart---各个圆角自由独立设置的堆积柱状图📊",
                "customColumnChartBorderStyleAndStatesHoverColor---自定义柱状图 border 样式及手指掠过图表 series 元素时的柱形颜色",
                
                "customLineChartWithColorfulMarkersAndLines---彩色连接点和连接线的折线图📈",
                "customLineChartWithColorfulMarkersAndLines2---彩色连接点和连接线的多组折线的折线图📈",
                "drawLineChartWithPointsCoordinates---通过点坐标来绘制折线图",
                "configureSpecialStyleColumnForNegativeDataMixedPositiveData---为正负数混合的柱形图自定义特殊样式效果",
                "configureMultiLevelStopsArrGradientColorAreasplineMixedLineChart---多层次半透明渐变效果的曲线填充图混合折线图📈"
            ],
            /*Mixed Chart*/
            [
                "Arearange Mixed Line---面积范围均线图",
                "Columnrange Mixed Line---柱形范围图混合折线图",
                "Stacking Column Mixed Line---堆积柱形图混合折线图",
                "Dash Style Types Mixed---多种类型曲线混合图",
                "Negative Color Mixed Column Chart---基准线以下异色混合图",
                "scatterMixedLine---散点图混合折线图",
                "Negative Color Mixed Bubble Chart---基准线以下异色气泡图",
                "Polygon Mixed Scatter---多边形混合散点图",
                "Polar Chart Mixed---极地混合图",
                "Column Mixed Scatter---柱形图混合散点图",
                "Pie Mixed Line Mixed Column---扇形折线柱形混合图",
                "Line Chart With Shadow---带有阴影效果の折线图",
                "Negative Color Mixed Areaspline chart---基准线以下异色混合曲线填充图",
                "Aerasplinerange Mixed Columnrange Mixed Line Chart---曲线面积范围混合柱形范围混合折线图"
            ],
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
                " Double Charts Linkedwork 双表联动",
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
                "confgureBlinkMarkerChart---自定义闪烁 marker 样式",
                "configureSpecialStyleMarkerOfSingleDataElementChartWithBlinkEffect---自定义闪烁 marker 样式2",
                "configureScatterChartWithBlinkEffect---带有闪烁特效 marker 的散点图"
            ],
            /*JavaScript Formatter Function */
            [
                "customAreaChartTooltipStyleWithSimpleFormatString---简单字符串拼接",
                "customAreaChartTooltipStyleWithDifferentUnitSuffix---自定义不同单位后缀",
                "customAreaChartTooltipStyleWithColorfulHtmlLabels---自定义多彩颜色文字",
                "customLineChartTooltipStyleWhenValueBeZeroDoNotShow---值为0时,在tooltip中不显示",
                "customBoxplotTooltipContent---自定义箱线图の浮动提示框头部内容",
                "customYAxisLabels---自定义Y轴文字1",
                "customYAxisLabels2---自定义Y轴文字2",
                "customStackedAndGroupedColumnChartTooltip---自定义分组堆积柱状图tooltip内容",
                "Double X Axes Mirror Chart---双 X 轴镜像图表",
                "custom Arearange Chart Tooltip---自定义面积范围图浮动提示框",
                "customLineChartOriginalPointPositionByConfiguringXAxisFormatterAndTooltipFormatter---调整折线图の X 轴左边距",
                "customTooltipWhichDataSourceComeFromOutSideRatherThanSeries---通过来自外部の数据源来自定义 tooltip (而非常规の来自图表の series)",
                "custom Spider Chart Style---自定义蜘蛛图🕷🕸样式",
                "customize Every DataLabel Singlely By DataLabels Formatter---通过 DataLabels 的 formatter 函数来实现单个数据标签🏷自定义",
                "custom XAxis Labels Be Images---自定义柱形图 X 轴 labels 为一组图片🖼",
                "custom Legend Item Click Event---自定义图例点击事件🖱",
                "customTooltipPostionerFunction---自定义浮动提示框 positioner 函数",
                "fixedTooltipPositionByCustomPositionerFunction---通过 Positioner 函数来实现一个位置固定的提示框",
                "disableColumnChartUnselectEventEffectBySeriesPointEventClickFunction---通过 Series 的 Point 的选中事件函数来禁用条形图反选效果",
                "customAreasplineChartTooltipStyleByDivWithCSS---通过自定义 div 的 css 样式来自定义复杂效果的 tooltip 浮动提示框",
                "configureTheAxesLabelsFormattersOfDoubleYAxesChart---配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数示例 1",
                "configureTheAxesLabelsFormattersOfDoubleYAxesChart2---配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数示例 2",
                "configureTheAxesLabelsFormattersOfDoubleYAxesChart3---配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数 示例 3",
                "makePieChartShow0Data---使饼图显示为 0 的数据",
                "customColumnChartXAxisLabelsTextByInterceptTheFirstFourCharacters---通过截取前四个字符来自定义 X 轴 labels",
                "customColumnChartBorderStyleAndStatesHoverColor---自定义柱状图 border 样式及手指掠过图表 series 元素时的柱形颜色(同时禁用 tooltip)",
                "customPlotAreaOutsideComlicatedTooltipStyle"
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
                "自定义监听触摸结束事件---CustomTouchEndEventCallbackVC"
            ],
            /*JS Function For AAChartEvents*/
            [
                "setCrosshairAndTooltipToTheDefaultPositionAfterLoadingChart---图表加载完成后设置 crosshair 和 tooltip 到默认位置",
                "generalDrawingChart---普通绘图",
                "advancedTimeLineChart---高级时间轴绘图",
                "configureBlinkMarkerChart---配置闪烁特效的 marker 图表",
                "configureSpecialStyleMarkerOfSingleDataElementChartWithBlinkEffect---配置闪烁特效的 marker 图表2",
                "configureScatterChartWithBlinkEffect---配置闪烁特效的散点图",
                "automaticallyHideTooltipAfterItIsShown---在浮动提示框显示后自动隐藏",
                "dynamicHeightGridLineAreaChart---动态高度的网格线区域填充图"
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
            ],
            [//Empty Array,just for holding place
            ],
            /*Mixed Chart*/
            [
                "arearangeMixedLine",
                "columnrangeMixedLine",
                "stackingColumnMixedLine",
                "dashStyleTypeMixed",
                "negativeColorMixed",
                "scatterMixedLine",
                "negativeColorMixedBubble",
                "polygonMixedScatter",
                "polarChartMixed",
                "columnMixedScatter",
                "PieMixedLineMixedColumn",
                "LineChartWithShadow",
                "NegativeColorMixedAreasplineChart",
                "AerasplinerangeMixedColumnrangeMixedLineChart"
            ],
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
            [//Empty Array,just for holding place
            ],
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
            [//Empty Array,just for holding place
            ],
            [//Empty Array,just for holding place
            ],
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
            [//Empty Array,just for holding place
            ],
            [//Empty Array,just for holding place
            ],
            [//Empty Array,just for holding place
            ],
            
        ]
        
        view.backgroundColor = .white
        
        setUpMainTableView()
    }
    
    private func setUpMainTableView() {
        let tableView = UITableView()
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.rowHeight = 45
        tableView.sectionHeaderHeight = 45
        tableView.sectionIndexColor = .red
        view.addSubview(tableView)
    }
    
    private func kRGBColorFromHex(rgbValue: Int) -> UIColor {
        UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,
                green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,
                blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,
                alpha: 1.0)
    }
}

@available(macCatalyst 13.1, *)
extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        chartTypeTitleArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chartTypeTitleArr[section].count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var listTitles = [String]()
        for item: String in sectionTitleArr {
            let titleStr = item.prefix(1)
            listTitles.append(String(titleStr))
        }
        return listTitles
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeaderView = UIView()
        sectionHeaderView.backgroundColor = kRGBColorFromHex(rgbValue: 0x7B68EE)//熏衣草花の淡紫色
        
        let sectionTitleLabel = UILabel()
        sectionTitleLabel.frame = sectionHeaderView.bounds
        sectionTitleLabel.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        sectionTitleLabel.text = sectionTitleArr[section]
        sectionTitleLabel.textColor = .white
        sectionTitleLabel.font = .boldSystemFont(ofSize: 17)
        sectionTitleLabel.textAlignment = .center
        sectionHeaderView.addSubview(sectionTitleLabel)
        
        return sectionHeaderView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cell"
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        
        let cellTitle = chartTypeTitleArr[indexPath.section][indexPath.row]
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.text = cellTitle
        cell?.textLabel?.font = .systemFont(ofSize: 16)
        cell?.accessoryType = .disclosureIndicator
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .white
        } else {
            cell.backgroundColor = kRGBColorFromHex(rgbValue: 0xE6E6FA)// kRGBColorFromHex(rgbValue: 0xF5F5F5)//白烟
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            /*Basic Type Charts*/
            let vc = BasicChartVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            /*Special Type Charts*/
            let vc = SpecialChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            navigationController?.pushViewController(vc, animated: true)
            
        case 2:
            /*Mixed Type Charts*/
            let vc = CustomStyleChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            navigationController?.pushViewController(vc, animated: true)
            
        case 3:
            /*Mixed Type Charts*/
            let vc = MixedChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            navigationController?.pushViewController(vc, animated: true)
            
        case 4:
            /*Only Refresh Chart Data Dynamiclly*/
            let vc = OnlyRefreshChartDataVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            vc.step = false
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            navigationController?.pushViewController(vc, animated: true)
            
        case 5:
            /*Show Many Charts In the Same View*/
            if indexPath.row == 0 {
                let vc = ShowManyChartViewVC()
                navigationController?.pushViewController(vc, animated: true)
            } else {
                let vc = DoubleChartsLinkedWorkVC()
                navigationController?.pushViewController(vc, animated: true)
            }
            
        case 6:
            /*Chart Rendering Animation Types*/
            let vc = AnimationTypeVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            vc.step = false
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            navigationController?.pushViewController(vc, animated: true)
            
        case 7:
            /*Hide Or Show Chart Series Element*/
            let vc = HideOrShowChartSeriesVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            vc.step = false
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            navigationController?.pushViewController(vc, animated: true)
            
        case 8:
            /*Evaluate JavaScript String Function*/
            let vc = EvaluateJSStringFunctionVC()
            vc.sampleChartTypeIndex = indexPath.row
            navigationController?.pushViewController(vc, animated: true)
            
        case 9:
            /*Draw Chart With AAOptions Instance Object*/
            let vc = DrawChartWithAAOptionsVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            navigationController?.pushViewController(vc, animated: true)
            
        case 10:
            /*Custom Tooltip With JavaScript Formatter Function */
            let vc = JSFormatterFunctionVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            navigationController?.pushViewController(vc, animated: true)
            
        case 11:
            /*Scrolling update Chart Data Dynamiclly*/
            let vc = ScrollingUpdateDataVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            vc.step = false
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            navigationController?.pushViewController(vc, animated: true)
            
        case 12:
            /*Scrollable Charts*/
            let vc = ScrollableChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            navigationController?.pushViewController(vc, animated: true)
            
        case 13:
            /*Data Sorting With Animation Charts*/
            let vc = DataSortingWithAnimationChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            if indexPath.row >= 3 {
                vc.polar = true
            }
            navigationController?.pushViewController(vc, animated: true)
            
        case 14:
            /*Advanced Updating Feature*/
            let vc = AdvancedUpdatingFeatureVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            navigationController?.pushViewController(vc, animated: true)
            
        case 15:
            /*Special Type Charts*/
            let vc = TestAAChartViewForXibVC()
//            vc.selectedIndex = indexPath.row
//            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            navigationController?.pushViewController(vc, animated: true)
          
        case 16:
            /*CustomTouchEndEventCallbackVCs*/
            let vc = CustomTouchEndEventCallbackVC()
            navigationController?.pushViewController(vc, animated: true)

        case 17:
            /*JS Function For AAChartEventsVC*/
            let vc = JSFunctionForAAChartEventsVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            navigationController?.pushViewController(vc, animated: true)
            
        default:
            break
        }
    }
    
}
