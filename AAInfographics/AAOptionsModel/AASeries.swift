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

import Foundation

public class AASeries: AAObject {
    public var borderRadius: Float?        //The corner radius of the border surrounding each column or bar.
    public var borderRadiusTopLeft: Any?
    public var borderRadiusTopRight: Any?
    public var borderRadiusBottomLeft: Any?
    public var borderRadiusBottomRight: Any?
    public var marker: AAMarker?
    public var stacking: String?
    public var animation: AAAnimation?
    public var keys: [String]?
    public var colorByPoint: Bool?
    public var connectNulls: Bool? //Whether reconnects the broken line of the chart
    public var events: AAEvents?
    public var shadow: AAShadow?
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

    
    @discardableResult
    public func borderRadius(_ prop: Float?) -> AASeries {
        borderRadius = prop
        return self
    }
    
    @discardableResult
    public func borderRadiusTopLeft(_ prop: Any?) -> AASeries {
        borderRadiusTopLeft = prop
        return self
    }
     
    @discardableResult
    public func borderRadiusTopRight(_ prop: Any?) -> AASeries {
        borderRadiusTopRight = prop
        return self
    }
     
    @discardableResult
    public func borderRadiusBottomLeft(_ prop: Any?) -> AASeries {
        borderRadiusBottomLeft = prop
        return self
    }
     
    @discardableResult
    public func borderRadiusBottomRight(_ prop: Any?) -> AASeries {
        borderRadiusBottomRight = prop
        return self
    }
    
    @discardableResult
    public func marker(_ prop: AAMarker?) -> AASeries {
        marker = prop
        return self
    }
    
    @discardableResult
    public func stacking(_ prop: AAChartStackingType?) -> AASeries {
        stacking = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func animation(_ prop: AAAnimation?) -> AASeries {
        animation = prop
        return self
    }
    
    @discardableResult
    public func keys(_ prop: [String]?) -> AASeries {
        keys = prop
        return self
    }
    
    @discardableResult
    public func colorByPoint(_ prop: Bool?) -> AASeries {
        colorByPoint = prop
        return self
    }
    
    @discardableResult
    public func connectNulls(_ prop: Bool?) -> AASeries {
        connectNulls = prop
        return self
    }
    
    @discardableResult
    public func events(_ prop: AAEvents?) -> AASeries {
        events = prop
        return self
    }
    
    @discardableResult
    public func shadow(_ prop: AAShadow?) -> AASeries {
        shadow = prop
        return self
    }
    
    @discardableResult
    public func dataLabels(_ prop: AADataLabels?) -> AASeries {
        dataLabels = prop
        return self
    }
    
    @discardableResult
    public func states(_ prop: AAStates?) -> AASeries {
        states = prop
        return self
    }
    
    @discardableResult
    public func point(_ prop: AAPoint?) -> AASeries {
        point = prop
        return self
    }

    @discardableResult
    public func pointInterval(_ prop: Float?) -> AASeries {
        pointInterval = prop
        return self
    }
    
    @discardableResult
    public func pointIntervalUnit(_ prop: String?) -> AASeries {
        pointIntervalUnit = prop
        return self
    }
    
    @discardableResult
    public func pointPlacement(_ prop: Any?) -> AASeries {
        pointPlacement = prop
        return self
    }
    
    @discardableResult
    public func pointStart(_ prop: Float?) -> AASeries {
        pointStart = prop
        return self
    }
    
    @discardableResult
    public func pointPadding(_ prop: Float?) -> AASeries {
        pointPadding = prop
        return self
    }
    
    @discardableResult
    public func groupPadding(_ prop: Float?) -> AASeries {
        groupPadding = prop
        return self
    }
    
    public override init() {
        
    }
}


public class AAEvents: AAObject {
    public var legendItemClick: String?

    @discardableResult
    public func legendItemClick(_ prop: String?) -> AAEvents {
        if prop != nil {
            legendItemClick = prop!.aa_toPureJSString()
        }
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
    public var remove: String?
    public var select: String?
    public var unselect: String?
    public var update: String?

    @discardableResult
    public func click(_ prop: String?) -> AAPointEvents {
        if prop != nil {
            click = prop!.aa_toPureJSString()
        }
        return self
    }
    
    @discardableResult
    public func mouseOver(_ prop: String?) -> AAPointEvents {
        if prop != nil {
            mouseOver = prop!.aa_toPureJSString()
        }
        return self
    }
    
    @discardableResult
    public func remove(_ prop: String?) -> AAPointEvents {
        if prop != nil {
            remove = prop!.aa_toPureJSString()
        }
        return self
    }
    
    @discardableResult
    public func select(_ prop: String?) -> AAPointEvents {
        if prop != nil {
            select = prop!.aa_toPureJSString()
        }
        return self
    }
    
    @discardableResult
    public func unselect(_ prop: String?) -> AAPointEvents {
        if prop != nil {
            unselect = prop!.aa_toPureJSString()
        }
        return self
    }
    
    @discardableResult
    public func update(_ prop: String?) -> AAPointEvents {
        if prop != nil {
            update = prop!.aa_toPureJSString()
        }
        return self
    }
    
    public override init() {
        
    }
}


