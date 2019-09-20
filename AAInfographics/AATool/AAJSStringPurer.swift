//
//  AAEasyTool.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/4/27.
//  Copyright © 2019 An An. All rights reserved.
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

public class AAJSStringPurer {
     public static func pureJavaScriptFunctionString(_ jsFunctionStr: String) -> String {
        var pureJSFunctionStr = jsFunctionStr
        pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "'", with: "\"")
        pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\0", with: "")
        pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\n", with: "")
        pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\\", with: "\\\\")
        pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\"", with: "\\\"")
//        pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\'", with: "\\\'")
        pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\n", with: "\\n")
        pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\r", with: "\\r")
        pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\u{000C}", with: "\\f")
        pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\u{2028}", with: "\\u2028")
        pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\u{2029}", with: "\\u2029")
        return pureJSFunctionStr
    }
}
