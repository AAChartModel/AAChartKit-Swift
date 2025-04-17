//
//  AASerializable.swift
//  AAChartKit-Swift
//
//  Created by An An  on 17/4/19.
//  Copyright © 2017年 An An . All rights reserved.
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

public enum AAChartZoneAxisType: String {
    case x
    case y
}

public enum AAChartLineStepType: String {
    case left
    case center
    case right
}

//https://api.highcharts.com/highcharts/series
open class AASeriesElement: AAObject {
    public var type: String?               //A chart type series. If the type option is not specified, it is inherited from `chart.type`.
    public var name: String?               //The name of the series as shown in the legend, tooltip etc.
    public var data: [Any]?                //An array of data points for the series
    public var color: Any?                 //The main color or the series. In line type series it applies to the line and the point markers unless otherwise specified. In bar type series it applies to the bars unless a color is specified per point. The default value is pulled from the options.colors array.
    public var colors: [Any]?
    public var lineWidth: Float?           //The line width, It is only valid for line, spline, area, areaspline, arearange and arearangespline chart types
    public var borderColor: String?        //The border color, It is only valid for column, bar, pie, columnrange, pyramid and funnel chart types
    public var borderWidth: Float?         //The border width, It is only valid for column, bar, pie, columnrange, pyramid and funnel chart types
    public var borderRadius: Any?          //The corner radius of the border surrounding each column or bar.
    public var fillColor: Any?             //The fill color, It is only valid for area, areaspline, arearange and arearangespline chart types
    public var fillOpacity: Float?         //The fill opacity, It is only valid for area, areaspline, arearange and arearangespline chart types. Note that when you set an explicit fillColor, the fillOpacity is not applied. Instead, you should define the opacity in the fillColor with an rgba color definition. Deafualt value：0.75.
    public var threshold: Float?           //The threshold, also called zero level or base level. For line type series this is only used in conjunction with negativeColor. default：0.
    public var negativeColor: Any?         //The color for the parts of the graph or points that are below the threshold
    public var negativeFillColor: Any?     //A separate color for the negative part of the area.
    public var dashStyle: String?          //A name for the dash style to use for the graph. Applies only to series type having a graph, like line, spline, area and scatter in case it has a lineWidth.
    public var xAxis: Int?
    public var yAxis: Int?
    public var dataLabels: AADataLabels?   //Individual data label for each point. The options are the same as the ones for `plotOptions.series.dataLabels`.
    public var marker: AAMarker?           //Enable or disable the point marker. If null, the markers are hidden when the data is dense, and shown for more widespread data points.
    public var step: Any?                  //Whether to apply steps to the line. Possible values are left, center and right.
    public var states: AAStates?
    public var showInLegend: Bool?         //Whether to display this particular series or series type in the legend. The default value is true for standalone series, false for linked series. Deafualt value：true.
    public var colorByPoint: Bool?         //When using automatic point colors pulled from the `options.colors` collection, this option determines whether the chart should receive one color per series or one color per point.
    public var allowPointSelect: Bool?     //Allow this series' points to be selected by clicking on the markers, bars or pie slices
    public var zIndex: Int?                //Define the visual z index of the series.
    public var size: Any?                  //The innder size for pie chart (String | Number)
    public var innerSize: Any?             //The innder size for pie chart (String | Number)
    public var minSize: Any?               //The minimum size for a pie in response to auto margins, Only useful for pie, bubble, funnel, Pyramid (String | Number)
    public var shadow: AAShadow?
    public var zones: [AAZonesElement]?
    public var zoneAxis: String?           //Defines the Axis on which the zones are applied. defalut value：y.
    public var stack: String?
    public var tooltip: AATooltip?
    public var pointPlacement: Any?
    public var pointPadding: Float?
    public var enableMouseTracking: Bool?
    public var dataSorting: AADataSorting?
    public var reversed: Bool?             //Only useful for pyramid chart and funnel chart
    public var id: String?
    public var connectNulls: Bool?         //Whether to connect a graph line across null points. default value：false.
    public var enabledCrosshairs: Bool?
    public var jitter: AAJitter?           //Only useful for scatter chart and bubble chart
    public var clip: Bool?
    
    @discardableResult
    public func type(_ prop: AAChartType) -> Self {
        type = prop.rawValue
        return self
    }
    
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
    public func lineWidth(_ prop: Float) -> Self {
        lineWidth = prop
        return self
    }
    
