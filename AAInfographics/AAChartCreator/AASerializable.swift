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

public class AAObject { }

@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
public extension AAObject {
    var classNameString: String {
        let nameClass: AnyClass! = object_getClass(self)
        return NSStringFromClass(nameClass)
    }
}

@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
public extension AAObject {
    fileprivate func loopForMirrorChildren(_ mirrorChildren: Mirror.Children, _ representation: inout [String : Any]) {
        for case let (label?, value) in mirrorChildren {
            switch value {
            case let value as AAObject: do {
                representation[label] = value.toDic()
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
    }
    
    func toDic() -> [String: Any]? {
        var representation = [String: Any]()
        
        let mirrorChildren = Mirror(reflecting: self).children
        loopForMirrorChildren(mirrorChildren, &representation)
        
        let superMirrorChildren = Mirror(reflecting: self).superclassMirror?.children
        if superMirrorChildren?.count ?? 0 > 0 {
            loopForMirrorChildren(superMirrorChildren!, &representation)
        }
        
        return representation as [String: Any]?
    }
    
    
    func toJSON() -> String? {
        do {
            let data = try JSONSerialization.data(withJSONObject: toDic() as Any, options: [])
            let jsonStr = String(data: data, encoding: String.Encoding.utf8)
            return jsonStr
        } catch {
            return nil
        }
    }
    
}

