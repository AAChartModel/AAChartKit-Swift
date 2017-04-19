//
//  AAChartView.swift
//  AAChartKit-Swift
//
//  Created by 金银岛 on 2017/4/18.
//  Copyright © 2017年 Danny boy. All rights reserved.
//

import UIKit
import WebKit
class AAChartView: UIWebView {
    var add:NSString?
    var sub:NSString?
    var mul:NSString?
    
    func addSet(_ num: NSString) -> AAChartView {
        self.add=num;
        return self
    }
    
    func subSet(_ num: NSString) -> AAChartView {
        self.sub = num;
         return self
    }
    
    func mulSet(_ num: NSString) -> AAChartView {
        self.mul = num;
         return self
    }
    
 
}

