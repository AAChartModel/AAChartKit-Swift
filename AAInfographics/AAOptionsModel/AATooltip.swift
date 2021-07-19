//
//  AATooltip.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/4/27.
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

public class AATooltip: AAObject {
    public var backgroundColor: String?
    public var borderColor: String?
    public var borderRadius: Float?
    public var borderWidth: Float?
    public var style: AAStyle?
    public var enabled: Bool?
    public var useHTML: Bool?
    public var formatter: String?
    public var headerFormat: String?
    public var pointFormat: String?
    public var footerFormat: String?
    public var valueDecimals: Int?
    public var shared: Bool?
    public var valueSuffix: String?
    public var followTouchMove: Bool?//https://api.highcharts.com.cn/highcharts#chart.panning
    public var shadow: Bool?
    public var padding: Float?
    public var pointFormatter: String?
    public var positioner: String?
    public var dateTimeLabelFormats: AADateTimeLabelFormats?
    
    @discardableResult
    public func backgroundColor(_ prop: String?) -> AATooltip {
        backgroundColor = prop
        return self
    }
    
    @discardableResult
    public func borderColor(_ prop: String?) -> AATooltip {
        borderColor = prop
        return self
    }
    
    @discardableResult
    public func borderRadius(_ prop: Float?) -> AATooltip {
        borderRadius = prop
        return self
    }
    
    @discardableResult
    public func borderWidth(_ prop: Float?) -> AATooltip {
        borderWidth = prop
        return self
    }
    
    @discardableResult
    public func style(_ prop: AAStyle?) -> AATooltip {
        style = prop
        return self
    }
    
    @discardableResult
    public func enabled(_ prop: Bool?) -> AATooltip {
        enabled = prop
        return self
    }
    
    @discardableResult
    public func useHTML(_ prop: Bool?) -> AATooltip {
        useHTML = prop
        return self
    }
    
    @discardableResult
    public func formatter(_ prop: String) -> AATooltip {
        formatter = prop.aa_toPureJSString()
        return self
    }
    
    @discardableResult
    public func headerFormat(_ prop: String?) -> AATooltip {
        headerFormat = prop
        return self
    }
    
    @discardableResult
    public func pointFormat(_ prop: String?) -> AATooltip {
        pointFormat = prop
        return self
    }
    
    @discardableResult
    public func footerFormat(_ prop: String?) -> AATooltip {
        footerFormat = prop
        return self
    }
    
    @discardableResult
    public func valueDecimals(_ prop: Int?) -> AATooltip {
        valueDecimals = prop
        return self
    }
    
    @discardableResult
    public func shared(_ prop: Bool?) -> AATooltip {
        shared = prop
        return self
    }
    
    @discardableResult
    public func valueSuffix(_ prop: String?) -> AATooltip {
        valueSuffix = prop
        return self
    }
    
    @discardableResult
    public func followTouchMove(_ prop: Bool?) -> AATooltip {
        followTouchMove = prop
        return self
    }
    
    @discardableResult
    public func shadow(_ prop: Bool?) -> AATooltip {
        shadow = prop
        return self
    }
    
    @discardableResult
    public func padding(_ prop: Float?) -> AATooltip {
        padding = prop
        return self
    }
    
    @discardableResult
    public func pointFormatter(_ prop: String) -> AATooltip {
        pointFormatter = prop.aa_toPureJSString()
        return self
    }
    
    @discardableResult
    public func positioner(_ prop: String) -> AATooltip {
        positioner = prop.aa_toPureJSString()
        return self
    }
    
    @discardableResult
    public func dateTimeLabelFormats(_ prop: AADateTimeLabelFormats?) -> AATooltip {
        dateTimeLabelFormats = prop
        return self
    }
    
    public override init() {
        enabled = true
        shared = true
    }
}
