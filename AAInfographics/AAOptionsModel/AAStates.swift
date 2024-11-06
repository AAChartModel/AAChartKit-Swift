//
//  AAStates.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2020/1/21.
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


/// https://api.highcharts.com/highcharts/plotOptions.series.states
/// https://api.highcharts.com/highcharts/plotOptions.line.states
/// https://api.highcharts.com/highcharts/series.line.states
public class AAStates: AAObject {
    public var hover: AAHover?
    public var select: AASelect?
    public var inactive: AAInactive?
    
    @discardableResult
    public func hover(_ prop: AAHover) -> AAStates {
        hover = prop
        return self
    }
    
    @discardableResult
    public func select(_ prop: AASelect) -> AAStates {
        select = prop
        return self
    }
    
    @discardableResult
    public func inactive(_ prop: AAInactive) -> AAStates {
        inactive = prop
        return self
    }
    
    public override init() {
        
    }
}


public class AAHover: AAObject {
    public var enabled: Bool?
    public var borderColor: String?
    public var brightness: Float?
    public var color: String?
    public var halo: AAHalo?
    public var lineWidth: Float?
    public var lineWidthPlus: Float?

    @discardableResult
    public func enabled(_ prop: Bool) -> AAHover {
        enabled = prop
        return self
    }
    
    @discardableResult
    public func borderColor(_ prop: String) -> AAHover {
        borderColor = prop
        return self
    }
    
    @discardableResult
    public func brightness(_ prop: Float) -> AAHover {
        brightness = prop
        return self
    }
    
    @discardableResult
    public func color(_ prop: String) -> AAHover {
        color = prop
        return self
    }
    
    @discardableResult
    public func halo(_ prop: AAHalo) -> AAHover {
        halo = prop
        return self
    }
    
    @discardableResult
    public func lineWidth(_ prop: Float) -> AAHover {
        lineWidth = prop
        return self
    }
    
    @discardableResult
    public func lineWidthPlus(_ prop: Float) -> AAHover {
        lineWidthPlus = prop
        return self
    }
    
    public override init() {
        
    }
}


public class AASelect: AAObject {
    public var enabled: Bool?
    public var borderColor: String?
    public var color: String?
    public var halo: AAHalo?
    
    
    @discardableResult
    public func enabled(_ prop: Bool) -> AASelect {
        enabled = prop
        return self
    }
    
    @discardableResult
    public func borderColor(_ prop: String) -> AASelect {
        borderColor = prop
        return self
    }
    
    @discardableResult
    public func color(_ prop: String) -> AASelect {
        color = prop
        return self
    }
    
    @discardableResult
    public func halo(_ prop: AAHalo) -> AASelect {
        halo = prop
        return self
    }
    
    public override init() {
        
    }
}


public class AAHalo: AAObject {
    public var attributes: [String: Any]?
    public var opacity: Float?
    public var size: Float?
    
    @discardableResult
    public func attributes(_ prop: AASVGAttributes) -> AAHalo {
        attributes = prop.toDictionaryProp()
        return self
    }
    
    @discardableResult
    public func opacity(_ prop: Float) -> AAHalo {
        opacity = prop
        return self
    }
    
    @discardableResult
    public func size(_ prop: Float) -> AAHalo {
        size = prop
        return self
    }
    
    public override init() {
        
    }
}


public class AAInactive: AAObject {
    public var enabled: Bool?
    public var opacity: Float?
    
    @discardableResult
    public func enabled(_ prop: Bool) -> AAInactive {
        enabled = prop
        return self
    }
    
    @discardableResult
    public func opacity(_ prop: Float) -> AAInactive {
        opacity = prop
        return self
    }
    
    public override init() {
        
    }
}

/// https://api.highcharts.com/class-reference/Highcharts.SVGAttributes
public class AASVGAttributes: AAObject {
    public var fill: String?
    public var stroke: String?
    public var strokeWidth: Float?
    
    @discardableResult
    public func fill(_ prop: String?) -> AASVGAttributes {
        fill = prop
        return self
    }
    
    @discardableResult
    public func stroke(_ prop: String?) -> AASVGAttributes {
        stroke = prop
        return self
    }
    
    @discardableResult
    public func strokeWidth(_ prop: Float?) -> AASVGAttributes {
        strokeWidth = prop
        return self
    }
    
    public func toDictionaryProp() -> [String: Any]? {
        var dic = [String: Any]()
        if let fill = fill {
            dic["fill"] = fill
        }
        if let stroke = stroke {
            dic["stroke"] = stroke
        }
        if let strokeWidth = strokeWidth {
            dic["stroke-width"] = strokeWidth
        }
        return dic
    }
    
    public override init() {
        
    }
}
