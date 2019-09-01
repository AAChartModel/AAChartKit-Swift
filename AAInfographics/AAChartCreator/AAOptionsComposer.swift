//
//  AAOptionsComposer.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/8/31.
//  Copyright © 2019 An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 *  🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit-Swift/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

import UIKit

class AAOptionsComposer: NSObject {
    
    public static func configureAAOptions(
        aaChartModel: AAChartModel
        ) -> AAOptions {
        let aaChart = AAChart()
            .type(aaChartModel.chartType!)//绘图类型
            .inverted(aaChartModel.inverted)//设置是否反转坐标轴，使X轴垂直，Y轴水平。 如果值为 true，则 x 轴默认是 倒置 的。 如果图表中出现条形图系列，则会自动反转
            .backgroundColor(aaChartModel.backgroundColor)//设置图表的背景色(包含透明度的设置)
            .pinchType(aaChartModel.zoomType?.rawValue)//设置手势缩放方向
            .panning(true)//设置手势缩放后是否可平移
            .polar(aaChartModel.polar)//是否极化图表(开启极坐标模式)
            .marginLeft(aaChartModel.marginLeft)//图表左边距
            .marginRight(aaChartModel.marginRight)//图表右边距
        
        let aaTitle = AATitle()
            .text(aaChartModel.title)//标题文本内容
            .style(AAStyle()
                .color(aaChartModel.titleFontColor)//Title font color
                .fontSize(aaChartModel.titleFontSize!)//Title font size
                .fontWeight(aaChartModel.titleFontWeight)//Title font weight
        )
        
        let aaSubtitle = AASubtitle()
            .text(aaChartModel.subtitle)//副标题内容
            .align(aaChartModel.subtitleAlign)//图表副标题文本水平对齐方式。可选的值有 “left”，”center“和“right”。 默认是：center.
            .style(AAStyle()
                .color(aaChartModel.subtitleFontColor)//Subtitle font color
                .fontSize(aaChartModel.subtitleFontSize!)//Subtitle font size
                .fontWeight(aaChartModel.subtitleFontWeight)//Subtitle font weight
        )
        
        let aaTooltip = AATooltip()
            .enabled(aaChartModel.tooltipEnabled)//启用浮动提示框
            .shared(true)//多组数据共享一个浮动提示框
            .crosshairs(true)//启用准星线
            .valueSuffix(aaChartModel.tooltipValueSuffix)//浮动提示框的单位名称后缀
        
        let aaPlotOptions = AAPlotOptions()
            .series(AASeries()
                .stacking(aaChartModel.stacking?.rawValue)//设置是否百分比堆叠显示图形
        )
        
        if (aaChartModel.animationType != .linear) {
            aaPlotOptions
                .series?.animation(AAAnimation()
                    .easing(aaChartModel.animationType?.rawValue)
                    .duration(aaChartModel.animationDuration)
            )
        }
        
        configureAAPlotOptionsMarkerStyle(aaChartModel, aaPlotOptions)
        configureAAPlotOptionsDataLabels(aaPlotOptions, aaChartModel)
        
        let aaLegend = AALegend()
            .enabled(aaChartModel.legendEnabled)//是否显示 legend
        
        let aaOptions = AAOptions()
            .chart(aaChart)
            .title(aaTitle)
            .subtitle(aaSubtitle)
            .tooltip(aaTooltip)
            .plotOptions(aaPlotOptions)
            .legend(aaLegend)
            .series(aaChartModel.series)
            .colors(aaChartModel.colorsTheme)//设置颜色主题
            .touchEventEnabled(aaChartModel.touchEventEnabled)//是否支持点击事件
        
        configureAxisContentAndStyle(aaOptions, aaChartModel)
        
        return aaOptions
    }
    
    private static func configureAAPlotOptionsMarkerStyle(
        _ aaChartModel: AAChartModel,
        _ aaPlotOptions: AAPlotOptions
        ) {
        let chartType = aaChartModel.chartType!
        
        //数据点标记相关配置，只有线性图(折线图、曲线图、折线区域填充图、曲线区域填充图)才有数据点标记
        if     chartType == .area
            || chartType == .areaspline
            || chartType == .line
            || chartType == .spline
            || chartType == .scatter {
            let aaMarker = AAMarker()
                .radius(aaChartModel.markerRadius)//曲线连接点半径，默认是4
                .symbol(aaChartModel.symbol?.rawValue)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
            if (aaChartModel.symbolStyle == .innerBlank) {
                aaMarker.fillColor("#ffffff")//点的填充色(用来设置折线连接点的填充色)
                    .lineWidth(2.0)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                    .lineColor("")//外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
            } else if (aaChartModel.symbolStyle == .borderBlank) {
                aaMarker.lineWidth(2.0)
                    .lineColor(aaChartModel.backgroundColor)
            }
            let aaSeries = aaPlotOptions.series
            aaSeries?.marker(aaMarker)
        }
    }
    

