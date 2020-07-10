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
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

import Foundation

public class AASeries: AAObject {
    public var borderRadius: Float?
    public var marker: AAMarker?
    public var stacking: String?
    public var animation: AAAnimation?
    public var keys: [String]?
    public var colorByPoint: Bool?
    public var connectNulls: Bool? //Whether reconnects the broken line of the chart
    public var events: AAEvents?
    public var shadow: AAShadow?
    public var dataLabels: AADataLabels?

    
    @discardableResult
    public func borderRadius(_ prop: Float?) -> AASeries {
        borderRadius = prop
        return self
    }
    
    @discardableResult
    public func marker(_ prop: AAMarker) -> AASeries {
        marker = prop
        return self
    }
    
    @discardableResult
    public func stacking(_ prop: AAChartStackingType?) -> AASeries {
        stacking = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func animation(_ prop: AAAnimation) -> AASeries {
        animation = prop
        return self
    }
    
    @discardableResult
    public func keys(_ prop: [String]) -> AASeries {
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
    public func shadow(_ prop: AAShadow) -> AASeries {
        shadow = prop
        return self
    }
    
    @discardableResult
    public func dataLabels(_ prop: AADataLabels) -> AASeries {
        dataLabels = prop
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
            legendItemClick = AAJSStringPurer.pureJavaScriptFunctionString(prop!)
        }
        return self
    }
    
    public override init() {
        
    }
}


