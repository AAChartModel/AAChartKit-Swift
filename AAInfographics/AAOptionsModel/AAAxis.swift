//
//  AAAxis.swift
//  AAInfographicsDemo
//
//  Created by Admin on 2022/4/18.
//  Copyright © 2022 An An. All rights reserved.
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


public enum AAChartAxisType: String {
    case linear
    case logarithmic
    case datetime
    case category
}

/// https://api.highcharts.com/highcharts/xAxis
/// https://api.highcharts.com/highcharts/yAxis
public class AAAxis: AAObject {
    public var allowDecimals: Bool?
    public var alternateGridColor: Any?
    public var crosshair: AACrosshair? //Focus line style settings
    public var title: AATitle?
    public var type: String?
    public var dateTimeLabelFormats: AADateTimeLabelFormats?
    public var plotBands: [AAPlotBandsElement]?
    public var plotLines: [AAPlotLinesElement]?
    public var categories: [String]?
    public var reversed: Bool? //Whether to reverse the axis so that the highest number is closest to the origin. If the chart is inverted, the XOrY-axis is reversed by default.
    public var reversedStacks: Bool?
    public var lineWidth: Float? //XOrY-axis line width
    public var lineColor: String? //XOrY-axis line color
    public var linkedTo: Int?
    public var max: Double? //XOrY-axis maximum
    public var min: Double? //XOrY-axis minimum  (set to 0, there will be no negative numbers)
    public var maxPadding: Float? //Padding of the max value relative to the length of the axis. A padding of 0.05 will make a 100px axis 5px longer. This is useful when you don't want the highest data value to appear on the edge of the plot area. When the axis' max option is set or a max extreme is set using axis.setExtremes(), the maxPadding will be ignored. Defaults to 0.01.
    public var minPadding: Float? //Padding of the min value relative to the length of the axis. A padding of 0.05 will make a 100px axis 5px longer. This is useful when you don't want the lowest data value to appear on the edge of the plot area.  Defaults to 0.05
    public var minRange: Int?
    public var minTickInterval: Int? //The minimum tick interval allowed in axis values. For example on zooming in on an axis with daily data, this can be used to prevent the axis from showing hours. Defaults to the closest distance between two points on the axis.
    public var minorTicks: Bool?
    public var minorGridLineColor: String? //Color of the minor, secondary grid lines.
    public var minorGridLineDashStyle: String? //The dash or dot style of the minor grid lines.
    public var minorGridLineWidth: Float? //Width of the minor, secondary grid lines.
    public var minorTickColor: String? //Color for the minor tick marks.
    public var minorTickInterval: Any? /*Specific tick interval in axis units for the minor ticks. On a linear axis, if "auto", the minor tick interval is calculated as a fifth of the tickInterval. If null or undefined, minor ticks are not shown.
     
     On logarithmic axes, the unit is the power of the value. For example, setting the minorTickInterval to 1 puts one tick on each of 0.1, 1, 10, 100 etc. Setting the minorTickInterval to 0.1 produces 9 ticks between 1 and 10, 10 and 100 etc.

    If user settings dictate minor ticks to become too dense, they don't make sense, and will be ignored to prevent performance problems.*/
    public var minorTickLength: Float? //The pixel length of the minor tick marks.
    public var minorTickPosition: String? //The position of the minor tick marks relative to the axis line. Can be one of inside and outside. Defaults to outside.
    public var minorTickWidth: Float? //The pixel width of the minor tick mark.
    
