//
//  AALabel.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/7/17.
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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */


/// https://api.highcharts.com/highcharts/xAxis.plotBands.label
/// https://api.highcharts.com/highcharts/xAxis.plotLines.label
/// https://api.highcharts.com/highcharts/yAxis.plotBands.label
/// https://api.highcharts.com/highcharts/yAxis.plotLines.label
public class AALabel: AAObject {
    public var align: String? //Alignment of axis labels. Available values are "left", "center", and "right". The default value is intelligently judged based on the position of the coordinate axis (position in the chart), that is, the rotation angle of the label.
    public var rotation: Float? //The rotation angle of the axis label. The default is: 0.
    public var text: String? //text
    public var textAlign: String? //Text alignment
    public var useHTML: Bool? //Enable HTML rendering
    public var verticalAlign: String? //Vertical alignment
    public var style: AAStyle? //CSS style for axis labels
    public var x: Float? //The horizontal offset from the axis axis tick marks. The default is: 0.
    public var y: Float? //The vertical flat offset from the axis axis tick marks. The default is: null.
    public var format: String? //Format string for the axis label.
    public var formatter: String? //Callback JavaScript function to format the label.
    
    @discardableResult
    public func align(_ prop: AAChartAlignType) -> AALabel {
        align = prop.rawValue
        return self
    }
    
    @discardableResult
    public func rotation(_ prop: Float) -> AALabel {
        rotation = prop
        return self
    }
    
    @discardableResult
    public func text(_ prop: String) -> AALabel {
        text = prop
        return self
    }
    
    @discardableResult
    public func textAlign(_ prop: AAChartAlignType) -> AALabel {
        textAlign = prop.rawValue
        return self
    }
    
    @discardableResult
    public func useHTML(_ prop: Bool) -> AALabel {
        useHTML = prop
        return self
    }
    
    @discardableResult
    public func verticalAlign(_ prop: String) -> AALabel {
        verticalAlign = prop
        return self
    }
    
    @discardableResult
    public func style(_ prop: AAStyle) -> AALabel {
        style = prop
        return self
    }
    
    @discardableResult
    public func x(_ prop: Float) -> AALabel {
        x = prop
        return self
    }
    
    @discardableResult
    public func y(_ prop: Float) -> AALabel {
        y = prop
        return self
    }

    @discardableResult
    public func format(_ prop: String) -> AALabel {
        format = prop
        return self
    }

    @discardableResult
    public func formatter(_ prop: String) -> AALabel {
        formatter =  prop.aa_toPureJSString()
        return self
    }
    
    public override init() {
        
    }
}
