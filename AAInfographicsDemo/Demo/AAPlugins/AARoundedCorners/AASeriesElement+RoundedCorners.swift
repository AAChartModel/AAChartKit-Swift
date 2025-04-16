//
//  AASeriesElement+RoundedCorners.swift
//  AAInfographics-ProDemo
//
//  Created by AnAn on 2024/11/18.
//

import AAInfographics

// --- 为 AAOptions 定义唯一的键 ---
private struct AAOptionsAssociatedKeys {
    static var borderRadiusTopLeft: UInt8 = 0
    static var borderRadiusTopRight: UInt8 = 0
    static var borderRadiusBottomLeft: UInt8 = 0
    static var borderRadiusBottomRight: UInt8 = 0
}

public extension AAOptions {
    var borderRadiusTopLeft: Any? {
        get {
            return objc_getAssociatedObject(self, &AAOptionsAssociatedKeys.borderRadiusTopLeft)
        }
        set {
            objc_setAssociatedObject(self, &AAOptionsAssociatedKeys.borderRadiusTopLeft, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @discardableResult
    func borderRadiusTopLeft(_ prop: Any?) -> Self {
        borderRadiusTopLeft = prop
        return self
    }
    
    
    var borderRadiusTopRight: Any? {
        get {
            return objc_getAssociatedObject(self, &AAOptionsAssociatedKeys.borderRadiusTopRight)
        }
        set {
            objc_setAssociatedObject(self, &AAOptionsAssociatedKeys.borderRadiusTopRight, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @discardableResult
    func borderRadiusTopRight(_ prop: Any?) -> Self {
        borderRadiusTopRight = prop
        return self
    }
    
    
    var borderRadiusBottomLeft: Any? {
        get {
            return objc_getAssociatedObject(self, &AAOptionsAssociatedKeys.borderRadiusBottomLeft)
        }
        set {
            objc_setAssociatedObject(self, &AAOptionsAssociatedKeys.borderRadiusBottomLeft, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @discardableResult
    func borderRadiusBottomLeft(_ prop: Any?) -> Self {
        borderRadiusBottomLeft = prop
        return self
    }
    
    
    var borderRadiusBottomRight: Any? {
        get {
            return objc_getAssociatedObject(self, &AAOptionsAssociatedKeys.borderRadiusBottomRight)
        }
        set {
            objc_setAssociatedObject(self, &AAOptionsAssociatedKeys.borderRadiusBottomRight, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @discardableResult
    func borderRadiusBottomRight(_ prop: Any?) -> Self {
        borderRadiusBottomRight = prop
        return self
    }
}

// --- 为 AAOptions 添加协议遵循和实现 ---
//extension AAOptions: AASerializableWithComputedProperties {
//    public func computedProperties() -> [String: Any] {
//        return [
//            "borderRadiusTopLeft": borderRadiusTopLeft ?? NSNull(),
//            "borderRadiusTopRight": borderRadiusTopRight ?? NSNull(),
//            "borderRadiusBottomLeft": borderRadiusBottomLeft ?? NSNull(),
//            "borderRadiusBottomRight": borderRadiusBottomRight ?? NSNull()
//        ]
//    }
//}

// --- 为 AASeriesElement 定义唯一的键 ---
private struct AASeriesElementAssociatedKeys {
    static var borderRadiusTopLeft: UInt8 = 0
    static var borderRadiusTopRight: UInt8 = 0
    static var borderRadiusBottomLeft: UInt8 = 0
    static var borderRadiusBottomRight: UInt8 = 0
}

public extension AASeriesElement {
    var borderRadiusTopLeft: Any? {
        get {
            return objc_getAssociatedObject(self, &AASeriesElementAssociatedKeys.borderRadiusTopLeft)
        }
        set {
            objc_setAssociatedObject(self, &AASeriesElementAssociatedKeys.borderRadiusTopLeft, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @discardableResult
    func borderRadiusTopLeft(_ prop: Any?) -> Self {
        borderRadiusTopLeft = prop
        return self
    }
    
    
    var borderRadiusTopRight: Any? {
        get {
            return objc_getAssociatedObject(self, &AASeriesElementAssociatedKeys.borderRadiusTopRight)
        }
        set {
            objc_setAssociatedObject(self, &AASeriesElementAssociatedKeys.borderRadiusTopRight, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @discardableResult
    func borderRadiusTopRight(_ prop: Any?) -> Self {
        borderRadiusTopRight = prop
        return self
    }
    
    
    var borderRadiusBottomLeft: Any? {
        get {
            return objc_getAssociatedObject(self, &AASeriesElementAssociatedKeys.borderRadiusBottomLeft)
        }
        set {
            objc_setAssociatedObject(self, &AASeriesElementAssociatedKeys.borderRadiusBottomLeft, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @discardableResult
    func borderRadiusBottomLeft(_ prop: Any?) -> Self {
        borderRadiusBottomLeft = prop
        return self
    }
    
    
    var borderRadiusBottomRight: Any? {
        get {
            return objc_getAssociatedObject(self, &AASeriesElementAssociatedKeys.borderRadiusBottomRight)
        }
        set {
            objc_setAssociatedObject(self, &AASeriesElementAssociatedKeys.borderRadiusBottomRight, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @discardableResult
    func borderRadiusBottomRight(_ prop: Any?) -> Self {
        borderRadiusBottomRight = prop
        return self
    }
}

//遵循协议以提供计算属性
extension AASeriesElement: AASerializableWithComputedProperties {
    public func computedProperties() -> [String: Any] {
        return [
            "borderRadiusTopLeft": borderRadiusTopLeft ?? NSNull(),
            "borderRadiusTopRight": borderRadiusTopRight ?? NSNull(),
            "borderRadiusBottomLeft": borderRadiusBottomLeft ?? NSNull(),
            "borderRadiusBottomRight": borderRadiusBottomRight ?? NSNull()
        ]
    }
}

// --- 为 AAPlotOptions 定义唯一的键 ---
private struct AAPlotOptionsAssociatedKeys {
    static var borderRadiusTopLeft: UInt8 = 0
    static var borderRadiusTopRight: UInt8 = 0
    static var borderRadiusBottomLeft: UInt8 = 0
    static var borderRadiusBottomRight: UInt8 = 0
}

public extension AAPlotOptions {
    var borderRadiusTopLeft: Any? {
        get {
            return objc_getAssociatedObject(self, &AAPlotOptionsAssociatedKeys.borderRadiusTopLeft)
        }
        set {
            objc_setAssociatedObject(self, &AAPlotOptionsAssociatedKeys.borderRadiusTopLeft, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @discardableResult
    func borderRadiusTopLeft(_ prop: Any?) -> Self {
        borderRadiusTopLeft = prop
        return self
    }
    
    
    var borderRadiusTopRight: Any? {
        get {
            return objc_getAssociatedObject(self, &AAPlotOptionsAssociatedKeys.borderRadiusTopRight)
        }
        set {
            objc_setAssociatedObject(self, &AAPlotOptionsAssociatedKeys.borderRadiusTopRight, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @discardableResult
    func borderRadiusTopRight(_ prop: Any?) -> Self {
        borderRadiusTopRight = prop
        return self
    }
    
    
    var borderRadiusBottomLeft: Any? {
        get {
            return objc_getAssociatedObject(self, &AAPlotOptionsAssociatedKeys.borderRadiusBottomLeft)
        }
        set {
            objc_setAssociatedObject(self, &AAPlotOptionsAssociatedKeys.borderRadiusBottomLeft, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @discardableResult
    func borderRadiusBottomLeft(_ prop: Any?) -> Self {
        borderRadiusBottomLeft = prop
        return self
    }
    
    
    var borderRadiusBottomRight: Any? {
        get {
            return objc_getAssociatedObject(self, &AAPlotOptionsAssociatedKeys.borderRadiusBottomRight)
        }
        set {
            objc_setAssociatedObject(self, &AAPlotOptionsAssociatedKeys.borderRadiusBottomRight, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @discardableResult
    func borderRadiusBottomRight(_ prop: Any?) -> Self {
        borderRadiusBottomRight = prop
        return self
    }
}

//遵循协议以提供计算属性
extension AAPlotOptions: AASerializableWithComputedProperties {
    public func computedProperties() -> [String: Any] {
        return [
            "borderRadiusTopLeft": borderRadiusTopLeft ?? NSNull(),
            "borderRadiusTopRight": borderRadiusTopRight ?? NSNull(),
            "borderRadiusBottomLeft": borderRadiusBottomLeft ?? NSNull(),
            "borderRadiusBottomRight": borderRadiusBottomRight ?? NSNull()
        ]
    }
}
