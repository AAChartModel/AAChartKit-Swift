//
//  AASubtitle.swift
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

public class AASubtitle: AAObject {
    public var text: String?
    public var style: AAStyle?
    public var align: String?
    public var verticalAlign: String?
    public var x: Float?
    public var y: Float?
    public var useHTML: Bool?
    
    @discardableResult
    public func text(_ prop: String?) -> AASubtitle {
        text = prop
        return self
    }
    
    @discardableResult
    public func style(_ prop: AAStyle?) -> AASubtitle {
        style = prop
        return self
    }
    
    @discardableResult
    public func align(_ prop: AAChartAlignType?) -> AASubtitle {
        align = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func verticalAlign(_ prop: AAChartVerticalAlignType?) -> AASubtitle {
        verticalAlign = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func x(_ prop: Float?) -> AASubtitle {
        x = prop
        return self
    }
    
    @discardableResult
    public func y(_ prop: Float?) -> AASubtitle {
        y = prop
        return self
    }
    
    @discardableResult
    public func useHTML(_ prop: Bool?) -> AASubtitle {
        useHTML = prop
        return self
    }
    
    public override init() {
        
    }
}

