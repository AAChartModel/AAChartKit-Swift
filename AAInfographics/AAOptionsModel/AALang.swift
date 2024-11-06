//
//  AALang.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2020/7/17.
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


/// https://api.highcharts.com/highcharts/lang
public class AALang: AAObject {
    public var noData: String?
    public var numericSymbolMagnitude: Int?
    public var numericSymbols: [String]?
    public var resetZoom: String?
    public var thousandsSep: String?
    
    @discardableResult
    public func noData(_ prop: String?) -> AALang {
        noData = prop
        return self
    }
    
    @discardableResult
    public func numericSymbolMagnitude(_ prop: Int?) -> AALang {
        numericSymbolMagnitude = prop
        return self
    }
    
    @discardableResult
    public func numericSymbols(_ prop: [String]?) -> AALang {
        numericSymbols = prop
        return self
    }
    
    @discardableResult
    public func resetZoom(_ prop: String?) -> AALang {
        resetZoom = prop
        return self
    }
    
    @discardableResult
    public func thousandsSep(_ prop: String?) -> AALang {
        thousandsSep = prop
        return self
    }
    
    public override init() {
        
    }
}
