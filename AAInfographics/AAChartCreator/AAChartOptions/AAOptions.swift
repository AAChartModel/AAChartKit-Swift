//
//  AAOptions.swift
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


/// https://api.highcharts.com/highcharts/
public class AAOptions: AAObject {
    public var chart: AAChart?
    public var title: AATitle?
    public var subtitle: AASubtitle?
    public var xAxis: AAXAxis?
    public var yAxis: AAYAxis?
    public var xAxisArray: [AAXAxis]?
    public var yAxisArray: [AAYAxis]?
    public var tooltip: AATooltip?
    public var plotOptions: AAPlotOptions?
    public var series: [Any]?
    public var legend: AALegend?
    public var pane: AAPane?
    public var colors: [Any]?
    public var credits: AACredits?
    public var defaultOptions: AALang?
    
    internal var clickEventEnabled: Bool? //Please DO NOT use this property
    internal var touchEventEnabled: Bool? //Please DO NOT use this property
    
    //beforeDrawChartJavaScript
    public var beforeDrawChartJavaScript: String?
    //afterDrawChartJavaScript
    public var afterDrawChartJavaScript: String?

    
    @discardableResult
    public func chart(_ prop: AAChart?) -> AAOptions {
        chart = prop
        return self
    }
    
    @discardableResult
    public func title(_ prop: AATitle?) -> AAOptions {
        title = prop
        return self
    }
    
    @discardableResult
    public func subtitle(_ prop: AASubtitle?) -> AAOptions {
        subtitle = prop
        return self
    }
    
    @discardableResult
    public func xAxis(_ prop: AAXAxis?) -> AAOptions {
        xAxis = prop
        return self
    }
    
    @discardableResult
    public func yAxis(_ prop: AAYAxis?) -> AAOptions {
        yAxis = prop
        return self
    }
    
    @discardableResult
    public func xAxisArray(_ prop: [AAXAxis]?) -> AAOptions {
        xAxisArray = prop
        return self
    }
    
    @discardableResult
    public func yAxisArray(_ prop: [AAYAxis]?) -> AAOptions {
        yAxisArray = prop
        return self
    }
    
    @discardableResult
    public func tooltip(_ prop: AATooltip?) -> AAOptions {
        tooltip = prop
        return self
    }
    
    @discardableResult
    public func plotOptions(_ prop: AAPlotOptions?) -> AAOptions {
        plotOptions = prop
        return self
    }
    
    @discardableResult
    public func series(_ prop: [Any]?) -> AAOptions {
        series = prop
        return self
    }
    
    @discardableResult
    public func legend(_ prop: AALegend?) -> AAOptions {
        legend = prop
        return self
    }
    
    @discardableResult
    public func pane(_ prop: AAPane?) -> AAOptions {
        pane = prop
        return self
    }
    
    @discardableResult
    public func colors(_ prop: [Any]?) -> AAOptions {
        colors = prop
        return self
    }
    
    @discardableResult
    public func credits(_ prop: AACredits?) -> AAOptions {
        credits = prop
        return self
    }
    
    @discardableResult
    public func defaultOptions(_ prop: AALang?) -> AAOptions {
        defaultOptions = prop
        return self
    }
    
    @discardableResult
    public func beforeDrawChartJavaScript(_ prop: String?) -> AAOptions {
        beforeDrawChartJavaScript = prop
        return self
    }
    
    @discardableResult
    public func afterDrawChartJavaScript(_ prop: String?) -> AAOptions {
        afterDrawChartJavaScript = prop
        return self
    }
    
    public override init() {
        let aaCredits = AACredits()
        aaCredits.enabled = false
        credits = aaCredits
    }
}


public class AAOptionsConstructor {
    
