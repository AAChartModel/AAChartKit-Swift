//
//  AAPlotLinesElement.swift
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

public class AAPlotLinesElement: AAObject {
    private var color: Any?
    private var dashStyle: String?
    private var width: Float?
    private var value: Float?
    private var zIndex: Int?
    private var label: [String: AnyObject]?
    
    @discardableResult
    public func color(_ prop: Any) -> AAPlotLinesElement {
        color = prop
        return self
    }
    
    @discardableResult
    public func dashStyle(_ prop: AALineDashStyleType) -> AAPlotLinesElement {
        dashStyle = prop.rawValue
        return self
    }
    
    @discardableResult
    public func width(_ prop: Float) -> AAPlotLinesElement {
        width = prop
        return self
    }
    
    @discardableResult
    public func value(_ prop: Float) -> AAPlotLinesElement {
        value = prop
        return self
    }
    
    @discardableResult
    public func zIndex(_ prop: Int) -> AAPlotLinesElement {
        zIndex = prop
        return self
    }
    
    @discardableResult
    public func label(_ prop: AALabel) -> AAPlotLinesElement {
        label = prop.toDic()!
        return self
    }
    
    public  override init() {
    }

}


