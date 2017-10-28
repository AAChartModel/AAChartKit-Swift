//
//  AAChartModel.swift
//  AAChartKit-Swift
//
//  Created by An An  on 17/4/19.
//  Copyright © 2017年 An An . All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit-Swift ***--- source code
//

enum AAChartType:String {
    case Column      = "column"
    case Bar         = "bar"
    case Area        = "area"
    case AreaSpline  = "areaspline"
    case Line        = "line"
    case Spline      = "spline"
    case Scatter     = "scatter"
    case Pie         = "pie"
    case Bubble      = "bubble"
    case Pyramid     = "pyramid"
    case Funnel      = "funnel"
    case Columnrange = "columnrange"
    case Arearange   = "arearange"
}

enum AAChartSubtitleAlignType:String {
    case Left   = "left"
    case Center = "center"
    case Right  = "right"
}

enum AAChartZoomType:String {
    case X  = "x"
    case Y  = "y"
    case XY = "xy"
}

enum AAChartStackingType:String {
    case False   = ""
    case Normal  = "normal"
    case Percent = "percent"
}

enum AAChartSymbolType:String {
    case Circle         = "circle"
    case Square         = "square"
    case Diamond        = "diamond"
    case Triangle       = "triangle"
    case Triangle_down  = "triangle-down"
}

enum AAChartSymbolStyleType:String {
    case Normal       = "normal"
    case InnerBlank   = "innerBlank"
    case BorderBlank  = "borderBlank"
}

enum AAchartLegendlLayoutType:String {
    case Horizontal  = "horizontal"
    case Vertical    = "vertical"
}

enum AAChartLegendAlignType:String {
    case Left     = "left"
    case Center   = "center"
    case Right    = "right"
}

enum AAChartLegendVerticalAlignType:String {
    case Top     = "top"
    case Middle  = "middle"
    case Bottom  = "bottom"
}

enum AAChartAnimationType:String {
    case Linear              = "linear" 
    case Swing               = "swing"
    case EaseInQuad          = "easeInQuad"
    case EaseOutQuad         = "easeOutQuad"
    case EaseInOutQuad       = "easeInOutQuad"
    case EaseInCubic         = "easeInCubic"
    case EaseOutCubic        = "easeOutCubic"
    case EaseInOutCubic      = "easeInOutCubic"
    case EaseInQuart         = "easeInQuart"
    case EaseOutQuart        = "easeOutQuart"
    case EaseInOutQuart      = "easeInOutQuart"
    case EaseInQuint         = "easeInQuint"
    case EaseOutQuint        = "easeOutQuint"
    case EaseInOutQuint      = "easeInOutQuint"
    case EaseInExpo          = "easeInExpo"
    case EaseOutExpo         = "easeOutExpo"
    case EaseInOutExpo       = "easeInOutExpo"
    case EaseInSine          = "easeInSine"
    case EaseOutSine         = "easeOutSine"
    case EaseInOutSine       = "easeInOutSine"
    case EaseInCirc          = "easeInCirc"
    case EaseOutCirc         = "easeOutCirc"
    case EaseInOutCirc       = "easeInOutCirc"
    case EaseInElastic       = "easeInElastic"
    case EaseOutElastic      = "easeOutElastic"
    case EaseInOutElastic    = "easeInOutElastic"
    case EaseInBack          = "easeInBack"
    case EaseOutBack         = "easeOutBack"
    case EaseInOutBack       = "easeInOutBack"
    case EaseInBounce        = "easeInBounce"
    case EaseOutBounce       = "easeOutBounce"
    case EaseInOutBounce     = "easeInOutBounce"
}


