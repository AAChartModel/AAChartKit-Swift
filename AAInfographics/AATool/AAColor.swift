//
//  AAColor.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2018/11/19.
//  Copyright © 2018 An An. All rights reserved.
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


public class AAColor {
    
    public class var black: String {
        "black"
    } // 0.0 white
    
    public class var darkGray: String {
        "darkGray"
    } // 0.333 white
    
    public class var lightGray: String {
        "lightGray"
    } // 0.667 white
    
    public class var white: String {
        "white"
    } // 1.0 white
    
    public class var gray: String {
        "gray"
    } // 0.5 white
    
    public class var red: String {
        "red"
    } // 1.0, 0.0, 0.0 RGB
    
    public class var green: String {
        "green"
    } // 0.0, 1.0, 0.0 RGB
    
    public class var blue: String {
        "blue"
    } // 0.0, 0.0, 1.0 RGB
    
    public class var cyan: String {
        "cyan"
    } // 0.0, 1.0, 1.0 RGB
    
    public class var yellow: String {
        "yellow"
    } // 1.0, 1.0, 0.0 RGB
    
    public class var magenta: String {
        "magenta"
    } // 1.0, 0.0, 1.0 RGB
    
    public class var orange: String {
        "orange"
    } // 1.0, 0.5, 0.0 RGB
    
    public class var purple: String {
        "purple"
    } // 0.5, 0.0, 0.5 RGB
    
    public class var brown: String {
        "brown"
    } // 0.6, 0.4, 0.2 RGB
    
    public class var clear: String {
        "#00000000"
    } // 0.0 white, 0.0 alpha
    
    public class func rgbaColor(
        _ red: Int,
        _ green: Int,
        _ blue: Int,
        _ alpha: Float = 1.0
        ) -> String {
        "rgba(\(red),\(green),\(blue),\(alpha))"
    }
}

public func AARgba(
    _ red: Int,
    _ green: Int,
    _ blue: Int,
    _ alpha: Float = 1.0
    ) -> String  {
    "rgba(\(red),\(green),\(blue),\(alpha))"
}

public func AARgb(
    _ red: Int,
    _ green: Int,
    _ blue: Int
    ) -> String  {
    AARgba(red, green, blue)
}

