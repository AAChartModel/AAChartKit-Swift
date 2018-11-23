//
//  AAOptionsConstructor.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2018/11/23.
//  Copyright © 2018 An An. All rights reserved.
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
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

import UIKit

public class AAOptionsConstructor: NSObject {
    public static func configureAAoptions(aaChartModel: AAChartModel) -> NSMutableDictionary {
        let aaChart = NSMutableDictionary()
        let chartType = aaChartModel.chartType
        
        aaChart.setValue(chartType, forKey: "type")//图表类型
        aaChart.setValue(aaChartModel.inverted, forKey: "inverted")//设置是否反转坐标轴，使X轴垂直，Y轴水平。 如果值为 true，则 x 轴默认是 倒置 的。 如果图表中出现条形图系列，则会自动反转
        aaChart.setValue(aaChartModel.backgroundColor, forKey: "backgroundColor")//图表背景色
        aaChart.setValue(true, forKey: "animation")
        aaChart.setValue(aaChartModel.zoomType, forKey: "pinchType")//设置手势缩放方向
        aaChart.setValue(true, forKey: "panning")//设置手势缩放后是否可平移
        aaChart.setValue(aaChartModel.polar, forKey: "polar")//是否辐射化图形
        aaChart.setValue(aaChartModel.marginLeft, forKey: "marginLeft")
        aaChart.setValue(aaChartModel.marginRight, forKey: "marginRight")
        
        let aaTitle = NSMutableDictionary()
        aaTitle.setValue(aaChartModel.title, forKey: "text")//标题文本内容
        aaTitle.setValue(["color":aaChartModel.titleColor!,//标题颜色
            "fontSize":"12px"], forKey: "style")//标题字体大小
        
        let aaSubtitle = NSMutableDictionary()
        aaSubtitle.setValue(aaChartModel.subtitle, forKey: "text")//副标题文本内容
        aaSubtitle.setValue(["color":aaChartModel.subtitleColor!,//副标题颜色
            "fontSize":"12px"] ,//副标题字体大小
            forKey: "style")
        
        let aaTooltip = NSMutableDictionary()
        aaTooltip.setValue(aaChartModel.tooltipEnabled, forKey: "enabled")
        aaTooltip.setValue(aaChartModel.tooltipValueSuffix, forKey: "valueSuffix")//浮动提示层数值的单位后缀
        aaTooltip.setValue(true, forKey: "shared")//多组数据浮动提示框是否共享
        aaTooltip.setValue(aaChartModel.tooltipCrosshairs, forKey: "crosshairs")//是否显示准星线
        //aaTooltip.setValue(false, forKey: "followTouchMove") //在触摸设备上，tooltip.followTouchMove选项为true（默认）时，平移需要两根手指。若要允许用一根手指平移，需要将followTouchMove设置为false。
        
        let aaSeries = NSMutableDictionary()
        aaSeries.setValue(aaChartModel.stacking, forKey: "stacking")//图表堆叠类型
        let animation = ["duration":aaChartModel.animationDuration!,
                         "easing":aaChartModel.animationType!] as [String : Any]
        aaSeries.setValue(animation, forKey: "animation")
        
        var aaPlotOptions = NSMutableDictionary()
        aaPlotOptions.setValue(aaSeries, forKey: "series")
        
        
        //数据点标记相关配置，只有线性图(折线图、曲线图、折线区域填充图、曲线区域填充图)才有数据点标记
        if     chartType == AAChartType.area.rawValue
            || chartType == AAChartType.areaSpline.rawValue
            || chartType == AAChartType.line.rawValue
            || chartType == AAChartType.spline.rawValue
            || chartType == AAChartType.scatter.rawValue {
            let aaMarker = NSMutableDictionary()
            aaMarker.setValue(aaChartModel.markerRadius, forKey: "radius")//曲线连接点半径，默认是4
            aaMarker.setValue(aaChartModel.symbol, forKey: "symbol")//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
            
            //设置曲线连接点风格样式
            if aaChartModel.symbolStyle == AAChartSymbolStyleType.innerBlank.rawValue {
                aaMarker.setValue("#ffffff", forKey: "fillColor")//点的填充色(用来设置折线连接点的填充色)
                aaMarker.setValue(2, forKey: "lineWidth")//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                aaMarker.setValue("", forKey: "lineColor")//外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色。)
            } else if aaChartModel.symbolStyle == AAChartSymbolStyleType.borderBlank.rawValue {
                aaMarker.setValue(2, forKey: "lineWidth")
                aaMarker.setValue(aaChartModel.backgroundColor, forKey: "lineColor")
            }
            
            aaSeries.setValue(aaMarker, forKey: "marker")
            aaPlotOptions.setValue(aaSeries, forKey: "series")
        }
        //配置 aaPlotOptions
        aaPlotOptions = configureAAPlotOptions(aaPlotOptions: aaPlotOptions, aaChartModel: aaChartModel)
        let aaLegend = NSMutableDictionary()
        aaLegend.setValue(aaChartModel.legendEnabled, forKey: "enabled")
        aaLegend.setValue(aaChartModel.legendLayout, forKey: "layout")
        aaLegend.setValue(aaChartModel.legendAlign, forKey: "align")
        aaLegend.setValue(aaChartModel.legendVerticalAlign, forKey: "verticalAlign")
        aaLegend.setValue(0, forKey: "borderWidth")
        aaLegend.setValue(["color":aaChartModel.axisColor!] , forKey: "itemStyle")//默认图例的文字颜色和X轴文字颜色一样
        
        let aaOptions = NSMutableDictionary()
        aaOptions.setValue(aaChart, forKey: "chart")
        aaOptions.setValue(aaTitle, forKey: "title")
        aaOptions.setValue(aaSubtitle, forKey: "subtitle")
        aaOptions.setValue(aaTooltip, forKey: "tooltip")
        aaOptions.setValue(aaLegend, forKey: "legend")
        aaOptions.setValue(aaPlotOptions, forKey: "plotOptions")
        aaOptions.setValue(aaChartModel.colorsTheme, forKey: "colors")
        aaOptions.setValue(aaChartModel.series, forKey: "series")
        aaOptions.setValue(aaChartModel.axisColor, forKey: "axisColor")
        
        //x 轴和 Y 轴的相关配置,扇形图、金字塔图和漏斗图则不需要设置 X 轴和 Y 轴的相关内容
        if (   chartType != AAChartType.pie.rawValue
            && chartType != AAChartType.pyramid.rawValue
            && chartType != AAChartType.funnel.rawValue) {
            configureAxisContentAndStyle(aaOptions: aaOptions, aaChartModel: aaChartModel)
        }
        return aaOptions
    }
    
    
  private static  func configureAxisContentAndStyle(aaOptions: NSMutableDictionary, aaChartModel: AAChartModel) {
        let aaXAxis = NSMutableDictionary()
        aaXAxis.setValue(["enabled":aaChartModel.xAxisLabelsEnabled!], forKey: "label")// X 轴是否显示文字
        aaXAxis.setValue(aaChartModel.xAxisReversed, forKey: "reversed")//是否反转 X 轴
        aaXAxis.setValue(aaChartModel.xAxisGridLineWidth, forKey: "gridLineWidth")// X 轴网格线宽度
        aaXAxis.setValue(aaChartModel.categories, forKey: "categories")
        aaXAxis.setValue(aaChartModel.xAxisVisible, forKey: "visible")
        
        let aaYAxis = NSMutableDictionary()
        aaYAxis.setValue(["enabled":aaChartModel.yAxisLabelsEnabled!] , forKey: "label")// Y 轴是否显示数字
        aaYAxis.setValue(aaChartModel.yAxisReversed, forKey: "reversed")//是否反转 Y 轴
        aaYAxis.setValue(aaChartModel.yAxisGridLineWidth, forKey: "gridLineWidth") // Y 轴网格线宽度
        aaYAxis.setValue(["text":aaChartModel.yAxisTitle], forKey: "title")//Y 轴标题
        aaYAxis.setValue(aaChartModel.yAxisLineWidth, forKey: "lineWidth")
        aaYAxis.setValue(aaChartModel.yAxisVisible, forKey: "visible")
        
        aaOptions.setValue(aaXAxis, forKey: "xAxis")
        aaOptions.setValue(aaYAxis, forKey: "yAxis")
    }
    
