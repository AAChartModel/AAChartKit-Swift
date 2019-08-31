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
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

 public class AASeriesElement: AAObject {
    
    private var type: String?               //A chart type series. If the type option is not specified, it is inherited from `chart.type`.
    private var name: String?               //The name of the series as shown in the legend, tooltip etc.
    private var data: [Any]?                //An array of data points for the series
    private var color: Any?                 //The main color or the series. In line type series it applies to the line and the point markers unless otherwise specified. In bar type series it applies to the bars unless a color is specified per point. The default value is pulled from the options.colors array.
    private var lineWidth: Float?           //折线图、曲线图、直方折线图、折线填充图、曲线填充图、直方折线填充图的线条宽度
    private var borderWidth: Float?         //柱形图、条形图、扇形图等图形的描边宽度
    private var borderColor: String?        //柱形图、条形图、扇形图等图形的描边颜色
    private var fillColor: Any?             //折线填充图、曲线填充图、直方折线填充图等填充图类型的填充颜色
    private var fillOpacity: Float?         //折线填充图、曲线填充图、直方折线填充图等填充图类型的填充颜色透明度 Fill opacity for the area. Note that when you set an explicit fillColor, the fillOpacity is not applied. Instead, you should define the opacity in the fillColor with an rgba color definition. 默认是：0.75. https://api.hcharts.cn/highcharts#plotOptions.area.fillOpacity
    private var threshold: Float?           //The threshold, also called zero level or base level. For line type series this is only used in conjunction with negativeColor. default：0.
    private var negativeColor: String?      //The color for the parts of the graph or points that are below the threshold
    private var dashStyle: String?          //A name for the dash style to use for the graph. Applies only to series type having a graph, like line, spline, area and scatter in case it has a lineWidth.
    private var dataLabels: [String: Any]?  //Individual data label for each point. The options are the same as the ones for `plotOptions.series.dataLabels`.
    private var marker: [String: Any]?      //Enable or disable the point marker. If null, the markers are hidden when the data is dense, and shown for more widespread data points.
    private var step: Any?                  //Whether to apply steps to the line. Possible values are left, center and right.
    private var colorByPoint: Bool?         //When using automatic point colors pulled from the `options.colors` collection, this option determines whether the chart should receive one color per series or one color per point.
    private var allowPointSelect: Bool?     //Allow this series' points to be selected by clicking on the markers, bars or pie slices
    private var zIndex: Int?                //Define the visual z index of the series.
    private var innerSize: String?          //内部圆环半径大小占比(内部圆环半径/扇形图半径)
    private var shadow: Any?
    private var zones: [Any]?
    private var stack: String?

    @discardableResult
    public func type(_ prop: AAChartType) -> AASeriesElement {
        type = prop.rawValue
        return self
    }
    
    @discardableResult
    public func name(_ prop: String) -> AASeriesElement {
        name = prop
        return self
    }
    
    @discardableResult
    public func data(_ prop: [Any]) -> AASeriesElement {
        data = prop
        return self
    }
    
    @discardableResult
    public func lineWidth(_ prop: Float) -> AASeriesElement {
        lineWidth = prop
        return self
    }
    
    @discardableResult
    public func borderWidth(_ prop: Float) -> AASeriesElement {
        borderWidth = prop
        return self
    }
    
    @discardableResult
    public func borderColor(_ prop: String) -> AASeriesElement {
        borderColor = prop
        return self
    }
    
    @discardableResult
    public func fillColor(_ prop: Any) -> AASeriesElement {
        fillColor = prop
        return self
    }
    
    @discardableResult
    public func color(_ prop: Any) -> AASeriesElement {
        color = prop
        return self
    }
    
    @discardableResult
    public func fillOpacity(_ prop: Float) -> AASeriesElement {
        fillOpacity = prop
        return self
    }
    
    @discardableResult
    public func threshold(_ prop: Float) -> AASeriesElement {
        threshold = prop
        return self
    }
    
    @discardableResult
    public func negativeColor(_ prop: String) -> AASeriesElement {
        negativeColor = prop
        return self
    }
    
    @discardableResult
    public func dashStyle(_ prop: AALineDashStyleType) -> AASeriesElement {
        dashStyle = prop.rawValue
        return self
    }
    
    @discardableResult
    public func dataLabels(_ prop: AADataLabels) -> AASeriesElement {
        dataLabels = prop.toDic()!
        return self
    }
    
    @discardableResult
    public func marker(_ prop: AAMarker) -> AASeriesElement {
        marker = prop.toDic()!
        return self
    }
    
    @discardableResult
    public func step(_ prop: Any) -> AASeriesElement {
        step = prop
        return self
    }
    
    @discardableResult
    public func colorByPoint(_ prop: Bool) -> AASeriesElement {
        colorByPoint = prop
        return self
    }
    
    @discardableResult
    public func allowPointSelect(_ prop: Bool) -> AASeriesElement {
        allowPointSelect = prop
        return self
    }
    
    @discardableResult
    public func zIndex(_ prop: Int) -> AASeriesElement {
        zIndex = prop
        return self
    }
    
    @discardableResult
    public func innerSize(_ prop: String) -> AASeriesElement {
        innerSize = prop
        return self
    }
    
    @discardableResult
    public func shadow(_ prop: AAShadow) -> AASeriesElement {
        shadow = prop.toDic()!
        return self
    }
    
    @discardableResult
    public func zones(_ prop: [Any]) -> AASeriesElement {
        zones = prop
        return self
    }
    
    @discardableResult
    public func stack(_ prop: String) -> AASeriesElement {
        stack = prop
        return self
    }

    public  override init() {
    }   
}

public class AADataElement: AAObject {
    private var name: String?
    private var y: Float?
    private var color: Any?
    private var dataLabels: [String: Any]?
    private var marker: [String: Any]?
    
    @discardableResult
    public func name(_ prop: String) -> AADataElement {
        name = prop
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
        dataLabels = prop.toDic()!
        return self
    }
    
    @discardableResult
    public func marker(_ prop: AAMarker) -> AADataElement {
        marker = prop.toDic()!
        return self
    }
}

public class AAShadow: AAObject {
    private var color: String?
    private var offsetX: Float?
    private var offsetY: Float?
    private var opacity: Float?
    private var width: Float?
    
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
}




