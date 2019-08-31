//
//  AALegend.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/6/26.
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

public class AALegend: AAObject {
    private var layout: AAChartLegendlLayoutType? //图例数据项的布局。布局类型： "horizontal" 或 "vertical" 即水平布局和垂直布局 默认是：horizontal.
    private var align: AAChartLegendAlignType? //设定图例在图表区中的水平对齐方式，合法值有left，center 和 right。
    private var verticalAlign: AAChartLegendVerticalAlignType? //设定图例在图表区中的垂直对齐方式，合法值有 top，middle 和 bottom。垂直位置可以通过 y 选项做进一步设定。
    private var enabled: Bool?
    private var borderColor: String?
    private var borderWidth: Float?
    private var itemMarginTop: Float? //图例的每一项的顶部外边距，单位px。 默认是：0.
    private var itemStyle: [String: Any]?
    private var x: Float?
    private var y: Float?
    
    @discardableResult
    public func layout(_ prop: AAChartLegendlLayoutType?) -> AALegend {
        layout = prop
        return self
    }
    
    @discardableResult
    public func align(_ prop: AAChartLegendAlignType?) -> AALegend {
        align = prop
        return self
    }
    
    @discardableResult
    public func verticalAlign(_ prop: AAChartLegendVerticalAlignType?) -> AALegend {
        verticalAlign = prop
        return self
    }
    
    @discardableResult
    public func enabled(_ prop: Bool?) -> AALegend {
        enabled = prop
        return self
    }
    
    @discardableResult
    public func borderColor(_ prop: String?) -> AALegend {
        borderColor = prop
        return self
    }
    
    @discardableResult
    public func borderWidth(_ prop: Float?) -> AALegend {
        borderWidth = prop
        return self
    }
    
    @discardableResult
    public func itemMarginTop(_ prop: Float?) -> AALegend {
        itemMarginTop = prop
        return self
    }
    
    @discardableResult
    public func itemStyle(_ prop: AAItemStyle?) -> AALegend {
        itemStyle = prop?.toDic()
        return self
    }
    
    @discardableResult
    public func x(_ prop: Float?) -> AALegend {
        x = prop
        return self
    }
    
    @discardableResult
    public func y(_ prop: Float?) -> AALegend {
        y = prop
        return self
    }
    
    public override init () {
        
    }
    
}

public class AAItemStyle: AAObject {
    private var color: String?
    private var cursor: String?
    private var pointer: String?
    private var fontSize: String?
    private var fontWeight: AAChartFontWeightType?
    
    @discardableResult
    public func color(_ prop: String) -> AAItemStyle {
        color = prop
        return self
    }
    
    @discardableResult
    public func cursor(_ prop: String) -> AAItemStyle {
        cursor = prop
        return self
    }
    
    @discardableResult
    public func pointer(_ prop: String) -> AAItemStyle {
        pointer = prop
        return self
    }
    
    @discardableResult
    public func fontSize(_ prop: String) -> AAItemStyle {
        fontSize = prop
        return self
    }
    
    @discardableResult
    public func fontWeight(_ prop: AAChartFontWeightType) -> AAItemStyle {
        fontWeight = prop
        return self
    }
    
    public override init() {
        
    }
}
