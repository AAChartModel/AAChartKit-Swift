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
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

import UIKit 

public class AATooltip: AAObject {
    private var backgroundColor: String?
    private var borderColor: String?
    private var borderRadius: Float?
    private var borderWidth: Float?
    private var style: AAStyle?
    private var enabled: Bool?
    private var useHTML: Bool?
    private var formatter: String?
    private var headerFormat: String?
    private var pointFormat: String?
    private var footerFormat: String?
    private var valueDecimals: Int?
    private var shared: Bool?
    private var crosshairs: Bool?
    private var valueSuffix: String?
    private var followTouchMove: Bool?
    
    
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
        var pureJSFunctionStr = "(\(prop))"
        pureJSFunctionStr = AAEasyTool.pureJavaScriptFunctionString(pureJSFunctionStr)
        formatter = pureJSFunctionStr
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
    public func crosshairs(_ prop: Bool?) -> AATooltip {
        crosshairs = prop
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
    
    public override init() {
        enabled = true
        shared = true
        crosshairs = true
    }
}
