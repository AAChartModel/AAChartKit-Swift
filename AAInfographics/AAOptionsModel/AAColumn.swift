//
//  AAColumn.swift
//  AAInfographics
//
//  Created by AnAn on 2022/11/25.
//  Copyright © 2022 An An. All rights reserved.
//

import Foundation

public class AAColumn: AASeries {
    public var name: String?
    public var data: [Any]?
    public var color: String?
    public var grouping: Bool?//Whether to group non-stacked columns or to let them render independent of each other. Non-grouped columns will be laid out individually and overlap each other. default：true.
    public var yAxis: Float?
    public var borderRadius: Float?        //The corner radius of the border surrounding each column or bar.
    public var borderRadiusTopLeft: Any?
    public var borderRadiusTopRight: Any?
    public var borderRadiusBottomLeft: Any?
    public var borderRadiusBottomRight: Any?
    
    @discardableResult
    public func name(_ prop: String) -> Self {
        name = prop
        return self
    }
    
    @discardableResult
    public func data(_ prop: [Any]) -> Self {
        data = prop
        return self
    }
    
    @discardableResult
    public func color(_ prop: String) -> Self {
        color = prop
        return self
    }
    
    @discardableResult
    public func grouping(_ prop: Bool?) -> Self {
        grouping = prop
        return self
    }

    @discardableResult
    public func yAxis(_ prop: Float?) -> Self {
        yAxis = prop
        return self
    }
    
    @discardableResult
    public func borderRadius(_ prop: Float?) -> Self {
        borderRadius = prop
        return self
    }
    
    @discardableResult
    public func borderRadiusTopLeft(_ prop: Any?) -> Self {
        borderRadiusTopLeft = prop
        return self
    }
     
    @discardableResult
    public func borderRadiusTopRight(_ prop: Any?) -> Self {
        borderRadiusTopRight = prop
        return self
    }
     
    @discardableResult
    public func borderRadiusBottomLeft(_ prop: Any?) -> Self {
        borderRadiusBottomLeft = prop
        return self
    }
     
    @discardableResult
    public func borderRadiusBottomRight(_ prop: Any?) -> Self {
        borderRadiusBottomRight = prop
        return self
    }

    
    public override init() {
        
    }
    
}

public class AABar: AAColumn {
    
    public override init() {
        
    }
}

public class AAColumnrange: AAObject {
    public var borderRadius: Float?//The color of the border surrounding each column or bar
    public var borderWidth: Float?//The corner radius of the border surrounding each column or bar. default：0
    public var dataLabels: AADataLabels?
    public var groupPadding: Float?//Padding between each value groups, in x axis units. default：0.2.
    public var grouping: Bool?
    public var pointPadding: Float?//Padding between each column or bar, in x axis units. default：0.1.
    public var pointPlacement: Float?//Padding between each column or bar, in x axis units. default：0.1.
    
    @discardableResult
    public func borderRadius(_ prop: Float?) -> AAColumnrange {
        borderRadius = prop
        return self
    }
    
    @discardableResult
    public func borderWidth(_ prop: Float?) -> AAColumnrange {
        borderWidth = prop
        return self
    }
    
    @discardableResult
    public func dataLabels(_ prop: AADataLabels?) -> AAColumnrange {
        dataLabels = prop
        return self
    }
    
    @discardableResult
    public func groupPadding(_ prop: Float?) -> AAColumnrange {
        groupPadding = prop
        return self
    }
    
    @discardableResult
    public func grouping(_ prop: Bool?) -> AAColumnrange {
        grouping = prop
        return self
    }
        
    @discardableResult
    public func pointPadding(_ prop: Float?) -> AAColumnrange {
        pointPadding = prop
        return self
    }
    
    @discardableResult
    public func pointPlacement(_ prop: Float?) -> AAColumnrange {
        pointPlacement = prop
        return self
    }
    
    public override init() {
        
    }
}
