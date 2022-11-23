//
//  AAMarker.swift
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

public class AAMarker: AAObject {
    public var enabled: Bool?
    public var radius: Float?
    public var symbol: String?
    public var fillColor: String?
    public var lineWidth: Float?
    public var lineColor: Any?
    public var states: AAMarkerStates?
    
    @discardableResult
    public func enabled(_ prop: Bool?) -> AAMarker {
        enabled = prop
        return self
    }
    
    @discardableResult
    public func radius(_ prop: Float?) -> AAMarker {
        radius = prop
        return self
    }
    
    @discardableResult
    public func symbol(_ prop: String?) -> AAMarker {
        symbol = prop
        return self
    }
    
    @discardableResult
    public func symbol(_ prop: AAChartSymbolType?) -> AAMarker {
        symbol = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func fillColor(_ prop: String?) -> AAMarker {
        fillColor = prop
        return self
    }
    
    @discardableResult
    public func lineWidth(_ prop: Float?) -> AAMarker {
        lineWidth = prop
        return self
    }
    
    @discardableResult
    public func lineColor(_ prop: Any?) -> AAMarker {
        lineColor = prop
        return self
    }
    
    @discardableResult
    public func states(_ prop: AAMarkerStates?) -> AAMarker {
        states = prop
        return self
    }
    
    public override init() {
        enabled = true
    }
}

public class AAMarkerStates: AAObject {
    public var hover: AAMarkerHover?
    
    @discardableResult
    public func hover(_ prop: AAMarkerHover) -> AAMarkerStates {
        hover = prop
        return self
    }
    
    public override init() {
        
    }
}

public class AAMarkerHover: AAObject {
    public var enabled: Bool?
    public var fillColor: String?
    public var lineColor: String?
    public var lineWidth: Float?
    public var radius: Float?
    
    @discardableResult
    public func enabled(_ prop: Bool) -> AAMarkerHover {
        enabled = prop
        return self
    }
    
    @discardableResult
    public func fillColor(_ prop: String) -> AAMarkerHover {
        fillColor = prop
        return self
    }
    
    @discardableResult
    public func lineColor(_ prop: String) -> AAMarkerHover {
        lineColor = prop
        return self
    }
    
    @discardableResult
    public func lineWidth(_ prop: Float) -> AAMarkerHover {
        lineWidth = prop
        return self
    }
    
    @discardableResult
    public func radius(_ prop: Float) -> AAMarkerHover {
        radius = prop
        return self
    }
    
    public override init() {
        
    }
}
