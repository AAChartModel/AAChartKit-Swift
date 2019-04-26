//
//  AAEasyTool.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/4/27.
//  Copyright © 2019 An An. All rights reserved.
//

import UIKit

public class AAEasyTool {
     public static func pureJavaScriptFunctionString(_ jsFunctionStr: String) -> String {
        var pureJSFunctionStr = jsFunctionStr
        pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "'", with: "\"")
        pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\\", with: "\\\\")
        pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\"", with: "\\\"")
        pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\'", with: "\\\'")
        pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\n", with: "\\n")
        pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\r", with: "\\r")
        pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\u{000C}", with: "\\f")
        pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\u{2028}", with: "\\u2028")
        pureJSFunctionStr = pureJSFunctionStr.replacingOccurrences(of: "\u{2029}", with: "\\u2029")
        return pureJSFunctionStr
    }
}
