//
//  AAPlotOptions.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/8/31.
//  Copyright © 2019 An An. All rights reserved.
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
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

import UIKit

public class AAPlotOptions: AAObject {
    public var column: AAColumn?
    public var bar: AABar?
    public var line: AALine?
    public var spline: AASpline?
    public var area: AAArea?
    public var areaspline: AAAreaspline?
    public var pie: AAPie?
    public var columnrange: AAColumnrange?
    public var arearange: AAArearange?
    public var series: AASeries?
    
    @discardableResult
    public func column(_ prop: AAColumn) -> AAPlotOptions {
        column = prop
        return self
    }
    
    @discardableResult
    public func line(_ prop: AALine) -> AAPlotOptions {
        line = prop
        return self
    }
    
    @discardableResult
    public func pie(_ prop: AAPie) -> AAPlotOptions {
        pie = prop
        return self
    }
    
    @discardableResult
    public func bar(_ prop: AABar) -> AAPlotOptions {
        bar = prop
        return self
    }
    
    @discardableResult
    public func spline(_ prop: AASpline) -> AAPlotOptions {
        spline = prop
        return self
    }
    
    @discardableResult
    public func area(_ prop: AAArea) -> AAPlotOptions {
        area = prop
        return self
    }
    
    @discardableResult
    public func areaspline(_ prop: AAAreaspline) -> AAPlotOptions {
        areaspline = prop
        return self
    }
    
    @discardableResult
    public func columnrange(_ prop: AAColumnrange) -> AAPlotOptions {
        columnrange = prop
        return self
    }
    
    @discardableResult
    public func arearange(_ prop: AAArearange) -> AAPlotOptions {
        arearange = prop
        return self
    }
    
    @discardableResult
    public func series(_ prop: AASeries) -> AAPlotOptions {
        series = prop
        return self
    }
    
    public override init() {
        
    }
    
}

public class AAColumn: AAObject {
    public var name: String?
    public var data: [Any]?
    public var color: String?
    public var grouping: Bool?//Whether to group non-stacked columns or to let them render independent of each other. Non-grouped columns will be laid out individually and overlap each other. 默认是：true.
    public var pointPadding: Float?//Padding between each column or bar, in x axis units. 默认是：0.1.
    public var pointPlacement: Float?//Padding between each column or bar, in x axis units. 默认是：0.1.
    public var groupPadding: Float?//Padding between each value groups, in x axis units. 默认是：0.2.
    public var borderWidth: Float?
    public var colorByPoint: Bool?//对每个不同的点设置颜色(当图表类型为 AAColumn 时,设置为 AAColumn 对象的属性,当图表类型为 bar 时,应该设置为 bar 对象的属性才有效)
    public var dataLabels: AADataLabels?
    public var stacking: String?
    public var borderRadius: Float?
    public var yAxis: Float?
    
    @discardableResult
    public func name(_ prop: String) -> AAColumn {
        name = prop
        return self
    }
    
    @discardableResult
    public func data(_ prop: [Any]) -> AAColumn {
        data = prop
        return self
    }
    
    @discardableResult
    public func color(_ prop: String) -> AAColumn {
        color = prop
        return self
    }
    
    @discardableResult
    public func grouping(_ prop: Bool?) -> AAColumn {
        grouping = prop
        return self
    }
    
    @discardableResult
    public func pointPadding(_ prop: Float?) -> AAColumn {
        pointPadding = prop
        return self
    }
    
    @discardableResult
    public func pointPlacement(_ prop: Float?) -> AAColumn {
        pointPlacement = prop
        return self
    }
    
    @discardableResult
    public func groupPadding(_ prop: Float?) -> AAColumn {
        groupPadding = prop
        return self
    }
    
    @discardableResult
    public func borderWidth(_ prop: Float?) -> AAColumn {
        borderWidth = prop
        return self
    }
    
    @discardableResult
    public func colorByPoint(_ prop: Bool?) -> AAColumn {
        colorByPoint = prop
        return self
    }
    
    @discardableResult
    public func dataLabels(_ prop: AADataLabels) -> AAColumn {
        dataLabels = prop
        return self
    }
    
    @discardableResult
    public func stacking(_ prop: String) -> AAColumn {
        stacking = prop
        return self
    }
    
    @discardableResult
    public func borderRadius(_ prop: Float?) -> AAColumn {
        borderRadius = prop
        return self
    }
    
    @discardableResult
    public func yAxis(_ prop: Float?) -> AAColumn {
        yAxis = prop
        return self
    }
    
    public override init() {
        
    }
    
}

