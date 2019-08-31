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
    private var borderRadius: Float?
    private var marker: AAMarker?
    private var stacking: String?
    private var animation: AAAnimation?
    private var keys: Array<String>?
    private var colorByPoint: Bool? //决定了图表是否给每个数据列或每个点分配一个颜色，默认值是 false， 即默认是给每个数据类分配颜色，
    private var connectNulls: Bool? //设置折线是否断点重连
    private var events: Dictionary<String, Any>?
    private var shadow: AAShadow?
    
    @discardableResult
    func borderRadius(_ prop: Float?) -> AASeries {
        borderRadius = prop
        return self
    }
    
    @discardableResult
    func marker(_ prop: AAMarker) -> AASeries {
        marker = prop
        return self
    }
    
    @discardableResult
    func stacking(_ prop: String?) -> AASeries {
        stacking = prop
        return self
    }
    
    @discardableResult
    func animation(_ prop: AAAnimation) -> AASeries {
        animation = prop
        return self
    }
    
    @discardableResult
    func keys(_ prop: Array<String>) -> AASeries {
        keys = prop
        return self
    }
    
    @discardableResult
    func colorByPoint(_ prop: Bool?) -> AASeries {
        colorByPoint = prop
        return self
    }
    
    @discardableResult
    func connectNulls(_ prop: Bool?) -> AASeries {
        connectNulls = prop
        return self
    }
    
    @discardableResult
    func events(_ prop: Dictionary<String, Any>?) -> AASeries {
        events = prop
        return self
    }
    
    @discardableResult
    func shadow(_ prop: AAShadow) -> AASeries {
        shadow = prop
        return self
    }
    
    public override init() {
        
    }
}


