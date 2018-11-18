//
//  AAGradientColor.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2018/11/18.
//  Copyright © 2018 An An. All rights reserved.
//

import UIKit

public class AAGradientColor: NSObject  {
    public static var oceanBlue: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "2E3192", endColor: "1BFFFF") as Any
        }
    }
    public static var sanguine: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "D4145A", endColor: "FBB03B") as Any
        }
    }
    public static var lusciousLime: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "009245", endColor: "FCEE21") as Any
        }
    }
    public static var purpleLake: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "662D8C", endColor: "ED1E79") as Any
        }
    }
    public static var freshPapaya: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "ED1C24", endColor: "FCEE21") as Any
        }
    }
    public static var ultramarine: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "00A8C5", endColor: "FFFF7E") as Any
        }
    }
    public static var pinkSugar: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "D74177", endColor: "FFE98A") as Any
        }
    }
    public static var lemonDrizzle: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "FB872B", endColor: "D9E021") as Any
        }
    }
    public static var victoriaPurple: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "312A6C", endColor: "852D91") as Any
        }
    }
    public static var springGreens: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "009E00", endColor: "FFFF96") as Any
        }
    }
    public static var mysticMauve: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "B066FE", endColor: "63E2FF") as Any
        }
    }
    public static var reflexSilver: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "808080", endColor: "E6E6E6") as Any
        }
    }
    public static var neonGlow: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "00FFA1", endColor: "00FFFF") as Any
        }
    }
    public static var berrySmoothie: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "8E78FF", endColor: "FC7D7B") as Any
        }
    }
    public static var newLeaf: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "00537E", endColor: "3AA17E") as Any
        }
    }
    public static var cottonCandy: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "FCA5F1", endColor: "B5FFFF") as Any
        }
    }
    public static var pixieDust: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "D585FF", endColor: "00FFEE") as Any
        }
    }
    public static var fizzyPeach: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "F24645", endColor: "EBC08D") as Any
        }
    }
    public static var sweetDream: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "3A3897", endColor: "A3A1FF") as Any
        }
    }
    public static var firebrick: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "45145A", endColor: "FF5300") as Any
        }
    }
    public static var wroughtIron: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "333333", endColor: "5A5454") as Any
        }
    }
    public static var deepSea: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "4F00BC", endColor: "29ABE2") as Any
        }
    }
    public static var coastalBreeze: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "00B7FF", endColor: "FFFFC7") as Any
        }
    }
    public static var eveningDelight: Any! {
        get {
            return GradientColorDicMaker.configureGradientColorDictionary(startColor: "93278F", endColor: "00A99D") as Any
        }
    }
    
}

open class GradientColorDicMaker {
    public static func configureGradientColorDictionary(startColor: String, endColor: String) -> [String : Any] {
        let gradientColorDic = [
            "linearGradient": [
                "x1": 0,
                "y1": 0,
                "x2": 0,
                "y2": 1
            ],
            "stops": [[0, "#\(startColor)"],
                      [1, "#\(endColor)"]]//颜色字符串设置支持十六进制类型和 rgba 类型
            ] as [String : Any]
        return gradientColorDic
    }

}
