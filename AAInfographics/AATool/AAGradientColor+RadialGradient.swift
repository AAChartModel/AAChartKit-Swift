//
//  AARadialGradientColor.swift
//  AAInfographics
//
//  Created by AnAn on 2024/2/4.
//  Copyright © 2024 An An. All rights reserved.
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

public enum AARadialGradientPosition: Int {
    case center
    case topLeft
    case topCenter
    case topRight
    case centerLeft
    case centerRight
    case bottomLeft
    case bottomCenter
    case bottomRight
}

extension AAGradientColor {
    
    public class func radialGradient(
        startColor: String,
        endColor: String
    ) -> [String : Any] {
        radialGradient(
            position: .center,
            startColor: startColor,
            endColor: endColor
        )
    }
    
    public class func radialGradient(
        position: AARadialGradientPosition,
        startColor: String,
        endColor: String
    ) -> [String : Any] {
        radialGradient(
            position: position,
            stops: [
                [0, startColor],
                [1, endColor]
            ]
        )
    }
    
    public class func radialGradient(
        position: AARadialGradientPosition,
        stops: [Any]
    ) -> [String : Any] {
        [
            "radialGradient": radialGradientPositionDictionary(position: position),
            "stops": stops
        ]
    }
    
    private class func radialGradientPositionDictionary(
        position: AARadialGradientPosition
    ) -> [String : String] {
        switch position {
        case .center:       return ["cx": "50%", "cy": "50%", "r": "50%"]
        case .topLeft:      return ["cx": "25%", "cy": "25%", "r": "50%"]
        case .topCenter:    return ["cx": "50%", "cy": "25%", "r": "50%"]
        case .topRight:     return ["cx": "75%", "cy": "25%", "r": "50%"]
        case .centerLeft:   return ["cx": "25%", "cy": "50%", "r": "50%"]
        case .centerRight:  return ["cx": "75%", "cy": "50%", "r": "50%"]
        case .bottomLeft:   return ["cx": "25%", "cy": "75%", "r": "50%"]
        case .bottomCenter: return ["cx": "50%", "cy": "75%", "r": "50%"]
        case .bottomRight:  return ["cx": "75%", "cy": "75%", "r": "50%"]
        }
    }

}

