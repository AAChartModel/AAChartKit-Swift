//
//  AAScrollablePlotArea.swift
//  AAInfographicsDemo
//
//  Created by Alfred Woo on 2020/03/20.
//  Copyright © 2020 An An. All rights reserved.
//

import Foundation

public class AAScrollablePlotArea: AAObject {
    public var minHeight: Int?
    public var minWidth: Int?
    public var opacity: Float?
    public var scrollPositionX: Float?
    public var scrollPositionY: Float?
    
    @discardableResult
    public func minHeight(_ prop: Int) -> AAScrollablePlotArea {
        minHeight = prop
        return self
    }
    
    @discardableResult
    public func minWidth(_ prop: Int) -> AAScrollablePlotArea {
        minWidth = prop
        return self
    }
    
    @discardableResult
    public func opacity(_ prop: Float) -> AAScrollablePlotArea {
        opacity = prop
        return self
    }
    
    @discardableResult
    public func scrollPositionX(_ prop: Float) -> AAScrollablePlotArea {
        scrollPositionX = prop
        return self
    }
    
    @discardableResult
    public func scrollPositionY(_ prop: Float) -> AAScrollablePlotArea {
        scrollPositionY = prop
        return self
    }
    
    public override init() {
        
    }
}
