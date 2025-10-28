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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */


public extension AAStyle {
    convenience init(color : String?) {
        self.init(color: color, fontSize: nil)
    }
    
    convenience init(color : String?, fontSize: Float?) {
        self.init(color: color, fontSize: fontSize, weight: nil)
    }
    
    convenience init(color : String?, fontSize: Float?, weight: AAChartFontWeightType?) {
      self.init(color: color, fontSize: fontSize,weight: weight, outline: nil)
    }
    
    convenience init(color : String?, fontSize: Float?, weight: AAChartFontWeightType?, outline: String?) {
        self.init()
        self.color(color)
        .fontSize(fontSize)
        .fontWeight(weight)
        .textOutline(outline)
    }
}

public extension String {
    
    private func aa_toPureString() -> String {
        var pureStr = self
        pureStr = pureStr.replacingOccurrences(of: "'", with: "\"")
        pureStr = pureStr.replacingOccurrences(of: "\0", with: "")
        pureStr = pureStr.replacingOccurrences(of: "\n", with: "")
        pureStr = pureStr.replacingOccurrences(of: "\\", with: "\\\\")
        pureStr = pureStr.replacingOccurrences(of: "\"", with: "\\\"")
        pureStr = pureStr.replacingOccurrences(of: "\n", with: "\\n")
        pureStr = pureStr.replacingOccurrences(of: "\r", with: "\\r")
        pureStr = pureStr.replacingOccurrences(of: "\u{000C}", with: "\\f")
        pureStr = pureStr.replacingOccurrences(of: "\u{2028}", with: "\\u2028")
        pureStr = pureStr.replacingOccurrences(of: "\u{2029}", with: "\\u2029")
        return pureStr
    }
    
    func aa_toPureJSString() -> String {
        //https://stackoverflow.com/questions/34334232/why-does-function-not-work-but-function-does-chrome-devtools-node
        return "(\(self.aa_toPureString()))"
    }
    
    func aa_toPureHTMLString() -> String {
        return self.aa_toPureString()
    }
    
    func aa_toPureCSSString() -> String {
        return self.aa_toPureString()
    }
    
}


public extension Array {
    
    //Convert Swift array to be JavaScript array
    func aa_toJSArray() -> String {
        var originalJsArrStr = ""
        for element in self {
            originalJsArrStr = originalJsArrStr + "'\(element)',"
        }
        
        return "[\(originalJsArrStr)]"
    }
    
}


public extension AAChartModel {
    
    //Convert AAChartModel to be AAOptions
    func aa_toAAOptions() -> AAOptions {
        AAOptionsConstructor.configureChartOptions(self)
    }
}