    public static func configureChartOptions(
        _ aaChartModel: AAChartModel
    ) -> AAOptions {
        let aaChart = AAChart()
            .type(aaChartModel.chartType)
            .inverted(aaChartModel.inverted)
            .backgroundColor(aaChartModel.backgroundColor)
            .zooming(AAZooming()
                .type(aaChartModel.zoomType))
            .polar(aaChartModel.polar) //Whether to polarize the chart (turn on polar mode)
            .scrollablePlotArea(aaChartModel.scrollablePlotArea)
        aaChart.margin = aaChartModel.margin
        
        let aaTitle = AATitle()
            .text(aaChartModel.title) //Title text content
        
        if aaChartModel.title != "" {
            aaTitle
                .align(aaChartModel.titleAlign) //Title horizontal alignment
                .style(aaChartModel.titleStyle)
        }
        
        var aaSubtitle: AASubtitle?
        if aaChartModel.subtitle != "" {
            aaSubtitle = AASubtitle()
                .text(aaChartModel.subtitle) //Subtitle text content
                .align(aaChartModel.subtitleAlign) // The horizontal alignment of the chart subtitle text. Possible values are "left", "center", and "right". The default is: "center".
                .style(aaChartModel.subtitleStyle)
        }
        
        
        let aaTooltip = AATooltip()
            .enabled(aaChartModel.tooltipEnabled)
            .shared(true) //Multiple groups of data share the same tooltip
            .valueSuffix(aaChartModel.tooltipValueSuffix)
        
        let aaPlotOptions = AAPlotOptions()
            .series(AASeries()
                .stacking(aaChartModel.stacking))
        
        aaPlotOptions.series?
            .animation(AAAnimation()
                .easing(aaChartModel.animationType)
                .duration(aaChartModel.animationDuration))
        
        configurePlotOptionsMarkerStyle(aaChartModel, aaPlotOptions)
        configurePlotOptionsDataLabels(aaPlotOptions, aaChartModel)
        
        let aaLegend = AALegend()
            .enabled(aaChartModel.legendEnabled)
            .itemStyle(aaChartModel.legendItemStyle)
        
        let aaOptions = AAOptions()
            .chart(aaChart)
            .title(aaTitle)
            .subtitle(aaSubtitle)
            .tooltip(aaTooltip)
            .plotOptions(aaPlotOptions)
            .legend(aaLegend)
            .series(aaChartModel.series)
            .colors(aaChartModel.colorsTheme)
        
        configureAxisContentAndStyle(aaOptions, aaChartModel)
        
        return aaOptions
    }
    
    private static func configurePlotOptionsMarkerStyle(
        _ aaChartModel: AAChartModel,
        _ aaPlotOptions: AAPlotOptions
    ) {
        let aaChartType = aaChartModel.chartType!
        
        //Data point markers related configuration. Only linear graphs have data point markers.
        if     aaChartType == .area
            || aaChartType == .areaspline
            || aaChartType == .line
            || aaChartType == .spline
            || aaChartType == .scatter
            || aaChartType == .arearange
            || aaChartType == .areasplinerange
            || aaChartType == .polygon {
            let aaMarker = AAMarker()
                .radius(aaChartModel.markerRadius) //Curve connection point radius, default is 4
                .symbol(aaChartModel.markerSymbol?.rawValue) //Curve connection point type: "circle", "square", "diamond", "triangle", "triangle-down", the default is "circle"
            if aaChartModel.markerSymbolStyle == .innerBlank {
                aaMarker
                    .fillColor(AAColor.white) //The fill color of the point (used to set the fill color of the polyline connection point)
                    .lineWidth(0.4 * aaChartModel.markerRadius!) //The width of the outer line (used to set the width of the outline stroke of the polyline connection point)
                    .lineColor("") //The color of the outer edge (used to set the outline stroke color of the polyline connection point. When the value is an empty string, the color of the data point or data column is taken by default)
            } else if aaChartModel.markerSymbolStyle == .borderBlank {
                aaMarker
                    .lineWidth(2.0)
                    .lineColor(aaChartModel.backgroundColor)
            }
            let aaSeries = aaPlotOptions.series
            aaSeries?.marker(aaMarker)
        }
    }
    
