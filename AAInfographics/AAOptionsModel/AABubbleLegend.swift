//
// Created by AnAn on 2024/1/16.
// Copyright © 2024 An An. All rights reserved.
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
public class AABubbleLegend: AAObject {
    public var borderColor: String?
    public var borderWidth: Float?
    public var className: String?
    public var color: String?
    public var connectorClassName: String?
    public var connectorColor: String?
    public var connectorDistance: Float?
    public var connectorWidth: Float?
    public var enabled: Bool?
    public var labels: AALabels?
    public var legendIndex: Float?
    public var maxSize: Float?
    public var minSize: Float?
    public var ranges: [AARangesElement]?
    public var sizeBy: String?
    public var sizeByAbsoluteValue: Bool?
    public var zIndex: Float?
    public var zThreshold: Float?

    @discardableResult
    public func borderColor(_ prop: String?) -> AABubbleLegend {
        borderColor = prop
        return self
    }

    @discardableResult
    public func borderWidth(_ prop: Float?) -> AABubbleLegend {
        borderWidth = prop
        return self
    }

    @discardableResult
    public func className(_ prop: String?) -> AABubbleLegend {
        className = prop
        return self
    }

    @discardableResult
    public func color(_ prop: String?) -> AABubbleLegend {
        color = prop
        return self
    }

    @discardableResult
    public func connectorClassName(_ prop: String?) -> AABubbleLegend {
        connectorClassName = prop
        return self
    }

    @discardableResult
    public func connectorColor(_ prop: String?) -> AABubbleLegend {
        connectorColor = prop
        return self
    }

    @discardableResult
    public func connectorDistance(_ prop: Float?) -> AABubbleLegend {
        connectorDistance = prop
        return self
    }

    @discardableResult
    public func connectorWidth(_ prop: Float?) -> AABubbleLegend {
        connectorWidth = prop
        return self
    }

    @discardableResult
    public func enabled(_ prop: Bool?) -> AABubbleLegend {
        enabled = prop
        return self
    }

    @discardableResult
    public func labels(_ prop: AALabels?) -> AABubbleLegend {
        labels = prop
        return self
    }

    @discardableResult
    public func legendIndex(_ prop: Int?) -> AABubbleLegend {
        legendIndex = Float(prop ?? 0)
        return self
    }

    @discardableResult
    public func maxSize(_ prop: Float?) -> AABubbleLegend {
        maxSize = prop
        return self
    }

    @discardableResult
    public func minSize(_ prop: Float?) -> AABubbleLegend {
        minSize = prop
        return self
    }

    @discardableResult
    public func ranges(_ prop: [AARangesElement]?) -> AABubbleLegend {
        ranges = prop
        return self
    }

    @discardableResult
    public func sizeBy(_ prop: String?) -> AABubbleLegend {
        sizeBy = prop
        return self
    }

    @discardableResult
    public func sizeByAbsoluteValue(_ prop: Bool?) -> AABubbleLegend {
        sizeByAbsoluteValue = prop
        return self
    }

    @discardableResult
    public func zIndex(_ prop: Float?) -> AABubbleLegend {
        zIndex = prop
        return self
    }

    @discardableResult
    public func zThreshold(_ prop: Float?) -> AABubbleLegend {
        zThreshold = prop
        return self
    }

    public override init() {

    }
}


public class AARangesElement: AAObject {
    public var borderColor: String?
    public var color: String?
    public var connectorColor: String?
    public var value: Float?

    @discardableResult
    public func borderColor(_ prop: String?) -> AARangesElement {
        borderColor = prop
        return self
    }

    @discardableResult
    public func color(_ prop: String?) -> AARangesElement {
        color = prop
        return self
    }

    @discardableResult
    public func connectorColor(_ prop: String?) -> AARangesElement {
        connectorColor = prop
        return self
    }

    @discardableResult
    public func value(_ prop: Float?) -> AARangesElement {
        value = prop
        return self
    }

    public override init() {

    }
}
