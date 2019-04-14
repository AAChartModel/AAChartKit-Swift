//
//  AAPlotBandsElement.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/4/14.
//  Copyright © 2019 An An. All rights reserved.
//

import UIKit

class AAPlotBandsElement: AASerializable {
    private var from: Any?
    private var to: Any?
    private var color: Any?
    
    @discardableResult
    public func from(_ prop: Any) -> AAPlotBandsElement {
        from = prop
        return self
    }
    
    @discardableResult
    public func to(_ prop: Any) -> AAPlotBandsElement {
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
