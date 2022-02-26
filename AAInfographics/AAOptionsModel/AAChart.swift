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
    public var plotBackgroundImage: String?
    public var pinchType: String?
    public var panning: Bool?
    public var panKey: String?
    public var polar: Bool?
    public var animation: AAAnimation?
    public var inverted: Bool?
    public var margin: [Any]? //Margin between the outer edge of the chart and the drawing area. The numbers in the array represent the top, right, bottom, and left ([👆, 👉, 👇, 👈]). You can also use marginTop, marginRight, marginBottom, and marginLeft to set the margins in a certain direction. Defaults to [null]
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
    public func plotBackgroundImage(_ prop: String?) -> AAChart {
        plotBackgroundImage = prop
        return self
    }
    
    @discardableResult
    public func pinchType(_ prop: AAChartZoomType?) -> AAChart {
        pinchType = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func panning(_ prop: Bool?) -> AAChart {
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
    
    public func margin(_ prop: [Any]?) -> AAChart {
        margin = prop
        return self
    }
    
    @discardableResult
    public func margin(
        top: Any = NSNull(),
        right: Any = NSNull(),
        bottom: Any = NSNull(),
        left: Any = NSNull()
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
    
    public override init() {
        
    }
}

public func AAMargin(
    left: Float,
    right: Float
) -> [Any]? {
    return [
        NSNull(),
        right,
        NSNull(),
        left
    ]
}

public func AAMargin(
    top: Float,
    bottom: Float
) -> [Any]? {
    return [
        top,
        NSNull(),
        bottom,
        NSNull()
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

