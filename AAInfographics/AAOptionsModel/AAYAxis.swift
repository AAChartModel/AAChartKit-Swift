//
//  AAYAxis.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/6/26.
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
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

import UIKit

public class AAYAxis: AAObject {
    private var title: AATitle?
    private var plotBands: [AAPlotBandsElement]?
    private var plotLines: [AAPlotLinesElement]?
    private var categories:[String]?
    private var reversed: Bool?
    private var gridLineWidth: Float? // y 轴网格线宽度
    private var gridLineColor: String?  // y 轴网格线颜色
    private var gridLineDashStyle: AALineDashStyleType? //网格线线条样式，所有可用的线条样式参考：Highcharts线条样式
    private var alternateGridColor: String?  //backcolor of every other grid line area
    private var gridLineInterpolation: String? //Polar charts only. Whether the grid lines should draw as a polygon with straight lines between categories, or as circles. Can be either circle or polygon. 默认是：null.
    private var labels: AALabels? //用于设置 y 轴文字相关的
    private var lineWidth: Float?  // y 轴线宽度
    private var lineColor: String? // y 轴线颜色
    private var offset: Float? // y 轴线水平偏移
    private var allowDecimals: Bool?  //y轴是否允许显示小数
    private var max: Float?  //y轴最大值
    private var min: Float?  //y轴最小值（设置为0就不会有负数）
    //private var minPadding:   //Padding of the min value relative to the length of the axis. A padding of 0.05 will make a 100px axis 5px longer. This is useful when you don't want the lowest data value to appear on the edge of the plot area. 默认是：0.05.
    private var tickPositions: [Any]? //自定义Y轴坐标（如：[0, 25, 50, 75 , 100]）
    private var visible: Bool?  //y轴是否允许显示
    private var opposite: Bool? //是否将坐标轴显示在对立面，默认情况下 x 轴是在图表的下方显示，y 轴是在左方，坐标轴显示在对立面后，x 轴是在上方显示，y 轴是在右方显示（即坐标轴会显示在对立面）。该配置一般是用于多坐标轴区分展示，另外在 Highstock 中，y 轴默认是在对立面显示的。 默认是：false.
    private var tickInterval: Int?
    private var crosshair: AACrosshair?  //准星线样式设置
    private var stackLabels: [String: Any]?
    private var tickWidth: Float? //坐标轴刻度线的宽度，设置为 0 时则不显示刻度线
    private var tickLength: Float? //坐标轴刻度线的长度。 默认是：10.
    private var tickPosition: String? //刻度线相对于轴线的位置，可用的值有 inside 和 outside，分别表示在轴线的内部和外部。 默认是：outside.
    
    @discardableResult
    public func title(_ prop:AATitle?) -> AAYAxis {
        title = prop
        return self
    }
    
    @discardableResult
    public func plotBands(_ prop: [AAPlotBandsElement]) -> AAYAxis {
        plotBands = prop
        return self
    }
    
    @discardableResult
    public func plotLines(_ prop: [AAPlotLinesElement]) -> AAYAxis {
        plotLines = prop
        return self
    }
    
    @discardableResult
    public func categories(_ prop: [String]?) -> AAYAxis {
        categories = prop
        return self
    }
    
    @discardableResult
    public func reversed(_ prop: Bool?) -> AAYAxis {
        reversed = prop
        return self
    }
    
    @discardableResult
    public func gridLineWidth(_ prop: Float?) -> AAYAxis {
        gridLineWidth = prop
        return self
    }
    
    @discardableResult
    public func gridLineColor(_ prop: String?) -> AAYAxis {
        gridLineColor = prop
        return self
    }
    
    @discardableResult
    public func gridLineDashStyle(_ prop: AALineDashStyleType?) -> AAYAxis {
        gridLineDashStyle = prop
        return self
    }
    
    @discardableResult
    public func alternateGridColor(_ prop: String?) -> AAYAxis {
        alternateGridColor = prop
        return self
    }
    
    @discardableResult
    public func gridLineInterpolation(_ prop: String?) -> AAYAxis {
        gridLineInterpolation = prop
        return self
    }
    
    @discardableResult
    public func labels(_ prop: AALabels?) -> AAYAxis {
        labels = prop
        return self
    }
    
    @discardableResult
    public func lineWidth(_ prop: Float?) -> AAYAxis {
        lineWidth = prop
        return self
    }
    
    @discardableResult
    public func lineColor(_ prop: String?) -> AAYAxis {
        lineColor = prop
        return self
    }
    
    @discardableResult
    public func offset(_ prop: Float?) -> AAYAxis {
        offset = prop
        return self
    }
    
    @discardableResult
    public func allowDecimals(_ prop: Bool?) -> AAYAxis {
        allowDecimals = prop
        return self
    }
    
    @discardableResult
    public func max(_ prop: Float?) -> AAYAxis {
        max = prop
        return self
    }
    
    @discardableResult
    public func min(_ prop: Float?) -> AAYAxis {
        min = prop
        return self
    }
    
    @discardableResult
    public func tickPositions(_ prop: [Any]?) -> AAYAxis {
        tickPositions = prop
        return self
    }
    
    @discardableResult
    public func visible(_ prop: Bool?) -> AAYAxis {
        visible = prop
        return self
    }
    
    @discardableResult
    public func opposite(_ prop: Bool?) -> AAYAxis {
        opposite = prop
        return self
    }
    
    @discardableResult
    public func tickInterval(_ prop: Int?) -> AAYAxis {
        tickInterval = prop
        return self
    }
    
    @discardableResult
    public func crosshair(_ prop: AACrosshair?) -> AAYAxis {
        crosshair = prop
        return self
    }
    
    @discardableResult
    public func stackLabels(_ prop: [String: Any]?) -> AAYAxis {
        stackLabels = prop
        return self
    }
    
    @discardableResult
    public func tickWidth(_ prop: Float?) -> AAYAxis {
        tickWidth = prop
        return self
    }
    
    @discardableResult
    public func tickLength(_ prop: Float?) -> AAYAxis {
        tickLength = prop
        return self
    }
    
    @discardableResult
    public func tickPosition(_ prop: String?) -> AAYAxis {
        tickPosition = prop
        return self
    }
    
    public override init() {
        
    }
}
