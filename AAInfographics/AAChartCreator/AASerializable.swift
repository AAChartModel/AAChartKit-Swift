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
    public init() {
        
    }
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
    
    fileprivate func loopForMirrorChildren(_ mirrorChildren: Mirror.Children, _ representation: inout [String : Any]) {
        for case let (label?, value) in mirrorChildren {
            switch value {
            case let value as AAObject:
                representation[label] = value.toDic()
                
            case let value as [AAObject]:
                let valueCount = value.count
                var aaObjectArr = [Any]()
                aaObjectArr.reserveCapacity(valueCount)
                
                for aaObject in value {
                    aaObjectArr.append(aaObject.toDic())
                }
                
                representation[label] = aaObjectArr
                
            case let value as NSObject:
                representation[label] = value
                
            default:
                // Ignore any unserializable properties
                break
            }
        }
    }
    
    func toDic() -> [String: Any] {
        // Create mirror once
        let mirror = Mirror(reflecting: self)
        
        // Estimate capacity based on property count
        let estimatedCapacity = mirror.children.underestimatedCount + 
                              (mirror.superclassMirror?.children.underestimatedCount ?? 0) + 5
        
        var representation = [String: Any](minimumCapacity: estimatedCapacity)
        
        // 遍历当前类的反射子属性
        loopForMirrorChildren(mirror.children, &representation)
        
        // 遍历父类的反射子属性
        if let superMirror = mirror.superclassMirror, !superMirror.children.isEmpty {
            loopForMirrorChildren(superMirror.children, &representation)
        }
        
        // 如果实现了 SerializableWithComputedProperties 协议，获取计算属性
        if let selfWithComputed = self as? AASerializableWithComputedProperties {
            let computedProps = selfWithComputed.computedProperties()
            for (key, value) in computedProps {
                representation[key] = value
            }
        }
        
        return representation
    }
    
    func toJSON() -> String {
        do {
            let data = try JSONSerialization.data(withJSONObject: toDic(), options: [.fragmentsAllowed])
            return String(data: data, encoding: .utf8) ?? ""
        } catch {
            print("JSON serialization error: \(error)")
            return ""
        }
    }
}