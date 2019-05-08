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

import UIKit

public class AAGradientColor: NSObject  {
    public static var oceanBlue: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "2E3192", endColor: "1BFFFF")
    }
    
    public static var sanguine: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "D4145A", endColor: "FBB03B")
    }
    
    public static var lusciousLime: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "009245", endColor: "FCEE21")
    }
    
    public static var purpleLake: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "662D8C", endColor: "ED1E79")
    }
    
    public static var freshPapaya: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "ED1C24", endColor: "FCEE21")
    }
    
    public static var ultramarine: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "00A8C5", endColor: "FFFF7E")
    }
    
    public static var pinkSugar: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "D74177", endColor: "FFE98A")
    }
    
    public static var lemonDrizzle: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "FB872B", endColor: "D9E021")
    }
    
    public static var victoriaPurple: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "312A6C", endColor: "852D91")
    }
    
    public static var springGreens: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "009E00", endColor: "FFFF96")
    }
    
    public static var mysticMauve: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "B066FE", endColor: "63E2FF")
    }
    
    public static var reflexSilver: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "808080", endColor: "E6E6E6")
    }
    
    public static var neonGlow: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "00FFA1", endColor: "00FFFF")
    }
    
    public static var berrySmoothie: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "8E78FF", endColor: "FC7D7B")
    }
    
    public static var newLeaf: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "00537E", endColor: "3AA17E")
    }
    
    public static var cottonCandy: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "FCA5F1", endColor: "B5FFFF")
    }
    
    public static var pixieDust: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "D585FF", endColor: "00FFEE")
    }
    
    public static var fizzyPeach: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "F24645", endColor: "EBC08D")
    }
    
    public static var sweetDream: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "3A3897", endColor: "A3A1FF")
    }
    
    public static var firebrick: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "45145A", endColor: "FF5300")
    }
    
    public static var wroughtIron: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "333333", endColor: "5A5454")
    }
    
    public static var deepSea: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "4F00BC", endColor: "29ABE2")
    }
    
    public static var coastalBreeze: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "00B7FF", endColor: "FFFFC7")
    }
    
    public static var eveningDelight: [String : Any]! {
        return GradientColorDicMaker.configureGradientColorDictionary(startColor: "93278F", endColor: "00A99D")
    }
}

public class GradientColorDicMaker {
    public static func configureGradientColorDictionary(startColor: String, endColor: String) -> [String : Any] {
        return [
            "linearGradient": [
                "x1": 0,
                "y1": 0,
                "x2": 0,
                "y2": 1
            ],
            "stops": [
                [0, "#\(startColor)"],
                [1, "#\(endColor)"]
            ]//颜色字符串设置支持十六进制类型和 rgba 类型
            ] as [String : Any]
    }
}


