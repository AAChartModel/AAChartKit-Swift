//
//  AALabels.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/7/17.
//  Copyright © 2019 An An. All rights reserved.
//

import UIKit

class AALabels: AASerializable {
    private var align :String?//轴标签的对齐方式，可用的值有 "left"、"center" 及 "right"。默认值是根据坐标轴的位置（在图表中的位置）即标签的旋转角度进行智能判断的。 默认是：center.
    private var autoRotation: AnyObject? //只针对水平轴有效，允许在防止轴标签重叠时自动旋转轴标签的角度。当空间足够时，轴标签不会被旋转。当图表变小时（主要是宽度变小） ，轴标签开始旋转对应的角度，然后会依次删除间隔的轴标签并尝试旋转数组中的角度。可以通过将此参数设置为 false 来关闭轴标签旋转（这将导致标签自动换行）。 默认是：[-45].
    private var autoRotationLimit: Float?//当每个分类的宽度比该参数的值大很多（像素）时，轴标签将不会被自动旋转，而是以换行的形式展示轴标签。 当轴标签包含多个短词时换行展示轴标签可以使得轴标签有足够的空间，所以设置合理的自动旋转下限是非常有意义的。 默认是：80.
    private var distance: Float?//只针对极地图有效，定义周标签与绘图区边缘的距离。 默认是：15.
    private var enabled: Bool?//是否显示坐标轴标签 默认是：true.
    private var format: String?//坐标轴格式化字符串。 默认是：{value}.
    private var formatter: String?//坐标轴格式化字符串。 默认是：{value}.
    private var padding: Float?//轴标签的内间距，作用是保证轴标签之间有空隙。 默认是：5.
    private var rotation: Float?//轴标签的旋转角度 默认是：0.
    private var staggerLines: Int?//只针对水平轴有效，定义轴标签显示行数。
    private var step: Int?//显示 n 的倍数标签，例如设置为 2 则表示标签间隔一个轴标签显示。默认情况下，为了避免轴标签被覆盖，该参数会根据情况自动计算。可以通过设置此参数为 1 来阻止自动计算。
    private var style: AAStyle?//轴标签的 CSS 样式
    private var x: Float?//相对于坐标轴刻度线的水平偏移。 默认是：0.
    private var y: Float?//相对于坐标轴刻度线的垂直平偏移。 默认是：null.
    private var useHTML: Bool?//HTML渲染
    
    @discardableResult
    public func align(_ prop: String) -> AALabels {
        align = prop
        return self
    }
    
    @discardableResult
    public func autoRotation(_ prop: AnyObject) -> AALabels {
        autoRotation = prop
        return self
    }
    
    @discardableResult
    public func autoRotationLimit(_ prop: Float) -> AALabels {
        autoRotationLimit = prop
        return self
    }
    
    @discardableResult
    public func distance(_ prop: Float) -> AALabels {
        distance = prop
        return self
    }
    
    @discardableResult
    public func enabled(_ prop: Bool) -> AALabels {
        enabled = prop
        return self
    }
    
    @discardableResult
    public func format(_ prop: String) -> AALabels {
        format = prop
        return self
    }
    
    @discardableResult
    public func formatter(_ prop: String) -> AALabels {
        formatter = prop
        return self
    }
    
    @discardableResult
    public func padding(_ prop: Float) -> AALabels {
        padding = prop
        return self
    }
    
    @discardableResult
    public func rotation(_ prop: Float) -> AALabels {
        rotation = prop
        return self
    }
    
    @discardableResult
    public func staggerLines(_ prop: Int) -> AALabels {
        staggerLines = prop
        return self
    }
    
    @discardableResult
    public func step(_ prop: Int) -> AALabels {
        step = prop
        return self
    }
    
    @discardableResult
    public func style(_ prop: AAStyle) -> AALabels {
        style = prop
        return self
    }
    
    @discardableResult
    public func x(_ prop: Float) -> AALabels {
        x = prop
        return self
    }
    
    @discardableResult
    public func y(_ prop: Float) -> AALabels {
        y = prop
        return self
    }
    
    @discardableResult
    public func useHTML(_ prop: Bool) -> AALabels {
        useHTML = prop
        return self
    }
    
    public init() {
    }
}
