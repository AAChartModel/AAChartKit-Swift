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



public class AAXAxis: AAAxis {
    
    @discardableResult
    public func allowDecimals(_ prop: Bool?) -> AAXAxis {
        allowDecimals = prop
        return self
    }

    @discardableResult
    public func alternateGridColor(_ prop: Any?) -> AAXAxis {
        alternateGridColor = prop
        return self
    }
    
    @discardableResult
    public func crosshair(_ prop: AACrosshair?) -> AAXAxis {
        crosshair = prop
        return self
    }
    
    @discardableResult
    public func title(_ prop: AATitle?) -> AAXAxis {
        title = prop
        return self
    }
    
    @discardableResult
    public func type(_ prop: AAChartAxisType?) -> AAXAxis {
        type = prop?.rawValue
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
    public func minRange(_ prop: Int?) -> AAXAxis {
        minRange = prop
        return self
    }
    
    @discardableResult
    public func minTickInterval(_ prop: Int?) -> AAXAxis {
        minTickInterval = prop
        return self
    }
    
    @discardableResult
    public func minorGridLineColor(_ prop: String?) -> AAXAxis {
        minorGridLineColor = prop
        return self
    }
    
    @discardableResult
    public func minorGridLineDashStyle(_ prop: AAChartLineDashStyleType?) -> AAXAxis {
        minorGridLineDashStyle = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func minorGridLineWidth(_ prop: Float?) -> AAXAxis {
        minorGridLineWidth = prop
        return self
    }
    
    @discardableResult
    public func minorTickColor(_ prop: String?) -> AAXAxis {
        minorTickColor = prop
        return self
    }
    
    @discardableResult
    public func minorTickInterval(_ prop: Any?) -> AAXAxis {
        minorTickInterval = prop
        return self
    }
    
    @discardableResult
    public func minorTickLength(_ prop: Float?) -> AAXAxis {
        minorTickLength = prop
        return self
    }
    
    @discardableResult
    public func minorTickPosition(_ prop: String?) -> AAXAxis {
        minorTickPosition = prop
        return self
    }
    
    @discardableResult
    public func minorTickWidth(_ prop: Float?) -> AAXAxis {
        minorTickWidth = prop
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
    public func gridLineInterpolation(_ prop: String?) -> AAXAxis {
        gridLineInterpolation = prop
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
    public func endOnTick(_ prop: Bool?) -> AAXAxis {
        endOnTick = prop
        return self
    }
    
    @discardableResult
    public func tickColor(_ prop: String?) -> AAXAxis {
        tickColor = prop
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
    public func tickPositions(_ prop: [Any]?) -> AAXAxis {
        tickPositions = prop
        return self
    }
    
    public override init() {
        
    }

}


