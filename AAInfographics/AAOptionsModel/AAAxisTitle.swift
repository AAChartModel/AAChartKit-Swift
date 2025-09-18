//
//  AAAxisTitle.swift
//  AAInfographics
//
//  Created by AnAn on 2025/9/18.
//  Copyright © 2025 An An. All rights reserved.
//

//https://api.highcharts.com/highcharts/xAxis.title.align
//https://api.highcharts.com/highcharts/yAxis.title.align
public enum AAChartAxisTitleAlignValueType: String {
    case high
    case low
    case middle
}

//https://api.highcharts.com/highcharts/xAxis.title
//https://api.highcharts.com/highcharts/yAxis.title
public class AAAxisTitle: AAObject {
    public var align: String?
    public var margin: String?
    public var offset: Double?
    public var rotation: Double?
    public var style: AAStyle?
    public var text: String?
    public var textAlign: String?
    public var useHTML: Bool?
    public var x: Double?
    public var y: Double?

    @discardableResult
    public func align(_ prop: AAChartAxisTitleAlignValueType?) -> AAAxisTitle {
        align = prop?.rawValue
        return self
    }

    @discardableResult
    public func margin(_ prop: String?) -> AAAxisTitle {
        margin = prop
        return self
    }

    @discardableResult
    public func offset(_ prop: Double?) -> AAAxisTitle {
        offset = prop
        return self
    }

    @discardableResult
    public func rotation(_ prop: Double?) -> AAAxisTitle {
        rotation = prop
        return self
    }

    @discardableResult
    public func style(_ prop: AAStyle?) -> AAAxisTitle {
        style = prop
        return self
    }

    @discardableResult
    public func text(_ prop: String?) -> AAAxisTitle {
        text = prop
        return self
    }

    @discardableResult
    public func textAlign(_ prop: AAChartAlignType?) -> AAAxisTitle {
        textAlign = prop?.rawValue
        return self
    }

    @discardableResult
    public func useHTML(_ prop: Bool?) -> AAAxisTitle {
        useHTML = prop
        return self
    }

    @discardableResult
    public func x(_ prop: Double?) -> AAAxisTitle {
        x = prop
        return self
    }

    @discardableResult
    public func y(_ prop: Double?) -> AAAxisTitle {
        y = prop
        return self
    }
    
    public override init() {
        
    }
}
