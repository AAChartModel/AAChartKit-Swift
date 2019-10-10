//
//  AALabel.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/7/17.
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

public class AALabel: AAObject {
    public var align :String?//轴标签的对齐方式，可用的值有 "left"、"center" 及 "right"。默认值是根据坐标轴的位置（在图表中的位置）即标签的旋转角度进行智能判断的。 默认是：center.
    public var rotation: Float?//轴标签的旋转角度 默认是：0.
    public var text: String?//文字
    public var textAlign: String?//文字对齐
    public var useHTML: Bool?//HTML渲染
    public var verticalAlign: String?//竖直对齐
    public var style: AAStyle?//轴标签的 CSS 样式
    public var x: Float?//相对于坐标轴刻度线的水平偏移。 默认是：0.
    public var y: Float?//相对于坐标轴刻度线的垂直平偏移。 默认是：null.
    
    @discardableResult
    public func align(_ prop: String) -> AALabel {
        align = prop
        return self
    }
    
    @discardableResult
    public func rotation(_ prop: Float) -> AALabel {
        rotation = prop
        return self
    }
    
    @discardableResult
    public func text(_ prop: String) -> AALabel {
        text = prop
        return self
    }
    
    @discardableResult
    public func textAlign(_ prop: String) -> AALabel {
        textAlign = prop
        return self
    }
    
    @discardableResult
    public func useHTML(_ prop: Bool) -> AALabel {
        useHTML = prop
        return self
    }
    
    @discardableResult
    public func verticalAlign(_ prop: String) -> AALabel {
        verticalAlign = prop
        return self
    }
    
    @discardableResult
    public func style(_ prop: AAStyle) -> AALabel {
        style = prop
        return self
    }
    
    @discardableResult
    public func x(_ prop: Float) -> AALabel {
        x = prop
        return self
    }
    
    @discardableResult
    public func y(_ prop: Float) -> AALabel {
        y = prop
        return self
    }
    
    public override init() {
    }
    
}
