//
//  AAChart.swift
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

public class AAChart: AAObject {
    public var type: String?
    public var backgroundColor: Any?
    public var plotBackgroundColor: Any?
    public var plotBackgroundImage: String?
    //为 pinchType 属性添加废弃标记. 请使用 `zooming` 属性的 `pinchType` 属性代替
    @available(*, deprecated, message: "This property has been deprecated, please use the `pinchType` property of `zooming` property of `AAChart` instead")
    public var pinchType: String?
    public var panning: AAPanning?
    public var panKey: String?
    public var polar: Bool?
    public var animation: AAAnimation?
    public var inverted: Bool?
    public var margin: [Any?]? //Margin between the outer edge of the chart and the drawing area. The numbers in the array represent the top, right, bottom, and left ([👆, 👉, 👇, 👈]). You can also use marginTop, marginRight, marginBottom, and marginLeft to set the margins in a certain direction. Defaults to [null]
    public var marginTop: Float? //👆
    public var marginRight: Float? //👉
    public var marginBottom: Float? //👇
    public var marginLeft: Float? //👈
    public var spacing: [Float]? //The distance between the outer edge of the chart and the content, like title or legend, or axis title and labels if present. The numbers in the array designate top, right, bottom and left ([👆, 👉, 👇, 👈]) respectively. Use the options spacingTop, spacingRight, spacingBottom and spacingLeft options for shorthand setting of one option. Defaults to [10, 10, 15, 10].
    public var spacingTop: Float? //👆
    public var spacingRight: Float? //👉
    public var spacingBottom: Float? //👇
    public var spacingLeft: Float? //👈
    public var scrollablePlotArea: AAScrollablePlotArea?
    public var resetZoomButton: AAResetZoomButton?
    //为 zoomtype 属性添加废弃标记. 请使用 `zooming` 属性的 `type` 属性代替
    @available(*, deprecated, message: "This property has been deprecated, please use the `type` property of `zooming` property of `AAChart` instead")
    public var zoomType: String?
    public var zooming: AAZooming?
    public var events: AAChartEvents?
    public var height: Any?
    
