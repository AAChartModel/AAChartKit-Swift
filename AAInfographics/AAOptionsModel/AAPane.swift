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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

import Foundation

public class AAPane: AAObject {
    public var background: [AABackgroundElement]?
    public var center: [String]?
    public var endAngle: Float?
    public var size: Any?
    public var startAngle: Float?
    
    
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
    public func size(_ prop: Any) -> AAPane {
        size = prop
        return self
    }
    
    @discardableResult
    public func startAngle(_ prop: Float) -> AAPane {
        startAngle = prop
        return self
    }
    
    public override init() {
        
    }
}

public class AABackgroundElement: AAObject {
    public var backgroundColor: Any? //背景颜色
    public var borderColor: String? //边框颜色
    public var borderWidth: Float? //边框宽度
    public var className: String?//类名
    public var innerRadius: Any?//内半径
    public var outerRadius: Any?//外半径
    public var shape: String?
    
    @discardableResult
    public func backgroundColor(_ prop: Any) -> AABackgroundElement {
        backgroundColor = prop
        return self
    }
    
    @discardableResult
    public func borderColor(_ prop: String) -> AABackgroundElement {
        borderColor = prop
        return self
    }
    
    @discardableResult
    public func borderWidth(_ prop: Float) -> AABackgroundElement {
        borderWidth = prop
        return self
    }
    
    @discardableResult
    public func className(_ prop: String) -> AABackgroundElement {
        className = prop
        return self
    }
    
    @discardableResult
    public func innerRadius(_ prop: Any) -> AABackgroundElement {
        innerRadius = prop
        return self
    }
    
    @discardableResult
    public func outerRadius(_ prop: Any) -> AABackgroundElement {
        outerRadius = prop
        return self
    }
    
    @discardableResult
    public func shape(_ prop: String) -> AABackgroundElement {
        shape = prop
        return self
    }
    
    public override init() {
        
    }
}
