//
//  AAChartModel.swift
//  AAChartKit-Swift
//
//  Created by Danny boy on 17/4/19.
//  Copyright © 2017年 Danny boy. All rights reserved.
//
/*
 struct AAChartType{
 static let AAChartTypeColumn = "column"
 static let AAChartTypeBar = "bar"
 static let AAChartTypeArea = "area"
 static let AAChartTypeAreaSpline = "areaspline"
 static let AAChartTypeLine = "line"
 static let AAChartTypeSpline = "spline"
 static let AAChartTypeScatter = "scatter"
 static let AAChartTypePie = "pie"
 static let AAChartTypeBubble = "bubble"
 static let AAChartTypePyramid = "pyramid"
 static let AAChartTypeFunnel = "funnel"
 static let AAChartTypeColumnrange = "columnrange"
 }
 */

/*
 let AAChartTypeColumn = "column"
 let AAChartTypeBar = "bar"
 let AAChartTypeArea = "area"
 let AAChartTypeAreaSpline = "areaspline"
 let AAChartTypeLine = "line"
 let AAChartTypeSpline = "spline"
 let AAChartTypeScatter = "scatter"
 let AAChartTypePie = "pie"
 let AAChartTypeBubble = "bubble"
 let AAChartTypePyramid = "pyramid"
 let AAChartTypeFunnel = "funnel"
 let AAChartTypeColumnrange = "columnrange"
 */

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
    static let AAChartZoomTypeX = "x"
    static let AAChartZoomTypeY = "y"
    static let AAChartZoomTypeXY = "xy"
}

enum AAChartStackingType{
    static let AAChartStackingTypeFalse = "nil"
    static let AAChartStackingTypeNormal = "normal"
    static let AAChartStackingTypePercent = "percent"
}

enum AAChartSymbolType{
    static let AAChartSymbolTypeCircle         = "circle";
    static let AAChartSymbolTypeSquare         = "square";
    static let AAChartSymbolTypeDiamond        = "diamond";
    static let AAChartSymbolTypeTriangle       = "triangle";
    static let AAChartSymbolTypeTriangle_down   = "triangle-down";
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


public struct AAChartModel:JSONSerializable {
    var animationType:String?       //动画类型
    var title:String?               //标题内容
    var subtitle:String?            //副标题内容
    var chartType:String?           //图表类型
    var stacking:String?            //堆积样式
    var symbol:String?              //折线曲线连接点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
    
    var zoomType:String?            //缩放类型 AAChartZoomTypeX表示可沿着 x 轴进行手势缩放
    var inverted:Bool?              //x 轴是否垂直
    var xAxisReversed:Bool?         // x 轴翻转
    var yAxisReversed:Bool?         //y 轴翻转
    var crosshairs:Bool?            //是否显示准星线(默认显示)
    var gradientColorEnable:Bool?   //是否要为渐变色
    var polar:Bool?                 //是否极化图形(变为雷达图)
    var dataLabelEnabled:Bool?      //是否显示数据
    var xAxisLabelsEnabled:Bool?    //x轴是否显示数据
    
    var categories:Array<Any>?      //x轴是否显示数据
    var xAxisGridLineWidth:Int?     //x轴网格线的宽度
    var yAxisLabelsEnabled:Bool?    //y轴是否显示数据
    var yAxisTitle:String?          //y轴标题
    var yAxisGridLineWidth:Int?     //y轴网格线的宽度
    
    var colorsTheme:Array<Any>?     //图表主题颜色数组
    var series:Array<Any>?
    
    var legendEnabled:Bool?         //是否显示图例
    var legendLayout:String?        //图例数据项的布局。布局类型： "horizontal" 或 "vertical" 即水平布局和垂直布局 默认是：horizontal.
    var legendAlign:String?         //设定图例在图表区中的水平对齐方式，合法值有left，center 和 right。
    var legendVerticalAlign:String? //设定图例在图表区中的垂直对齐方式，合法值有 top，middle 和 bottom。垂直位置可以通过 y 选项做进一步设定。
    
    var backgroundColor:String?   //图表背景色
    var options3dEnable:Bool?       //是否3D化图形(仅对条形图,柱状图有效)
    var options3dAlpha:Int?
    var  options3dBeta:Int?
    var options3dDepth:Int?         //3D图形深度
    
    var borderRadius:Int?           //柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效)
    var markerRadius:Int?           //折线连接点的半径长度
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
