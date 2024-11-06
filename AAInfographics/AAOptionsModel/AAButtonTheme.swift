//
//  AAButtonTheme.swift
//  AAInfographics
//
//  Created by AnAn on 2024/11/5.
//  Copyright © 2024 An An. All rights reserved.
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

/// https://api.highcharts.com/highcharts/global.buttonTheme
public class AAButtonTheme: AAObject {
    public var fill: String?
    public var padding: Float?
    public var r: Float?
    public var states: AAButtonThemeStates?
    public var stroke: String?
    public var strokeWidth: Float?
    public var style: AAStyle?

    @discardableResult
    public func fill(_ prop: String?) -> AAButtonTheme {
        fill = prop
        return self
    }
    
    @discardableResult
    public func padding(_ prop: Float?) -> AAButtonTheme {
        padding = prop
        return self
    }
    
    @discardableResult
    public func r(_ prop: Float?) -> AAButtonTheme {
        r = prop
        return self
    }
    
    @discardableResult
    public func states(_ prop: AAButtonThemeStates?) -> AAButtonTheme {
        states = prop
        return self
    }
    
    @discardableResult
    public func stroke(_ prop: String?) -> AAButtonTheme {
        stroke = prop
        return self
    }
    
    @discardableResult
    public func strokeWidth(_ prop: Float?) -> AAButtonTheme {
        strokeWidth = prop
        return self
    }
    
    @discardableResult
    public func style(_ prop: AAStyle?) -> AAButtonTheme {
        style = prop
        return self
    }
    
    public func toDictionaryProp() -> [String: Any]? {
        var dic = [String: Any]()
        if let fill = fill {
            dic["fill"] = fill
        }
        if let padding = padding {
            dic["padding"] = padding
        }
        if let r = r {
            dic["r"] = r
        }
        if let states = states {
            dic["states"] = states.toDic() as Any
        }
        if let stroke = stroke {
            dic["stroke"] = stroke
        }
        if let strokeWidth = strokeWidth {
            dic["stroke-width"] = strokeWidth
        }
        if let style = style {
            dic["style"] = style.toDic() as Any
        }
        return dic
    }
    
    public override init() {

    }
}


public class AAButtonThemeStates: AAObject {
    public var disabled: AAButtonThemeStatesDisabled?
    public var hover: AAButtonThemeStatesHover?
    public var select: AAButtonThemeStatesSelect?
    
    @discardableResult
    public func disabled(_ prop: AAButtonThemeStatesDisabled?) -> AAButtonThemeStates {
        disabled = prop
        return self
    }
    
    @discardableResult
    public func hover(_ prop: AAButtonThemeStatesHover?) -> AAButtonThemeStates {
        hover = prop
        return self
    }
    
    @discardableResult
    public func select(_ prop: AAButtonThemeStatesSelect?) -> AAButtonThemeStates {
        select = prop
        return self
    }
    
    public override init() {

    }
}


public class AAButtonThemeStatesDisabled: AAObject {
    public var style: AAStyle?
    
    @discardableResult
    public func style(_ prop: AAStyle?) -> AAButtonThemeStatesDisabled {
        style = prop
        return self
    }
    
    public override init() {
        
    }
}


public class AAButtonThemeStatesHover: AAObject {
    public var fill: String?
    public var style: AAStyle?
    
    @discardableResult
    public func fill(_ prop: String?) -> AAButtonThemeStatesHover {
        fill = prop
        return self
    }
    
    @discardableResult
    public func style(_ prop: AAStyle?) -> AAButtonThemeStatesHover {
        style = prop
        return self
    }
    
    public override init() {
        
    }
}


public class AAButtonThemeStatesSelect: AAObject {
    public var fill: String?
    public var style: AAStyle?
    
    @discardableResult
    public func fill(_ prop: String?) -> AAButtonThemeStatesSelect {
        fill = prop
        return self
    }
    
    @discardableResult
    public func style(_ prop: AAStyle?) -> AAButtonThemeStatesSelect {
        style = prop
        return self
    }
    
    public override init() {
        
    }
}