    private static  func configureAAPlotOptions(aaPlotOptions: NSMutableDictionary, aaChartModel: AAChartModel) -> NSMutableDictionary {
        let plotOptions = NSMutableDictionary.init(dictionary: aaPlotOptions)
        let chartType = aaChartModel.chartType
        
        if chartType == AAChartType.column.rawValue {
            let aaColumn = NSMutableDictionary()
            aaColumn.setValue(0, forKey: "borderWidth")
            aaColumn.setValue(aaChartModel.borderRadius, forKey: "borderRadius")
            aaColumn.setValue(["enabled":aaChartModel.dataLabelEnabled!] , forKey: "dataLabels" )
            if aaChartModel.polar == true {
                aaColumn.setValue(0, forKey: "pointPadding")
                aaColumn.setValue(0.005, forKey: "groupPadding")
            }
            plotOptions.setValue(aaColumn, forKey: AAChartType.column.rawValue)
        } else if chartType == AAChartType.bar.rawValue {
            let aabar = NSMutableDictionary()
            aabar.setValue(0, forKey: "borderWidth")
            aabar.setValue(aaChartModel.borderRadius, forKey: "borderRadius")
            aabar.setValue(["enabled":aaChartModel.dataLabelEnabled!] , forKey: "dataLabels" )
            if aaChartModel.polar == true {
                aabar.setValue(0, forKey: "pointPadding")
                aabar.setValue(0.005, forKey: "groupPadding")
            }
            plotOptions.setValue(aabar, forKey: AAChartType.bar.rawValue)
        } else if chartType == AAChartType.area.rawValue {
            let aaArea = NSMutableDictionary()
            aaArea.setValue(["enabled":aaChartModel.dataLabelEnabled!] , forKey: "dataLabels")
            plotOptions.setValue(aaArea, forKey: AAChartType.area.rawValue)
        } else if chartType == AAChartType.areaSpline.rawValue {
            let aaAreaSpline = NSMutableDictionary()
            aaAreaSpline.setValue(["enabled":aaChartModel.dataLabelEnabled!] , forKey: "dataLabels")
            plotOptions.setValue(aaAreaSpline, forKey: AAChartType.areaSpline.rawValue)
        } else if chartType == AAChartType.line.rawValue {
            let aaline = NSMutableDictionary()
            aaline.setValue(["enabled":aaChartModel.dataLabelEnabled!] , forKey: "dataLabels")
            plotOptions.setValue(aaline, forKey: AAChartType.line.rawValue)
        } else if chartType == AAChartType.spline.rawValue {
            let aaspline = NSMutableDictionary()
            aaspline.setValue(["enabled":aaChartModel.dataLabelEnabled!] , forKey: "dataLabels")
            plotOptions.setValue(aaspline, forKey: AAChartType.spline.rawValue)
        } else if chartType == AAChartType.pie.rawValue {
            let aaPie = NSMutableDictionary()
            aaPie.setValue(true, forKey: "allowPointSelect")
            aaPie.setValue("pointer", forKey: "cursor")
            aaPie.setValue(aaChartModel.legendEnabled, forKey: "showInLegend")
            aaPie.setValue(["enabled":aaChartModel.dataLabelEnabled!,
                            "format":"{point.name}"] , forKey: "dataLabels")
            plotOptions.setValue(aaPie, forKey: AAChartType.spline.rawValue)
        } else if chartType == AAChartType.columnRange.rawValue {
            let aaColumnRange = NSMutableDictionary()
            aaColumnRange.setValue(["enabled":aaChartModel.dataLabelEnabled!] , forKey: "dataLabels")
            plotOptions.setValue(aaColumnRange, forKey: AAChartType.columnRange.rawValue)
        }
        
        return plotOptions
    }
    
}

