//
//  AAScatter.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2022/9/8.
//  Copyright © 2022 An An. All rights reserved.
//

import Foundation

public class AAScatter: AAObject {
    
    //        AAPropStatementAndPropSetFuncStatement(copy,   AAScatter, NSNumber *, lineWidth)
    //        AAPropStatementAndPropSetFuncStatement(copy,   AAScatter, NSString *, lineColor)
    //        AAPropStatementAndPropSetFuncStatement(copy,   AAScatter, NSString *, dashStyle)
    //        AAPropStatementAndPropSetFuncStatement(copy,   AAScatter, id        , enableMouseTracking)
    //        AAPropStatementAndPropSetFuncStatement(copy,   AAScatter, NSString *, linkedTo)
    //        AAPropStatementAndPropSetFuncStatement(strong, AAScatter, AAStates *, states)
    //        AAPropStatementAndPropSetFuncStatement(strong, AAScatter, AAMarker *, marker)
    
    public var lineWidth: Float?
    public var lineColor: String?
    public var dashStyle: String?
    public var enableMouseTracking: Bool?
    public var linkedTo: String?
    public var states: AAStates?
    public var marker: AAMarker?
    
    @discardableResult
    public func lineWidth(_ prop: Float?) -> AAScatter {
        lineWidth = prop
        return self
    }
    
    @discardableResult
    public func lineColor(_ prop: String?) -> AAScatter {
        lineColor = prop
        return self
    }
    
    @discardableResult
    public func dashStyle(_ prop: AAChartLineDashStyleType?) -> AAScatter {
        dashStyle = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func enableMouseTracking(_ prop: Bool?) -> AAScatter {
        enableMouseTracking = prop
        return self
    }
    
    @discardableResult
    public func linkedTo(_ prop: String?) -> AAScatter {
        linkedTo = prop
        return self
    }
    
    @discardableResult
    public func states(_ prop: AAStates?) -> AAScatter {
        states = prop
        return self
    }
    
    @discardableResult
    public func marker(_ prop: AAMarker?) -> AAScatter {
        marker = prop
        return self
    }

    public override init() {

    }
    
    
}
