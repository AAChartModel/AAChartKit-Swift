//
//  AADataLabels.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/4/20.
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

import Foundation

public class AADataLabels: AAObject {
    public var enabled: Bool?
    public var align: String?
    public var style: AAStyle?
    public var format: String?
    public var rotation: Float?
    public var allowOverlap: Bool?
    public var useHTML: Bool?
    public var distance: Float?
    public var verticalAlign: String?
    public var x: Float?
    public var y: Float?
    public var color: String?
    public var backgroundColor: String?
    public var borderColor: String?
    public var borderRadius: Float?
    public var borderWidth: Float?
    public var shape: String?
    public var crop: Bool?
    public var inside: Bool?
    public var overflow: String?
    
    @discardableResult
    public func enabled(_ prop: Bool?) -> AADataLabels {
        enabled = prop
        return self
    }
    
    @discardableResult
    public func align(_ prop: AAChartAlignType?) -> AADataLabels {
        align = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func style(_ prop: AAStyle?) -> AADataLabels {
        style = prop
        return self
    }
    
    @discardableResult
    public func format(_ prop: String?) -> AADataLabels {
        format = prop
        return self
    }
    
    @discardableResult
    public func rotation(_ prop: Float?) -> AADataLabels {
        rotation = prop
        return self
    }
    
    @discardableResult
    public func allowOverlap(_ prop: Bool?) -> AADataLabels {
        allowOverlap = prop
        return self
    }
    
    @discardableResult
    public func useHTML(_ prop: Bool?) -> AADataLabels {
        useHTML = prop
        return self
    }
    
    @discardableResult
    public func distance(_ prop: Float?) -> AADataLabels {
        distance = prop
        return self
    }
    
    @discardableResult
    public func verticalAlign(_ prop: AAChartVerticalAlignType?) -> AADataLabels {
        verticalAlign = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func x(_ prop: Float?) -> AADataLabels {
        x = prop
        return self
    }
    
    @discardableResult
    public func y(_ prop: Float?) -> AADataLabels {
        y = prop
        return self
    }
    
    @discardableResult
    public func color(_ prop: String?) -> AADataLabels {
        color = prop
        return self
    }
    
    @discardableResult
    public func backgroundColor(_ prop: String?) -> AADataLabels {
        backgroundColor = prop
        return self
    }
    
    @discardableResult
    public func borderColor(_ prop: String?) -> AADataLabels {
        borderColor = prop
        return self
    }
    
    @discardableResult
    public func borderRadius(_ prop: Float?) -> AADataLabels {
        borderRadius = prop
        return self
    }
    
    @discardableResult
    public func borderWidth(_ prop: Float?) -> AADataLabels {
        borderWidth = prop
        return self
    }
    
    @discardableResult
    public func shape(_ prop: String?) -> AADataLabels {
        shape = prop
        return self
    }
    
    @discardableResult
    public func crop(_ prop: Bool?) -> AADataLabels {
        crop = prop
        return self
    }
    
    @discardableResult
    public func inside(_ prop: Bool?) -> AADataLabels {
        inside = prop
        return self
    }
    
    @discardableResult
    public func overflow(_ prop: String?) -> AADataLabels {
        overflow = prop
        return self
    }
    
    public override init() {
    }
}

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