    @discardableResult
    public func borderColor(_ prop: String) -> Self {
        borderColor = prop
        return self
    }
    
    @discardableResult
    public func borderWidth(_ prop: Float) -> Self {
        borderWidth = prop
        return self
    }
        
    @discardableResult
    public func borderRadius(_ prop: Float) -> Self {
        borderRadius = prop
        return self
    }
    
    @discardableResult
    public func borderRadius(_ prop: String) -> Self {
        borderRadius = prop
        return self
    }
    
    @discardableResult
    public func borderRadius(_ prop: Any) -> Self {
        borderRadius = prop
        return self
    }
    
    @discardableResult
    public func fillColor(_ prop: Any) -> Self {
        fillColor = prop
        return self
    }
    
    @discardableResult
    public func color(_ prop: Any) -> Self {
        color = prop
        return self
    }
    
    @discardableResult
    public func colors(_ prop: [Any]) -> Self {
        colors = prop
        return self
    }
    
    @discardableResult
    public func fillOpacity(_ prop: Float) -> Self {
        fillOpacity = prop
        return self
    }
    
    @discardableResult
    public func threshold(_ prop: Float) -> Self {
        threshold = prop
        return self
    }
    
    @discardableResult
    public func negativeColor(_ prop: Any) -> Self {
        negativeColor = prop
        return self
    }
    
    @discardableResult
    public func negativeFillColor(_ prop: Any) -> Self {
        negativeFillColor = prop
        return self
    }
    
    @discardableResult
    public func dashStyle(_ prop: AAChartLineDashStyleType) -> Self {
        dashStyle = prop.rawValue
        return self
    }
    
    @discardableResult
    public func xAxis(_ prop: Int) -> Self {
        xAxis = prop
        return self
    }
    
    @discardableResult
    public func yAxis(_ prop: Int) -> Self {
        yAxis = prop
        return self
    }
    
    @discardableResult
    public func dataLabels(_ prop: AADataLabels) -> Self {
        dataLabels = prop
        return self
    }
    
    @discardableResult
    public func marker(_ prop: AAMarker) -> Self {
        marker = prop
        return self
    }
    
    @discardableResult
    public func step(_ prop: Any) -> Self {
        step = prop
        return self
    }
    
    @discardableResult
    public func step(_ prop: AAChartLineStepType) -> Self {
        step = prop.rawValue
        return self
    }
    
    @discardableResult
    public func states(_ prop: AAStates) -> Self {
        states = prop
        return self
    }
    
    @discardableResult
    public func showInLegend(_ prop: Bool) -> Self {
        showInLegend = prop
        return self
    }
    
    @discardableResult
    public func colorByPoint(_ prop: Bool) -> Self {
        colorByPoint = prop
        return self
    }
    
    @discardableResult
    public func allowPointSelect(_ prop: Bool) -> Self {
        allowPointSelect = prop
        return self
    }
    
    @discardableResult
    public func zIndex(_ prop: Int) -> Self {
        zIndex = prop
        return self
    }
    
    @discardableResult
    public func size(_ prop: Any) -> Self {
        size = prop
        return self
    }
    
    @discardableResult
    public func innerSize(_ prop: Any) -> Self {
        innerSize = prop
        return self
    }
    
    @discardableResult
    public func minSize(_ prop: Any) -> Self {
        minSize = prop
        return self
    }
    
    @discardableResult
    public func shadow(_ prop: AAShadow) -> Self {
        shadow = prop
        return self
    }
    
    @discardableResult
    public func zones(_ prop: [AAZonesElement]) -> Self {
        zones = prop
        return self
    }
    
    @discardableResult
    public func zoneAxis(_ prop: String) -> Self {
        zoneAxis = prop
        return self
    }
    
    @discardableResult
    public func zoneAxis(_ prop: AAChartZoneAxisType) -> Self {
        zoneAxis = prop.rawValue
        return self
    }
    
    @discardableResult
    public func stack(_ prop: String) -> Self {
        stack = prop
        return self
    }
    
    @discardableResult
    public func tooltip(_ prop: AATooltip) -> Self {
        tooltip = prop
        return self
    }
    
    @discardableResult
    public func pointPlacement(_ prop: Any) -> Self {
        pointPlacement = prop
        return self
    }

    @discardableResult
    public func pointPadding(_ prop: Float) -> Self {
        pointPadding = prop
        return self
    }
    
