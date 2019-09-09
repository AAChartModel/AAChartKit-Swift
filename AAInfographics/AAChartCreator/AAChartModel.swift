//
//  AAChartModel.swift
//  AAChartKit-Swift
//
//  Created by An An  on 17/4/19.
//  Copyright © 2017年 An An . All rights reserved.
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
 * And if you want to contribute for self project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

 public enum AAChartAnimationType: Int {
    case linear
    case easeInQuad
    case easeOutQuad
    case easeInOutQuad
    case easeInCubic
    case easeOutCubic
    case easeInOutCubic
    case easeInQuart
    case easeOutQuart
    case easeInOutQuart
    case easeInQuint
    case easeOutQuint
    case easeInOutQuint
    case easeInSine
    case easeOutSine
    case easeInOutSine
    case easeInExpo
    case easeOutExpo
    case easeInOutExpo
    case easeInCirc
    case easeOutCirc
    case easeInOutCirc
    case easeOutBounce
    case easeInBack
    case easeOutBack
    case easeInOutBack
    case elastic
    case swingFromTo
    case swingFrom
    case swingTo
    case bounce
    case bouncePast
    case easeFromTo
    case easeFrom
    case easeTo
}

public enum AAChartType: String {
    case column
    case bar
    case area
    case areaspline
    case line
    case spline
    case scatter
    case pie
    case bubble
    case pyramid
    case funnel
    case columnrange
    case arearange
    case areasplinerange
    case boxplot
    case waterfall
    case polygon
}

public enum AAChartSubtitleAlignType: String {
    case left, center, right
}

public enum AAChartZoomType: String {
    case none, x, y, xy
}

public enum AAChartStackingType: String {
    case none = "", normal, percent
}

public enum AAChartSymbolType: String {
    case circle, square, diamond, triangle, triangleDown  = "triangle-down"
}

public enum AAChartSymbolStyleType: String {
    case normal, innerBlank, borderBlank
}

public enum AAChartFontWeightType: String {
    case thin, regular, bold
}

public enum AALineDashStyleType: String {
    case solid
    case shortDash
    case shortDot
    case shortDashDot
    case shortDashDotDot
    case dot
    case dash
    case longDash
    case dashDot
    case longDashDot
    case longDashDotDot
}


public class AAChartModel: AAObject {
    public var animationType: AAChartAnimationType?        //动画类型
    public var animationDuration: Int?                     //动画时间
    public var title: String?                              //标题内容
    public var titleFontColor: String?                     //标题字体颜色
    public var titleFontSize: Float?                       //标题字体大小
    public var titleFontWeight: AAChartFontWeightType?     //标题字体粗细
    public var subtitle: String?                           //副标题内容
    public var subtitleAlign: String?                      //副标题文本水平对齐方式
    public var subtitleFontColor: String?                  //副标题字体颜色
    public var subtitleFontSize: Float?                    //副标题字体大小
    public var subtitleFontWeight: AAChartFontWeightType?  //副标题字体粗细
    public var axesTextColor: String?                      //x 轴和 y 轴文字颜色
    public var chartType: AAChartType?                     //图表类型
    public var stacking: AAChartStackingType?              //堆积样式
    public var symbol: AAChartSymbolType?                  //折线曲线连接点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
    public var symbolStyle: AAChartSymbolStyleType?        //折线或者曲线的连接点是否为空心的
    public var zoomType: AAChartZoomType?                  //缩放类型 AAChartZoomTypeX表示可沿着 x 轴进行手势缩放
    public var inverted: Bool?                             //x 轴是否翻转(垂直)
    public var xAxisReversed: Bool?                        //x 轴翻转
    public var yAxisReversed: Bool?                        //y 轴翻转
    public var polar: Bool?                                //是否极化图形(变为雷达图)
    public var marginLeft: Float?                          //图表左边距
    public var marginRight: Float?                         //图表右边距
    public var marginBottom: Float?                        //图表底部边距
    public var dataLabelsEnabled: Bool?                    //数据标签是否显示
    public var dataLabelsFontColor: String?                //数据标签的字体颜色
    public var dataLabelsFontSize: Float?                  //数据标签的字体大小
    public var dataLabelsFontWeight: AAChartFontWeightType?//数据标签的字体粗细
    public var xAxisLabelsEnabled: Bool?                   //x 轴是否显示数据
    public var categories: [String]?                       //x 轴是否显示数据
    public var xAxisGridLineWidth: Float?                  //x 轴网格线的宽度
    public var xAxisVisible: Bool?                         //x 轴是否显示
    public var xAxisTickInterval: Int?                     //x 轴刻度线间隔
    public var yAxisVisible: Bool?                         //y 轴是否显示
    public var yAxisLabelsEnabled: Bool?                   //y 轴是否显示数据
    public var yAxisTitle: String?                         //y 轴标题
    public var yAxisLineWidth: Float?                      //y 轴轴线的宽度
    public var yAxisMin: Float?                            //y 轴起始位置的最小值
    public var yAxisMax: Float?                            //y 轴结束位置的最大值
    public var yAxisAllowDecimals: Bool?                   //y 轴是否允许小数
    public var yAxisGridLineWidth: Float?                  //y 轴网格线的宽度
    public var tooltipEnabled: Bool?                       //是否显示浮动提示框(默认显示)
    public var tooltipValueSuffix: String?                 //浮动提示框单位后缀
    public var tooltipCrosshairs: Bool?                    //是否显示准星线(默认显示)
    public var colorsTheme: [Any]?                         //图表主题颜色数组
    public var series: [AASeriesElement]?                  //图表的数据数组
    public var legendEnabled: Bool?                        //是否显示图例
    public var backgroundColor: Any?                       //图表背景色
    public var borderRadius: Int?                          //柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效)
    public var markerRadius: Int?                          //折线连接点的半径长度
    public var touchEventEnabled: Bool?                    //是否支持触摸事件回调
    
