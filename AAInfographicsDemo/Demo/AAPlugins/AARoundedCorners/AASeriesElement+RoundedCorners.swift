//
//  AASeriesElement+RoundedCorners.swift
//  AAInfographics-ProDemo
//
//  Created by AnAn on 2024/11/18.
//

import AAInfographics

// --- 为 AAOptions 定义唯一的键 ---
private struct AAOptionsAssociatedKeys {
    static var borderRadiusTopLeft = "AAOptions.borderRadiusTopLeft"
    static var borderRadiusTopRight = "AAOptions.borderRadiusTopRight"
    static var borderRadiusBottomLeft = "AAOptions.borderRadiusBottomLeft"
    static var borderRadiusBottomRight = "AAOptions.borderRadiusBottomRight"
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

// --- 为 AASeriesElement 定义唯一的键 ---
private struct AASeriesElementAssociatedKeys {
    static var borderRadiusTopLeft = "AASeriesElement.borderRadiusTopLeft"
    static var borderRadiusTopRight = "AASeriesElement.borderRadiusTopRight"
    static var borderRadiusBottomLeft = "AASeriesElement.borderRadiusBottomLeft"
    static var borderRadiusBottomRight = "AASeriesElement.borderRadiusBottomRight"
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
    // 这个方法实现了协议要求，用于提供那些不能通过标准反射（如关联对象）获取的属性。
    // 理想情况下，`toDic()` 方法应该调用这个方法来获取这些额外的属性。
    public func computedProperties() -> [String: Any] {
        var dic = [String:Any]()
        // 直接尝试读取关联对象并填充字典
        if let val = self.borderRadiusTopLeft {
            dic["borderRadiusTopLeft"] = val
        }
        
        if let val = self.borderRadiusTopRight {
            dic["borderRadiusTopRight"] = val
        }
        
        if let val = self.borderRadiusBottomLeft {
            dic["borderRadiusBottomLeft"] = val
        }
        
        if let val = self.borderRadiusBottomRight {
            dic["borderRadiusBottomRight"] = val
        }
        
        // 直接返回构建好的字典
        return dic
    }
    
    // 这个自定义方法直接访问关联对象来构建字典。
    // 它与 computedProperties() 的实现基本相同，主要用于调试或直接获取圆角值。
    // 它绕过了标准的 toDic() 序列化流程。
    func toRoundedCornersDic() -> [String: Any] {
        var dic = [String:Any]()
        
        if let val = self.borderRadiusTopLeft {
            dic["borderRadiusTopLeft"] = val
        }
        if let val = self.borderRadiusTopRight {
            dic["borderRadiusTopRight"] = val
        }
        if let val = self.borderRadiusBottomLeft {
            dic["borderRadiusBottomLeft"] = val
        }
        if let val = self.borderRadiusBottomRight {
            dic["borderRadiusBottomRight"] = val
        }
        return dic
     }
}



// --- 为 AAPlotOptions 定义唯一的键 ---
private struct AAPlotOptionsAssociatedKeys {
    static var borderRadiusTopLeft = "AAPlotOptions.borderRadiusTopLeft"
    static var borderRadiusTopRight = "AAPlotOptions.borderRadiusTopRight"
    static var borderRadiusBottomLeft = "AAPlotOptions.borderRadiusBottomLeft"
    static var borderRadiusBottomRight = "AAPlotOptions.borderRadiusBottomRight"
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
        var dict = [String: Any]()
        if let val = borderRadiusTopLeft {
            dict["borderRadiusTopLeft"] = val
        }
        if let val = borderRadiusTopRight {
            dict["borderRadiusTopRight"] = val
        }
        if let val = borderRadiusBottomLeft {
            dict["borderRadiusBottomLeft"] = val
        }
        if let val = borderRadiusBottomRight {
            dict["borderRadiusBottomRight"] = val
        }
        return dict
    }
}

// 添加一个直接访问关联对象的工具函数，帮助我们解决问题
public extension AAPlotOptions {
    func toRoundedCornersDic() -> [String: Any] {
        var dic = self.toDic()
        
        if let val = self.borderRadiusTopLeft {
            dic["borderRadiusTopLeft"] = val
        }
        if let val = self.borderRadiusTopRight {
            dic["borderRadiusTopRight"] = val 
        }
        if let val = self.borderRadiusBottomLeft {
            dic["borderRadiusBottomLeft"] = val
        }
        if let val = self.borderRadiusBottomRight {
            dic["borderRadiusBottomRight"] = val
        }
        return dic
    }
}

// 也为 AAOptions 添加一个类似的便捷方法
extension AAOptions {
    public func toRoundedCornersDic() -> [String: Any] {
        var dic = self.toDic()
        if let val = self.borderRadiusTopLeft {
            dic["borderRadiusTopLeft"] = val
        }
        if let val = self.borderRadiusTopRight {
            dic["borderRadiusTopRight"] = val 
        }
        if let val = self.borderRadiusBottomLeft {
            dic["borderRadiusBottomLeft"] = val
        }
        if let val = self.borderRadiusBottomRight {
            dic["borderRadiusBottomRight"] = val
        }
        return dic
    }
}

// 为所有支持圆角的图表元素提供一个统一的辅助函数
public func convertToRoundedCornersDictionary(_ element: Any) -> [String: Any] {
    if let options = element as? AAOptions {
        return options.toRoundedCornersDic()
    } else if let seriesElement = element as? AASeriesElement {
        return seriesElement.toRoundedCornersDic()
    } else if let plotOptions = element as? AAPlotOptions {
        return plotOptions.toRoundedCornersDic()
    } else {
        // 对于其他类型，尝试使用标准 toDic() 方法
        return [:]

    }
}
