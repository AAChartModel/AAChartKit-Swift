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
    public class var oceanBlue: [String : Any] {
        oceanBlueColor(.toTop)
    }
    
    public class var sanguine: [String : Any] {
        sanguineColor(.toTop)
    }
    
    public class var lusciousLime: [String : Any] {
        lusciousLimeColor(.toTop)
    }
    
    public class var purpleLake: [String : Any] {
        purpleLakeColor(.toTop)
    }
    
    public class var freshPapaya: [String : Any] {
        freshPapayaColor(.toTop)
    }
    
    public class var ultramarine: [String : Any] {
        ultramarineColor(.toTop)
    }
    
    public class var pinkSugar: [String : Any] {
        pinkSugarColor(.toTop)
    }
    
    public class var lemonDrizzle: [String : Any] {
        lemonDrizzleColor(.toTop)
    }
    
    public class var victoriaPurple: [String : Any] {
        victoriaPurpleColor(.toTop)
    }
    
    public class var springGreens: [String : Any] {
        springGreensColor(.toTop)
    }
    
    public class var mysticMauve: [String : Any] {
        mysticMauveColor(.toTop)
    }
    
    public class var reflexSilver: [String : Any] {
        reflexSilverColor(.toTop)
    }
    
    public class var neonGlow: [String : Any] {
        neonGlowColor(.toTop)
    }
    
    public class var berrySmoothie: [String : Any] {
        berrySmoothieColor(.toTop)
    }
    
    public class var newLeaf: [String : Any] {
        newLeafColor(.toTop)
    }
    
    public class var cottonCandy: [String : Any] {
        cottonCandyColor(.toTop)
    }
    
    public class var pixieDust: [String : Any] {
        pixieDustColor(.toTop)
    }
    
    public class var fizzyPeach: [String : Any] {
        fizzyPeachColor(.toTop)
    }
    
    public class var sweetDream: [String : Any] {
        sweetDreamColor(.toTop)
    }
    
    public class var firebrick: [String : Any] {
        firebrickColor(.toTop)
    }
    
    public class var wroughtIron: [String : Any] {
        wroughtIronColor(.toTop)
    }
    
    public class var deepSea: [String : Any] {
        deepSeaColor(.toTop)
    }
    
    public class var coastalBreeze: [String : Any] {
        coastalBreezeColor(.toTop)
    }
    
    public class var eveningDelight: [String : Any] {
        eveningDelightColor(.toTop)
    }
    
    public class func oceanBlueColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#2E3192",
            endColor: "#1BFFFF"
        )
    }
    
    public class func sanguineColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#D4145A",
            endColor: "#FBB03B"
        )
    }
    
    public class func lusciousLimeColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#009245",
            endColor: "#FCEE21"
        )
    }
    
    public class func purpleLakeColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#662D8C",
            endColor: "#ED1E79"
        )
    }
    
    public class func freshPapayaColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#ED1C24",
            endColor: "#FCEE21"
        )
    }
    
    public class func ultramarineColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#00A8C5",
            endColor: "#FFFF7E"
        )
    }
    
    public class func pinkSugarColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#D74177",
            endColor: "#FFE98A"
        )
    }
    
    public class func lemonDrizzleColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#FB872B",
            endColor: "#D9E021"
        )
    }
    
    public class func victoriaPurpleColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#312A6C",
            endColor: "#852D91"
        )
    }
    
    public class func springGreensColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#009E00",
            endColor: "#FFFF96"
        )
    }
    
    public class func mysticMauveColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#B066FE",
            endColor: "#63E2FF"
        )
    }
    
    public class func reflexSilverColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#808080",
            endColor: "#E6E6E6"
        )
    }
    
    public class func neonGlowColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#00FFA1",
            endColor: "#00FFFF"
        )
    }
    
    public class func berrySmoothieColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#8E78FF",
            endColor: "#FC7D7B"
        )
    }
    
    public class func newLeafColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#00537E",
            endColor: "#3AA17E"
        )
    }
    
    public class func cottonCandyColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#FCA5F1",
            endColor: "#B5FFFF"
        )
    }
    
    public class func pixieDustColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#D585FF",
            endColor: "#00FFEE"
        )
    }
    
    public class func fizzyPeachColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#F24645",
            endColor: "#EBC08D"
        )
    }
    
    public class func sweetDreamColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#3A3897",
            endColor: "#A3A1FF"
        )
    }
    
    public class func firebrickColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#45145A",
            endColor: "#FF5300"
        )
    }
    
    public class func wroughtIronColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#333333",
            endColor: "#5A5454"
        )
    }
    
    public class func deepSeaColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#4F00BC",
            endColor: "#29ABE2"
        )
    }
    
    public class func coastalBreezeColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#00B7FF",
            endColor: "#FFFFC7"
        )
    }
    
    public class func eveningDelightColor(
        _ direction: AALinearGradientDirection
    ) -> [String : Any] {
        linearGradient(
            direction: direction,
            startColor: "#93278F",
            endColor: "#00A99D"
        )
    }
    
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
        case .toTop:
            return ["x1":0, "y1":1, "x2":0, "y2":0]
        case .toBottom:
            return ["x1":0, "y1":0, "x2":0, "y2":1]
        case .toLeft:
            return ["x1":1, "y1":0, "x2":0, "y2":0]
        case .toRight:
            return ["x1":0, "y1":0, "x2":1, "y2":0]
        case .toTopLeft:
            return ["x1":1, "y1":1, "x2":0, "y2":0]
        case .toTopRight:
            return ["x1":0, "y1":1, "x2":1, "y2":0]
        case .toBottomLeft:
            return ["x1":1, "y1":0, "x2":0, "y2":1]
        case .toBottomRight:
            return ["x1":0, "y1":0, "x2":1, "y2":1]
        }
    }
}


