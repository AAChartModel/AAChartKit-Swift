//
//  AACrosshair.swift
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

public class AACrosshair: AAObject {
    public var dashStyle: String?
    public var color: String?
    public var width: Float?  
    
    @discardableResult
    public func dashStyle(_ prop: AAChartLineDashStyleType) -> AACrosshair {
        dashStyle = prop.rawValue
        return self
    }
    
    @discardableResult
    public func color(_ prop: String) -> AACrosshair {
        color = prop
        return self
    }
    
    @discardableResult
    public func width(_ prop: Float) -> AACrosshair {
        width = prop
        return self
    }
    
    public override init() {
        
    }
}

