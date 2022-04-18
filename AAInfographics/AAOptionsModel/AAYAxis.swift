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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */


import Foundation

public class AAYAxis: AAAxis {
    public var stackLabels: [String: Any]?
    
    @discardableResult
    public func stackLabels(_ prop: [String: Any]?) -> AAYAxis {
        stackLabels = prop
        return self
    }
    ///----------------------------------------------------------

    
    @discardableResult
    public func allowDecimals(_ prop: Bool?) -> AAYAxis {
        allowDecimals = prop
        return self
    }

    @discardableResult
    public func alternateGridColor(_ prop: Any?) -> AAYAxis {
        alternateGridColor = prop
        return self
    }
    
    @discardableResult
    public func crosshair(_ prop: AACrosshair?) -> AAYAxis {
        crosshair = prop
        return self
    }
    
    @discardableResult
    public func title(_ prop: AATitle?) -> AAYAxis {
        title = prop
        return self
    }
    
    @discardableResult
    public func type(_ prop: AAChartAxisType?) -> AAYAxis {
        type = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func dateTimeLabelFormats(_ prop: AADateTimeLabelFormats?) -> AAYAxis {
        dateTimeLabelFormats = prop
        return self
    }
    
    @discardableResult
    public func plotBands(_ prop: [AAPlotBandsElement]?) -> AAYAxis {
        plotBands = prop
        return self
    }
    
    @discardableResult
    public func plotLines(_ prop: [AAPlotLinesElement]?) -> AAYAxis {
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
    public func linkedTo(_ prop: Int?) -> AAYAxis {
        linkedTo = prop
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
    public func minRange(_ prop: Int?) -> AAYAxis {
        minRange = prop
        return self
    }
    
    @discardableResult
    public func minTickInterval(_ prop: Int?) -> AAYAxis {
        minTickInterval = prop
        return self
    }
    
    @discardableResult
    public func minorGridLineColor(_ prop: String?) -> AAYAxis {
        minorGridLineColor = prop
        return self
    }
    
    @discardableResult
    public func minorGridLineDashStyle(_ prop: AAChartLineDashStyleType?) -> AAYAxis {
        minorGridLineDashStyle = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func minorGridLineWidth(_ prop: Float?) -> AAYAxis {
        minorGridLineWidth = prop
        return self
    }
    
    @discardableResult
    public func minorTickColor(_ prop: String?) -> AAYAxis {
        minorTickColor = prop
        return self
    }
    
    @discardableResult
    public func minorTickInterval(_ prop: Any?) -> AAYAxis {
        minorTickInterval = prop
        return self
    }
    
    @discardableResult
    public func minorTickLength(_ prop: Float?) -> AAYAxis {
        minorTickLength = prop
        return self
    }
    
    @discardableResult
    public func minorTickPosition(_ prop: String?) -> AAYAxis {
        minorTickPosition = prop
        return self
    }
    
    @discardableResult
    public func minorTickWidth(_ prop: Float?) -> AAYAxis {
        minorTickWidth = prop
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
    public func gridLineInterpolation(_ prop: String?) -> AAYAxis {
        gridLineInterpolation = prop
        return self
    }
    
    @discardableResult
    public func offset(_ prop: Float?) -> AAYAxis {
        offset = prop
        return self
    }
    
    @discardableResult
    public func labels(_ prop: AALabels?) -> AAYAxis {
        labels = prop
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
    public func tickColor(_ prop: String?) -> AAYAxis {
        tickColor = prop
        return self
    }
    
    @discardableResult
    public func tickAmount(_ prop: Int?) -> AAYAxis {
        tickAmount = prop
        return self
    }
    
    @discardableResult
    public func tickInterval(_ prop: Float?) -> AAYAxis {
        tickInterval = prop
        return self
    }
    
    @discardableResult
    public func tickmarkPlacement(_ prop: String?) -> AAYAxis {
        tickmarkPlacement = prop
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
    
    @discardableResult
    public func tickPositions(_ prop: [Any]?) -> AAYAxis {
        tickPositions = prop
        return self
    }
    
    public override init() {
        
    }

}