    public var gridLineWidth: Float? //XOrY-axis grid line width
    public var gridLineColor: String? //XOrY-axis grid line color
    public var gridLineDashStyle: String? //XOrY-axis grid line style
    public var gridLineInterpolation: String?
    public var gridZIndex: Int?
    public var offset: Float? //The distance in pixels from the plot area to the axis line. A positive offset moves the axis with it's line, labels and ticks away from the plot area. This is typically used when two or more axes are displayed on the same side of the plot. With multiple axes the offset is dynamically adjusted to avoid collision, this can be overridden by setting offset explicitly.
    public var labels: AALabels? //Used to set the XOrY-axis text related
    public var visible: Bool? //Used to set whether the XOrY-axis and XOrY-axis text are displayed
    public var opposite: Bool? //Whether to display the coordinate axis on the opposite surface. By default, the X or Y axis is displayed below the chart, the y axis is on the left, the coordinate axis is displayed on the opposite surface, and the X or Y axis is displayed on the top. The axis is displayed on the right (that is, the coordinate axis is displayed on the opposite side). This configuration is generally used for multi-axis display, and in Highstock, the y-axis is displayed on the opposite side by default. The default is: false.

    public var startOnTick: Bool? //Whether to force the axis to start on a tick. Use this option with the minPadding option to control the axis start. The default is false.
    public var endOnTick: Bool? //Whether to force the axis to end on a tick. Use this option with the minPadding option to control the axis end. The default is false.
    public var tickColor: String? //Color of tick mark below X or Y axis
    public var tickAmount: Int?
    public var tickInterval: Float? //Number of ticks on the X or Y axis (set the X or Y axis content every few points:
    public var tickmarkPlacement: String? //This parameter is only valid for the classification axis. When the value is on, the tick mark will be displayed above the classification; when the value is between, the tick mark will be displayed between the two classifications. When tickInterval is 1, the default is between, otherwise it is on. The default is: null.
    public var tickWidth: Float? //The width of the axis tick marks. When set to 0, tick marks are not displayed.
    public var tickLength: Float? //The length of the axis tick marks. The default is: 10.
    public var tickPosition: String? //Position of the tick line relative to the axis line. Available values ​​are "inside" and "outside", which represent the inside and outside of the axis line, respectively. The default is: "outside".
    public var tickPositions: [Any]? //Custom XOrY-axis coordinates
    public var height: Any? //number | string
    public var top: Any? //number | string
    public var events: AAAxisEvents?

    @discardableResult
    public func allowDecimals(_ prop: Bool?) -> Self {
        allowDecimals = prop
        return self
    }

    @discardableResult
    public func alternateGridColor(_ prop: Any?) -> Self {
        alternateGridColor = prop
        return self
    }
    
    @discardableResult
    public func crosshair(_ prop: AACrosshair?) -> Self {
        crosshair = prop
        return self
    }
    
    @discardableResult
    public func title(_ prop: AATitle?) -> Self {
        title = prop
        return self
    }
    