    private static func configurePlotOptionsDataLabels(
        _ aaPlotOptions: AAPlotOptions,
        _ aaChartModel: AAChartModel
    ) {
        let aaChartType = aaChartModel.chartType!
        
        let aaDataLabels = AADataLabels()
            .enabled(aaChartModel.dataLabelsEnabled)
            .style(aaChartModel.dataLabelsStyle)
        
        switch aaChartType {
        case .column:
            let aaColumn = AAColumn()
                .borderWidth(0)
                .borderRadius(aaChartModel.borderRadius)
            
            if (aaChartModel.polar == true) {
                aaColumn
                    .pointPadding(0)
                    .groupPadding(0.005)
            }
            aaPlotOptions.column(aaColumn)
            
        case .bar:
            let aaBar = AABar()
                .borderWidth(0)
                .borderRadius(aaChartModel.borderRadius)
            
            aaPlotOptions.bar(aaBar)
            
        case .pie:
            if (aaChartModel.dataLabelsEnabled == true) {
                aaDataLabels.format("<b>{point.name}</b>: {point.percentage:.1f} %")
            }
            let aaPie = AAPie()
                .allowPointSelect(true)
                .cursor("pointer")
                .showInLegend(true)
                .borderRadius(aaChartModel.borderRadius)
            
            aaPlotOptions.pie(aaPie)
            
        case .columnrange:
            let aaColumnrange = AAColumnrange()
                .borderWidth(0)
                .borderRadius(aaChartModel.borderRadius)
            
            aaPlotOptions.columnrange(aaColumnrange)
            
        default: break
        }
        aaPlotOptions.series?.dataLabels(aaDataLabels)
    }
    
    private static func configureAxisContentAndStyle(
        _ aaOptions: AAOptions,
        _ aaChartModel: AAChartModel
    ) {
        let aaChartType = aaChartModel.chartType
        //The related configuration of the x-axis and the Y-axis, the fan, pyramid, funnel, and meter and dial charts do not need to set the relevant content of the X-axis and Y-axis
        if     aaChartType == .column
            || aaChartType == .bar
            || aaChartType == .area
            || aaChartType == .areaspline
            || aaChartType == .line
            || aaChartType == .spline
            || aaChartType == .scatter
            || aaChartType == .bubble
            || aaChartType == .columnrange
            || aaChartType == .arearange
            || aaChartType == .areasplinerange
            || aaChartType == .boxplot
            || aaChartType == .waterfall
            || aaChartType == .polygon
            || aaChartType == .gauge
            || aaChartType == .columnpyramid
        {
            
            if aaChartType != .gauge {
                let aaXAxisLabelsEnabled = aaChartModel.xAxisLabelsEnabled
                let aaXAxisLabels = AALabels()
                    .enabled(aaXAxisLabelsEnabled) //Set whether the x-axis displays text
                if aaXAxisLabelsEnabled == true {
                    aaXAxisLabels
                        .style(aaChartModel.xAxisLabelsStyle)
                }
                
                let aaXAxis = AAXAxis()
                    .labels(aaXAxisLabels)
                    .reversed(aaChartModel.xAxisReversed)
                    .gridLineWidth(aaChartModel.xAxisGridLineWidth) //x-axis grid line width
                    .categories(aaChartModel.categories)
                    .visible(aaChartModel.xAxisVisible) //whether the x axis is visible
                    .tickInterval(aaChartModel.xAxisTickInterval) //Number of x-axis coordinate point intervals
                    .title(AATitle()
                        .text(aaChartModel.xAxisTitle)) //x axis title
                
                aaOptions.xAxis(aaXAxis)
            }
            
            let aaYAxisLabelsEnabled = aaChartModel.yAxisLabelsEnabled
            let aaYAxisLabels = AALabels()
                .enabled(aaChartModel.yAxisLabelsEnabled)
            if aaYAxisLabelsEnabled == true {
                aaYAxisLabels
                    .style(aaChartModel.yAxisLabelsStyle)
            }
            
            let aaYAxis = AAYAxis()
                .labels(aaYAxisLabels) //Set the y-axis text
                .min(aaChartModel.yAxisMin) //Set the minimum value of the y-axis. If the minimum value is equal to zero, negative values ​​cannot be displayed.
                .max(aaChartModel.yAxisMax) //Maximum y-axis
                .tickPositions(aaChartModel.yAxisTickPositions)
                .allowDecimals(aaChartModel.yAxisAllowDecimals) //Whether to display decimals
                .reversed(aaChartModel.yAxisReversed)
                .gridLineWidth(aaChartModel.yAxisGridLineWidth) //y-axis grid line width
                .lineWidth(aaChartModel.yAxisLineWidth) //Set the width of the y-axis axis, which is 0 to hide the y-axis axis
                .visible(aaChartModel.yAxisVisible)
                .title(AATitle()
                    .text(aaChartModel.yAxisTitle)) //y axis title
            
            aaOptions.yAxis(aaYAxis)
        }
    }
    
}