    @discardableResult
    public func enableMouseTracking(_ prop: Bool) -> Self {
        enableMouseTracking = prop
        return self
    }
    
    @discardableResult
    public func enabledCrosshairs(_ prop: Bool) -> Self {
        enabledCrosshairs = prop
        return self
    }
    
    @discardableResult
    public func dataSorting(_ prop: AADataSorting) -> Self {
        dataSorting = prop
        return self
    }
    
    @discardableResult
    public func reversed(_ prop: Bool) -> Self {
        reversed = prop
        return self
    }

    @discardableResult
    public func id(_ prop: String) -> Self {
        id = prop
        return self
    }

    @discardableResult
    public func connectNulls(_ prop: Bool) -> Self {
        connectNulls = prop
        return self
    }

    @discardableResult
    public func jitter(_ prop: AAJitter) -> Self {
        jitter = prop
        return self
    }
    
    @discardableResult
    public func clip(_ prop: Bool) -> Self {
        clip = prop
        return self
    }
    
    public  override init() {
        
    }
}

//https://api.highcharts.com/highcharts/series.area.data
public class AADataElement: AAObject {
    public var name: String?
    public var x: Float?
    public var y: Float?
    public var color: Any?
    public var dataLabels: AADataLabels?
    public var marker: AAMarker?
    public var selected: Bool?
    
    @discardableResult
    public func name(_ prop: String) -> AADataElement {
        name = prop
        return self
    }
    
    @discardableResult
    public func x(_ prop: Float) -> AADataElement {
        x = prop
        return self
    }
    
    @discardableResult
    public func y(_ prop: Float) -> AADataElement {
        y = prop
        return self
    }
    
    @discardableResult
    public func color(_ prop: Any) -> AADataElement {
        color = prop
        return self
    }
    
    @discardableResult
    public func dataLabels(_ prop: AADataLabels) -> AADataElement {
        dataLabels = prop
        return self
    }
    
    @discardableResult
    public func marker(_ prop: AAMarker) -> AADataElement {
        marker = prop
        return self
    }

    @discardableResult
    public func selected(_ prop: Bool) -> AADataElement {
        selected = prop
        return self
    }
    
    public override init() {
        
    }
}

//https://api.highcharts.com/highcharts/series.area.shadow
public class AAShadow: AAObject {
    public var color: String?
    public var offsetX: Float?
    public var offsetY: Float?
    public var opacity: Float?
    public var width: Float?
    
    @discardableResult
    public func color(_ prop: String) -> AAShadow {
        color = prop
        return self
    }
    
    @discardableResult
    public func offsetX(_ prop: Float) -> AAShadow {
        offsetX = prop
        return self
    }
    
    @discardableResult
    public func offsetY(_ prop: Float) -> AAShadow {
        offsetY = prop
        return self
    }
    
    @discardableResult
    public func opacity(_ prop: Float) -> AAShadow {
        opacity = prop
        return self
    }
    
    @discardableResult
    public func width(_ prop: Float) -> AAShadow {
        width = prop
        return self
    }
    
    public override init() {
        
    }
}

//https://api.highcharts.com/highcharts/series.area.zones
public class AAZonesElement: AAObject {
    public var value: Double?
    public var color: Any?
    public var fillColor: Any?
    public var dashStyle: String?

    @discardableResult
    public func value(_ prop: Double) -> AAZonesElement {
        value = prop
        return self
    }
    
    @discardableResult
    public func color(_ prop: Any) -> AAZonesElement {
        color = prop
        return self
    }
    
    @discardableResult
    public func fillColor(_ prop: Any) -> AAZonesElement {
        fillColor = prop
        return self
    }
    
    @discardableResult
    public func dashStyle(_ prop: AAChartLineDashStyleType) -> AAZonesElement {
        dashStyle = prop.rawValue
        return self
    }
    
    public override init() {
        
    }
}

//https://api.highcharts.com/highcharts/series.column.dataSorting
public class AADataSorting: AAObject {
    public var enabled: Bool?
    public var matchByName: Bool?
    
    @discardableResult
    public func enabled(_ prop: Bool) -> AADataSorting {
        enabled = prop
        return self
    }
    
    @discardableResult
    public func matchByName(_ prop: Bool) -> AADataSorting {
        matchByName = prop
        return self
    }
    
    public override init() {
        
    }
}




