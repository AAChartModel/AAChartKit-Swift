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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

//https://api.highcharts.com/class-reference/Highcharts.GradientColorObject
public class AAGradientColor: AAObject {
    public var linearGradient: AALinearGradient?
    public var radialGradient: AARadialGradient?
    public var stops: [[Any]]?
    
    @discardableResult
    public func linearGradient(_ prop: AALinearGradient?) -> AAGradientColor {
        linearGradient = prop
        return self
    }
    
    @discardableResult
    public func radialGradient(_ prop: AARadialGradient?) -> AAGradientColor {
        radialGradient = prop
        return self
    }
    
    @discardableResult
    public func stops(_ prop: [[Any]]?) -> AAGradientColor {
        stops = prop
        return self
    }
    
    public override init() {
        
    }
}

public class AALinearGradient: AAObject {
    public var x1: Float?
    public var y1: Float?
    public var x2: Float?
    public var y2: Float?
    
    @discardableResult
    public func x1(_ prop: Float?) -> AALinearGradient {
        x1 = prop
        return self
    }
    
    @discardableResult
    public func y1(_ prop: Float?) -> AALinearGradient {
        y1 = prop
        return self
    }
    
    @discardableResult
    public func x2(_ prop: Float?) -> AALinearGradient {
        x2 = prop
        return self
    }
    
    @discardableResult
    public func y2(_ prop: Float?) -> AALinearGradient {
        y2 = prop
        return self
    }
    
    public init(
        x1: Float,
        y1: Float,
        x2: Float,
        y2: Float
    ) {
        self.x1 = x1
        self.y1 = y1
        self.x2 = x2
        self.y2 = y2
    }
    
    public override init() {
        
    }
}

public class AARadialGradient: AAObject {
    public var cx: Float?
    public var cy: Float?
    public var r: Float?
    
    @discardableResult
    public func cx(_ prop: Float?) -> AARadialGradient {
        cx = prop
        return self
    }
    
    @discardableResult
    public func cy(_ prop: Float?) -> AARadialGradient {
        cy = prop
        return self
    }
    
    @discardableResult
    public func r(_ prop: Float?) -> AARadialGradient {
        r = prop
        return self
    }
    
    public init(
        cx: Float,
        cy: Float,
        r: Float
    ) {
        self.cx = cx
        self.cy = cy
        self.r = r
    }
    
    public override init() {
        
    }
}




