//
//  AASerializeHelper.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/4/16.
//  Copyright © 2025 An An. All rights reserved.
//

import AAInfographics

// 为需要计算属性的可序列化对象定义一个扩展方法
extension AASerializableWithComputedProperties {
    public func toCustomDic() -> [String: Any] {
        var dic = (self as AnyObject).toDic()
        let computedProps = self.computedProperties()
        for (key, value) in computedProps {
            dic[key] = value
        }
        return dic
    }
}

// 为 AAOptions 添加协议遵循，使其与其他类保持一致
extension AAOptions: AASerializableWithComputedProperties {
    public func computedProperties() -> [String: Any] {
        var propsDict = [String: Any]()
        
        if let val = borderRadiusTopLeft {
            propsDict["borderRadiusTopLeft"] = val
        }
        if let val = borderRadiusTopRight {
            propsDict["borderRadiusTopRight"] = val
        }
        if let val = borderRadiusBottomLeft {
            propsDict["borderRadiusBottomLeft"] = val
        }
        if let val = borderRadiusBottomRight {
            propsDict["borderRadiusBottomRight"] = val
        }
        
        return propsDict
    }
}

// 创建扩展方法，替换原有的 toDic 方法
extension AASeriesElement {
    func toRoundedCornersDic() -> [String: Any] {
        var dic = self.toDic()
        if let val = borderRadiusTopLeft {
            dic["borderRadiusTopLeft"] = val
        }
        if let val = borderRadiusTopRight {
            dic["borderRadiusTopRight"] = val
        }
        if let val = borderRadiusBottomLeft {
            dic["borderRadiusBottomLeft"] = val
        }
        if let val = borderRadiusBottomRight {
            dic["borderRadiusBottomRight"] = val
        }
        return dic
    }
}

// 创建扩展方法，替换原有的 toDic 方法
extension AAPlotOptions {
    func toRoundedCornersDic() -> [String: Any] {
        var dic = self.toDic()
        if let val = borderRadiusTopLeft {
            dic["borderRadiusTopLeft"] = val
        }
        if let val = borderRadiusTopRight {
            dic["borderRadiusTopRight"] = val
        }
        if let val = borderRadiusBottomLeft {
            dic["borderRadiusBottomLeft"] = val
        }
        if let val = borderRadiusBottomRight {
            dic["borderRadiusBottomRight"] = val
        }
        return dic
    }
}
