//
//  AAScrollablePlotArea.swift
//  AAInfographicsDemo
//
//  Created by Alfred Woo on 2020/03/20.
//  Copyright © 2020 An An. All rights reserved.
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


/// https://api.highcharts.com/highcharts/chart.scrollablePlotArea
public class AAScrollablePlotArea: AAObject {
    public var minHeight: Int?
    public var minWidth: Int?
    public var opacity: Float?
    public var scrollPositionX: Float?
    public var scrollPositionY: Float?
    
    @discardableResult
    public func minHeight(_ prop: Int) -> AAScrollablePlotArea {
        minHeight = prop
        return self
    }
    
    @discardableResult
    public func minWidth(_ prop: Int) -> AAScrollablePlotArea {
        minWidth = prop
        return self
    }
    
    @discardableResult
    public func opacity(_ prop: Float) -> AAScrollablePlotArea {
        opacity = prop
        return self
    }
    
    @discardableResult
    public func scrollPositionX(_ prop: Float) -> AAScrollablePlotArea {
        scrollPositionX = prop
        return self
    }
    
    @discardableResult
    public func scrollPositionY(_ prop: Float) -> AAScrollablePlotArea {
        scrollPositionY = prop
        return self
    }
    
    public override init() {
        
    }
}
