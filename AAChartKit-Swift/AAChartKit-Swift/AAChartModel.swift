//
//  AAChartModel.swift
//  AAChartKit-Swift
//
//  Created by Danny boy on 17/4/19.
//  Copyright © 2017年 Danny boy. All rights reserved.
//


enum AAChartType{
    static let AAChartTypeColumn      = "column"
    static let AAChartTypeBar         = "bar"
    static let AAChartTypeArea        = "area"
    static let AAChartTypeAreaSpline  = "areaspline"
    static let AAChartTypeLine        = "line"
    static let AAChartTypeSpline      = "spline"
    static let AAChartTypeScatter     = "scatter"
    static let AAChartTypePie         = "pie"
    static let AAChartTypeBubble      = "bubble"
    static let AAChartTypePyramid     = "pyramid"
    static let AAChartTypeFunnel      = "funnel"
    static let AAChartTypeColumnrange = "columnrange"
}

enum AAChartSubtitleAlignType{
    static let AAChartSubtitleAlignTypeLeft   = "left"
    static let AAChartSubtitleAlignTypeCenter = "center"
    static let AAChartSubtitleAlignTypeRight  = "right"
}

enum AAChartZoomType{
    static let AAChartZoomTypeX  = "x"
    static let AAChartZoomTypeY  = "y"
    static let AAChartZoomTypeXY = "xy"
}

enum AAChartStackingType{
    static let AAChartStackingTypeFalse   = "nil"
    static let AAChartStackingTypeNormal  = "normal"
    static let AAChartStackingTypePercent = "percent"
}

enum AAChartSymbolType{
    static let AAChartSymbolTypeCircle         = "circle";
    static let AAChartSymbolTypeSquare         = "square";
    static let AAChartSymbolTypeDiamond        = "diamond";
    static let AAChartSymbolTypeTriangle       = "triangle";
    static let AAChartSymbolTypeTriangle_down  = "triangle-down";
}

enum AAchartLegendlLayoutType{
    static let AAChartLegendLayoutTypeHorizontal  = "horizontal";
    static let AAChartLegendLayoutTypeVertical    = "vertical";
}

enum AAChartLegendAlignType{
    static let AAChartLegendAlignTypeLeft     = "left";
    static let AAChartLegendAlignTypeCenter   = "center";
    static let AAChartLegendAlignTypeRight    = "right";
}

enum AAChartLegendVerticalAlignType{
    static let AAChartLegendVerticalAlignTypeTop     = "top";
    static let AAChartLegendVerticalAlignTypeMiddle  = "middle";
    static let AAChartLegendVerticalAlignTypeBottom  = "bottom";
}
enum AAChartAnimationType:String{
    case
    AAChartAnimationTypeLinear              = "linear" ,
    AAChartAnimationTypeSwing               = "swing",
    AAChartAnimationTypeEaseInQuad          = "easeInQuad",
    AAChartAnimationTypeEaseOutQuad         = "easeOutQuad",
    AAChartAnimationTypeEaseInOutQuad       = "easeInOutQuad",
    AAChartAnimationTypeEaseInCubic         = "easeInCubic",
    AAChartAnimationTypeEaseOutCubic        = "easeOutCubic",
    AAChartAnimationTypeEaseInOutCubic      = "easeInOutCubic",
    AAChartAnimationTypeEaseInQuart         = "easeInQuart",
    AAChartAnimationTypeEaseOutQuart        = "easeOutQuart",
    AAChartAnimationTypeEaseInOutQuart      = "easeInOutQuart",
    AAChartAnimationTypeEaseInQuint         = "easeInQuint",
    AAChartAnimationTypeEaseOutQuint        = "easeOutQuint",
    AAChartAnimationTypeEaseInOutQuint      = "easeInOutQuint",
    AAChartAnimationTypeEaseInExpo          = "easeInExpo",
    AAChartAnimationTypeEaseOutExpo         = "easeOutExpo",
    AAChartAnimationTypeEaseInOutExpo       = "easeInOutExpo",
    AAChartAnimationTypeEaseInSine          = "easeInSine",
    AAChartAnimationTypeEaseOutSine         = "easeOutSine",
    AAChartAnimationTypeEaseInOutSine       = "easeInOutSine",
    AAChartAnimationTypeEaseInCirc          = "easeInCirc",
    AAChartAnimationTypeEaseOutCirc         = "easeOutCirc",
    AAChartAnimationTypeEaseInOutCirc       = "easeInOutCirc",
    AAChartAnimationTypeEaseInElastic       = "easeInElastic",
    AAChartAnimationTypeEaseOutElastic      = "easeOutElastic",
    AAChartAnimationTypeEaseInOutElastic    = "easeInOutElastic",
    AAChartAnimationTypeEaseInBack          = "easeInBack",
    AAChartAnimationTypeEaseOutBack         = "easeOutBack",
    AAChartAnimationTypeEaseInOutBack       = "easeInOutBack",
    AAChartAnimationTypeEaseInBounce        = "easeInBounce",
    AAChartAnimationTypeEaseOutBounce       = "easeOutBounce",
    AAChartAnimationTypeEaseInOutBounce     = "easeInOutBounce"
};