public class AABar: AAObject {
    public var name: String?
    public var data: [Any]?
    public var color: String?
    public var grouping: Bool?//Whether to group non-stacked columns or to let them render independent of each other. Non-grouped columns will be laid out individually and overlap each other. 默认是：true.
    public var pointPadding: Float?//Padding between each column or bar, in x axis units. 默认是：0.1.
    public var pointPlacement: Float?//Padding between each column or bar, in x axis units. 默认是：0.1.
    public var groupPadding: Float?//Padding between each value groups, in x axis units. 默认是：0.2.
    public var borderWidth: Float?
    public var colorByPoint: Bool?//对每个不同的点设置颜色(当图表类型为 AABar 时,设置为 AABar 对象的属性,当图表类型为 bar 时,应该设置为 bar 对象的属性才有效)
    public var dataLabels: AADataLabels?
    public var stacking: String?
    public var borderRadius: Float?
    public var yAxis: Float?
    
    @discardableResult
    public func name(_ prop: String) -> AABar {
        name = prop
        return self
    }
    
    @discardableResult
    public func data(_ prop: [Any]) -> AABar {
        data = prop
        return self
    }
    
    @discardableResult
    public func color(_ prop: String) -> AABar {
        color = prop
        return self
    }
    
    @discardableResult
    public func grouping(_ prop: Bool?) -> AABar {
        grouping = prop
        return self
    }
    
    @discardableResult
    public func pointPadding(_ prop: Float?) -> AABar {
        pointPadding = prop
        return self
    }
    
    @discardableResult
    public func pointPlacement(_ prop: Float?) -> AABar {
        pointPlacement = prop
        return self
    }
    
    @discardableResult
    public func groupPadding(_ prop: Float?) -> AABar {
        groupPadding = prop
        return self
    }
    
    @discardableResult
    public func borderWidth(_ prop: Float?) -> AABar {
        borderWidth = prop
        return self
    }
    
    @discardableResult
    public func colorByPoint(_ prop: Bool?) -> AABar {
        colorByPoint = prop
        return self
    }
    
    @discardableResult
    public func dataLabels(_ prop: AADataLabels) -> AABar {
        dataLabels = prop
        return self
    }
    
    @discardableResult
    public func stacking(_ prop: String) -> AABar {
        stacking = prop
        return self
    }
    
    @discardableResult
    public func borderRadius(_ prop: Float?) -> AABar {
        borderRadius = prop
        return self
    }
    
    @discardableResult
    public func yAxis(_ prop: Float?) -> AABar {
        yAxis = prop
        return self
    }
    
    public override init() {
        
    }
}


public class AALine: AAObject {
    public var dataLabels: AADataLabels?
    
    @discardableResult
    public func dataLabels(_ prop: AADataLabels) -> AALine {
        dataLabels = prop
        return self
    }
    
    public override init() {
        
    }
}

public class AASpline: AAObject {
    public var dataLabels: AADataLabels?
    
    @discardableResult
    public func dataLabels(_ prop: AADataLabels) -> AASpline {
        dataLabels = prop
        return self
    }
    
    public override init() {
        
    }
}

public class AAArea: AAObject {
    public var dataLabels: AADataLabels?
    
    @discardableResult
    public func dataLabels(_ prop: AADataLabels) -> AAArea {
        dataLabels = prop
        return self
    }
    
    public override init() {
        
    }
}

public class AAAreaspline: AAObject {
    public var dataLabels: AADataLabels?
    
    @discardableResult
    public func dataLabels(_ prop: AADataLabels) -> AAAreaspline {
        dataLabels = prop
        return self
    }
    
    public override init() {
        
    }
}

public class AAPie: AAObject {
    public var dataLabels:AADataLabels?
    public var size: Float?
    public var allowPointSelect: Bool?
    public var cursor: String?
    public var showInLegend: Bool?
    public var startAngle: Float?
    public var endAngle: Float?
    public var depth: Float?
    public var center: [Int]?
    
    @discardableResult
    public func dataLabels(_ prop: AADataLabels) -> AAPie {
        dataLabels = prop
        return self
    }
    
    @discardableResult
    public func size(_ prop: Float?) -> AAPie {
        size = prop
        return self
    }
    
    @discardableResult
    public func allowPointSelect(_ prop: Bool?) -> AAPie {
        allowPointSelect = prop
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
    
    public override init() {
        
    }
    
}

public class AAColumnrange: AAObject {
    public var borderRadius: Float?//The color of the border surrounding each column or bar
    public var borderWidth: Float?//The corner radius of the border surrounding each column or bar. default：0
    public var dataLabels: AADataLabels?
    
    @discardableResult
    public func borderRadius(_ prop: Float) -> AAColumnrange {
        borderRadius = prop
        return self
    }
    
    @discardableResult
    public func borderWidth(_ prop: Float) -> AAColumnrange {
        borderWidth = prop
        return self
    }
    
    @discardableResult
    public func dataLabels(_ prop: AADataLabels) -> AAColumnrange {
        dataLabels = prop
        return self
    }
    
    public override init() {
        
    }
}

public class AAArearange: AAObject {
    public var dataLabels: AADataLabels?
    
    @discardableResult
    public func dataLabels(_ prop: AADataLabels) -> AAArearange {
        dataLabels = prop
        return self
    }
    
    public override init() {
        
    }
}




