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
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

import UIKit

public class AACrosshair: AAObject {
    public var dashStyle: String? //准星线样式
    public var color: String?  //准星线颜色
    public var width: Float?  //准星线宽度
    
    @discardableResult
    public func dashStyle(_ prop: AALineDashStyleType) -> AACrosshair {
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