public class AAChartModel:AASerializable {
     public var animationType:String?       //动画类型
     public var title:String?               //标题内容
     public var subtitle:String?            //副标题内容
     public var chartType:String?           //图表类型
     public var stacking:String?            //堆积样式
     public var symbol:String?              //折线曲线连接点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
     public var zoomType:String?            //缩放类型 AAChartZoomTypeX表示可沿着 x 轴进行手势缩放
     public var inverted:Bool?              //x 轴是否垂直
     public var xAxisReversed:Bool?         // x 轴翻转
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
     public var backgroundColor:String?   //图表背景色
     public var options3dEnable:Bool?       //是否3D化图形(仅对条形图,柱状图有效)
     public var options3dAlpha:Int?
     public var  options3dBeta:Int?
     public var options3dDepth:Int?         //3D图形深度
     public var borderRadius:Int?           //柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效)
     public var markerRadius:Int?           //折线连接点的半径长度
    
    func animationTypeSet(_ prop: String) -> AAChartModel {
        self.animationType=prop;
        return self
    }
    func titleSet(_ prop: String) -> AAChartModel {
        self.title = prop;
        return self
    }
    func subtitleSet(_ prop: String) -> AAChartModel {
        self.subtitle = prop;
        return self
    }
    func chartTypeSet(_ prop: String) -> AAChartModel {
        self.chartType = prop;
        return self
    }
    func stackingSet(_ prop: String) -> AAChartModel {
        self.stacking = prop;
        return self
    }
    func symbolSet(_ prop: String) -> AAChartModel {
        self.symbol = prop;
        return self
    }
    func zoomTypeSet(_ prop: String) -> AAChartModel {
        self.zoomType = prop;
        return self
    }
    func invertedSet(_ prop: Bool) -> AAChartModel {
        self.inverted = prop;
        return self
    }
    func xAxisReversedSet(_ prop: Bool) -> AAChartModel {
        self.xAxisReversed = prop;
        return self
    }
    func yAxisReversedSet(_ prop: Bool) -> AAChartModel {
        self.yAxisReversed = prop;
        return self
    }
    func crosshairsSet(_ prop: Bool) -> AAChartModel {
        self.crosshairs = prop;
        return self
    }
    func gradientColorEnableSet(_ prop: Bool) -> AAChartModel {
        self.gradientColorEnable = prop;
        return self
    }
    func polarSet(_ prop: Bool) -> AAChartModel {
        self.polar = prop;
        return self
    }
    func dataLabelEnabledSet(_ prop: Bool) -> AAChartModel {
        self.dataLabelEnabled = prop;
        return self
    }
    func xAxisLabelsEnabledSet(_ prop: Bool) -> AAChartModel {
        self.xAxisLabelsEnabled = prop;
        return self
    }
    func categoriesSet(_ prop: Array<Any>) -> AAChartModel {
        self.categories = prop;
        return self
    }
    func xAxisGridLineWidthSet(_ prop: Int) -> AAChartModel {
        self.xAxisGridLineWidth = prop;
        return self
    }
    func yAxisLabelsEnabledSet(_ prop: Bool) -> AAChartModel {
        self.yAxisLabelsEnabled = prop;
        return self
    }
    func yAxisTitleSet(_ prop: String) -> AAChartModel {
        self.yAxisTitle = prop;
        return self
    }
    func yAxisGridLineWidthSet(_ prop: Int) -> AAChartModel {
        self.yAxisGridLineWidth = prop;
        return self
    }
    func colorsThemeSet(_ prop: Array<Any>) -> AAChartModel {
        self.colorsTheme = prop;
        return self
    }
     func seriesSet(_ prop: Array<Any>) -> AAChartModel {
        self.series = prop;
        return self
    }
    func legendEnabledSet(_ prop: Bool) -> AAChartModel {
        self.legendEnabled = prop;
        return self
    }
    func legendLayoutSet(_ prop: String) -> AAChartModel {
        self.legendLayout = prop;
        return self
    }
    func legendAlignSet(_ prop: String) -> AAChartModel {
        self.legendAlign = prop;
        return self
    }
    func legendVerticalAlignSet(_ prop: String) -> AAChartModel {
        self.legendAlign = prop;
        return self
    }
    func backgroundColorSet(_ prop: String) -> AAChartModel {
        self.legendAlign = prop;
        return self
    }
    func options3dEnableSet(_ prop: Bool) -> AAChartModel {
        self.options3dEnable = prop;
        return self
    }
    func options3dAlphaSet(_ prop: Int) -> AAChartModel {
        self.options3dAlpha = prop;
        return self
    }
    func options3dBetaSet(_ prop: Int) -> AAChartModel {
        self.options3dBeta = prop;
        return self
    }
    func options3dDepthSet(_ prop: Int) -> AAChartModel {
        self.options3dDepth = prop;
        return self
    }
    func borderRadiusSet(_ prop: Int) -> AAChartModel {
        self.borderRadius = prop;
        return self
    }
    func markerRadiusSet(_ prop: Int) -> AAChartModel {
        self.markerRadius = prop;
        return self
    }
  
