//
//  AALinearGradientColor.swift
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

public enum AALinearGradientDirection: Int {
    case toTop = 0       //⇧⇧⇧⇧⇧⇧
    case toBottom        //⇩⇩⇩⇩⇩⇩
    case toLeft          //⇦⇦⇦⇦⇦⇦
    case toRight         //⇨⇨⇨⇨⇨⇨
    case toTopLeft       //⇖⇖⇖⇖⇖⇖
    case toTopRight      //⇗⇗⇗⇗⇗⇗
    case toBottomLeft    //⇙⇙⇙⇙⇙⇙
    case toBottomRight   //⇘⇘⇘⇘⇘⇘
}

extension AAGradientColor {
    public class func linearGradient(
        startColor: String,
        endColor: String
    ) -> [String : Any] {
        linearGradient(
            direction: .toTop,
            startColor: startColor,
            endColor: endColor
        )
    }
    
    public class func linearGradient(
        direction: AALinearGradientDirection,
        startColor: String,
        endColor: String
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            stops: [
                [0, startColor],
                [1, endColor]
            ]
        )
    }
    
    public class func linearGradient(
        direction: AALinearGradientDirection,
        stops: [Any]
    ) -> [String : Any] {
        [
            "linearGradient": linearGradientDirectionDictionary(direction: direction),
            "stops": stops
        ]
    }
    
    /**
     (0,0) ----------- (1,0)
     |                   |
     |                   |
     |                   |
     |                   |
     |                   |
     (0,1) ----------- (1,1)
     */
    private class func linearGradientDirectionDictionary(
        direction: AALinearGradientDirection
    ) -> [String : Int] {
        switch direction {
        case .toTop:         return ["x1":0, "y1":1, "x2":0, "y2":0]
        case .toBottom:      return ["x1":0, "y1":0, "x2":0, "y2":1]
        case .toLeft:        return ["x1":1, "y1":0, "x2":0, "y2":0]
        case .toRight:       return ["x1":0, "y1":0, "x2":1, "y2":0]
        case .toTopLeft:     return ["x1":1, "y1":1, "x2":0, "y2":0]
        case .toTopRight:    return ["x1":0, "y1":1, "x2":1, "y2":0]
        case .toBottomLeft:  return ["x1":1, "y1":0, "x2":0, "y2":1]
        case .toBottomRight: return ["x1":0, "y1":0, "x2":1, "y2":1]
        }
    }
}