    @discardableResult
    public func type(_ prop: AAChartAxisType?) -> Self {
        type = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func dateTimeLabelFormats(_ prop: AADateTimeLabelFormats?) -> Self {
        dateTimeLabelFormats = prop
        return self
    }
    
    @discardableResult
    public func plotBands(_ prop: [AAPlotBandsElement]?) -> Self {
        plotBands = prop
        return self
    }
    
    @discardableResult
    public func plotLines(_ prop: [AAPlotLinesElement]?) -> Self {
        plotLines = prop
        return self
    }
    
    @discardableResult
    public func categories(_ prop: [String]?) -> Self {
        categories = prop
        return self
    }
    
    @discardableResult
    public func reversed(_ prop: Bool?) -> Self {
        reversed = prop
        return self
    }
    
    @discardableResult
    public func reversedStacks(_ prop: Bool?) -> Self {
        reversedStacks = prop
        return self
    }
    
    @discardableResult
    public func lineWidth(_ prop: Float?) -> Self {
        lineWidth = prop
        return self
    }
    
    @discardableResult
    public func lineColor(_ prop: String?) -> Self {
        lineColor = prop
        return self
    }
    
    @discardableResult
    public func linkedTo(_ prop: Int?) -> Self {
        linkedTo = prop
        return self
    }
    
    @discardableResult
    public func max(_ prop: Double?) -> Self {
        max = prop
        return self
    }
    
    @discardableResult
    public func min(_ prop: Double?) -> Self {
        min = prop
        return self
    }
    
    @discardableResult
    public func maxPadding(_ prop: Float?) -> Self {
        maxPadding = prop
        return self
    }
    
    @discardableResult
    public func minPadding(_ prop: Float?) -> Self {
        minPadding = prop
        return self
    }
    
    @discardableResult
    public func minRange(_ prop: Int?) -> Self {
        minRange = prop
        return self
    }
    
    @discardableResult
    public func minorTicks(_ prop: Bool?) -> Self {
        minorTicks = prop
        return self
    }
    
    @discardableResult
    public func minTickInterval(_ prop: Int?) -> Self {
        minTickInterval = prop
        return self
    }
    
    @discardableResult
    public func minorGridLineColor(_ prop: String?) -> Self {
        minorGridLineColor = prop
        return self
    }
    
    @discardableResult
    public func minorGridLineDashStyle(_ prop: AAChartLineDashStyleType?) -> Self {
        minorGridLineDashStyle = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func minorGridLineWidth(_ prop: Float?) -> Self {
        minorGridLineWidth = prop
        return self
    }
    
    @discardableResult
    public func minorTickColor(_ prop: String?) -> Self {
        minorTickColor = prop
        return self
    }
    
    @discardableResult
    public func minorTickInterval(_ prop: Any?) -> Self {
        minorTickInterval = prop
        return self
    }
    
    @discardableResult
    public func minorTickLength(_ prop: Float?) -> Self {
        minorTickLength = prop
        return self
    }
    
    @discardableResult
    public func minorTickPosition(_ prop: String?) -> Self {
        minorTickPosition = prop
        return self
    }
    
    @discardableResult
    public func minorTickWidth(_ prop: Float?) -> Self {
        minorTickWidth = prop
        return self
    }
    
    @discardableResult
    public func gridLineWidth(_ prop: Float?) -> Self {
        gridLineWidth = prop
        return self
    }
    
    @discardableResult
    public func gridLineColor(_ prop: String?) -> Self {
        gridLineColor = prop
        return self
    }
    
    @discardableResult
    public func gridLineDashStyle(_ prop: AAChartLineDashStyleType?) -> Self {
        gridLineDashStyle = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func gridLineInterpolation(_ prop: String?) -> Self {
        gridLineInterpolation = prop
        return self
    }
    
    @discardableResult
    public func gridZIndex(_ prop: Int?) -> Self {
        gridZIndex = prop
        return self
    }
    
    @discardableResult
    public func offset(_ prop: Float?) -> Self {
        offset = prop
        return self
    }
    
    @discardableResult
    public func labels(_ prop: AALabels?) -> Self {
        labels = prop
        return self
    }
    
    @discardableResult
    public func visible(_ prop: Bool?) -> Self {
        visible = prop
        return self
    }
    
    @discardableResult
    public func opposite(_ prop: Bool?) -> Self {
        opposite = prop
        return self
    }
    
    @discardableResult
    public func startOnTick(_ prop: Bool?) -> Self {
        startOnTick = prop
        return self
    }
    
    @discardableResult
    public func endOnTick(_ prop: Bool?) -> Self {
        endOnTick = prop
        return self
    }
    
    @discardableResult
    public func tickColor(_ prop: String?) -> Self {
        tickColor = prop
        return self
    }
    
    @discardableResult
    public func tickAmount(_ prop: Int?) -> Self {
        tickAmount = prop
        return self
    }
    
    @discardableResult
    public func tickInterval(_ prop: Float?) -> Self {
        tickInterval = prop
        return self
    }
    
    @discardableResult
    public func tickmarkPlacement(_ prop: String?) -> Self {
        tickmarkPlacement = prop
        return self
    }
    
    @discardableResult
    public func tickWidth(_ prop: Float?) -> Self {
        tickWidth = prop
        return self
    }
    
    @discardableResult
    public func tickLength(_ prop: Float?) -> Self {
        tickLength = prop
        return self
    }
    
    @discardableResult
    public func tickPosition(_ prop: String?) -> Self {
        tickPosition = prop
        return self
    }
    
    @discardableResult
    public func tickPositions(_ prop: [Any]?) -> Self {
        tickPositions = prop
        return self
    }
    
    @discardableResult
    public func height(_ prop: Any?) -> Self {
        height = prop
        return self
    }
    
    @discardableResult
    public func top(_ prop: Any?) -> Self {
        top = prop
        return self
    }
    
    @discardableResult
    public func events(_ prop: AAAxisEvents?) -> Self {
        events = prop
        return self
    }
    
    public override init() {
        
    }
}


public class AADateTimeLabelFormats: AAObject {
    public var millisecond: String?
    public var second: String?
    public var minute: String?
    public var hour: String?
    public var day: String?
    public var week: String?
    public var month: String?
    public var year: String?
    
    @discardableResult
    public func millisecond(_ prop: String?) -> AADateTimeLabelFormats {
        millisecond = prop
        return self
    }
    
    @discardableResult
    public func second(_ prop: String?) -> AADateTimeLabelFormats {
        second = prop
        return self
    }
    
    @discardableResult
    public func minute(_ prop: String?) -> AADateTimeLabelFormats {
        minute = prop
        return self
    }
    
    @discardableResult
    public func hour(_ prop: String?) -> AADateTimeLabelFormats {
        hour = prop
        return self
    }
    
    @discardableResult
    public func day(_ prop: String?) -> AADateTimeLabelFormats {
        day = prop
        return self
    }
    
    @discardableResult
    public func week(_ prop: String?) -> AADateTimeLabelFormats {
        week = prop
        return self
    }
    
    @discardableResult
    public func month(_ prop: String?) -> AADateTimeLabelFormats {
        month = prop
        return self
    }
    
    @discardableResult
    public func year(_ prop: String?) -> AADateTimeLabelFormats {
        year = prop
        return self
    }
    
    public override init() {
        
    }
}

/**
 events:{
 afterBreaks:undefined
 afterSetExtremes:undefined
 pointBreak:undefined
 pointBreakOut:undefined
 pointInBreak:undefined
 setExtremes:undefined
 }
 */
public class AAAxisEvents: AAObject {
    public var afterBreaks: String?
    public var afterSetExtremes: String?
    public var pointBreak: String?
    public var pointBreakOut: String?
    public var pointInBreak: String?
    public var setExtremes: String?
    
    @discardableResult
    public func afterBreaks(_ prop: String?) -> AAAxisEvents {
        afterBreaks = prop?.aa_toPureJSString()
        return self
    }
    
    @discardableResult
    public func afterSetExtremes(_ prop: String?) -> AAAxisEvents {
        afterSetExtremes = prop?.aa_toPureJSString()
        return self
    }
    
    @discardableResult
    public func pointBreak(_ prop: String?) -> AAAxisEvents {
        pointBreak = prop?.aa_toPureJSString()
        return self
    }
    
    @discardableResult
    public func pointBreakOut(_ prop: String?) -> AAAxisEvents {
        pointBreakOut = prop?.aa_toPureJSString()
        return self
    }
    
    @discardableResult
    public func pointInBreak(_ prop: String?) -> AAAxisEvents {
        pointInBreak = prop?.aa_toPureJSString()
        return self
    }
    
    @discardableResult
    public func setExtremes(_ prop: String?) -> AAAxisEvents {
        setExtremes = prop?.aa_toPureJSStringWithParentheses()
        return self
    }
    
    public override init() {
        
    }
}


private extension String {
    
    func aa_toPureJSStringWithParentheses() -> String {
        //https://stackoverflow.com/questions/34334232/why-does-function-not-work-but-function-does-chrome-devtools-node
        var pureJSStr = "(\(self))"
        pureJSStr = pureJSStr.replacingOccurrences(of: "'", with: "\"")
        pureJSStr = pureJSStr.replacingOccurrences(of: "\0", with: "")
        pureJSStr = pureJSStr.replacingOccurrences(of: "\n", with: "")
  
        return pureJSStr
    }
    
}
