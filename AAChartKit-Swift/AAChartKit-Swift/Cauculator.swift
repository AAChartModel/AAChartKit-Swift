//
//  Cauculator.swift
//  AAChartKit-Swift
//
//  Created by 金银岛 on 2017/4/18.
//  Copyright © 2017年 Danny boy. All rights reserved.
//

import Foundation



class Calculater: NSObject {
    // 用来保存结果的
    var result : Float = 0.0
    
    func add(num: Float) -> Calculater {
        result += num
        return self
    }
    
    func sub(num: Float) -> Calculater {
        result -= num
        return self
    }
    
    func mul(num: Float) -> Calculater {
        result *= num
        return self
    }
 
}
