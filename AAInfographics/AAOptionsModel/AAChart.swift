//
//  AAChart.swift
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

public class AAChart: AAObject {
    var type: String?
    var backgroundColor: Any?
    var plotBackgroundImage: String?
    var pinchType: String?
    var panning: Bool?
    var panKey: String?
    var polar: Bool?
    var animation: AAAnimation?
    var inverted: Bool?
    var marginLeft: Float?
    var marginRight: Float?
    
    @discardableResult
    public func type(_ prop: AAChartType) -> AAChart {
        type = prop.rawValue
        return self
    }
    
    @discardableResult
    public func backgroundColor(_ prop: Any?) -> AAChart {
        backgroundColor = prop
        return self
    }
    
    @discardableResult
    public func plotBackgroundImage(_ prop: String) -> AAChart {
        plotBackgroundImage = prop
        return self
    }
    
    @discardableResult
    public func pinchType(_ prop: String?) -> AAChart {
        pinchType = prop
        return self
    }
    
    @discardableResult
    public func panning(_ prop: Bool?) -> AAChart {
        panning = prop
        return self
    }
    
    @discardableResult
    public func panKey(_ prop: String) -> AAChart {
        panKey = prop
        return self
    }
    
    @discardableResult
    public func polar(_ prop: Bool?) -> AAChart {
        polar = prop
        return self
    }
    
    @discardableResult
    public func animation(_ prop: AAAnimation) -> AAChart {
        animation = prop
        return self
    }
    
    @discardableResult
    public func inverted(_ prop: Bool?) -> AAChart {
        inverted = prop
        return self
    }
    
    @discardableResult
    public func marginLeft(_ prop: Float?) -> AAChart {
        marginLeft = prop
        return self
    }
    
    @discardableResult
    public func marginRight(_ prop: Float?) -> AAChart {
        marginRight = prop
        return self
    }
    
    public override init() {
        
    }
}

