//
//  AASerializable.swift
//  AAChartKit-Swift
//
//  Created by An An  on 17/4/19.
//  Copyright © 2017年 An An . All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 *  🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit-Swift/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

import Foundation

open class AAObject {
    public init() {}
}

@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
public extension AAObject {
    var classNameString: String {
        let nameClass: AnyClass! = object_getClass(self)
        return NSStringFromClass(nameClass)
    }
}

@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
public protocol AASerializableWithComputedProperties {
    /// 返回计算属性的键值对
    func computedProperties() -> [String: Any]
}

@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
public extension AAObject {
    
    fileprivate func loopForMirrorChildren(_ mirrorChildren: Mirror.Children, _ representation: inout [String: Any]) {
        for case let (label?, value) in mirrorChildren {
            if let value = value as? AAObject {
                representation[label] = value.toDic()
            } else if let value = value as? [AAObject] {
                // 使用 map 简化数组转换
                representation[label] = value.map { $0.toDic() }
            } else if let value = value as? NSObject {
                representation[label] = value
            }
        }
    }
    
    func toDic() -> [String: Any] {
        // 创建 Mirror 对象
        let mirror = Mirror(reflecting: self)
        
        // 预估容量
        let estimatedCapacity = mirror.children.underestimatedCount +
                                (mirror.superclassMirror?.children.underestimatedCount ?? 0) + 5
        var representation = [String: Any](minimumCapacity: estimatedCapacity)
        
        // 遍历当前类和父类的反射子属性
        var currentMirror: Mirror? = mirror
        while let current = currentMirror {
            loopForMirrorChildren(current.children, &representation)
            currentMirror = current.superclassMirror
        }
        
        // 添加计算属性
        addComputedProperties(to: &representation)
        
        return representation
    }
    
    private func addComputedProperties(to representation: inout [String: Any]) {
        // 仅依赖协议
        if let selfWithComputed = self as? AASerializableWithComputedProperties {
            let computedProps = selfWithComputed.computedProperties()
            // 仅在有计算属性时合并
            if !computedProps.isEmpty {
                for (key, value) in computedProps {
                    representation[key] = value
                }
            }
        }
    }
    
    func toJSON() -> String {
        do {
            let data = try JSONSerialization.data(withJSONObject: toDic(), options: [.fragmentsAllowed])
            guard let jsonString = String(data: data, encoding: .utf8) else {
                print("JSON encoding error: Unable to convert data to String.")
                return ""
            }
            return jsonString
        } catch let error as NSError {
            print("JSON serialization error: \(error.localizedDescription)")
            return ""
        }
    }
}