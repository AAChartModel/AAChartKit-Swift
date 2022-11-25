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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

import Foundation

public class AAPlotOptions: AAObject {
    public var series: AASeries?
    public var column: AAColumn?
    public var bar: AABar?
    public var line: AALine?
    public var spline: AASpline?
    public var area: AAArea?
    public var areaspline: AAAreaspline?
    public var pie: AAPie?
    public var bubble: AABubble?
    public var columnrange: AAColumnrange?
    public var arearange: AAArearange?
    public var boxplot: AABoxplot?
    public var scatter: AAScatter?

    @discardableResult
    public func series(_ prop: AASeries) -> AAPlotOptions {
        series = prop
        return self
    }
    
    @discardableResult
    public func column(_ prop: AAColumn) -> AAPlotOptions {
        column = prop
        return self
    }
    
    @discardableResult
    public func bar(_ prop: AABar) -> AAPlotOptions {
        bar = prop
        return self
    }
    
    @discardableResult
    public func line(_ prop: AALine) -> AAPlotOptions {
        line = prop
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
    public func pie(_ prop: AAPie) -> AAPlotOptions {
        pie = prop
        return self
    }
    
    @discardableResult
    public func bubble(_ prop: AABubble) -> AAPlotOptions {
        bubble = prop
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
    public func boxplot(_ prop: AABoxplot) -> AAPlotOptions {
        boxplot = prop
        return self
    }

    @discardableResult
    public func scatter(_ prop: AAScatter) -> AAPlotOptions {
        scatter = prop
        return self
    }
    
    public override init() {
        
    }
    
}

public class AAColumn: AASeries {
    public var name: String?
    public var data: [Any]?
    public var color: String?
    public var grouping: Bool?//Whether to group non-stacked columns or to let them render independent of each other. Non-grouped columns will be laid out individually and overlap each other. default：true.
    public var yAxis: Float?
    
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

    
    public override init() {
        
    }
    
}

public class AABar: AAColumn {
    
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

public class AAArea: AASeries {
    public var fillColor: String?
    public var fillOpacity: Float?
    public var negativeFillColor: String?
    public var trackByArea: Bool?
    public var lineColor: String?
    public var lineWidth: Float?

    @discardableResult
    public func fillColor(_ prop: String) -> Self {
        fillColor = prop
        return self
    }

    @discardableResult
    public func fillOpacity(_ prop: Float) -> Self {
        fillOpacity = prop
        return self
    }

    @discardableResult
    public func negativeFillColor(_ prop: String) -> Self {
        negativeFillColor = prop
        return self
    }

    @discardableResult
    public func trackByArea(_ prop: Bool) -> Self {
        trackByArea = prop
        return self
    }

    @discardableResult
    public func lineColor(_ prop: String) -> Self {
        lineColor = prop
        return self
    }

    @discardableResult
    public func lineWidth(_ prop: Float) -> Self {
        lineWidth = prop
        return self
    }

    public override init() {
        
    }
}

public class AAAreaspline: AAArea {
    
    public override init() {
        
    }
}

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

public class AABubble: AAObject {
    public var minSize: Any? // (String | Number)
    public var maxSize: Any? // (String | Number)
    public var zMin: Float?
    public var zMax: Float?
    public var dataLabels:AADataLabels?
    
    @discardableResult
    public func minSize(_ prop: Any?) -> AABubble {
        minSize = prop
        return self
    }
    
    @discardableResult
    public func maxSize(_ prop: Any?) -> AABubble {
        maxSize = prop
        return self
    }
    
    @discardableResult
    public func zMin(_ prop: Float?) -> AABubble {
        zMin = prop
        return self
    }
    
    @discardableResult
    public func zMax(_ prop: Float?) -> AABubble {
        zMax = prop
        return self
    }
    
    @discardableResult
    public func dataLabels(_ prop: AADataLabels?) -> AABubble {
        dataLabels = prop
        return self
    }
    
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




