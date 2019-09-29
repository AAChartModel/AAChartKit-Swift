//
//  AAPlotBandsElement.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/4/14.
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

public class AAPlotBandsElement: AAObject {
    private var from: Float?
    private var to: Float?
    private var color: Any?
    private var borderColor: String?
    private var borderWidth: Float?
    private var className: String?
    private var label: AALabel?
    private var zIndex: Int?
    private var outerRadius: String?
    private var thickness: String?
    
    
    @discardableResult
    public func from(_ prop: Float) -> AAPlotBandsElement {
        from = prop
        return self
    }
    
    @discardableResult
    public func to(_ prop: Float) -> AAPlotBandsElement {
        to = prop
        return self
    }
    
    @discardableResult
    public func color(_ prop: Any) -> AAPlotBandsElement {
        color = prop
        return self
    }
    
    @discardableResult
    public func borderColor(_ prop: String) -> AAPlotBandsElement {
        borderColor = prop
        return self
    }
    
    @discardableResult
    public func borderWidth(_ prop: Float) -> AAPlotBandsElement {
        borderWidth = prop
        return self
    }
    
    @discardableResult
    public func className(_ prop: String) -> AAPlotBandsElement {
        className = prop
        return self
    }
    
    @discardableResult
    public func label(_ prop: AALabel) -> AAPlotBandsElement {
        label = prop
        return self
    }
    
    @discardableResult
    public func zIndex(_ prop: Int) -> AAPlotBandsElement {
        zIndex = prop
        return self
    }
    
    @discardableResult
    public func outerRadius(_ prop: String) -> AAPlotBandsElement {
        outerRadius = prop
        return self
    }
    
    @discardableResult
    public func thickness(_ prop: String) -> AAPlotBandsElement {
        thickness = prop
        return self
    }
    
    public override init() {
    }   

}
