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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */


/// https://api.highcharts.com/highcharts/legend.bubbleLegend
public class AALegend: AAObject {
    public var layout: String? //The layout of the legend data items. Layout type: "horizontal" or "vertical" ie horizontal and vertical layout The default is: "horizontal".
    public var align: String? //Set the horizontal alignment of the legend in the chart area. Legal values are "left", "center", and "right".  The default is: "center".
    public var verticalAlign: String? //Set the vertical alignment of the legend in the chart area. Legal values are "top", "middle", and "bottom". The vertical position can be further set by the y option.The default is: "bottom".
    public var enabled: Bool?
    public var borderColor: String?
    public var borderWidth: Float?
    public var bubbleLegend: AABubbleLegend?
    public var itemMarginTop: Float? //The top margin of each item of the legend, in px. The default is: 0.
    public var itemMarginBottom: Float? //The bottom margin of each item of the legend, in px. The default is: 0.
    public var itemStyle: AAStyle?
    public var itemWidth: Float?
    public var symbolHeight: Float?
    public var symbolPadding: Float?
    public var symbolRadius: Float?
    public var symbolWidth: Float?
    public var x: Float?
    public var y: Float?
    public var floating: Bool?
    public var labelFormat: String?
    public var backgroundColor: Any?
    public var reversed: Bool?
    public var shadow: Bool?
    
    @discardableResult
    public func layout(_ prop: AAChartLayoutType?) -> AALegend {
        layout = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func align(_ prop: AAChartAlignType?) -> AALegend {
        align = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func verticalAlign(_ prop: AAChartVerticalAlignType?) -> AALegend {
        verticalAlign = prop?.rawValue
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
    public func bubbleLegend(_ prop: AABubbleLegend?) -> AALegend {
        bubbleLegend = prop
        return self
    }
    
    @discardableResult
    public func itemMarginTop(_ prop: Float?) -> AALegend {
        itemMarginTop = prop
        return self
    }
    
    //添加方法废弃警告⚠️
    @available(*, deprecated, message: "`public func itemStyle(_ prop: AAItemStyle?) -> AALegend {...}` has been deprecated,  please use `public func itemStyle(_ prop: AAStyle?) -> AALegend {...}` for legend item style instead")
    @discardableResult
    public func itemStyle(_ prop: AAItemStyle?) -> AALegend {
//        itemStyle = prop
        return self
    }
    
    @discardableResult
    public func itemStyle(_ prop: AAStyle?) -> AALegend {
        itemStyle = prop
        return self
    }
    
    @discardableResult
    public func itemWidth(_ prop: Float?) -> AALegend {
        itemWidth = prop
        return self
    }
    
    @discardableResult
    public func symbolHeight(_ prop: Float?) -> AALegend {
        symbolHeight = prop
        return self
    }
    
    @discardableResult
    public func symbolPadding(_ prop: Float?) -> AALegend {
        symbolPadding = prop
        return self
    }
    
    @discardableResult
    public func symbolRadius(_ prop: Float?) -> AALegend {
        symbolRadius = prop
        return self
    }
    
    @discardableResult
    public func x(_ prop: Float?) -> AALegend {
        x = prop
        return self
    }
    
    @discardableResult
    public func symbolWidth(_ prop: Float?) -> AALegend {
        symbolWidth = prop
        return self
    }
    
    @discardableResult
    public func y(_ prop: Float?) -> AALegend {
        y = prop
        return self
    }
    
    @discardableResult
    public func floating(_ prop: Bool?) -> AALegend {
        floating = prop
        return self
    }
    
    @discardableResult
    public func labelFormat(_ prop: String?) -> AALegend {
        labelFormat = prop
        return self
    }

    @discardableResult
    public func backgroundColor(_ prop: Any?) -> AALegend {
        backgroundColor = prop
        return self
    }

    @discardableResult
    public func reversed(_ prop: Bool?) -> AALegend {
        reversed = prop
        return self
    }

    @discardableResult
    public func shadow(_ prop: Bool?) -> AALegend {
        shadow = prop
        return self
    }
    
    public override init () {
        
    }
}

/**
 //添加 AAItemStyle 废弃警告⚠️
 DEPRECATED_MSG_ATTRIBUTE("Please use AAStyle instead")
 */

//添加 AAItemStyle 废弃警告⚠️
@available(*, deprecated, message: "Please use AAStyle instead")
public class AAItemStyle: AAObject {
    public var color: String?
    public var cursor: String?
    public var pointer: String?
    public var fontSize: String?
    public var fontWeight: AAChartFontWeightType?
    
    @discardableResult
    public func color(_ prop: String?) -> AAItemStyle {
        color = prop
        return self
    }
    
    @discardableResult
    public func cursor(_ prop: String?) -> AAItemStyle {
        cursor = prop
        return self
    }
    
    @discardableResult
    public func pointer(_ prop: String?) -> AAItemStyle {
        pointer = prop
        return self
    }
    
    @discardableResult
    public func fontSize(_ prop: Float?) -> AAItemStyle {
        if let validProp = prop {
            fontSize = "\(validProp)px"
        }
        return self
    }
    
    @discardableResult
    public func fontWeight(_ prop: AAChartFontWeightType?) -> AAItemStyle {
        fontWeight = prop
        return self
    }
    
    public override init() {
        
    }
}