    private static  func configureAAPlotOptionsDataLabels(
        _ aaPlotOptions: AAPlotOptions,
        _ aaChartModel: AAChartModel
        ) {
        let chartType = aaChartModel.chartType!
        
        var aaDataLabels = AADataLabels()
        .enabled(aaChartModel.dataLabelsEnabled)
        if (aaChartModel.dataLabelsEnabled == true) {
            aaDataLabels = aaDataLabels
                .style(AAStyle()
                    .color(aaChartModel.dataLabelsFontColor)
                    .fontSize(aaChartModel.dataLabelsFontSize!)
                    .fontWeight(aaChartModel.dataLabelsFontWeight)
            )
        }
        
        switch chartType {
        case .column:
            let aaColumn = AAColumn()
                .borderWidth(0)
                .borderRadius(aaChartModel.borderRadius)
                .dataLabels(aaDataLabels)
            if (aaChartModel.polar == true) {
                aaColumn.pointPadding(0)
                    .groupPadding(0.005)
            }
            aaPlotOptions.column(aaColumn)
        case .bar:
            let aaBar = AABar()
                .borderWidth(0)
                .borderRadius(aaChartModel.borderRadius)
                .dataLabels(aaDataLabels)
            if (aaChartModel.polar == true) {
                aaBar.pointPadding(0)
                    .groupPadding(0.005)
            }
            aaPlotOptions.bar(aaBar)
        case .area:
            aaPlotOptions.area(AAArea().dataLabels(aaDataLabels))
        case .areaspline:
            aaPlotOptions.areaspline(AAAreaspline().dataLabels(aaDataLabels))
        case .line:
            aaPlotOptions.line(AALine().dataLabels(aaDataLabels))
        case .spline:
            aaPlotOptions.spline(AASpline().dataLabels(aaDataLabels))
        case .pie:
            let aaPie = AAPie()
                .allowPointSelect(true)
                .cursor("pointer")
                .showInLegend(true)
            if (aaChartModel.dataLabelsEnabled == true) {
                aaDataLabels.format("<b>{point.name}</b>: {point.percentage:.1f} %")
            }
            aaPlotOptions.pie(aaPie.dataLabels(aaDataLabels))
        case .columnrange:
            aaPlotOptions.columnrange(AAColumnrange()
                .dataLabels(aaDataLabels)
                .borderRadius(0)
                .borderWidth(0))
        case .arearange:
            aaPlotOptions.arearange(AAArearange().dataLabels(aaDataLabels))
        default: break
        }
    }
    
    private static func configureAxisContentAndStyle(
        _ aaOptions: AAOptions,
        _ aaChartModel: AAChartModel
        ) {
        let chartType = aaChartModel.chartType
        
        //x 轴和 Y 轴的相关配置,扇形图、金字塔图和漏斗图则不需要设置 X 轴和 Y 轴的相关内容
        if (   chartType != .pie
            && chartType != .pyramid
            && chartType != .funnel) {
            let aaXAxis = AAXAxis()
                .labels(AALabels()
                    .enabled(aaChartModel.xAxisLabelsEnabled)//设置 x 轴是否显示文字
                )
                .reversed(aaChartModel.xAxisReversed)
                .gridLineWidth(aaChartModel.xAxisGridLineWidth)//x轴网格线宽度
                .categories(aaChartModel.categories)
                .visible(aaChartModel.xAxisVisible)//x轴是否可见
                .tickInterval(aaChartModel.xAxisTickInterval) //x轴坐标点间隔数
            
            let aaYAxis = AAYAxis()
                .labels(AALabels()
                    .enabled(aaChartModel.yAxisLabelsEnabled)
                )//设置 y 轴是否显示数字
                .min(aaChartModel.yAxisMin)//设置 y 轴最小值,最小值等于零就不能显示负值了
                .max(aaChartModel.yAxisMax)//y轴最大值
                .allowDecimals(aaChartModel.yAxisAllowDecimals)//是否允许显示小数
                .reversed(aaChartModel.yAxisReversed)
                .gridLineWidth(aaChartModel.yAxisGridLineWidth)//y轴网格线宽度
                .lineWidth(aaChartModel.yAxisLineWidth)//设置 y轴轴线的宽度,为0即是隐藏 y轴轴线
                .visible(aaChartModel.yAxisVisible)
                .title(AATitle()
                        .text(aaChartModel.yAxisTitle)
                 )//y 轴标题
            
            aaOptions.xAxis(aaXAxis)
                .yAxis(aaYAxis)
        }
    }
    
}
