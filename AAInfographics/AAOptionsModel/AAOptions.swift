//
//  AAOptions.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/8/31.
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

public class AAOptions: AAObject {
    var chart: AAChart?
    var title: AATitle?
    var subtitle: AASubtitle?
    var xAxis: AAXAxis?
    var yAxis: Any?
    var tooltip: AATooltip?
    var plotOptions: AAPlotOptions?
    var series: [AASeriesElement]?
    var legend: AALegend?
    var colors: [Any]?
    var touchEventEnabled: Bool?
    
    @discardableResult
    public func chart(_ prop: AAChart?) -> AAOptions {
        chart = prop
        return self
    }
    
    @discardableResult
    public func title(_ prop: AATitle?) -> AAOptions {
        title = prop
        return self
    }
    
    @discardableResult
    public func subtitle(_ prop: AASubtitle?) -> AAOptions {
        subtitle = prop
        return self
    }
    
    @discardableResult
    public func xAxis(_ prop: AAXAxis?) -> AAOptions {
        xAxis = prop
        return self
    }
    
    @discardableResult
    public func yAxis(_ prop: Any?) -> AAOptions {
        yAxis = prop
        return self
    }
    
    @discardableResult
    public func tooltip(_ prop: AATooltip?) -> AAOptions {
        tooltip = prop
        return self
    }
    
    @discardableResult
    public func plotOptions(_ prop: AAPlotOptions?) -> AAOptions {
        plotOptions = prop
        return self
    }
    
    @discardableResult
    public func series(_ prop: [AASeriesElement]?) -> AAOptions {
        series = prop
        return self
    }
    
    @discardableResult
    public func legend(_ prop: AALegend?) -> AAOptions {
        legend = prop
        return self
    }
    
    @discardableResult
    public func colors(_ prop: [Any]?) -> AAOptions {
        colors = prop
        return self
    }
    
    @discardableResult
    public func touchEventEnabled(_ prop: Bool?) -> AAOptions {
        touchEventEnabled = prop
        return self
    }
    
    public override init() {
        
    }
}

