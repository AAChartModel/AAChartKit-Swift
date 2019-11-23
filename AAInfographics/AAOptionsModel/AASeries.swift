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

import UIKit

public class AASeries: AAObject {
    public var borderRadius: Float?
    public var marker: AAMarker?
    public var stacking: String?
    public var animation: AAAnimation?
    public var keys: [String]?
    public var colorByPoint: Bool? //决定了图表是否给每个数据列或每个点分配一个颜色，默认值是 false， 即默认是给每个数据类分配颜色，
    public var connectNulls: Bool? //设置折线是否断点重连
    public var events: [String: Any]?
    public var shadow: AAShadow?
    
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
    public func events(_ prop: [String: Any]?) -> AASeries {
        events = prop
        return self
    }
    
    @discardableResult
    public func shadow(_ prop: AAShadow) -> AASeries {
        shadow = prop
        return self
    }
    
    public override init() {
        
    }
}


