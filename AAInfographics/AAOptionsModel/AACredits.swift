//
//  AACredits.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2020/7/17.
//  Copyright © 2020 An An. All rights reserved.
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

public class AACredits: AAObject {
    public var enabled: Bool?
    public var href: String?
    public var position: AAPosition?
    public var style: AAStyle?
    public var text: String?
    
    @discardableResult
    public func enabled(_ prop: Bool?) -> AACredits {
        enabled = prop
        return self
    }
    
    @discardableResult
    public func href(_ prop: String?) -> AACredits {
        href = prop
        return self
    }
    
    @discardableResult
    public func position(_ prop: AAPosition?) -> AACredits {
        position = prop
        return self
    }
    
    @discardableResult
    public func style(_ prop: AAStyle?) -> AACredits {
        style = prop
        return self
    }
    
    @discardableResult
    public func text(_ prop: String?) -> AACredits {
        text = prop
        return self
    }
    
    public override init() {
        
    }
}

public class AAPosition: AAObject {
    public var align: String?
    public var verticalAlign: String?
    public var x: Float?
    public var y: Float?
    
    @discardableResult
    public func align(_ prop: AAChartAlignType?) -> AAPosition {
        align = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func verticalAlign(_ prop: AAChartVerticalAlignType?) -> AAPosition {
        verticalAlign = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func x(_ prop: Float?) -> AAPosition {
        x = prop
        return self
    }
    
    @discardableResult
    public func y(_ prop: Float?) -> AAPosition {
        y = prop
        return self
    }
    
    public override init() {
        
    }
}

