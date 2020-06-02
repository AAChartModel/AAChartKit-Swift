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
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */
import Foundation

public class AAColor {
    
    public class var black: String {
        return "black"
    } // 0.0 white
    
    public class var darkGray: String {
        return "darkGray"
    } // 0.333 white
    
    public class var lightGray: String {
        return "lightGray"
    } // 0.667 white
    
    public class var white: String {
        return "white"
    } // 1.0 white
    
    public class var gray: String {
        return "gray"
    } // 0.5 white
    
    public class var red: String {
        return "red"
    } // 1.0, 0.0, 0.0 RGB
    
    public class var green: String {
        return "green"
    } // 0.0, 1.0, 0.0 RGB
    
    public class var blue: String {
        return "blue"
    } // 0.0, 0.0, 1.0 RGB
    
    public class var cyan: String {
        return "cyan"
    } // 0.0, 1.0, 1.0 RGB
    
    public class var yellow: String {
        return "yellow"
    } // 1.0, 1.0, 0.0 RGB
    
    public class var magenta: String {
        return "magenta"
    } // 1.0, 0.0, 1.0 RGB
    
    public class var orange: String {
        return "orange"
    } // 1.0, 0.5, 0.0 RGB
    
    public class var purple: String {
        return "purple"
    } // 0.5, 0.0, 0.5 RGB
    
    public class var brown: String {
        return "brown"
    } // 0.6, 0.4, 0.2 RGB
    
    public class var clear: String {
        return "#00000000"
    } // 0.0 white, 0.0 alpha
    
    public class func rgbaColor(
        _ red: Float,
        _ green: Float,
        _ blue: Float,
        _ alpha: Float
        ) -> String {
        return "rgba(\(red),\(green),\(blue),\(alpha))"
    }
}