public class AAChartModel:AASerializable {
    public var animationType:String?       //动画类型
    public var animationDuration:Int?      //动画时间
    public var title:String?               //标题内容
    public var subtitle:String?            //副标题内容
    public var chartType:String?           //图表类型
    public var stacking:String?            //堆积样式
    public var symbol:String?              //折线曲线连接点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
    public var zoomType:String?            //缩放类型 AAChartZoomTypeX表示可沿着 x 轴进行手势缩放
    public var symbolStyle:String?     //折线或者曲线的连接点是否为空心的
    public var inverted:Bool?              //x 轴是否翻转(垂直)
    public var xAxisReversed:Bool?         //x 轴翻转
    public var yAxisReversed:Bool?         //y 轴翻转
    public var crosshairs:Bool?            //是否显示准星线(默认显示)
    public var gradientColorEnable:Bool?   //是否要为渐变色
    public var polar:Bool?                 //是否极化图形(变为雷达图)
    public var dataLabelEnabled:Bool?      //是否显示数据
    public var xAxisLabelsEnabled:Bool?    //x轴是否显示数据
    public var categories:Array<Any>?      //x轴是否显示数据
    public var xAxisGridLineWidth:Int?     //x轴网格线的宽度
    public var yAxisLabelsEnabled:Bool?    //y轴是否显示数据
    public var yAxisTitle:String?          //y轴标题
    public var yAxisGridLineWidth:Int?     //y轴网格线的宽度
    public var colorsTheme:Array<Any>?     //图表主题颜色数组
    public var series:Array<Any>?
    public var legendEnabled:Bool?         //是否显示图例
    public var legendLayout:String?        //图例数据项的布局。布局类型： "horizontal" 或 "vertical" 即水平布局和垂直布局 默认是：horizontal.
    public var legendAlign:String?         //设定图例在图表区中的水平对齐方式，合法值有left，center 和 right。
    public var legendVerticalAlign:String? //设定图例在图表区中的垂直对齐方式，合法值有 top，middle 和 bottom。垂直位置可以通过 y 选项做进一步设定。
    public var backgroundColor:String?     //图表背景色
    public var options3dEnable:Bool?       //是否3D化图形(仅对条形图,柱状图有效)
    public var options3dAlpha:Int?
    public var options3dBeta:Int?
    public var options3dDepth:Int?         //3D图形深度
    public var borderRadius:Int?           //柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效)
    public var markerRadius:Int?           //折线连接点的半径长度
    
    
    /*public var tooltip:Dictionary<String,Any> = ["shared":true,"pointFormat":"{series.name}: <b>{point.y}</b><br/>"]
     func valueSuffixSet(_ prop: String) -> AAChartModel {
     self.tooltip["valueSuffix"] = prop
     return self
     }*/
    
    func animationTypeSet(_ prop: AAChartAnimationType) -> AAChartModel {
        self.animationType = prop.rawValue
        return self
    }
    
    func animationDurationSet(_ prop: Int) -> AAChartModel {
        self.animationDuration = prop
        return self
    }
    
    func titleSet(_ prop: String) -> AAChartModel {
        self.title = prop
        return self
    }
    
    func subtitleSet(_ prop: String) -> AAChartModel {
        self.subtitle = prop
        return self
    }
    
    func chartTypeSet(_ prop: AAChartType) -> AAChartModel {
        self.chartType = prop.rawValue
        return self
    }
    
    func stackingSet(_ prop: AAChartStackingType) -> AAChartModel {
        self.stacking = prop.rawValue
        return self
    }
    
    func symbolSet(_ prop: AAChartSymbolType) -> AAChartModel {
        self.symbol = prop.rawValue
        return self
    }
    
    func zoomTypeSet(_ prop: AAChartZoomType) -> AAChartModel {
        self.zoomType = prop.rawValue
        return self
    }
    
    func invertedSet(_ prop: Bool) -> AAChartModel {
        self.inverted = prop
        return self
    }
    
    func symbolStyleSet(_ prop: AAChartSymbolStyleType) -> AAChartModel {
        self.symbolStyle = prop.rawValue
        return self
    }
    
    func xAxisReversedSet(_ prop: Bool) -> AAChartModel {
        self.xAxisReversed = prop
        return self
    }
    
    func yAxisReversedSet(_ prop: Bool) -> AAChartModel {
        self.yAxisReversed = prop
        return self
    }
    
    func crosshairsSet(_ prop: Bool) -> AAChartModel {
        self.crosshairs = prop
        return self
    }
    
    func gradientColorEnableSet(_ prop: Bool) -> AAChartModel {
        self.gradientColorEnable = prop
        return self
    }
    
    func polarSet(_ prop: Bool) -> AAChartModel {
        self.polar = prop
        return self
    }
    
    func dataLabelEnabledSet(_ prop: Bool) -> AAChartModel {
        self.dataLabelEnabled = prop
        return self
    }
    
    func xAxisLabelsEnabledSet(_ prop: Bool) -> AAChartModel {
        self.xAxisLabelsEnabled = prop
        return self
    }
    
