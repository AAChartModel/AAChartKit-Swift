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

import Foundation

public class AAYAxis: AAObject {
    public var title: AATitle?
    public var plotBands: [AAPlotBandsElement]?
    public var plotLines: [AAPlotLinesElement]?
    public var categories: [String]?
    public var reversed: Bool?
    public var gridLineWidth: Float? // y-axis grid line width
    public var gridLineColor: String? // y-axis grid line color
    public var gridLineDashStyle: String? // Grid line line style, all available line style references: Highcharts line style
    public var alternateGridColor: String? // backcolor of every other grid line area
    public var gridLineInterpolation: String? // Polar charts only. Whether the grid lines should draw as a polygon with straight lines between categories, or as circles. Can be either circle or polygon. The default is: null.
    public var labels: AALabels? // Used to set the y-axis text related
    public var lineWidth: Float? // y-axis width
    public var lineColor: String? // y--axis line color
    public var offset: Float? // y-axis horizontal offset
    public var allowDecimals: Bool? // Does the y-axis allow decimals to be displayed?
    public var max: Double? // y-axis maximum
    public var min: Double? // y-axis minimum  (set to 0, there will be no negative numbers)
    // private var minPadding: // Padding of the min value relative to the length of the axis. A padding of 0.05 will make a 100px axis 5px longer. This is useful when you don't want the lowest data value to appear on the edge of the plot area. The default is: 0.05.
    public var tickPositions: [Any]? // Custom Y-axis coordinates (eg: [0, 25, 50, 75, 100])
    public var visible: Bool? // Whether the y-axis is allowed to display
    public var opposite: Bool? // Whether to display the coordinate axis on the opposite surface. By default, the x axis is displayed below the chart, the y axis is on the left, the coordinate axis is displayed on the opposite surface, and the x axis is displayed on the top. The axis is displayed on the right (that is, the coordinate axis is displayed on the opposite side). This configuration is generally used for multi-axis display, and in Highstock, the y-axis is displayed on the opposite side by default. The default is: false.
    public var startOnTick: Bool? //Whether to force the axis to start on a tick. Use this option with the minPadding option to control the axis start. The default is: false.
    public var endOnTick: Bool?
    public var tickInterval: Float?
    public var crosshair: AACrosshair? // Crosshair (focus line) style settings
    public var stackLabels: [String: Any]?
    public var tickWidth: Float? // The width of the axis tick marks. When set to 0, tick marks are not displayed.
    public var tickLength: Float? // The length of the axis tick marks. The default is: 10.
    public var tickPosition: String? // Position of the tick line relative to the axis line. Available values ​​are "inside" and "outside", which represent the inside and outside of the axis line, respectively. The default is: "outside".
    
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
    public func gridLineDashStyle(_ prop: AAChartLineDashStyleType?) -> AAYAxis {
        gridLineDashStyle = prop?.rawValue
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
    public func max(_ prop: Double?) -> AAYAxis {
        max = prop
        return self
    }
    
    @discardableResult
    public func min(_ prop: Double?) -> AAYAxis {
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
    public func startOnTick(_ prop: Bool?) -> AAYAxis {
        startOnTick = prop
        return self
    }
    
    @discardableResult
    public func endOnTick(_ prop: Bool?) -> AAYAxis {
        endOnTick = prop
        return self
    }
    
    @discardableResult
    public func tickInterval(_ prop: Float?) -> AAYAxis {
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
