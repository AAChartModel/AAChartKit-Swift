//
//  AATitle.swift
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

public class AATitle: AAObject {
    var text: String?
    var style: AAStyle?
    var align: String?
    var verticalAlign: String?
    var x: Float?
    var y: Float?
    var userHTML: Bool?
    
    @discardableResult
    func text(_ prop: String?) -> AATitle {
        text = prop
        return self
    }
    
    @discardableResult
    func style(_ prop: AAStyle?) -> AATitle {
        style = prop
        return self
    }
    
    @discardableResult
    func align(_ prop: AAChartLegendAlignType?) -> AATitle {
        align = prop?.rawValue
        return self
    }
    
    @discardableResult
    func verticalAlign(_ prop: AAChartLegendVerticalAlignType?) -> AATitle {
        verticalAlign = prop?.rawValue
        return self
    }
    
    @discardableResult
    func x(_ prop: Float?) -> AATitle {
        x = prop
        return self
    }
    
    @discardableResult
    func y(_ prop: Float?) -> AATitle {
        y = prop
        return self
    }
    
    @discardableResult
    func userHTML(_ prop: Bool?) -> AATitle {
        userHTML = prop
        return self
    }
    
    public override init() {
        
    }
    
}

