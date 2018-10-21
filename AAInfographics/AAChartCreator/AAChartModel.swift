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
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

 public enum AAChartAnimationType: String {
    case easeInQuad     = "easeInQuad"
    case easeOutQuad    = "easeOutQuad"
    case easeInOutQuad  = "easeInOutQuad"
    case easeInCubic    = "easeInCubic"
    case easeOutCubic   = "easeOutCubic"
    case easeInOutCubic = "easeInOutCubic"
    case easeInQuart    = "easeInQuart"
    case easeOutQuart   = "easeOutQuart"
    case easeInOutQuart = "easeInOutQuart"
    case easeInQuint    = "easeInQuint"
    case easeOutQuint   = "easeOutQuint"
    case easeInOutQuint = "easeInOutQuint"
    case easeInSine     = "easeInSine"
    case easeOutSine    = "easeOutSine"
    case easeInOutSine  = "easeInOutSine"
    case easeInExpo     = "easeInExpo"
    case easeOutExpo    = "easeOutExpo"
    case easeInOutExpo  = "easeInOutExpo"
    case easeInCirc     = "easeInCirc"
    case easeOutCirc    = "easeOutCirc"
    case easeInOutCirc  = "easeInOutCirc"
    case easeOutBounce  = "easeOutBounce"
    case easeInBack     = "easeInBack"
    case easeOutBack    = "easeOutBack"
    case easeInOutBack  = "easeInOutBack"
    case elastic        = "elastic"
    case swingFromTo    = "swingFromTo"
    case swingFrom      = "swingFrom"
    case swingTo        = "swingTo"
    case bounce         = "bounce"
    case bouncePast     = "bouncePast"
    case easeFromTo     = "easeFromTo"
    case easeFrom       = "easeFrom"
    case easeTo         = "easeTo"
}

public enum AAChartType: String {
    case column          = "column"
    case bar             = "bar"
    case area            = "area"
    case areaSpline      = "areaspline"
    case line            = "line"
    case spline          = "spline"
    case scatter         = "scatter"
    case pie             = "pie"
    case bubble          = "bubble"
    case pyramid         = "pyramid"
    case funnel          = "funnel"
    case columnRange     = "columnrange"
    case areaRange       = "arearange"
    case areaSplineRange = "areasplinerange"
    case boxplot         = "boxplot"
    case waterfall       = "waterfall"
    case polygon         = "polygon"
}

public enum AAChartSubtitleAlignType: String {
    case left   = "left"
    case center = "center"
    case right  = "right"
}

public enum AAChartZoomType: String {
    case none = "none"
    case x    = "x"
    case y    = "y"
    case xy   = "xy"
}

public enum AAChartStackingType: String {
    case none    = ""
    case normal  = "normal"
    case percent = "percent"
}

public enum AAChartSymbolType: String {
    case circle        = "circle"
    case square        = "square"
    case diamond       = "diamond"
    case triangle      = "triangle"
    case triangleDown  = "triangle-down"
}

public enum AAChartSymbolStyleType: String {
    case normal      = "normal"
    case innerBlank  = "innerBlank"
    case borderBlank = "borderBlank"
}

public enum AAchartLegendlLayoutType: String {
    case horizontal = "horizontal"
    case vertical   = "vertical"
}

public enum AAChartLegendAlignType: String {
    case left   = "left"
    case center = "center"
    case right  = "right"
}

public enum AAChartLegendVerticalAlignType: String {
    case top    = "top"
    case middle = "middle"
    case bottom = "bottom"
}

public enum AALineDashSyleType: String {
    case solid           = "Solid"
    case shortDash       = "ShortDash"
    case shortDot        = "ShortDot"
    case shortDashDot    = "ShortDashDot"
    case shortDashDotDot = "ShortDashDotDot"
    case dot             = "Dot"
    case dash            = "Dash"
    case longDash        = "LongDash"
    case dashDot         = "DashDot"
    case longDashDot     = "LongDashDot"
    case longDashDotDot  = "LongDashDotDot"
}


