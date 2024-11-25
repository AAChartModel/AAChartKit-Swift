//
// Created by AnAn on 2022/11/25.
// Copyright (c) 2022 An An. All rights reserved.
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


/// https://api.highcharts.com/highcharts/plotOptions.pie
public class AAPie: AASeries {
    public var name: String?
    public var type: String?
    public var data: [Any]?
    public var size: Any?
    public var innerSize: Any?
    public var cursor: String?
    public var showInLegend: Bool?
    public var startAngle: Float?
    public var endAngle: Float?
    public var depth: Float?
    public var center: [Any]?
    public var borderRadius: Any?
    
    @discardableResult
    public func name(_ prop: String) -> AAPie {
        name = prop
        return self
    }

    @discardableResult
    public func type(_ prop: AAChartType) -> AAPie {
        type = prop.rawValue
        return self
    }
    
    @discardableResult
    public func data(_ prop: [Any]) -> AAPie {
        data = prop
        return self
    }
        
    @discardableResult
    public func size(_ prop: Float?) -> AAPie {
        size = prop
        return self
    }
    @discardableResult
    public func size(_ prop: String?) -> AAPie {
        size = prop
        return self
    }
    
    @discardableResult
    public func innerSize(_ prop: Float?) -> AAPie {
        innerSize = prop
        return self
    }
    @discardableResult
    public func innerSize(_ prop: String?) -> AAPie {
        innerSize = prop
        return self
    }
    
    @discardableResult
    public func cursor(_ prop: String) -> AAPie {
        cursor = prop
        return self
    }
    
    @discardableResult
    public func showInLegend(_ prop: Bool?) -> AAPie {
        showInLegend = prop
        return self
    }
    
    @discardableResult
    public func startAngle(_ prop: Float?) -> AAPie {
        startAngle = prop
        return self
    }
    
    @discardableResult
    public func endAngle(_ prop: Float?) -> AAPie {
        endAngle = prop
        return self
    }
    
    @discardableResult
    public func depth(_ prop: Float?) -> AAPie {
        depth = prop
        return self
    }
    
    @discardableResult
    public func center(_ prop: [Int]?) -> AAPie {
        center = prop
        return self
    }
    
    @discardableResult
    public func center(_ prop: [String]?) -> AAPie {
        center = prop
        return self
    }
    
    @discardableResult
    public func borderRadius(_ prop: Float?) -> AAPie {
        borderRadius = prop
        return self
    }
    
    @discardableResult
    public func borderRadius(_ prop: String?) -> AAPie {
        borderRadius = prop
        return self
    }
    
    @discardableResult
    public func borderRadius(_ prop: Any?) -> AAPie {
        borderRadius = prop
        return self
    }
    
    public override init() {
        
    }
}

