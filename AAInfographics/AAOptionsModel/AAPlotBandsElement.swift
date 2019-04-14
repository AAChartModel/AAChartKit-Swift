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
    
    public  init() {
    }   

}
