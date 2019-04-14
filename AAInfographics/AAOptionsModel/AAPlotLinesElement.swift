//
//  AAPlotLinesElement.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/4/14.
//  Copyright © 2019 An An. All rights reserved.
//

import UIKit

class AAPlotLinesElement: AASerializable {
    private var color: Any?
    private var dashStyle: AALineDashSyleType?
    private var width: Float?
    private var value: Float?
    private var zIndex: Int?
    private var label: [String: AnyObject]?
    
    @discardableResult
    public func color(_ prop: Any) -> AAPlotLinesElement {
        color = prop
        return self
    }
    
    @discardableResult
    public func dashStyle(_ prop: AALineDashSyleType) -> AAPlotLinesElement {
        dashStyle = prop
        return self
    }
    
    @discardableResult
    public func width(_ prop: Float) -> AAPlotLinesElement {
        width = prop
        return self
    }
    
    @discardableResult
    public func value(_ prop: Float) -> AAPlotLinesElement {
        value = prop
        return self
    }
    
    @discardableResult
    public func zIndex(_ prop: Int) -> AAPlotLinesElement {
        zIndex = prop
        return self
    }
    
    @discardableResult
    public func label(_ prop: [String: AnyObject]) -> AAPlotLinesElement {
        label = prop
        return self
    }
    
    public  init() {
    }

}

class AALabel: AASerializable {
   private var text: String?
   private var style: [String: AnyObject]?
    
    @discardableResult
    public func text(_ prop: String) -> AALabel {
        text = prop
        return self
    }
    
    @discardableResult
    public func style(_ prop: [String: AnyObject]) -> AALabel {
        style = prop
        return self
    }
}

class AAStyle: AASerializable {
    private var color: Any?
    private var fontWeight: AAChartFontWeightType?

    @discardableResult
    public func color(_ prop: String) -> AAStyle {
        color = prop
        return self
    }
    
    @discardableResult
    public func fontWeight(_ prop: AAChartFontWeightType) -> AAStyle {
        fontWeight = prop
        return self
    }

}
