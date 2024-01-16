//
// Created by AnAn on 2024/1/16.
// Copyright (c) 2024 An An. All rights reserved.
//

import Foundation

//bubbleLegend:{
//borderColor:undefined
//borderWidth:2
//className:undefined
//color:undefined
//connectorClassName:undefined
//connectorColor:undefined
//connectorDistance:60
//connectorWidth:1
//enabled:false
//labels:{...}
//legendIndex:0
//maxSize:60
//minSize:10
//ranges:{...}
//sizeBy:area
//sizeByAbsoluteValue:false
//zIndex:1
//zThreshold:0
//}

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
    public var ranges: [AARange]?
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
    public func ranges(_ prop: [AARange]?) -> AABubbleLegend {
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


//ranges:{
//borderColor:undefined
//color:undefined
//connectorColor:undefined
//value:undefined
//}
public class AARange: AAObject {
    public var borderColor: String?
    public var color: String?
    public var connectorColor: String?
    public var value: Float?

    @discardableResult
    public func borderColor(_ prop: String?) -> AARange {
        borderColor = prop
        return self
    }

    @discardableResult
    public func color(_ prop: String?) -> AARange {
        color = prop
        return self
    }

    @discardableResult
    public func connectorColor(_ prop: String?) -> AARange {
        connectorColor = prop
        return self
    }

    @discardableResult
    public func value(_ prop: Float?) -> AARange {
        value = prop
        return self
    }

    public override init() {

    }
}