    func categoriesSet(_ prop: Array<Any>) -> AAChartModel {
        self.categories = prop
        return self
    }
    
    func xAxisGridLineWidthSet(_ prop: Int) -> AAChartModel {
        self.xAxisGridLineWidth = prop
        return self
    }
    
    func yAxisLabelsEnabledSet(_ prop: Bool) -> AAChartModel {
        self.yAxisLabelsEnabled = prop
        return self
    }
    
    func yAxisTitleSet(_ prop: String) -> AAChartModel {
        self.yAxisTitle = prop
        return self
    }
    
    func yAxisGridLineWidthSet(_ prop: Int) -> AAChartModel {
        self.yAxisGridLineWidth = prop
        return self
    }
    
    func colorsThemeSet(_ prop: Array<Any>) -> AAChartModel {
        self.colorsTheme = prop
        return self
    }
    
    func seriesSet(_ prop: Array<Any>) -> AAChartModel {
        self.series = prop
        return self
    }
    
    func legendEnabledSet(_ prop: Bool) -> AAChartModel {
        self.legendEnabled = prop
        return self
    }
    
    func legendLayoutSet(_ prop: AAchartLegendlLayoutType) -> AAChartModel {
        self.legendLayout = prop.rawValue
        return self
    }
    
    func legendAlignSet(_ prop: AAChartLegendAlignType) -> AAChartModel {
        self.legendAlign = prop.rawValue
        return self
    }
    
    func legendVerticalAlignSet(_ prop: AAChartLegendVerticalAlignType) -> AAChartModel {
        self.legendAlign = prop.rawValue
        return self
    }
    
    func backgroundColorSet(_ prop: String) -> AAChartModel {
        self.backgroundColor = prop
        
        return self
    }
    
    func options3dEnableSet(_ prop: Bool) -> AAChartModel {
        self.options3dEnable = prop
        return self
    }
    
    func options3dAlphaSet(_ prop: Int) -> AAChartModel {
        self.options3dAlpha = prop
        return self
    }
    
    func options3dBetaSet(_ prop: Int) -> AAChartModel {
        self.options3dBeta = prop
        return self
    }
    
    func options3dDepthSet(_ prop: Int) -> AAChartModel {
        self.options3dDepth = prop
        return self
    }
    
    func borderRadiusSet(_ prop: Int) -> AAChartModel {
        self.borderRadius = prop
        return self
    }
    
    func markerRadiusSet(_ prop: Int) -> AAChartModel {
        self.markerRadius = prop
        return self
    }
    
    
    public  init() {
//        print(AAChartAnimationType.EaseInBack.rawValue)
        
        self.animationType       = AAChartAnimationType.EaseInBack.rawValue
        self.animationDuration   = 800//以毫秒为单位
        self.chartType           = AAChartType.Column.rawValue
        self.inverted            = false
        self.stacking            = AAChartStackingType.False.rawValue
//        self.symbol              = AAChartSymbolType.Square.rawValue//默认的折线连接点类型
        self.xAxisReversed       = false
        self.yAxisReversed       = false
        self.zoomType            = AAChartZoomType.X.rawValue
//        self.colorsTheme         = ["#bb250c","#f67210","#fde680","#257679","#f1c6c5"]
        self.colorsTheme         = ["#EA007B", "#49C1B6", "#FDC20A", "#F78320", "#068E81",]//明艳色彩
        self.gradientColorEnable = false
        self.polar               = false
        self.dataLabelEnabled    = true
        self.options3dEnable     = false
        self.crosshairs          = true
        self.xAxisLabelsEnabled  = true
        self.xAxisGridLineWidth  = 0
        self.yAxisLabelsEnabled  = true
        self.yAxisGridLineWidth  = 1
        self.legendEnabled       = true
        self.legendLayout        = AAchartLegendlLayoutType.Horizontal.rawValue
        self.legendAlign         = AAChartLegendAlignType.Center.rawValue
        self.legendVerticalAlign = AAChartLegendVerticalAlignType.Bottom.rawValue
        self.borderRadius        = 0//柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效,设置为1000时,柱形图或者条形图头部为楔形)
        self.markerRadius        = 5//折线连接点的半径长度,设置默认值为0,这样就相当于不显示了
    }
    
    
}
