//
//  AASeries.swift
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


/// https://api.highcharts.com/highcharts/plotOptions.series
public class AASeries: AAObject {
    public var borderColor: String? //The border color, It is only valid for column, bar, pie, columnrange, pyramid and funnel chart types
    public var borderWidth: Float? //The border width, It is only valid for column, bar, pie, columnrange, pyramid and funnel chart types
    public var marker: AAMarker?
    public var stacking: String?
    public var animation: Any? //AAAnimation | Bool
    public var keys: [String]?
    public var colorByPoint: Bool?
    public var connectNulls: Bool? //Whether reconnects the broken line of the chart
    public var events: AASeriesEvents?
    public var shadow: Any? //Bool | AAShadow
    public var dataLabels: AADataLabels?
    public var states: AAStates?
    public var allowPointSelect: Bool?
    public var point: AAPoint?
    public var pointInterval: Float?
    public var pointIntervalUnit: String?
    public var pointPlacement: Any? //String | Number
    public var pointStart: Float?
    public var pointPadding: Float?
    public var groupPadding: Float?
    public var pointWidth: Float?
    public var maxPointWidth: Float?
    public var minPointLength: Float?
    public var tooltip: AATooltip?
    public var lineWidth: Float?
    public var negativeColor: String?

    @discardableResult
    public func borderColor(_ prop: String?) -> Self {
        borderColor = prop
        return self
    }
    
    @discardableResult
    public func borderWidth(_ prop: Float?) -> Self {
        borderWidth = prop
        return self
    }
    
    @discardableResult
    public func marker(_ prop: AAMarker?) -> Self {
        marker = prop
        return self
    }
    
    @discardableResult
    public func stacking(_ prop: AAChartStackingType?) -> Self {
        stacking = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func animation(_ prop: AAAnimation?) -> Self {
        animation = prop
        return self
    }
    
    @discardableResult
    public func animation(_ prop: Bool?) -> Self {
        animation = prop
        return self
    }
    
    @discardableResult
    public func keys(_ prop: [String]?) -> Self {
        keys = prop
        return self
    }
    
    @discardableResult
    public func colorByPoint(_ prop: Bool?) -> Self {
        colorByPoint = prop
        return self
    }
    
    @discardableResult
    public func connectNulls(_ prop: Bool?) -> Self {
        connectNulls = prop
        return self
    }
    
    @discardableResult
    public func events(_ prop: AASeriesEvents?) -> Self {
        events = prop
        return self
    }
    
    @discardableResult
    public func shadow(_ prop: Bool?) -> Self {
        shadow = prop
        return self
    }
    
    @discardableResult
    public func shadow(_ prop: AAShadow?) -> Self {
        shadow = prop
        return self
    }
    
    @discardableResult
    public func dataLabels(_ prop: AADataLabels?) -> Self {
        dataLabels = prop
        return self
    }
    
    @discardableResult
    public func states(_ prop: AAStates?) -> Self {
        states = prop
        return self
    }
    
    @discardableResult
    public func allowPointSelect(_ prop: Bool?) -> Self {
        allowPointSelect = prop
        return self
    }
    
    @discardableResult
    public func point(_ prop: AAPoint?) -> Self {
        point = prop
        return self
    }

    @discardableResult
    public func pointInterval(_ prop: Float?) -> Self {
        pointInterval = prop
        return self
    }
    
    @discardableResult
    public func pointIntervalUnit(_ prop: String?) -> Self {
        pointIntervalUnit = prop
        return self
    }
    
    @discardableResult
    public func pointPlacement(_ prop: Any?) -> Self {
        pointPlacement = prop
        return self
    }
    
    @discardableResult
    public func pointStart(_ prop: Float?) -> Self {
        pointStart = prop
        return self
    }
    
    @discardableResult
    public func pointPadding(_ prop: Float?) -> Self {
        pointPadding = prop
        return self
    }
    
    @discardableResult
    public func groupPadding(_ prop: Float?) -> Self {
        groupPadding = prop
        return self
    }

    @discardableResult
    public func pointWidth(_ prop: Float?) -> Self {
        pointWidth = prop
        return self
    }

    @discardableResult
    public func maxPointWidth(_ prop: Float?) -> Self {
        maxPointWidth = prop
        return self
    }

    @discardableResult
    public func minPointLength(_ prop: Float?) -> Self {
        minPointLength = prop
        return self
    }

    @discardableResult
    public func tooltip(_ prop: AATooltip?) -> Self {
        tooltip = prop
        return self
    }
    
    @discardableResult
    public func lineWidth(_ prop: Float?) -> Self {
        lineWidth = prop
        return self
    }
    
    @discardableResult
    public func negativeColor(_ prop: String?) -> Self {
        negativeColor = prop
        return self
    }
    
    public override init() {
        
    }
}


public class AASeriesEvents: AAObject {
    public var click: String?
    public var mouseOver: String?
    public var mouseOut: String?
    public var legendItemClick: String?
    
    @discardableResult
    public func click(_ prop: String?) -> AASeriesEvents {
        click = prop?.aa_toPureJSString()
        return self
    }
    
    @discardableResult
    public func mouseOver(_ prop: String?) -> AASeriesEvents {
        mouseOver = prop?.aa_toPureJSString()
        return self
    }
    
    @discardableResult
    public func mouseOut(_ prop: String?) -> AASeriesEvents {
        mouseOut = prop?.aa_toPureJSString()
        return self
    }

    @discardableResult
    public func legendItemClick(_ prop: String?) -> AASeriesEvents {
        legendItemClick = prop?.aa_toPureJSString()
        return self
    }
    
    public override init() {
        
    }
}


public class AAPoint: AAObject {
    public var events: AAPointEvents?

    @discardableResult
    public func events(_ prop: AAPointEvents?) -> AAPoint {
        events = prop
        return self
    }
    
    public override init() {
        
    }
}


public class AAPointEvents: AAObject {
    public var click: String?
    public var mouseOver: String?
    public var mouseOut: String?
    public var remove: String?
    public var select: String?
    public var unselect: String?
    public var update: String?
    public var legendItemClick: String? // Only for pie chart

    @discardableResult
    public func click(_ prop: String?) -> AAPointEvents {
        click = prop?.aa_toPureJSString()
        return self
    }
    
    @discardableResult
    public func mouseOver(_ prop: String?) -> AAPointEvents {
        mouseOver = prop?.aa_toPureJSString()
        return self
    }
    
    @discardableResult
    public func mouseOut(_ prop: String?) -> AAPointEvents {
        mouseOut = prop?.aa_toPureJSString()
        return self
    }
    
    @discardableResult
    public func remove(_ prop: String?) -> AAPointEvents {
        remove = prop?.aa_toPureJSString()
        return self
    }
    
    @discardableResult
    public func select(_ prop: String?) -> AAPointEvents {
        select = prop?.aa_toPureJSString()
        return self
    }
    
    @discardableResult
    public func unselect(_ prop: String?) -> AAPointEvents {
        unselect = prop?.aa_toPureJSString()
        return self
    }
    
    @discardableResult
    public func update(_ prop: String?) -> AAPointEvents {
        update = prop?.aa_toPureJSString()
        return self
    }
    
    @discardableResult
    public func legendItemClick(_ prop: String?) -> AAPointEvents {
        legendItemClick = prop?.aa_toPureJSString()
        return self
    }
    
    public override init() {
        
    }
}


