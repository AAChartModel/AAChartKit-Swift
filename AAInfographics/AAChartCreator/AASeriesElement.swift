//
//  AASeriesElement.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2018/4/10.
//  Copyright © 2018年 An An. All rights reserved.
//

class AASeriesElement: AASerializable {
    private var type:String?
    private var name:String?
    private var data:Array<Any>?
    private var lineWidth:Float?
    private var dashStyle:String?
    private var dataLabels:Dictionary<String,Any>?
    private var step:Any?
    
    func type(_ prop:String) -> AASeriesElement {
        self.type = prop
        return self;
    }
    
    func name(_ prop:String) -> AASeriesElement {
        self.name = prop
        return self
    }
    
    func data(_ prop:Array<Any>) -> AASeriesElement {
        self.data = prop
        return self
    }
    
    func lineWidth(_ prop:Float) -> AASeriesElement {
        self.lineWidth = prop
        return self
    }
    
    func dashStyle(_ prop:String) -> AASeriesElement {
        self.dashStyle = prop;
        return self
    }
    
    func dataLabels(_ prop:Dictionary<String,Any>) -> AASeriesElement {
        self.dataLabels = prop
        return self
    }
    
    func step(_ prop:Any) -> AASeriesElement {
        self.step = prop
        return self
    }

}
