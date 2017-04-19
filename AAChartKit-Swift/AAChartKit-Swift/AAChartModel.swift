//
//  AAChartModel.swift
//  AAChartKit-Swift
//
//  Created by Danny boy on 17/4/19.
//  Copyright © 2017年 Danny boy. All rights reserved.
//

public struct AAChartModel:JSONSerializable {
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
        self.chartType = "column";
        self.inverted = false;
        self.stacking = "percent";
        self.xAxisReversed = false;
        self.yAxisReversed = false;
        self.zoomType = "x";
        self.colorsTheme =  ["#b5282a","#e7a701","#50c18d","#c37779","#f1c6c5"];
        self.gradientColorEnable = false;
        self.polar = false;
        self.options3dEnable = false;
        self.crosshairs = true;
        self.xAxisLabelsEnabled = true;
        self.xAxisGridLineWidth = 0;
        self.yAxisLabelsEnabled = true;
        self.yAxisGridLineWidth = 1;
        self.legendEnabled = true;
//        self.legendLayout = AAChartLegendLayoutTypeHorizontal;
//        self.legendAlign = AAChartLegendAlignTypeCenter;
//        self.legendVerticalAlign = AAChartLegendVerticalAlignTypeBottom;
        
        self.borderRadius = 0;//柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效,设置为1000时,柱形图或者条形图头部为楔形)
        self.markerRadius = 6;//折线连接点的半径长度,设置默认值为0,这样就相当于不显示了
    
    
    }
    
    
}
