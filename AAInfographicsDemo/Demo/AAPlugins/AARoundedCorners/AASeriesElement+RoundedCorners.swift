//
//  AASeriesElement+RoundedCorners.swift
//  AAInfographics-ProDemo
//
//  Created by AnAn on 2024/11/18.
//

import AAInfographics

//为 AASeriesElement 添加独立圆角属性
//public var borderRadiusTopLeft: Any?
//public var borderRadiusTopRight: Any?
//public var borderRadiusBottomLeft: Any?
//public var borderRadiusBottomRight: Any?
// 定义关联对象的键 borderRadiusTopLeft
private var borderRadiusTopLeftKey: UInt8 = 0
private var borderRadiusTopRightKey: UInt8 = 0
private var borderRadiusBottomLeftKey: UInt8 = 0
private var borderRadiusBottomRightKey: UInt8 = 0

public extension AASeriesElement {
    var borderRadiusTopLeft: Any? {
        get {
            return objc_getAssociatedObject(self, &borderRadiusTopLeftKey)
        }
        set {
            objc_setAssociatedObject(self, &borderRadiusTopLeftKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @discardableResult
    func borderRadiusTopLeft(_ prop: Any?) -> AASeriesElement {
        borderRadiusTopLeft = prop
        return self
    }
    
    
    var borderRadiusTopRight: Any? {
        get {
            return objc_getAssociatedObject(self, &borderRadiusTopRightKey)
        }
        set {
            objc_setAssociatedObject(self, &borderRadiusTopRightKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @discardableResult
    func borderRadiusTopRight(_ prop: Any?) -> AASeriesElement {
        borderRadiusTopRight = prop
        return self
    }
    
    
    var borderRadiusBottomLeft: Any? {
        get {
            return objc_getAssociatedObject(self, &borderRadiusBottomLeftKey)
        }
        set {
            objc_setAssociatedObject(self, &borderRadiusBottomLeftKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @discardableResult
    func borderRadiusBottomLeft(_ prop: Any?) -> AASeriesElement {
        borderRadiusBottomLeft = prop
        return self
    }
    
    
    var borderRadiusBottomRight: Any? {
        get {
            return objc_getAssociatedObject(self, &borderRadiusBottomRightKey)
        }
        set {
            objc_setAssociatedObject(self, &borderRadiusBottomRightKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @discardableResult
    func borderRadiusBottomRight(_ prop: Any?) -> AASeriesElement {
        borderRadiusBottomRight = prop
        return self
    }
}



//遵循协议以提供计算属性
extension AASeriesElement: @retroactive AASerializableWithComputedProperties {
    public func computedProperties() -> [String: Any] {
        return [
            "borderRadiusTopLeft": borderRadiusTopLeft ?? NSNull(),
            "borderRadiusTopRight": borderRadiusTopRight ?? NSNull(),
            "borderRadiusBottomLeft": borderRadiusBottomLeft ?? NSNull(),
            "borderRadiusBottomRight": borderRadiusBottomRight ?? NSNull()
        ]
    }
}
