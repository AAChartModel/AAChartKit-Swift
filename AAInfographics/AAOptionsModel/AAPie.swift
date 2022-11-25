//
// Created by AnAn on 2022/11/25.
// Copyright (c) 2022 An An. All rights reserved.
//

import Foundation

public class AAPie: AASeries {
    public var type: String?
    public var data: [Any]?
//    public var dataLabels:AADataLabels?
    public var size: Float?
//    public var allowPointSelect: Bool?
    public var cursor: String?
    public var showInLegend: Bool?
    public var startAngle: Float?
    public var endAngle: Float?
    public var depth: Float?
    public var center: [Any]?
    
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
    
//    @discardableResult
//    public func dataLabels(_ prop: AADataLabels) -> AAPie {
//        dataLabels = prop
//        return self
//    }
    
    @discardableResult
    public func size(_ prop: Float?) -> AAPie {
        size = prop
        return self
    }
    
//    @discardableResult
//    public func allowPointSelect(_ prop: Bool?) -> AAPie {
//        allowPointSelect = prop
//        return self
//    }
    
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
    
    public override init() {
        
    }
    
}

