//
//  AAButtonTheme.swift
//  AAInfographics
//
//  Created by AnAn on 2024/11/5.
//  Copyright © 2024 An An. All rights reserved.
//

/**
 buttonTheme:{
 fill:#f7f7f7
 padding:8
 r:2
 states:{
 disabled:{
 style:{
 color:#cccccc
 }
 }
 hover:{
 fill:#e6e6e6
 }
 select:{
 fill:#e6e9ff
 style:{
 color:#000000
 fontWeight:bold
 }
 }
 }
 stroke:#cccccc
 stroke-width:1
 style:{
 color:#333333
 cursor:pointer
 fontSize:0.8em
 fontWeight:normal
 }
 }
 */
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


//https://api.highcharts.com/highcharts/global.buttonTheme
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
    
    public override init() {

    }
}
