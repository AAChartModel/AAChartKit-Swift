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
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */


import Foundation

public protocol AASerializable {
    var JSONRepresentation: [String: Any] { get }
}

public class AAObject: AASerializable { }

public extension AAObject {
    var classNameString: String {
        let nameClass: AnyClass! = object_getClass(self)
        return NSStringFromClass(nameClass)
    }
}

public extension AASerializable {
    var JSONRepresentation: [String: Any] {
        var representation = [String: Any]()
        
        let mirrorChildren = Mirror(reflecting: self).children
        
        for case let (label?, value) in mirrorChildren {
            switch value {
            case let value as AAObject: do {
                representation[label] = value.JSONRepresentation
                }
                
            case let value as [AAObject]: do {
                var aaObjectArr = [Any]()
                
                let valueCount = value.count
                for i in 0 ..< valueCount {
                    let aaObject = value[i]
                    let aaObjectDic = aaObject.toDic()
                    aaObjectArr.append(aaObjectDic as Any)
                }
                
                representation[label] = aaObjectArr
                }
                
            case let value as NSObject: do {
                representation[label] = value
                }
                
            default:
                // Ignore any unserializable properties
                break
            }
        }
        return representation
    }
}

public extension AASerializable {
    func toDic() -> [String: Any]? {
        return JSONRepresentation
    }
    
    func toJSON() -> String? {
        do {
            let data = try JSONSerialization.data(withJSONObject: JSONRepresentation, options: [])
            let jsonStr = String(data: data, encoding: String.Encoding.utf8)
            return jsonStr
        } catch {
            return nil
        }
    }
    
}

