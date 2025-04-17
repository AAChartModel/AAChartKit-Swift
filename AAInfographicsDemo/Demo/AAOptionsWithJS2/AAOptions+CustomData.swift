//
//  AAOptions+CustomData.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/4/2.
//  Copyright © 2025 An An. All rights reserved.
//

import AAInfographics

public class AACustomData: AAObject {
    public var categoryHasBoth: [String: Any]?
    
    @discardableResult
    func categoryHasBoth(_ prop: [String: Any]?) -> AACustomData {
        categoryHasBoth = prop
        return self
    }
    
    public override init() {
        
    }
}



///  为 AAOptions 添加 customData 属性
 

// 定义关联对象的键 customData
private var customDataKey: UInt8 = 0
private var borderRadiusTopLeftKey: UInt8 = 0

public extension AAOptions {
    var customData: AACustomData? {
        get {
            return objc_getAssociatedObject(self, &customDataKey) as? AACustomData
        }
        set {
            objc_setAssociatedObject(self, &customDataKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @discardableResult
    func customData(_ prop: AACustomData?) -> AAOptions {
        customData = prop
        return self
    }

}


//遵循协议以提供计算属性
extension AAOptions:  AASerializableWithComputedProperties {
    
    public func computedProperties() -> [String: Any] {
        
        var dict = [String: Any]()
        if customData != nil {
            dict["customData"] = customData?.toDic() as Any
        }
 
        return dict
    }
}