    public  init() {
        print(AAChartAnimationType.AAChartAnimationTypeEaseInBack);
        self.animationType = AAChartAnimationType.AAChartAnimationTypeEaseInBack.rawValue;
        self.chartType = AAChartType.AAChartTypeColumn;
        self.inverted = false;
        self.stacking = AAChartStackingType.AAChartStackingTypeNormal;
        self.symbol = AAChartSymbolType.AAChartSymbolTypeSquare;
        self.xAxisReversed = false;
        self.yAxisReversed = false;
        self.zoomType = AAChartZoomType.AAChartZoomTypeX;
        self.colorsTheme =  ["#b5282a","#e7a701","#50c18d","#c37779","#f1c6c5"];
        self.gradientColorEnable = false;
        self.polar = false;
        self.dataLabelEnabled = true;
        self.options3dEnable = false;
        self.crosshairs = true;
        self.xAxisLabelsEnabled = true;
        self.xAxisGridLineWidth = 0;
        self.yAxisLabelsEnabled = true;
        self.yAxisGridLineWidth = 1;
        self.legendEnabled = true;
        self.legendLayout = AAchartLegendlLayoutType.AAChartLegendLayoutTypeHorizontal;
        self.legendAlign = AAChartLegendAlignType.AAChartLegendAlignTypeCenter;
        self.legendVerticalAlign = AAChartLegendVerticalAlignType.AAChartLegendVerticalAlignTypeBottom;
        self.borderRadius = 0;//柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效,设置为1000时,柱形图或者条形图头部为楔形)
        self.markerRadius = 6;//折线连接点的半径长度,设置默认值为0,这样就相当于不显示了
    }
    
    
}
