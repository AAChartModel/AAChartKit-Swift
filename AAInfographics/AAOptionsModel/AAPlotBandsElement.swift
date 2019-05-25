//
//  AAPlotBandsElement.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/4/14.
//  Copyright © 2019 An An. All rights reserved.
//

import UIKit

class AAPlotBandsElement: AASerializable {
    private var from: Float?
    private var to: Float?
    private var color: Any?
    private var borderColor: String?
    private var borderWidth: Float?
    private var className: String?
    private var label: AALabel?
    private var index: Int?
    
    @discardableResult
    public func from(_ prop: Float) -> AAPlotBandsElement {
        from = prop
        return self
    }
    
    @discardableResult
    public func to(_ prop: Float) -> AAPlotBandsElement {
        to = prop
        return self
    }
    
    @discardableResult
    public func color(_ prop: Any) -> AAPlotBandsElement {
        color = prop
        return self
    }
    
    @discardableResult
    public func borderColor(_ prop: String) -> AAPlotBandsElement {
        borderColor = prop
        return self
    }
    
    @discardableResult
    public func borderWidth(_ prop: Float) -> AAPlotBandsElement {
        borderWidth = prop
        return self
    }
    
    @discardableResult
    public func className(_ prop: String) -> AAPlotBandsElement {
        className = prop
        return self
    }
    
    @discardableResult
    public func label(_ prop: AALabel) -> AAPlotBandsElement {
        label = prop
        return self
    }
    
    @discardableResult
    public func index(_ prop: Int) -> AAPlotBandsElement {
        index = prop
        return self
    }
    
    public  init() {
    }   

}
