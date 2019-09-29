//
//  AAPane.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/9/29.
//  Copyright © 2019 An An. All rights reserved.
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

public class AAPane: AAObject {
    private var background: [AABackgroundElement]?
    private var center: [String]?
    private var endAngle: Float?
    private var size: AnyObject?
    private var startAngle: Float?
    
    
    @discardableResult
      public func background(_ prop: [AABackgroundElement]) -> AAPane {
          background = prop
          return self
      }
    
    @discardableResult
     public func center(_ prop: [String]) -> AAPane {
         center = prop
         return self
     }
    
    @discardableResult
    public func endAngle(_ prop: Float) -> AAPane {
        endAngle = prop
        return self
    }
    
    @discardableResult
    public func size(_ prop: AnyObject) -> AAPane {
        size = prop
        return self
    }
    
    @discardableResult
    public func startAngle(_ prop: Float) -> AAPane {
        startAngle = prop
        return self
    }

}

public class AABackgroundElement: AAObject {
    private var backgroundColor: AnyObject? //背景颜色
    private var borderColor: String? //边框颜色
    private var borderWidth: Float? //边框宽度
    private var className: String?//类名
    private var innerRadius: AnyObject?//内半径
    private var outerRadius: AnyObject?//外半径
    private var shape: String?
}
