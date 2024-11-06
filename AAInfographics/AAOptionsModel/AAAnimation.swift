//
//  AAAnimation.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/8/31.
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


/// https://api.highcharts.com/highcharts/chart.animation
/// https://api.highcharts.com/highcharts/plotOptions.series.animation
/// https://api.highcharts.com/highcharts/plotOptions.line.animation
/// https://api.highcharts.com/highcharts/series.line.animation
public class AAAnimation: AAObject {
    public var duration: Int?
    public var easing: Int?
    
    @discardableResult
    public func duration(_ prop: Int?) -> AAAnimation {
        duration = prop
        return self
    }
    
    @discardableResult
    public func easing(_ prop: AAChartAnimationType?) -> AAAnimation {
        easing = prop?.rawValue
        return self
    }
    
    public override init() {
        
    }
}
