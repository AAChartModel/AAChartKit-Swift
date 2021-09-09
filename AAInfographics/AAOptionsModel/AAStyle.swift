//
//  AAStyle.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2021/9/9.
//  Copyright © 2021 An An. All rights reserved.
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

public class AAStyle: AAObject {
    public var color: String?
    public var fontSize: String?
    public var fontWeight: String?
    public var textOutline: String?
    
    @discardableResult
    public func color(_ prop: String?) -> AAStyle {
        color = prop
        return self
    }
    
    @discardableResult
    public func fontSize(_ prop: Float?) -> AAStyle {
        if prop != nil {
            fontSize = "\(prop!)px"
        }
        return self
    }
    
    @discardableResult
    public func fontWeight(_ prop: AAChartFontWeightType?) -> AAStyle {
        fontWeight = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func textOutline(_ prop: String?) -> AAStyle {
        textOutline = prop
        return self
    }
    
    public override init() {
        
    }
}

public extension AAStyle {
    convenience init(color : String?) {
        self.init(color: color, fontSize: nil)
    }
    
    convenience init(color : String?, fontSize: Float?) {
        self.init(color: color, fontSize: fontSize,weight: nil)
    }
    
    convenience init(color : String?, fontSize: Float?, weight: AAChartFontWeightType?) {
      self.init(color: color, fontSize: fontSize,weight: weight, outline: nil)
    }
    
    convenience init(color : String?, fontSize: Float?, weight: AAChartFontWeightType?, outline: String?) {
        self.init()
        self.color(color)
        .fontSize(fontSize)
        .fontWeight(weight)
        .textOutline(outline)
    }
}