    @discardableResult
    public func animationType(_ prop: AAChartAnimationType) -> AAChartModel {
        animationType = prop
        return self
    }
    
    @discardableResult
    public func animationDuration(_ prop: Int) -> AAChartModel {
        animationDuration = prop
        return self
    }
    
    @discardableResult
    public func title(_ prop: String) -> AAChartModel {
        title = prop
        return self
    }
    
    @discardableResult
    public func titleFontColor(_ prop: String) -> AAChartModel {
        titleFontColor = prop
        return self
    }
    
    @discardableResult
    public func titleFontSize(_ prop: Float?) -> AAChartModel {
        titleFontSize = prop
        return self
    }
    
    @discardableResult
    public func titleFontWeight(_ prop: AAChartFontWeightType) -> AAChartModel {
        titleFontWeight = prop
        return self
    }
    
    @discardableResult
    public func subtitle(_ prop: String) -> AAChartModel {
        subtitle = prop
        return self
    }
    
    @discardableResult
    public func subtitleAlign(_ prop: String) -> AAChartModel {
        subtitleAlign = prop
        return self
    }
    
    @discardableResult
    public func subtitleFontColor(_ prop: String) -> AAChartModel {
        subtitleFontColor = prop
        return self
    }
    
    @discardableResult
    public func subtitleFontSize(_ prop: Float?) -> AAChartModel {
        subtitleFontSize = prop
        return self
    }
    
    @discardableResult
    public func subtitleFontWeight(_ prop: AAChartFontWeightType) -> AAChartModel {
        subtitleFontWeight = prop
        return self
    }
    
    @discardableResult
    public func axesTextColor(_ prop: String) -> AAChartModel {
        axesTextColor = prop
        return self
    }
    
    @discardableResult
    public func chartType(_ prop: AAChartType) -> AAChartModel {
        chartType = prop
        return self
    }
    
    @discardableResult
    public func stacking(_ prop: AAChartStackingType) -> AAChartModel {
        stacking = prop
        return self
    }
    
    @discardableResult
    public func symbol(_ prop: AAChartSymbolType) -> AAChartModel {
        symbol = prop
        return self
    }
    
    @discardableResult
    public func zoomType(_ prop: AAChartZoomType) -> AAChartModel {
        zoomType = prop
        return self
    }
    
    @discardableResult
    public func inverted(_ prop: Bool) -> AAChartModel {
        inverted = prop
        return self
    }
    
    @discardableResult
    public func symbolStyle(_ prop: AAChartSymbolStyleType) -> AAChartModel {
        symbolStyle = prop
        return self
    }
    
    @discardableResult
    public func xAxisReversed(_ prop: Bool) -> AAChartModel {
        xAxisReversed = prop
        return self
    }
    
    @discardableResult
    public func yAxisReversed(_ prop: Bool) -> AAChartModel {
        yAxisReversed = prop
        return self
    }
    
    @discardableResult
    public func tooltipEnabled(_ prop: Bool) -> AAChartModel {
        tooltipEnabled = prop
        return self
    }
    
    @discardableResult
    public func tooltipValueSuffix(_ prop: String) -> AAChartModel {
        tooltipValueSuffix = prop
        return self
    }
    
    @discardableResult
    public func tooltipCrosshairs(_ prop: Bool) -> AAChartModel {
        tooltipCrosshairs = prop
        return self
    }
    
    @discardableResult
    public func polar(_ prop: Bool) -> AAChartModel {
        polar = prop
        return self
    }
    
    @discardableResult
    public func marginLeft(_ prop: Float) -> AAChartModel {
        marginLeft = prop
        return self
    }
    
    @discardableResult
    public func marginRight(_ prop: Float) -> AAChartModel {
        marginRight = prop
        return self
    }
    
    @discardableResult
    public func marginBottom(_ prop: Float) -> AAChartModel {
        marginBottom = prop
        return self
    }
    
    @discardableResult
    public func dataLabelsEnabled(_ prop: Bool) -> AAChartModel {
        dataLabelsEnabled = prop
        return self
    }
    
