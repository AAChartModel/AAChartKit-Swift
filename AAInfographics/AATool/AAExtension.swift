//
//  AAStringExtension.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2020/8/11.
//  Copyright © 2020 An An. All rights reserved.
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

import UIKit

public extension String {
    
    func aa_toPureJSString() -> String {
        //https://stackoverflow.com/questions/34334232/why-does-function-not-work-but-function-does-chrome-devtools-node
        var pureJSStr = "(\(self))"
        pureJSStr = pureJSStr.replacingOccurrences(of: "'", with: "\"")
        pureJSStr = pureJSStr.replacingOccurrences(of: "\0", with: "")
        pureJSStr = pureJSStr.replacingOccurrences(of: "\n", with: "")
        pureJSStr = pureJSStr.replacingOccurrences(of: "\\", with: "\\\\")
        pureJSStr = pureJSStr.replacingOccurrences(of: "\"", with: "\\\"")
        pureJSStr = pureJSStr.replacingOccurrences(of: "\n", with: "\\n")
        pureJSStr = pureJSStr.replacingOccurrences(of: "\r", with: "\\r")
        pureJSStr = pureJSStr.replacingOccurrences(of: "\u{000C}", with: "\\f")
        pureJSStr = pureJSStr.replacingOccurrences(of: "\u{2028}", with: "\\u2028")
        pureJSStr = pureJSStr.replacingOccurrences(of: "\u{2029}", with: "\\u2029")
        return pureJSStr
    }

}


public extension Array {
    
    //Convert Swift array to be JavaScript array
    func aa_toJSArray() -> String {
        var originalJsArrStr = ""
        for element in self {
            originalJsArrStr = originalJsArrStr + "'\(element)',"
        }
        
        let finalJSArrStr = "[\(originalJsArrStr)]"
        return finalJSArrStr
    }
    
}


public extension AAChartModel {
    
    //Convert AAChartModel to be AAOptions
    func aa_toAAOptions() -> AAOptions {
        return AAOptionsConstructor.configureChartOptions(self)
    }
}



