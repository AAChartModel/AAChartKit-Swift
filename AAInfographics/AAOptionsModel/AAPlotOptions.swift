//
//  AAPlotOptions.swift
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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */


/// https://api.highcharts.com/highcharts/plotOptions
public class AAPlotOptions: AAObject {
    public var series: AASeries?
    public var column: AAColumn?
    public var bar: AABar?
    public var line: AALine?
    public var spline: AASpline?
    public var area: AAArea?
    public var areaspline: AAAreaspline?
    public var pie: AAPie?
    public var bubble: AABubble?
    public var columnrange: AAColumnrange?
    public var arearange: AAArearange?
    public var boxplot: AABoxplot?
    public var scatter: AAScatter?

    @discardableResult
    public func series(_ prop: AASeries) -> AAPlotOptions {
        series = prop
        return self
    }
    
    @discardableResult
    public func column(_ prop: AAColumn) -> AAPlotOptions {
        column = prop
        return self
    }
    
    @discardableResult
    public func bar(_ prop: AABar) -> AAPlotOptions {
        bar = prop
        return self
    }
    
    @discardableResult
    public func line(_ prop: AALine) -> AAPlotOptions {
        line = prop
        return self
    }
    
    @discardableResult
    public func spline(_ prop: AASpline) -> AAPlotOptions {
        spline = prop
        return self
    }
    
    @discardableResult
    public func area(_ prop: AAArea) -> AAPlotOptions {
        area = prop
        return self
    }
    
    @discardableResult
    public func areaspline(_ prop: AAAreaspline) -> AAPlotOptions {
        areaspline = prop
        return self
    }
    
    @discardableResult
    public func pie(_ prop: AAPie) -> AAPlotOptions {
        pie = prop
        return self
    }
    
    @discardableResult
    public func bubble(_ prop: AABubble) -> AAPlotOptions {
        bubble = prop
        return self
    }
    
    @discardableResult
    public func columnrange(_ prop: AAColumnrange) -> AAPlotOptions {
        columnrange = prop
        return self
    }
    
    @discardableResult
    public func arearange(_ prop: AAArearange) -> AAPlotOptions {
        arearange = prop
        return self
    }
    
    @discardableResult
    public func boxplot(_ prop: AABoxplot) -> AAPlotOptions {
        boxplot = prop
        return self
    }

    @discardableResult
    public func scatter(_ prop: AAScatter) -> AAPlotOptions {
        scatter = prop
        return self
    }
    
    public override init() {
        
    }
    
}


public class AALine: AAObject {
    public var dataLabels: AADataLabels?
    public var lineColor: String?
    public var lineWidth: Float?
    
    @discardableResult
    public func dataLabels(_ prop: AADataLabels) -> AALine {
        dataLabels = prop
        return self
    }
    
    @discardableResult
    public func lineColor(_ prop: String) -> Self {
        lineColor = prop
        return self
    }

    @discardableResult
    public func lineWidth(_ prop: Float) -> Self {
        lineWidth = prop
        return self
    }
    
    public override init() {
        
    }
}


public class AASpline: AALine {
    
    public override init() {
        
    }
}


public class AAArea: AASeries {
    public var fillColor: String?
    public var fillOpacity: Float?
    public var negativeFillColor: String?
    public var trackByArea: Bool?
    public var lineColor: String?

    @discardableResult
    public func fillColor(_ prop: String) -> Self {
        fillColor = prop
        return self
    }

    @discardableResult
    public func fillOpacity(_ prop: Float) -> Self {
        fillOpacity = prop
        return self
    }

    @discardableResult
    public func negativeFillColor(_ prop: String) -> Self {
        negativeFillColor = prop
        return self
    }

    @discardableResult
    public func trackByArea(_ prop: Bool) -> Self {
        trackByArea = prop
        return self
    }

    @discardableResult
    public func lineColor(_ prop: String) -> Self {
        lineColor = prop
        return self
    }

    public override init() {
        
    }
}


public class AAAreaspline: AAArea {
    
    public override init() {
        
    }
}


public class AAArearange: AAObject {
    public var dataLabels: AADataLabels?
    
    @discardableResult
    public func dataLabels(_ prop: AADataLabels) -> AAArearange {
        dataLabels = prop
        return self
    }
    
    public override init() {
        
    }
}




