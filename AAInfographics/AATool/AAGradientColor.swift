//
//  AAGradientColor.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2018/11/18.
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

public class AAGradientColor  {
    public static var oceanBlue: [String : Any] {
        return oceanBlueColor(.toTop)
    }
    
    public static var sanguine: [String : Any] {
        return sanguineColor(.toTop)
    }
    
    public static var lusciousLime: [String : Any] {
        return lusciousLimeColor(.toTop)
    }
    
    public static var purpleLake: [String : Any] {
        return purpleLakeColor(.toTop)
    }
    
    public static var freshPapaya: [String : Any] {
        return freshPapayaColor(.toTop)
    }
    
    public static var ultramarine: [String : Any] {
        return ultramarineColor(.toTop)
    }
    
    public static var pinkSugar: [String : Any] {
        return pinkSugarColor(.toTop)
    }
    
    public static var lemonDrizzle: [String : Any] {
        return lemonDrizzleColor(.toTop)
    }
    
    public static var victoriaPurple: [String : Any] {
        return victoriaPurpleColor(.toTop)
    }
    
    public static var springGreens: [String : Any] {
        return springGreensColor(.toTop)
    }
    
    public static var mysticMauve: [String : Any] {
        return mysticMauveColor(.toTop)
    }
    
    public static var reflexSilver: [String : Any] {
        return reflexSilverColor(.toTop)
    }
    
    public static var neonGlow: [String : Any] {
        return neonGlowColor(.toTop)
    }
    
    public static var berrySmoothie: [String : Any] {
        return berrySmoothieColor(.toTop)
    }
    
    public static var newLeaf: [String : Any] {
        return newLeafColor(.toTop)
    }
    
    public static var cottonCandy: [String : Any] {
        return cottonCandyColor(.toTop)
    }
    
    public static var pixieDust: [String : Any] {
        return pixieDustColor(.toTop)
    }
    
    public static var fizzyPeach: [String : Any] {
        return fizzyPeachColor(.toTop)
    }
    
    public static var sweetDream: [String : Any] {
        return sweetDreamColor(.toTop)
    }
    
    public static var firebrick: [String : Any] {
        return firebrickColor(.toTop)
    }
    
    public static var wroughtIron: [String : Any] {
        return wroughtIronColor(.toTop)
    }
    
    public static var deepSea: [String : Any] {
        return deepSeaColor(.toTop)
    }
    
    public static var coastalBreeze: [String : Any] {
        return coastalBreezeColor(.toTop)
    }
    
    public static var eveningDelight: [String : Any] {
        return eveningDelightColor(.toTop)
    }
    
    public static func oceanBlueColor(
         _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#2E3192",
            endColor: "#1BFFFF"
        )
    }
    
    public static func sanguineColor(
        _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#D4145A",
            endColor: "#FBB03B"
        )
    }
    
    public static func lusciousLimeColor(
        _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#009245",
            endColor: "#FCEE21"
        )
    }
    
    public static func purpleLakeColor(
        _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#662D8C",
            endColor: "#ED1E79"
        )
    }
    
    public static func freshPapayaColor(
        _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#ED1C24",
            endColor: "#FCEE21"
        )
    }
    
    public static func ultramarineColor(
        _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#00A8C5",
            endColor: "#FFFF7E"
        )
    }
    
    public static func pinkSugarColor(
        _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#D74177",
            endColor: "#FFE98A"
        )
    }
    
    public static func lemonDrizzleColor(
        _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#FB872B",
            endColor: "#D9E021"
        )
    }
    
    public static func victoriaPurpleColor(
        _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#312A6C",
            endColor: "#852D91"
        )
    }
    
    public static func springGreensColor(
        _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#009E00",
            endColor: "#FFFF96"
        )
    }
    
    public static func mysticMauveColor(
        _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#B066FE",
            endColor: "#63E2FF"
        )
    }
    
    public static func reflexSilverColor(
        _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#808080",
            endColor: "#E6E6E6"
        )
    }
    
    public static func neonGlowColor(
        _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#00FFA1",
            endColor: "#00FFFF"
        )
    }
    
    public static func berrySmoothieColor(
        _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#8E78FF",
            endColor: "#FC7D7B"
        )
    }
    
    public static func newLeafColor(
        _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#00537E",
            endColor: "#3AA17E"
        )
    }
    
    public static func cottonCandyColor(
        _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#FCA5F1",
            endColor: "#B5FFFF"
        )
    }
    
    public static func pixieDustColor(
        _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#D585FF",
            endColor: "#00FFEE"
        )
    }
    
    public static func fizzyPeachColor(
        _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#F24645",
            endColor: "#EBC08D"
        )
    }
    
    public static func sweetDreamColor(
        _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#3A3897",
            endColor: "#A3A1FF"
        )
    }
    
    public static func firebrickColor(
        _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#45145A",
            endColor: "#FF5300"
        )
    }
    
    public static func wroughtIronColor(
        _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#333333",
            endColor: "#5A5454"
        )
    }
    
    public static func deepSeaColor(
        _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#4F00BC",
            endColor: "#29ABE2"
        )
    }
    
    public static func coastalBreezeColor(
        _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#00B7FF",
            endColor: "#FFFFC7"
        )
    }
    
    public static func eveningDelightColor(
        _ direction: AALinearGradientDirection
        ) -> [String : Any] {
        return linearGradient(
            direction: direction,
            startColor: "#93278F",
            endColor: "#00A99D"
        )
    }
    
    public static func linearGradient(
        startColor: String,
        endColor: String
        ) -> [String : Any] {
        return self.linearGradient(
            direction: .toTop,
            startColor: startColor,
            endColor: endColor
        )
    }
    
    public static func linearGradient(
        direction: AALinearGradientDirection,
        startColor: String,
        endColor: String
        ) -> [String : Any] {
        return self.linearGradient(
            direction: direction,
            stops: [
                [0, startColor],
                [1, endColor]
            ]
        )
    }
    
    public static func linearGradient(
        direction: AALinearGradientDirection,
        stops: [Any]
        ) -> [String : Any] {
        let linearGradient = linearGradientDirectionDictionary(direction: direction)
        return [
            "linearGradient": linearGradient,
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
    private static func linearGradientDirectionDictionary(
         direction: AALinearGradientDirection
        ) -> [String : Int] {
        switch direction {
        case .toTop:
            return ["x1":0, "y1":1, "x2":0, "y2":0];
        case .toBottom:
            return ["x1":0, "y1":0, "x2":0, "y2":1];
        case .toLeft:
            return ["x1":1, "y1":0, "x2":0, "y2":0];
        case .toRight:
            return ["x1":0, "y1":0, "x2":1, "y2":0];
        case .toTopLeft:
            return ["x1":1, "y1":1, "x2":0, "y2":0];
        case .toTopRight:
            return ["x1":0, "y1":1, "x2":1, "y2":0];
        case .toBottomLeft:
            return ["x1":1, "y1":0, "x2":0, "y2":1];
        case .toBottomRight:
            return ["x1":0, "y1":0, "x2":1, "y2":1];
        }
    }
}


