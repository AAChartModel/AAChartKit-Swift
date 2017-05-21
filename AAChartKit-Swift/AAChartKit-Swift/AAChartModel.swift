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
    var animationType:String?
    var title:String?
    var subtitle:String?
    
    var chartType:String?
    var stacking:String?
    var symbol:String?
    
    var zoomType:String?
    
    var inverted:Bool?
    var xAxisReversed:Bool?
    var yAxisReversed:Bool?
    var crosshairs:Bool?
    var gradientColorEnable:Bool?
    var polar:Bool?
    var dataLabelEnabled:Bool?
    var xAxisLabelsEnabled:Bool?
    
    var categories:Array<Any>?
    var xAxisGridLineWidth:Int?
    var yAxisLabelsEnabled:Bool?
    var yAxisTitle:String?
    var yAxisGridLineWidth:Int?
    
    var colorsTheme:Array<Any>?
    var series:Array<Any>?
    
    
    var legendEnabled:Bool?
    var legendLayout:String?
    var legendAlign:String?
    var legendVerticalAlign:String?
    
    var backgroundColor:String?
    var options3dEnable:Bool?
    var options3dAlpha:Int?
    var  options3dBeta:Int?
    var options3dDepth:Int?
    
    var borderRadius:Int?
    var markerRadius:Int?
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