    @discardableResult
    public func height(_ prop: AAChartType?) -> AAChart {
        height = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func type(_ prop: AAChartType?) -> AAChart {
        type = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func backgroundColor(_ prop: Any?) -> AAChart {
        backgroundColor = prop
        return self
    }
    
    @discardableResult
    public func plotBackgroundColor(_ prop: Any?) -> AAChart {
        plotBackgroundColor = prop
        return self
    }
    
    @discardableResult
    public func plotBackgroundImage(_ prop: String?) -> AAChart {
        plotBackgroundImage = prop
        return self
    }
    
    //为 pinchType 属性添加废弃标记. 请使用 `zooming` 属性的 `pinchType` 属性代替
    @available(*, deprecated, message: "This property has been deprecated, please use the `pinchType` property of `zooming` set method of `AAChart` instead")
    @discardableResult
    public func pinchType(_ prop: AAChartZoomType?) -> AAChart {
        pinchType = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func panning(_ prop: AAPanning?) -> AAChart {
        panning = prop
        return self
    }
    
    @discardableResult
    public func panKey(_ prop: String?) -> AAChart {
        panKey = prop
        return self
    }
    
    @discardableResult
    public func polar(_ prop: Bool?) -> AAChart {
        polar = prop
        return self
    }
    
    @discardableResult
    public func animation(_ prop: AAAnimation?) -> AAChart {
        animation = prop
        return self
    }
    
    @discardableResult
    public func inverted(_ prop: Bool?) -> AAChart {
        inverted = prop
        return self
    }
    
    @discardableResult
    public func margin(_ prop: [Any?]?) -> AAChart {
        margin = prop
        return self
    }
    
    @discardableResult
    public func margin(
        top: Any? = nil,
        right: Any? = nil,
        bottom: Any? = nil,
        left: Any? = nil
    ) -> AAChart {
        margin = [
            top,
            right,
            bottom,
            left
        ]
        return self
    }
    
    @discardableResult
    public func marginTop(_ prop: Float?) -> AAChart {
        marginTop = prop
        return self
    }
    
    @discardableResult
    public func marginRight(_ prop: Float?) -> AAChart {
        marginRight = prop
        return self
    }
    
    @discardableResult
    public func marginBottom(_ prop: Float?) -> AAChart {
        marginBottom = prop
        return self
    }
    
    @discardableResult
    public func marginLeft(_ prop: Float?) -> AAChart {
        marginLeft = prop
        return self
    }
    
    @discardableResult
    public func spacing(
        top: Float = 10,
        right: Float = 10,
        bottom: Float = 15,
        left: Float = 10
    ) -> AAChart {
        spacing = [
            top,
            right,
            bottom,
            left
        ]
        return self
    }
    
    @discardableResult
    public func spacingTop(_ prop: Float?) -> AAChart {
        spacingTop = prop
        return self
    }
    
    @discardableResult
    public func spacingRight(_ prop: Float?) -> AAChart {
        spacingRight = prop
        return self
    }
    
    @discardableResult
    public func spacingBottom(_ prop: Float?) -> AAChart {
        spacingBottom = prop
        return self
    }
    
    @discardableResult
    public func spacingLeft(_ prop: Float?) -> AAChart {
        spacingLeft = prop
        return self
    }
    
    @discardableResult
    public func scrollablePlotArea(_ prop: AAScrollablePlotArea?) -> AAChart {
        scrollablePlotArea = prop
        return self
    }
    
    @discardableResult
    public func resetZoomButton(_ prop: AAResetZoomButton?) -> AAChart {
        resetZoomButton = prop
        return self
    }
    
    //为 zoomType 属性添加废弃标记. 请使用 `zooming` 属性的 `type` 属性代替
    @available(*, deprecated, message: "This method has been deprecated, please use the `type` property of `zooming` set method of `AAChart` instead")
    @discardableResult
    public func zoomType(_ prop: AAChartZoomType?) -> AAChart {
        zoomType = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func zooming(_ prop: AAZooming?) -> AAChart {
        zooming = prop
        return self
    }
    
    @discardableResult
    public func events(_ prop: AAChartEvents?) -> AAChart {
        events = prop
        return self
    }
    
    public override init() {
        
    }
}

public func AAMargin(
    left: Float,
    right: Float
) -> [Any?]? {
    [
        nil,
        right,
        nil,
        left
    ]
}

public func AAMargin(
    top: Float,
    bottom: Float
) -> [Any?]? {
    [
        top,
        nil,
        bottom,
        nil
    ]
}

public class AAResetZoomButton: AAObject {
    public var position: AAPosition?
    public var relativeTo: String?
    public var theme: [String: Any]?
    
    @discardableResult
    public func position(_ prop: AAPosition?) -> AAResetZoomButton {
        position = prop
        return self
    }
    
    @discardableResult
    public func relativeTo(_ prop: String?) -> AAResetZoomButton {
        relativeTo = prop
        return self
    }
    
    @discardableResult
    public func theme(_ prop: [String: Any]?) -> AAResetZoomButton {
        theme = prop
        return self
    }
    
    public override init() {
        
    }
}

public class AAChartEvents: AAObject {
    public var click: String?
    public var load: String?
    public var redraw: String?
    public var render: String?
    public var selection: String?

    @discardableResult
    public func click(_ prop: String?) -> AAChartEvents {
        click = prop?.aa_toPureJSString()
        return self
    }
    
    @discardableResult
    public func load(_ prop: String?) -> AAChartEvents {
        load = prop?.aa_toPureJSString()
        return self
    }

    @discardableResult
    public func redraw(_ prop: String?) -> AAChartEvents {
        redraw = prop?.aa_toPureJSString()
        return self
    }

    @discardableResult
    public func render(_ prop: String?) -> AAChartEvents {
        render = prop?.aa_toPureJSString()
        return self
    }
    
    @discardableResult
    public func selection(_ prop: String?) -> AAChartEvents {
        selection = prop?.aa_toPureJSString()
        return self
    }
    
    public override init() {
        
    }
}



/**
 panning:{
 enabled:false
 type:x
 }
 */
public class AAPanning: AAObject {
    public var enabled: Bool?
    public var type: String?
    
    @discardableResult
    public func enabled(_ prop: Bool?) -> AAPanning {
        enabled = prop
        return self
    }
    
    @discardableResult
    public func type(_ prop: String?) -> AAPanning {
        type = prop
        return self
    }
    
    public override init() {
        
    }
}


/**
 zooming:{
 key:undefined
 mouseWheel:{
 enabled:true
 sensitivity:1.1
 type:undefined
 }
 pinchType:undefined
 resetButton:{
 position:{
 align:right
 verticalAlign:top
 x:-10
 y:10
 }
 relativeTo:plot
 theme:{
 zIndex:6
 }
 }
 singleTouch:false
 type:undefined
 }
 */


public class AAZooming: AAObject {
    public var key: String?
    public var mouseWheel: AAMouseWheel?
    public var pinchType: String?
    public var resetButton: AAResetButton?
    public var singleTouch: Bool?
    public var type: String?
    
    @discardableResult
    public func key(_ prop: String?) -> AAZooming {
        key = prop
        return self
    }
    
    @discardableResult
    public func mouseWheel(_ prop: AAMouseWheel?) -> AAZooming {
        mouseWheel = prop
        return self
    }
    
    @discardableResult
    public func pinchType(_ prop: AAChartZoomType?) -> AAZooming {
        pinchType = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func resetButton(_ prop: AAResetButton?) -> AAZooming {
        resetButton = prop
        return self
    }
    
    @discardableResult
    public func singleTouch(_ prop: Bool?) -> AAZooming {
        singleTouch = prop
        return self
    }
    
    @discardableResult
    public func type(_ prop: AAChartZoomType?) -> AAZooming {
        type = prop?.rawValue
        return self
    }
    
    public override init() {
        
    }
}

public class AAMouseWheel: AAObject {
    public var enabled: Bool?
    public var sensitivity: Float?
    public var type: String?
    
    @discardableResult
    public func enabled(_ prop: Bool?) -> AAMouseWheel {
        enabled = prop
        return self
    }
    
    @discardableResult
    public func sensitivity(_ prop: Float?) -> AAMouseWheel {
        sensitivity = prop
        return self
    }
    
    @discardableResult
    public func type(_ prop: String?) -> AAMouseWheel {
        type = prop
        return self
    }
    
    public override init() {
        
    }
}

public class AAResetButton: AAObject {
    public var position: AAPosition?
    public var relativeTo: String?
    public var theme: [String: Any]?
    
    @discardableResult
    public func position(_ prop: AAPosition?) -> AAResetButton {
        position = prop
        return self
    }
    
    @discardableResult
    public func relativeTo(_ prop: String?) -> AAResetButton {
        relativeTo = prop
        return self
    }
    
    @discardableResult
    public func theme(_ prop: AAButtonTheme?) -> AAResetButton {
        theme = prop?.toDictionaryProp()
        return self
    }
    
    public override init() {
        
    }
}