    @discardableResult
    public func dataLabelsFontColor(prop: String) -> AAChartModel {
    dataLabelsFontColor = prop
    return self
    }
    
    @discardableResult
    public func dataLabelsFontSize(prop: Float?) -> AAChartModel {
    dataLabelsFontSize = prop
    return self
    }
    
    @discardableResult
    public func dataLabelsFontWeight(prop: AAChartFontWeightType) -> AAChartModel {
    dataLabelsFontWeight = prop
    return self
    }
    
    @discardableResult
    public func xAxisLabelsEnabled(_ prop: Bool) -> AAChartModel {
        xAxisLabelsEnabled = prop
        return self
    }
    
    @discardableResult
    public func categories(_ prop: [String]) -> AAChartModel {
        categories = prop
        return self
    }
    
    @discardableResult
    public func xAxisGridLineWidth(_ prop: Float) -> AAChartModel {
        xAxisGridLineWidth = prop
        return self
    }
    
    @discardableResult
    public func xAxisVisible(_ prop: Bool) -> AAChartModel {
        xAxisVisible = prop
        return self
    }
    
    @discardableResult
    public func xAxisTickInterval(_ prop: Int) -> AAChartModel {
        xAxisTickInterval = prop
        return self
    }
    
    @discardableResult
    public func yAxisVisible(_ prop: Bool) -> AAChartModel {
        yAxisVisible = prop
        return self
    }
    
    @discardableResult
    public func yAxisLabelsEnabled(_ prop: Bool) -> AAChartModel {
        yAxisLabelsEnabled = prop
        return self
    }
    
    @discardableResult
    public func yAxisTitle(_ prop: String) -> AAChartModel {
        yAxisTitle = prop
        return self
    }
    
    @discardableResult
    public func yAxisMin(_ prop: Float) -> AAChartModel {
    yAxisMin = prop
    return self
    }
    
    @discardableResult
    public func yAxisMax(_ prop: Float) -> AAChartModel {
    yAxisMax = prop
    return self
    }
    
    @discardableResult
    public func yAxisAllowDecimals(_ prop: Bool) -> AAChartModel {
    yAxisAllowDecimals = prop
    return self
    }
    
    @discardableResult
    public func yAxisGridLineWidth(_ prop: Float) -> AAChartModel {
        yAxisGridLineWidth = prop
        return self
    }
    
    @discardableResult
    public func colorsTheme(_ prop: [Any]) -> AAChartModel {
        colorsTheme = prop
        return self
    }
    
    @discardableResult
    public func series(_ prop: [AASeriesElement]) -> AAChartModel {
        series = prop
        return self
    }
    
    @discardableResult
    public func legendEnabled(_ prop: Bool) -> AAChartModel {
        legendEnabled = prop
        return self
    }
    
    @discardableResult
    public func backgroundColor(_ prop: Any) -> AAChartModel {
        backgroundColor = prop
        return self
    }
    
    @discardableResult
    public func borderRadius(_ prop: Int) -> AAChartModel {
        borderRadius = prop
        return self
    }
    
    @discardableResult
    public func markerRadius(_ prop: Int) -> AAChartModel {
        markerRadius = prop
        return self
    }
    
    @discardableResult
    public func touchEventEnabled(_ prop: Bool) -> AAChartModel {
        touchEventEnabled = prop
        return self
    }
    
    
    public override init() {
        backgroundColor        = "#ffffff"
        animationType          = AAChartAnimationType.easeInQuad
        animationDuration      = 800 //以毫秒为单位
        chartType              = AAChartType.line
        stacking               = AAChartStackingType.none
        zoomType               = AAChartZoomType.none //默认禁用手势缩放
        colorsTheme            = ["#1e90ff","#ef476f","#ffd066","#04d69f","#25547c",]
        dataLabelsEnabled      = true
        tooltipEnabled         = true
        tooltipCrosshairs      = true
        xAxisLabelsEnabled     = true
        xAxisVisible           = true // X 轴默认可见
        yAxisVisible           = true // Y 轴默认可见
        yAxisLabelsEnabled     = true
        yAxisLineWidth         = 0
        yAxisGridLineWidth     = 0.6
        legendEnabled          = true
        borderRadius           = 0 //柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效,设置为1000时,柱形图或者条形图头部为楔形)
        markerRadius           = 5 //折线连接点的半径长度,如果设置默认值为0,那么这样就相当于不显示了
        titleFontColor         = "#000000" //标题字体颜色为黑色
        titleFontWeight        = AAChartFontWeightType.regular //常规字体
        titleFontSize          = 11
        subtitleFontColor      = "#000000" //副标题字体颜色为黑色
        subtitleFontWeight     = AAChartFontWeightType.regular //常规字体
        subtitleFontSize       = 9
        dataLabelsFontColor    = "#000000" //数据标签默认颜色为黑色
        dataLabelsFontWeight   = AAChartFontWeightType.bold //图表的数据字体为粗体
        dataLabelsFontSize     = 10
        yAxisTitle             = ""
        
    }
    
}