public class AAChartModel: AASerializable {
    private var animationType: String?       //动画类型
    private var animationDuration: Int?      //动画时间
    private var title: String?               //标题内容
    private var subtitle: String?            //副标题内容
    private var chartType: String?           //图表类型
    private var stacking: String?            //堆积样式
    private var symbol: String?              //折线曲线连接点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
    private var symbolStyle: String?         //折线或者曲线的连接点是否为空心的
    private var zoomType: String?            //缩放类型 AAChartZoomTypeX表示可沿着 x 轴进行手势缩放
    private var inverted: Bool?              //x 轴是否翻转(垂直)
    private var xAxisReversed: Bool?         //x 轴翻转
    private var yAxisReversed: Bool?         //y 轴翻转
    private var gradientColorEnable: Bool?   //是否要为渐变色
    private var polar: Bool?                 //是否极化图形(变为雷达图)
    private var marginLeft: Float?           //图表左边距
    private var marginRight: Float?          //图表右边距
    private var dataLabelEnabled: Bool?      //是否显示数据
    private var xAxisLabelsEnabled: Bool?    //x 轴是否显示数据
    private var categories: [String]?        //x 轴是否显示数据
    private var xAxisGridLineWidth: Float?   //x 轴网格线的宽度
    private var xAxisVisible: Bool?          //x 轴是否显示
    private var yAxisVisible: Bool?          //y 轴是否显示
    private var yAxisLabelsEnabled: Bool?    //y 轴是否显示数据
    private var yAxisTitle: String?          //y 轴标题
    private var yAxisLineWidth: Float?       //y 轴轴线的宽度
    private var yAxisGridLineWidth: Float?   //y 轴网格线的宽度
    private var tooltipEnabled: Bool?        //是否显示浮动提示框(默认显示)
    private var tooltipValueSuffix: String?  //浮动提示框单位后缀
    private var tooltipCrosshairs: Bool?     //是否显示准星线(默认显示)
    private var colorsTheme: [Any]?          //图表主题颜色数组
    private var series: [[String: Any]]?     //图表的数据数组
    private var legendEnabled: Bool?         //是否显示图例
    private var legendLayout: String?        //图例数据项的布局。布局类型： "horizontal" 或 "vertical" 即水平布局和垂直布局 默认是：horizontal.
    private var legendAlign: String?         //设定图例在图表区中的水平对齐方式，合法值有left，center 和 right。
    private var legendVerticalAlign: String? //设定图例在图表区中的垂直对齐方式，合法值有 top，middle 和 bottom。垂直位置可以通过 y 选项做进一步设定。
    private var backgroundColor: String?     //图表背景色
    private var borderRadius: Int?           //柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效)
    private var markerRadius: Int?           //折线连接点的半径长度
    private var titleColor: String?          //标题颜色
    private var subTitleColor: String?       //副标题颜色
    private var axisColor: String?           //x 轴和 y 轴文字颜色
    
    
    @discardableResult
    public func animationType(_ prop: AAChartAnimationType) -> AAChartModel {
        animationType = prop.rawValue
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
    public func subtitle(_ prop: String) -> AAChartModel {
        subtitle = prop
        return self
    }
    
    @discardableResult
    public func chartType(_ prop: AAChartType) -> AAChartModel {
        chartType = prop.rawValue
        return self
    }
    
    @discardableResult
    public func stacking(_ prop: AAChartStackingType) -> AAChartModel {
        stacking = prop.rawValue
        return self
    }
    
    @discardableResult
    public func symbol(_ prop: AAChartSymbolType) -> AAChartModel {
        symbol = prop.rawValue
        return self
    }
    
    @discardableResult
    public func zoomType(_ prop: AAChartZoomType) -> AAChartModel {
        zoomType = prop.rawValue
        return self
    }
    
    @discardableResult
    public func inverted(_ prop: Bool) -> AAChartModel {
        inverted = prop
        return self
    }
    
    @discardableResult
    public func symbolStyle(_ prop: AAChartSymbolStyleType) -> AAChartModel {
        symbolStyle = prop.rawValue
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
    public func gradientColorEnable(_ prop: Bool) -> AAChartModel {
        gradientColorEnable = prop
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
    public func dataLabelEnabled(_ prop: Bool) -> AAChartModel {
        dataLabelEnabled = prop
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
    public func series(_ prop: [[String: Any]]) -> AAChartModel {
        series = prop
        return self
    }
    
    @discardableResult
    public func legendEnabled(_ prop: Bool) -> AAChartModel {
        legendEnabled = prop
        return self
    }
    
    @discardableResult
    public func legendLayout(_ prop: AAchartLegendlLayoutType) -> AAChartModel {
        legendLayout = prop.rawValue
        return self
    }
    
    @discardableResult
    public func legendAlign(_ prop: AAChartLegendAlignType) -> AAChartModel {
        legendAlign = prop.rawValue
        return self
    }
    
    @discardableResult
    public func legendVerticalAlign(_ prop: AAChartLegendVerticalAlignType) -> AAChartModel {
        legendAlign = prop.rawValue
        return self
    }
    
    @discardableResult
    public func backgroundColor(_ prop: String) -> AAChartModel {
        backgroundColor = prop
        return self
    }
    
    @discardableResult
    public func titleColor(_ prop: String) -> AAChartModel {
        titleColor = prop
        return self
    }
    
    @discardableResult
    public func subTitleColor(_ prop: String) -> AAChartModel {
        subTitleColor = prop
        return self
    }
    
    @discardableResult
    public func axisColor(_ prop: String) -> AAChartModel {
        axisColor = prop
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
    
    
    public init() {
        backgroundColor     = "#ffffff"
        titleColor          = "#000000"
        subTitleColor       = "#000000"
        axisColor           = "#000000"
        animationDuration   = 800//以毫秒为单位
        chartType           = AAChartType.column.rawValue
        inverted            = false
        stacking            = AAChartStackingType.none.rawValue
        xAxisReversed       = false
        yAxisReversed       = false
        zoomType            = AAChartZoomType.none.rawValue//默认禁用手势缩放
        colorsTheme         = ["#1e90ff","#ef476f","#ffd066","#04d69f","#25547c",]
        gradientColorEnable = false
        polar               = false
        dataLabelEnabled    = true
        tooltipEnabled      = true
        tooltipCrosshairs   = true
        xAxisLabelsEnabled  = true
        xAxisVisible        = true // X 轴默认可见
        yAxisVisible        = true // Y 轴默认可见
        yAxisLabelsEnabled  = true
        yAxisLineWidth      = 0
        yAxisGridLineWidth  = 0.6
        legendEnabled       = true
        legendLayout        = AAchartLegendlLayoutType.horizontal.rawValue
        legendAlign         = AAChartLegendAlignType.center.rawValue
        legendVerticalAlign = AAChartLegendVerticalAlignType.bottom.rawValue
        borderRadius        = 0 //柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效,设置为1000时,柱形图或者条形图头部为楔形)
        markerRadius        = 5 //折线连接点的半径长度,设置默认值为0,这样就相当于不显示了
    }
    
}
