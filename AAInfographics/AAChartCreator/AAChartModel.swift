//
//  AAChartModel.swift
//  AAChartKit-Swift
//
//  Created by An An  on 17/4/19.
//  Copyright © 2017年 An An . All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit-Swift ***--- source code
//

/*
 
 * -------------------------------------------------------------------------------
 *
 * ❤❤❤❤❤   WARM TIPS!!!   ❤❤❤❤❤
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


enum AAChartAnimationType:String {
    case EaseInQuad     = "easeInQuad"
    case EaseOutQuad    = "easeOutQuad"
    case EaseInOutQuad  = "easeInOutQuad"
    case EaseInCubic    = "easeInCubic"
    case EaseOutCubic   = "easeOutCubic"
    case EaseInOutCubic = "easeInOutCubic"
    case EaseInQuart    = "easeInQuart"
    case EaseOutQuart   = "easeOutQuart"
    case EaseInOutQuart = "easeInOutQuart"
    case EaseInQuint    = "easeInQuint"
    case EaseOutQuint   = "easeOutQuint"
    case EaseInOutQuint = "easeInOutQuint"
    case EaseInSine     = "easeInSine"
    case EaseOutSine    = "easeOutSine"
    case EaseInOutSine  = "easeInOutSine"
    case EaseInExpo     = "easeInExpo"
    case EaseOutExpo    = "easeOutExpo"
    case EaseInOutExpo  = "easeInOutExpo"
    case EaseInCirc     = "easeInCirc"
    case EaseOutCirc    = "easeOutCirc"
    case EaseInOutCirc  = "easeInOutCirc"
    case EaseOutBounce  = "easeOutBounce"
    case EaseInBack     = "easeInBack"
    case EaseOutBack    = "easeOutBack"
    case EaseInOutBack  = "easeInOutBack"
    case Elastic        = "elastic"
    case SwingFromTo    = "swingFromTo"
    case SwingFrom      = "swingFrom"
    case SwingTo        = "swingTo"
    case Bounce         = "bounce"
    case BouncePast     = "bouncePast"
    case EaseFromTo     = "easeFromTo"
    case EaseFrom       = "easeFrom"
    case EaseTo         = "easeTo"
}

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
    case Boxplot     = "boxplot"
    case Waterfall   = "waterfall"
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


public class AAChartModel:AASerializable {
    private var animationType:String?       //动画类型
    private var animationDuration:Int?      //动画时间
    private var title:String?               //标题内容
    private var subtitle:String?            //副标题内容
    private var chartType:String?           //图表类型
    private var stacking:String?            //堆积样式
    private var symbol:String?              //折线曲线连接点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
    private var symbolStyle:String?         //折线或者曲线的连接点是否为空心的
    private var zoomType:String?            //缩放类型 AAChartZoomTypeX表示可沿着 x 轴进行手势缩放
    private var inverted:Bool?              //x 轴是否翻转(垂直)
    private var xAxisReversed:Bool?         //x 轴翻转
    private var yAxisReversed:Bool?         //y 轴翻转
    private var gradientColorEnable:Bool?   //是否要为渐变色
    private var polar:Bool?                 //是否极化图形(变为雷达图)
    private var dataLabelEnabled:Bool?      //是否显示数据
    private var xAxisLabelsEnabled:Bool?    //x轴是否显示数据
    private var categories:Array<Any>?      //x轴是否显示数据
    private var xAxisGridLineWidth:Int?     //x轴网格线的宽度
    private var xAxisVisible:Bool?          //x轴是否显示
    private var yAxisVisible:Bool?          //y轴是否显示
    private var yAxisLabelsEnabled:Bool?    //y轴是否显示数据
    private var yAxisTitle:String?          //y轴标题
    private var yAxisGridLineWidth:Float?   //y轴网格线的宽度
    private var tooltipValueSuffix:String?  //浮动提示框单位后缀
    private var tooltipCrosshairs:Bool?     //是否显示准星线(默认显示)
    private var colorsTheme:Array<Any>?     //图表主题颜色数组
    private var series:Array<Any>?          //图表的数据数组
    private var legendEnabled:Bool?         //是否显示图例
    private var legendLayout:String?        //图例数据项的布局。布局类型： "horizontal" 或 "vertical" 即水平布局和垂直布局 默认是：horizontal.
    private var legendAlign:String?         //设定图例在图表区中的水平对齐方式，合法值有left，center 和 right。
    private var legendVerticalAlign:String? //设定图例在图表区中的垂直对齐方式，合法值有 top，middle 和 bottom。垂直位置可以通过 y 选项做进一步设定。
    private var backgroundColor:String?     //图表背景色
    private var options3dEnable:Bool?       //是否3D化图形(仅对条形图,柱状图有效)
    private var options3dAlpha:Int?
    private var options3dBeta:Int?
    private var options3dDepth:Int?         //3D图形深度
    private var borderRadius:Int?           //柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效)
    private var markerRadius:Int?           //折线连接点的半径长度
  

    
    func animationType(_ prop: AAChartAnimationType) -> AAChartModel {
        self.animationType = prop.rawValue
        return self
    }
    
    func animationDuration(_ prop: Int) -> AAChartModel {
        self.animationDuration = prop
        return self
    }
    
    func title(_ prop: String) -> AAChartModel {
        self.title = prop
        return self
    }
    
    func subtitle(_ prop: String) -> AAChartModel {
        self.subtitle = prop
        return self
    }
    
    func chartType(_ prop: AAChartType) -> AAChartModel {
        self.chartType = prop.rawValue
        return self
    }
    
    func stacking(_ prop: AAChartStackingType) -> AAChartModel {
        self.stacking = prop.rawValue
        return self
    }
    
    func symbol(_ prop: AAChartSymbolType) -> AAChartModel {
        self.symbol = prop.rawValue
        return self
    }
    
    func zoomType(_ prop: AAChartZoomType) -> AAChartModel {
        self.zoomType = prop.rawValue
        return self
    }
    
    func inverted(_ prop: Bool) -> AAChartModel {
        self.inverted = prop
        return self
    }
    
    func symbolStyle(_ prop: AAChartSymbolStyleType) -> AAChartModel {
        self.symbolStyle = prop.rawValue
        return self
    }
    
    func xAxisReversed(_ prop: Bool) -> AAChartModel {
        self.xAxisReversed = prop
        return self
    }
    
    func yAxisReversed(_ prop: Bool) -> AAChartModel {
        self.yAxisReversed = prop
        return self
    }
    
    func tooltipValueSuffix(_ prop:String) -> AAChartModel {
        self.tooltipValueSuffix = prop
        return self
    }
    
    func tooltipCrosshairs(_ prop: Bool) -> AAChartModel {
        self.tooltipCrosshairs = prop
        return self
    }
    
    func gradientColorEnable(_ prop: Bool) -> AAChartModel {
        self.gradientColorEnable = prop
        return self
    }
    
    func polar(_ prop: Bool) -> AAChartModel {
        self.polar = prop
        return self
    }
    
    func dataLabelEnabled(_ prop: Bool) -> AAChartModel {
        self.dataLabelEnabled = prop
        return self
    }
    
    func xAxisLabelsEnabled(_ prop: Bool) -> AAChartModel {
        self.xAxisLabelsEnabled = prop
        return self
    }
    
    func categories(_ prop: Array<Any>) -> AAChartModel {
        self.categories = prop
        return self
    }
    
    func xAxisGridLineWidth(_ prop: Int) -> AAChartModel {
        self.xAxisGridLineWidth = prop
        return self
    }
    
    func xAxisVisible(_ prop: Bool) -> AAChartModel {
        self.xAxisVisible = prop
        return self
    }
    
    func yAxisVisible(_ prop: Bool) -> AAChartModel {
        self.yAxisVisible = prop
        return self
    }
    
    func yAxisLabelsEnabled(_ prop: Bool) -> AAChartModel {
        self.yAxisLabelsEnabled = prop
        return self
    }
    
    func yAxisTitle(_ prop: String) -> AAChartModel {
        self.yAxisTitle = prop
        return self
    }
    
    func yAxisGridLineWidth(_ prop: Float) -> AAChartModel {
        self.yAxisGridLineWidth = prop
        return self
    }
    
    func colorsTheme(_ prop: Array<Any>) -> AAChartModel {
        self.colorsTheme = prop
        return self
    }
    
    func series(_ prop: Array<Any>) -> AAChartModel {
        self.series = prop
        return self
    }
    
    func legendEnabled(_ prop: Bool) -> AAChartModel {
        self.legendEnabled = prop
        return self
    }
    
    func legendLayout(_ prop: AAchartLegendlLayoutType) -> AAChartModel {
        self.legendLayout = prop.rawValue
        return self
    }
    
    func legendAlign(_ prop: AAChartLegendAlignType) -> AAChartModel {
        self.legendAlign = prop.rawValue
        return self
    }
    
    func legendVerticalAlign(_ prop: AAChartLegendVerticalAlignType) -> AAChartModel {
        self.legendAlign = prop.rawValue
        return self
    }
    
    func backgroundColor(_ prop: String) -> AAChartModel {
        self.backgroundColor = prop
        
        return self
    }
    
    func options3dEnable(_ prop: Bool) -> AAChartModel {
        self.options3dEnable = prop
        return self
    }
    
    func options3dAlpha(_ prop: Int) -> AAChartModel {
        self.options3dAlpha = prop
        return self
    }
    
    func options3dBeta(_ prop: Int) -> AAChartModel {
        self.options3dBeta = prop
        return self
    }
    
    func options3dDepth(_ prop: Int) -> AAChartModel {
        self.options3dDepth = prop
        return self
    }
    
    func borderRadius(_ prop: Int) -> AAChartModel {
        self.borderRadius = prop
        return self
    }
    
    func markerRadius(_ prop: Int) -> AAChartModel {
        self.markerRadius = prop
        return self
    }
    
    
    public  init() {
//        self.backgroundColor     = "#9b43b4"
        self.backgroundColor     = "#ffffff"
//        self.animationType       = AAChartAnimationType.EaseInOutQuart.rawValue
        self.animationDuration   = 800//以毫秒为单位
        self.chartType           = AAChartType.Column.rawValue
        self.inverted            = false
        self.stacking            = AAChartStackingType.False.rawValue
        self.xAxisReversed       = false
        self.yAxisReversed       = false
        self.zoomType            = AAChartZoomType.X.rawValue
        self.colorsTheme         = ["#9b43b4","#ef476f","#ffd066","#04d69f","#25547c",]
        self.gradientColorEnable = false
        self.polar               = false
        self.dataLabelEnabled    = true
        self.options3dEnable     = false
        self.tooltipCrosshairs   = true
        self.xAxisLabelsEnabled  = true
        self.xAxisGridLineWidth  = 0
        self.xAxisVisible        = true
        self.yAxisVisible        = false
        self.yAxisLabelsEnabled  = true
        self.yAxisGridLineWidth  = 0.6
        self.legendEnabled       = false
        self.legendLayout        = AAchartLegendlLayoutType.Horizontal.rawValue
        self.legendAlign         = AAChartLegendAlignType.Center.rawValue
        self.legendVerticalAlign = AAChartLegendVerticalAlignType.Bottom.rawValue
        self.borderRadius        = 0//柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效,设置为1000时,柱形图或者条形图头部为楔形)
        self.markerRadius        = 5//折线连接点的半径长度,设置默认值为0,这样就相当于不显示了
    }
    
    
}
