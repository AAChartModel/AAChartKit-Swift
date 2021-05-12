//
//  AAXAxis.swift
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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

import Foundation

public class AAXAxis: AAObject {
    public var type: String?
    public var dateTimeLabelFormats: AADateTimeLabelFormats?
    public var plotBands: [AAPlotBandsElement]?
    public var plotLines: [AAPlotLinesElement]?
    public var categories: [String]?
    public var reversed: Bool?
    public var lineWidth: Float? // x-axis line width
    public var lineColor: String? // x-axis line color
    public var linkedTo: Int?
    public var max: Float? // x-axis maximum
    public var min: Float? // x-axis minimum  (set to 0, there will be no negative numbers)
    public var tickColor: String? // Color of tick mark below x axis
    public var title: AATitle?
    public var gridLineWidth: Float? // x-axis grid line width
    public var gridLineColor: String? // x-axis grid line color
    public var gridLineDashStyle: String? // x-axis grid line style
    public var offset: Float? // x-axis vertical offset
    public var labels: AALabels? // Used to set the x-axis text related
    public var visible: Bool? // Used to set whether the x-axis and x-axis text are displayed
    public var opposite: Bool? // Whether to display the coordinate axis on the opposite surface. By default, the x axis is displayed below the chart, the y axis is on the left, the coordinate axis is displayed on the opposite surface, and the x axis is displayed on the top. The axis is displayed on the right (that is, the coordinate axis is displayed on the opposite side). This configuration is generally used for multi-axis display, and in Highstock, the y-axis is displayed on the opposite side by default. The default is: false.

    public var startOnTick: Bool? // Whether to force the axis to start on a tick. Use this option with the minPadding option to control the axis start. The default is false.
    public var tickAmount: Int?
    public var tickInterval: Float? // Number of ticks on the x axis (set the X axis content every few points:
    public var crosshair: AACrosshair? // Focus line style settings
    public var tickmarkPlacement: String? // This parameter is only valid for the classification axis. When the value is on, the tick mark will be displayed above the classification; when the value is between, the tick mark will be displayed between the two classifications. When tickInterval is 1, the default is between, otherwise it is on. The default is: null.
    public var tickWidth: Float? // The width of the axis tick marks. When set to 0, tick marks are not displayed.
    public var tickLength: Float? /// The length of the axis tick marks. The default is: 10.
    public var tickPosition: String? // Position of the tick line relative to the axis line. Available values ​​are "inside" and "outside", which represent the inside and outside of the axis line, respectively. The default is: "outside".
    public var tickPositions: [Any]? // Custom x-axis coordinates 
    public var minRange: Int?

    @discardableResult
    public func title(_ prop:AATitle?) -> AAXAxis {
        title = prop
        return self
    }
    
    @discardableResult
    public func type(_ prop: String?) -> AAXAxis {
        type = prop
        return self
    }
    
    @discardableResult
    public func dateTimeLabelFormats(_ prop: AADateTimeLabelFormats?) -> AAXAxis {
        dateTimeLabelFormats = prop
        return self
    }
    
    @discardableResult
    public func plotBands(_ prop: [AAPlotBandsElement]?) -> AAXAxis {
        plotBands = prop
        return self
    }
    
    @discardableResult
    public func plotLines(_ prop: [AAPlotLinesElement]?) -> AAXAxis {
        plotLines = prop
        return self
    }
    
    @discardableResult
    public func categories(_ prop: [String]?) -> AAXAxis {
        categories = prop
        return self
    }
    
    @discardableResult
    public func reversed(_ prop: Bool?) -> AAXAxis {
        reversed = prop
        return self
    }
    
    @discardableResult
    public func lineWidth(_ prop: Float?) -> AAXAxis {
        lineWidth = prop
        return self
    }
    
    @discardableResult
    public func lineColor(_ prop: String?) -> AAXAxis {
        lineColor = prop
        return self
    }
    
    @discardableResult
    public func linkedTo(_ prop: Int?) -> AAXAxis {
        linkedTo = prop
        return self
    }
    
    @discardableResult
    public func max(_ prop: Float?) -> AAXAxis {
        max = prop
        return self
    }
    
    @discardableResult
    public func min(_ prop: Float?) -> AAXAxis {
        min = prop
        return self
    }
    
    @discardableResult
    public func tickColor(_ prop: String?) -> AAXAxis {
        tickColor = prop
        return self
    }
    
    @discardableResult
    public func gridLineWidth(_ prop: Float?) -> AAXAxis {
        gridLineWidth = prop
        return self
    }
    
    @discardableResult
    public func gridLineColor(_ prop: String?) -> AAXAxis {
        gridLineColor = prop
        return self
    }
    
    @discardableResult
    public func gridLineDashStyle(_ prop: AAChartLineDashStyleType?) -> AAXAxis {
        gridLineDashStyle = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func offset(_ prop: Float?) -> AAXAxis {
        offset = prop
        return self
    }
    
    @discardableResult
    public func labels(_ prop: AALabels?) -> AAXAxis {
        labels = prop
        return self
    }
    
    @discardableResult
    public func visible(_ prop: Bool?) -> AAXAxis {
        visible = prop
        return self
    }
    
    @discardableResult
    public func opposite(_ prop: Bool?) -> AAXAxis {
        opposite = prop
        return self
    }
    
    @discardableResult
    public func startOnTick(_ prop: Bool?) -> AAXAxis {
        startOnTick = prop
        return self
    }
    
    @discardableResult
    public func tickAmount(_ prop: Int?) -> AAXAxis {
        tickAmount = prop
        return self
    }
    
    @discardableResult
    public func tickInterval(_ prop: Float?) -> AAXAxis {
        tickInterval = prop
        return self
    }
    
    @discardableResult
    public func crosshair(_ prop: AACrosshair?) -> AAXAxis {
        crosshair = prop
        return self
    }
    
    @discardableResult
    public func tickmarkPlacement(_ prop: String?) -> AAXAxis {
        tickmarkPlacement = prop
        return self
    }
    
    @discardableResult
    public func tickWidth(_ prop: Float?) -> AAXAxis {
        tickWidth = prop
        return self
    }
    
    @discardableResult
    public func tickLength(_ prop: Float?) -> AAXAxis {
        tickLength = prop
        return self
    }
    
    @discardableResult
    public func tickPosition(_ prop: String?) -> AAXAxis {
        tickPosition = prop
        return self
    }
    
    @discardableResult
    public func minRange(_ prop: Int?) -> AAXAxis {
        minRange = prop
        return self
    }
    
    @discardableResult
    public func tickPositions(_ prop: [Any]?) -> AAXAxis {
        tickPositions = prop
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

