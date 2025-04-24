//
//  SeriesElement.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/4/17.
//  Copyright © 2025 An An. All rights reserved.
//

import AAInfographics

class AARoundedCornersSeriesElement: AASeriesElement {
    public var borderRadiusTopLeft: Any?
    public var borderRadiusTopRight: Any?
    public var borderRadiusBottomLeft: Any?
    public var borderRadiusBottomRight: Any?
    
    @discardableResult
    public func borderRadiusTopLeft(_ prop: Any) -> AARoundedCornersSeriesElement {
        borderRadiusTopLeft = prop
        return self
    }
    
    @discardableResult
    public func borderRadiusTopRight(_ prop: Any) -> AARoundedCornersSeriesElement {
        borderRadiusTopRight = prop
        return self
    }
    
    @discardableResult
    public func borderRadiusBottomLeft(_ prop: Any) -> AARoundedCornersSeriesElement {
        borderRadiusBottomLeft = prop
        return self
    }
    
    @discardableResult
    public func borderRadiusBottomRight(_ prop: Any) -> AARoundedCornersSeriesElement {
        borderRadiusBottomRight = prop
        return self
    }
    
}
