//
//  AAStates.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2020/1/21.
//  Copyright © 2020 An An. All rights reserved.
//

import Foundation

class AAStates: AAObject {
    var hover: AAHover?
    var select: AASelect?
    
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

class AAHover: AAObject {
    var borderColor: String?
    var brightness: Float?
    var color: String?
    var halo: AAHalo?
    
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

class AASelect: AAObject {
    var borderColor: String?
    var color: String?
    var halo: AAHalo?
    
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

class AAHalo: AAObject {
    var attributes: [String: AnyObject]?
    var opacity: Float?
    var size: Float?
    
    @discardableResult
    public func attributes(_ prop: [String: AnyObject]) -> AAHalo {
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
