//
//  AAXAxis.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/6/26.
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

public class AAXAxis: AAObject {
    private var plotBands: [AAPlotBandsElement]?
    private var plotLines: [AAPlotLinesElement]?
    private var categories: [String]?
    private var reversed: Bool?
    private var lineWidth: Float?  //x轴轴线宽度
    private var lineColor: String? //x轴轴线线颜色
    private var linkedTo: Int?
    private var max: Float?  //x轴最大值
    private var min: Float? //x轴最小值（设置为0就不会有负数）
    private var tickColor: String? //x轴轴线下方刻度线颜色
    private var gridLineWidth: Float?  //x轴网格线宽度
    private var gridLineColor: String? //x轴网格线颜色
    private var gridLineDashStyle: String? //x轴网格线样式
    private var offset: Float? //x轴垂直偏移
    public var labels: AALabels? //用于设置 x 轴文字相关的
    private var visible: Bool? //用于设置 x 轴以及 x 轴文字是否显示
    private var opposite: Bool? //是否将坐标轴显示在对立面，默认情况下 x 轴是在图表的下方显示，y 轴是在左方，坐标轴显示在对立面后，x 轴是在上方显示，y 轴是在右方显示（即坐标轴会显示在对立面）。该配置一般是用于多坐标轴区分展示，另外在 Highstock 中，y 轴默认是在对立面显示的。 默认是：false.

    private var startOnTick: Bool? //Whether to force the axis to start on a tick. Use this option with the minPadding option to control the axis start. 默认是：false.
    private var tickInterval: Int? //x轴刻度点间隔数(设置每隔几个点显示一个 X轴的内容:
    private var crosshair: AACrosshair?  //准星线样式设置
    private var tickmarkPlacement: String? //本参数只对分类轴有效。 当值为 on 时刻度线将在分类上方显示；当值为 between 时，刻度线将在两个分类中间显示。当 tickInterval 为 1 时，默认是 between，其他情况默认是 on。 默认是：null.
    private var tickWidth: Float? //坐标轴刻度线的宽度，设置为 0 时则不显示刻度线
    private var tickLength: Float?//坐标轴刻度线的长度。 默认是：10.
    private var tickPosition: String? //刻度线相对于轴线的位置，可用的值有 inside 和 outside，分别表示在轴线的内部和外部。 默认是：outside.
    
    @discardableResult
    public func plotBands(_ prop: [AAPlotBandsElement]?) -> AAXAxis {
        plotBands = prop
        return self
    }
    
    @discardableResult
    public func plotLines(_ prop: [AAPlotLinesElement]?) -> AAXAxis {
        plotLines = prop
        return self
    }
    
    @discardableResult
    public func categories(_ prop: [String]?) -> AAXAxis {
        categories = prop
        return self
    }
    
    @discardableResult
    public func reversed(_ prop: Bool?) -> AAXAxis {
        reversed = prop
        return self
    }
    
    @discardableResult
    public func lineWidth(_ prop: Float?) -> AAXAxis {
        lineWidth = prop
        return self
    }
    
    @discardableResult
    public func lineColor(_ prop: String?) -> AAXAxis {
        lineColor = prop
        return self
    }
    
    @discardableResult
    public func linkedTo(_ prop: Int?) -> AAXAxis {
        linkedTo = prop
        return self
    }
    
    @discardableResult
    public func max(_ prop: Float?) -> AAXAxis {
        max = prop
        return self
    }
    
    @discardableResult
    public func min(_ prop: Float?) -> AAXAxis {
        min = prop
        return self
    }
    
    @discardableResult
    public func tickColor(_ prop: String?) -> AAXAxis {
        tickColor = prop
        return self
    }
    
    @discardableResult
    public func gridLineWidth(_ prop: Float?) -> AAXAxis {
        gridLineWidth = prop
        return self
    }
    
    @discardableResult
    public func gridLineColor(_ prop: String?) -> AAXAxis {
        gridLineColor = prop
        return self
    }
    
    @discardableResult
    public func gridLineDashStyle(_ prop: String?) -> AAXAxis {
        gridLineDashStyle = prop
        return self
    }
    
    @discardableResult
    public func offset(_ prop: Float?) -> AAXAxis {
        offset = prop
        return self
    }
    
    @discardableResult
    public func labels(_ prop: AALabels?) -> AAXAxis {
        labels = prop
        return self
    }
    
    @discardableResult
    public func visible(_ prop: Bool?) -> AAXAxis {
        visible = prop
        return self
    }
    
    @discardableResult
    public func opposite(_ prop: Bool?) -> AAXAxis {
        opposite = prop
        return self
    }
    
    @discardableResult
    public func startOnTick(_ prop: Bool?) -> AAXAxis {
        startOnTick = prop
        return self
    }
    
    @discardableResult
    public func tickInterval(_ prop: Int?) -> AAXAxis {
        tickInterval = prop
        return self
    }
    
    @discardableResult
    public func crosshair(_ prop: AACrosshair?) -> AAXAxis {
        crosshair = prop
        return self
    }
    
    @discardableResult
    public func tickmarkPlacement(_ prop: String?) -> AAXAxis {
        tickmarkPlacement = prop
        return self
    }
    
    @discardableResult
    public func tickWidth(_ prop: Float?) -> AAXAxis {
        tickWidth = prop
        return self
    }
    
    @discardableResult
    public func tickLength(_ prop: Float?) -> AAXAxis {
        tickLength = prop
        return self
    }
    
    @discardableResult
    public func tickPosition(_ prop: String?) -> AAXAxis {
        tickPosition = prop
        return self
    }
    
    public override init() {
        
    }

}

