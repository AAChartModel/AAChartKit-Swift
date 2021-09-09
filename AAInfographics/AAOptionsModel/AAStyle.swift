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
    public var background: String?
    public var backgroundColor: String?
    public var border: String?
    public var borderRadius: String?
    public var color: String?
    public var cursor: String?
    public var fontFamily: String?
    public var fontSize: String?
    public var fontWeight: String?
    public var height: Float?
    public var lineWidth: Float?
    public var opacity: Float?
    public var padding: String?
    public var pointerEvents: String?
    public var position: String?
    public var textAlign: String?
    public var textDecoration: String?
    public var textOutline: String?
    public var textOverflow: String?
    public var top: String?
    public var transition: String?
    public var whiteSpace: String?
    public var width: Float?
    
    @discardableResult
    public func background(_ prop: String?) -> AAStyle {
        background = prop
        return self
    }

    @discardableResult
    public func backgroundColor(_ prop: String?) -> AAStyle {
        backgroundColor = prop
        return self
    }

    @discardableResult
    public func border(_ prop: String?) -> AAStyle {
        border = prop
        return self
    }

    @discardableResult
    public func borderRadius(_ prop: Float?) -> AAStyle {
        if prop != nil {
            borderRadius = "\(prop!)px"
        }
        return self
    }

    @discardableResult
    public func color(_ prop: String?) -> AAStyle {
        color = prop
        return self
    }

    @discardableResult
    public func cursor(_ prop: String?) -> AAStyle {
        cursor = prop
        return self
    }

    @discardableResult
    public func fontFamily(_ prop: String?) -> AAStyle {
        fontFamily = prop
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
    public func height(_ prop: Float?) -> AAStyle {
        height = prop
        return self
    }

    @discardableResult
    public func lineWidth(_ prop: Float?) -> AAStyle {
        lineWidth = prop
        return self
    }

    @discardableResult
    public func opacity(_ prop: Float?) -> AAStyle {
        opacity = prop
        return self
    }

    @discardableResult
    public func padding(_ prop: Float?) -> AAStyle {
        if prop != nil {
            padding = "\(prop!)px"
        }
        return self
    }

    @discardableResult
    public func pointerEvents(_ prop: String?) -> AAStyle {
        pointerEvents = prop
        return self
    }

    @discardableResult
    public func position(_ prop: String?) -> AAStyle {
        position = prop
        return self
    }

    @discardableResult
    public func textAlign(_ prop: String?) -> AAStyle {
        textAlign = prop
        return self
    }

    @discardableResult
    public func textDecoration(_ prop: String?) -> AAStyle {
        textDecoration = prop
        return self
    }

    @discardableResult
    public func textOutline(_ prop: String?) -> AAStyle {
        textOutline = prop
        return self
    }

    @discardableResult
    public func textOverflow(_ prop: String?) -> AAStyle {
        textOverflow = prop
        return self
    }

    @discardableResult
    public func top(_ prop: String?) -> AAStyle {
        top = prop
        return self
    }

    @discardableResult
    public func transition(_ prop: String?) -> AAStyle {
        transition = prop
        return self
    }

    @discardableResult
    public func whiteSpace(_ prop: String?) -> AAStyle {
        whiteSpace = prop
        return self
    }

    @discardableResult
    public func width(_ prop: Float?) -> AAStyle {
        width = prop
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
