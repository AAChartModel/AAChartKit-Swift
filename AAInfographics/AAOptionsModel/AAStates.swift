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
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

import Foundation

public class AAStates: AAObject {
    public var hover: AAHover?
    public var select: AASelect?
    
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
}

public class AAHover: AAObject {
    public var enabled: Bool?
    public var borderColor: String?
    public var brightness: Float?
    public var color: String?
    public var halo: AAHalo?
    
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
}

public class AASelect: AAObject {
    public var borderColor: String?
    public var color: String?
    public var halo: AAHalo?
    
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
}

public class AAHalo: AAObject {
    public var attributes: [String: Any]?
    public var opacity: Float?
    public var size: Float?
    
    @discardableResult
    public func attributes(_ prop: [String: Any]) -> AAHalo {
        attributes = prop
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
}
