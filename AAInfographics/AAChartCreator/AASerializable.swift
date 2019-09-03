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

public protocol AAJSONRepresentable {
    var JSONRepresentation: AnyObject { get }
}

public protocol AASerializable: AAJSONRepresentable {
}

public class AAObject: AASerializable  {
}

public extension AASerializable {
    
    var JSONRepresentation: AnyObject {
        var representation = [String: AnyObject]()
        
        let mirrorChildren = Mirror(reflecting: self).children
        
        for case let (label?, value) in mirrorChildren {
            switch value {
            case let value as AAObject: do {
//                print("🦁propery name：\(label)     property value：\(value)")
//                print("To be saved value：\(value.JSONRepresentation)")
                representation[label] = value.JSONRepresentation
                }
                
            case let value as [AAObject]: do {
//                print("l🐯propery name：\(label)     property value：\(value)")
                var aaObjectArr = [AnyObject]()
                
                let valueCount = value.count
                for i in 0 ..< valueCount {
                    let aaObject = value[i]
                    let aaObjectDic = aaObject.toDic()
                    aaObjectArr.insert(aaObjectDic as AnyObject, at: i)
                }
                
                representation[label] = aaObjectArr as AnyObject
                }
                
            case let value as NSObject: do {
//                  print("🐱propery name：\(label)     property value：\(value)")
                representation[label] = value
                }
                
            default:
                // Ignore any unserializable properties
                break
            }
        }
        
        return representation as AnyObject
    }
}

public extension AASerializable {
    func toDic() -> [String: AnyObject]? {
        let dic = JSONRepresentation as? [String: AnyObject]
        return dic
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

