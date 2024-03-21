//
//  CustomStyleForLineChartComposer.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/2/1.
//  Copyright © 2024 An An. All rights reserved.
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

import AAInfographics

class CustomStyleForLineChartComposer {
    
    static func mixedLineChart() -> AAChartModel {
        AAChartModel()
            .chartType(.line)
            .subtitle("虚拟数据")
            .categories(["Java", "Swift", "Python", "Ruby", "PHP", "Go", "C", "C#", "C++", "Perl", "R", "MATLAB", "SQL"])
            .yAxisTitle("摄氏度")
            .dataLabelsEnabled(true)
            .series([
                AASeriesElement()
                    .name("本专业")
                    .data([45, 88, 49, 43, 65, 56, 47, 28, 49, 44, 89, 55])
                    .zoneAxis(.x)
                    .color(AAGradientColor.freshPapaya)
                    .lineWidth(5)
                    .zones([
                        AAZonesElement()
                            .value(8)
                            .dashStyle(.dot)
                    ]),
                AASeriesElement()
                    .name("所有专业")
                    .color(AAGradientColor.pixieDust)
                    .lineWidth(5)
                    .data([NSNull(), NSNull(), 100, 109, 89, NSNull(), NSNull(), 120, NSNull(), NSNull(), NSNull(), NSNull()])
                ])
    }
    
    static func stepLineChart() -> AAChartModel {
        AAChartModel()
            .chartType(.line)//图形类型
            .animationType(.bounce)//图形渲染动画类型为"bounce"
            .title("STEP LINE CHART")//图形标题
            .subtitle("2020/08/08")//图形副标题
            .dataLabelsEnabled(false)//是否显示数字
            .markerSymbolStyle(.borderBlank)//折线连接点样式
            .markerRadius(7)//折线连接点半径长度,为0时相当于没有折线连接点
            .series([
                AASeriesElement()
                    .name("Berlin")
                    .data([450, 432, 401, 454, 590, 530, 510])
                    .step(.right), //折线连接点靠右👉
                AASeriesElement()
                    .name("New York")
                    .data([220, 282, 201, 234, 290, 430, 410])
                    .step(.center),//折线连接点居中
                AASeriesElement()
                    .name("Tokyo")
                    .data([120, 132, 101, 134, 90, 230, 210])
                    .step(.left),//折线连接点靠左边👈
                ])
    }
    
    static func stepAreaChart() -> AAChartModel {
        AAChartModel()
            .chartType(.area)//图形类型
            .animationType(.bounce)//图形渲染动画类型为"bounce"
            .title("STEP AREA CHART")//图形标题
            .subtitle("2020/08/08")//图形副标题
            .dataLabelsEnabled(false)//是否显示数字
            .markerSymbolStyle(.innerBlank)//折线连接点样式
            .markerRadius(0)//折线连接点半径长度,为0时相当于没有折线连接点
            .series([
                AASeriesElement()
                    .name("Berlin")
                    .data([450, 432, 401, 454, 590, 530, 510])
                    .step((true))//设置折线样式为直方折线,连接点位置默认靠左👈
                ,
                AASeriesElement()
                    .name("New York")
                    .data([220, 282, 201, 234, 290, 430, 410])
                    .step((true))//设置折线样式为直方折线,连接点位置默认靠左👈
                ,
                AASeriesElement()
                    .name("Tokyo")
                    .data([120, 132, 101, 134, 90, 230, 210])
                    .step((true))//设置折线样式为直方折线,连接点位置默认靠左👈
                ,
                ])
    }
    
    static func customSingleDataLabelChart() -> AAChartModel {
        AAChartModel()
            .title("单独自定义某个指定数据元素的DataLabel")
            .colorsTheme([AAGradientColor.mysticMauve])
            .series([
                AASeriesElement()
                    .name("货币")
                    .data([
                        0.38, 0.31, 0.32, 0.32, 0.64, 0.66, 0.86,
                        AADataElement()
                            .y(1.25)
                            .dataLabels(AADataLabels()
                                .enabled(true)
                                .format("{y} 美元🇺🇸💲")
                                .x(3)
                                .verticalAlign(.middle)
                                .style(AAStyle(
                                    color: AAColor.red,
                                    fontSize: 20,
                                    weight: .bold, 
                                    outline: "1px 1px contrast"
                                )))
                            .toDic()!,
                        0.52, 0.75, 0.52, 0.56, 0.54, 0.60, 0.46, 0.63, 0.54, 0.51, 0.58, 0.64, 0.60, 0.45, 0.36, 0.67
                    ])
            ])
    }
    
    static func chartWithShadowStyle() -> AAChartModel {
        AAChartModel()
            .yAxisVisible(false)
            .chartType(.spline)
            .legendEnabled(false)//隐藏图例(底部可点按的小圆点)
            .categories(["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"])
            .markerSymbolStyle(.innerBlank)
            .markerRadius(8)
            .dataLabelsEnabled(false)
            .series([
                AASeriesElement()
                    .name("Tokyo")
                    .lineWidth(8.0)
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
                    .shadow(AAShadow()
                        .color(AAColor.red)
                        .offsetX(15.0)
                        .offsetY(15.0)
                        .opacity(0.2)
                        .width(8.0))
            ])
    }
    
    static func colorfulGradientSplineChart() -> AAChartModel {
        AAChartModel()
            .chartType(.spline)
            .categories(["一月", "二月", "三月", "四月", "五月", "六月",
                         "七月", "八月", "九月", "十月", "十一月", "十二月"])
            .markerRadius(0)
            .legendEnabled(false)
            .dataLabelsEnabled(false)
            .series([
                AASeriesElement()
                    .name("Tokyo Hot")
                    .lineWidth(13)
                    .color(AAGradientColor.linearGradient(
                        direction: .toRight,
                        stops: [
                            [0.00, "#febc0f"],//颜色字符串设置支持十六进制类型和 rgba 类型
                            [0.25, "#FF14d4"],
                            [0.50, "#0bf8f5"],
                            [0.75, "#F33c52"],
                            [1.00, "#1904dd"],
                        ]
                    ))
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6]),
                ])
    }

    //refer to online sample https://jshare.com.cn/github/highcharts/highcharts/tree/master/samples/highcharts/plotoptions/series-marker-symbol/
    static func customLineChartMarkerSymbolContent() -> AAChartModel {
        let aaChartModel = CustomStyleForScatterChartComposer.customScatterChartMarkerSymbolContent()
        aaChartModel.chartType = .line
        return aaChartModel
    }

    static func drawLineChartWithPointsCoordinates() -> AAChartModel {
        AAChartModel()
            .chartType(.line)
            .title("Draw Line Chart With Points Coordinates")
            .markerSymbolStyle(.borderBlank)
            .markerRadius(7)
            .series([
                AASeriesElement()
                    .name("Blue Dot")
                    .data([
                        [0, 200],
                        [0, 300],
                        [0, 400],
                        [1, 100],
                        [2, 120],
                        [3, 130]
                    ])
            ])
    }

    static func customChartHoverAndSelectHaloStyle() -> AAChartModel {
        AAChartModel()
            .chartType(.line)
            .title("Custom Chart Hover And Select Halo Style")
            .colorsTheme([AAColor.red])
            .yAxisReversed(true)
            .xAxisReversed(true)
            .markerRadius(20)
            .series([
                AASeriesElement()
                    .name("ElementOne")
                    .data([211, 183, 157, 133, 111, 91, 73, 57, 43, 31, 21, 13, 7, 3])
                    .allowPointSelect(true)
                    .states(AAStates()
                        .hover(AAHover()
                            .halo(AAHalo()
                                .size(130)
                                .opacity(0.8)
                                .attributes(AASVGAttributes()
                                    .strokeWidth(50)
                                    .fill("#00BFFF")
                                    .stroke("#00FA9A"))))
                        .select(AASelect()
                            .halo(AAHalo()
                                .size(130)
                                .opacity(1.0)
                                .attributes(AASVGAttributes()
                                    .strokeWidth(150)
                                    .fill(AARgba(138, 43, 226, 1))
                                    .stroke(AARgba(30, 144, 255, 1))))))
            ])
    }

    //GitHub issue https://github.com/AAChartModel/AAChartKit/issues/903
    static func disableSomeOfLinesMouseTrackingEffect() -> AAChartModel {
        AAChartModel()
            .chartType(.line)//图表类型
            .tooltipValueSuffix("万元")//设置浮动提示框单位后缀
            .yAxisTitle("万元")//设置 Y 轴标题
            .categories([
                "一月", "二月", "三月", "四月", "五月", "六月",
                "七月", "八月", "九月", "十月", "十一月", "十二月"
            ])
            .series([
                AASeriesElement()
                    .name("2017")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]),
                AASeriesElement()
                    .name("2018")
                    .enableMouseTracking(false)
                    .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]),
                AASeriesElement()
                    .name("2019")
                    .enableMouseTracking(false)
                    .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]),
                AASeriesElement()
                    .name("2020")
                    .enableMouseTracking(false)
                    .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]),
            ])
    }

    // GitHub issue https://github.com/AAChartModel/AAChartKit/issues/904
    static func colorfulShadowSplineChart() -> AAChartModel {
        AAChartModel()
            .chartType(.spline)
            .yAxisVisible(false)
            .stacking(.normal)
            .colorsTheme(["#1e90ff","#ef476f","#ffd066","#04d69f"])
            .markerSymbol(.circle)
            .markerRadius(8.0)
            .markerSymbolStyle(.borderBlank)
            .series([
                AASeriesElement()
                    .name("2017")
                    .lineWidth(5)
                    .data([0.45, 0.43, 0.50, 0.55, 0.58, 0.62, 0.83, 0.39, 0.56, 0.67, 0.50, 0.34, 0.50, 0.67, 0.58, 0.29, 0.46, 0.23, 0.47, 0.46, 0.38, 0.56, 0.48, 0.36])
                    .shadow(AAShadow()
                        .offsetX(15.0)
                        .offsetY(15.0)
                        .opacity(0.2)
                        .width(8.0)
                        .color("#1e90ff")),
                AASeriesElement()
                    .name("2018")
                    .lineWidth(5)
                    .data([0.38, 0.31, 0.32, 0.32, 0.64, 0.66, 0.86, 0.47, 0.52, 0.75, 0.52, 0.56, 0.54, 0.60, 0.46, 0.63, 0.54, 0.51, 0.58, 0.64, 0.60, 0.45, 0.36, 0.67])
                    .shadow(AAShadow()
                        .offsetX(15.0)
                        .offsetY(15.0)
                        .opacity(0.2)
                        .width(8.0)
                        .color("#ef476f")),
                AASeriesElement()
                    .name("2019")
                    .lineWidth(5)
                    .data([0.46, 0.32, 0.53, 0.58, 0.86, 0.68, 0.85, 0.73, 0.69, 0.71, 0.91, 0.74, 0.60, 0.50, 0.39, 0.67, 0.55, 0.49, 0.65, 0.45, 0.64, 0.47, 0.63, 0.64])
                    .shadow(AAShadow()
                        .offsetX(15.0)
                        .offsetY(15.0)
                        .opacity(0.2)
                        .width(8.0)
                        .color("#ffd066")),
                AASeriesElement()
                    .name("2020")
                    .lineWidth(5)
                    .data([0.60, 0.51, 0.52, 0.53, 0.64, 0.84, 0.65, 0.68, 0.63, 0.47, 0.72, 0.60, 0.65, 0.74, 0.66, 0.65, 0.71, 0.59, 0.65, 0.77, 0.52, 0.53, 0.58, 0.53])
                    .shadow(AAShadow()
                        .offsetX(15.0)
                        .offsetY(15.0)
                        .opacity(0.2)
                        .width(8.0)
                        .color("#04d69f")),
            ])
    }

    // GitHub issue https://github.com/AAChartModel/AAChartKit/issues/905
    static func colorfulDataLabelsStepLineChart() -> AAChartModel {
        AAChartModel()
            .chartType(.line)
            .yAxisVisible(false)
            .stacking(.normal)
            .colorsTheme(["#1e90ff", "#ef476f", "#ffd066", "#04d69f"])
            .markerSymbol(.circle)
            .markerRadius(8.0)
            .markerSymbolStyle(.innerBlank)
            .dataLabelsEnabled(true)
            .series([
                AASeriesElement()
                    .name("2017")
                    .fillOpacity(1.0)
                    .step((true))
                    .dataLabels(AADataLabels()
                        .style(AAStyle()
                            .color("#1e90ff")
                            .fontSize(11)))
                    .data([2.10, 2.54, 2.78, 3.62, 4.41, 4.09, 3.83, 4.47, 4.20, 3.94, 3.80, 3.58, 3.19, 4.30, 3.69, 3.52, 3.02, 3.30]),
                AASeriesElement()
                    .name("2018")
                    .fillOpacity(1.0)
                    .step((true))
                    .dataLabels(AADataLabels()
                        .style(AAStyle()
                            .color("#ef476f")
                            .fontSize(11)))
                    .data([1.56, 1.91, 2.45, 3.87, 3.24, 4.90, 4.61, 4.10, 4.17, 3.85, 4.17, 3.46, 3.46, 3.55, 3.50, 4.13, 2.58, 2.28]),
                AASeriesElement()
                    .name("2019")
                    .fillOpacity(1.0)
                    .step((true))
                    .dataLabels(AADataLabels()
                        .style(AAStyle()
                            .color("#ffd066")
                            .fontSize(11)))
                    .data([1.16, 1.67, 2.64, 2.86, 3.00, 3.21, 4.14, 4.07, 3.68, 3.11, 3.41, 3.25, 3.32, 3.07, 3.92, 3.05, 2.18, 3.24]),
                AASeriesElement()
                    .name("2020")
                    .fillOpacity(1.0)
                    .step((true))
                    .dataLabels(AADataLabels()
                        .style(AAStyle()
                            .color("#04d69f")
                            .fontSize(11)))
                    .data([5.59, 3.09, 4.09, 6.14, 5.33, 6.05, 5.71, 6.22, 6.56, 4.75, 5.27, 6.02, 5.22, 5.77, 6.19, 5.68, 4.33, 5.48]),
            ])
    }

    // https://github.com/AAChartModel/AAChartKit/issues/1318
    // Refer to https://api.highcharts.com.cn/highcharts#plotOptions.spline.marker.states.hover.enabled
    static func disableSplineChartMarkerHoverEffect() -> AAChartModel {
        AAChartModel()
            .chartType(.spline)
            .title("Disable Spline Chart Marker Hover Effect")
            .categories([
                "一月", "二月", "三月", "四月", "五月", "六月",
                "七月", "八月", "九月", "十月", "十一月", "十二月"
            ])
            .markerRadius(0)//marker点半径为0个像素
            .yAxisLineWidth(0)
            .yAxisGridLineWidth(0)
            .legendEnabled(false)
            .series([
                AASeriesElement()
                    .name("Tokyo Hot")
                    .lineWidth(5.0)
                    .color(AARgba(220, 20, 60, 1))//猩红色, alpha 透明度 1
                    .marker(AAMarker()
                        .states(AAMarkerStates()
                            .hover(AAMarkerHover()
                                .enabled(false))))
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
            ])
    }

    //https://github.com/AAChartModel/AAChartKit/issues/1203
    static func maxAndMinDataLabelsForChart() -> AAChartModel {
        AAChartModel()
            .chartType(.spline)
            .dataLabelsEnabled(false)//是否显示值
            .tooltipEnabled(false)
            .markerRadius(0)
            .xAxisVisible(false)
            .yAxisVisible(false)
            .series({
                let aaDataLabels = AADataLabels()
                    .enabled(true)
                    .format("{y} 美元")
                    .shape(.callout)
                    .style(AAStyle(color: AAColor.red, fontSize: 15, weight: .bold))
                    .backgroundColor(AAColor.white)// white color
                    .borderColor(AAColor.red)// red color
                    .borderRadius(1.5)
                    .borderWidth(1.3)
                
                let minData = AADataElement()
                    .dataLabels(aaDataLabels)
                    .y(2.5)
                    .toDic()!
                
                let maxData = AADataElement()
                    .dataLabels(aaDataLabels)
                    .y(49.5)
                    .toDic()!
                
                return [
                    AASeriesElement()
                        .name("Show The Max and Min values Data Labels")
                        .lineWidth(7)
                        .data([7.0, 6.9, minData, 14.5, 18.2, maxData, 5.2, 26.5, 23.3, 26.5, 13.9, 9.6])
                        .color(AAGradientColor.oceanBlue)
                ]
            }())
    }
    
    static func dashStyleTypesMixedChart() -> AAChartModel {
        AAChartModel()
            .chartType(.spline)//图形类型
            .dataLabelsEnabled(false)//是否显示数字
            .stacking(.normal)
            .markerRadius(0)
            .series({
                let dataArr = [50, 320, 230, 370, 230, 400,]
                let lineWidth: Float = 3
                return [
                    AASeriesElement()
                        .name(AAChartLineDashStyleType.solid.rawValue)
                        .lineWidth(lineWidth)
                        .data(dataArr)
                    ,
                    AASeriesElement()
                        .name(AAChartLineDashStyleType.dash.rawValue)
                        .lineWidth(lineWidth)
                        .dashStyle(.dash)
                        .data(dataArr)
                    ,
                    AASeriesElement()
                        .name(AAChartLineDashStyleType.dashDot.rawValue)
                        .lineWidth(lineWidth)
                        .dashStyle(.dashDot)
                        .data(dataArr)
                    ,
                    AASeriesElement()
                        .name(AAChartLineDashStyleType.longDash.rawValue)
                        .lineWidth(lineWidth)
                        .dashStyle(.longDash)
                        .data(dataArr)
                    ,
                    AASeriesElement()
                        .name(AAChartLineDashStyleType.longDashDot.rawValue)
                        .lineWidth(lineWidth)
                        .dashStyle(.longDashDot)
                        .data(dataArr)
                    ,
                ]
            }())
    }
    
    
    static func allLineDashStyleTypesMixedChart() -> AAChartModel {
        AAChartModel()
            .chartType(.spline)//图表类型
            .yAxisVisible(true)//设置 Y 轴是否可见
            .colorsTheme(["#eb2100", "#eb3600", "#d0570e", "#d0a00e", "#34da62", "#00e9db", "#00c0e9", "#0096f3", "#33CCFF", "#33FFCC"])//设置主体颜色数组
            .tooltipValueSuffix("℃")//设置浮动提示框单位后缀
            .yAxisGridLineWidth(0)//y轴横向分割线宽度为0(即是隐藏分割线)
            .stacking(.normal)
            .markerRadius(0)//隐藏连接点
            .series({
                let dataArr = [50, 620, 230, 370, 130, 720, 230, 570, 230, 400,100,]
                let lineWidth: Float = 3
                return [
                    AASeriesElement()
                        .name(AAChartLineDashStyleType.solid.rawValue)
                        .lineWidth(lineWidth)
                        .data(dataArr)
                    ,
                    AASeriesElement()
                        .name(AAChartLineDashStyleType.shortDash.rawValue)
                        .lineWidth(lineWidth)
                        .dashStyle(.shortDash)
                        .data(dataArr)
                    ,
                    AASeriesElement()
                        .name(AAChartLineDashStyleType.shortDot.rawValue)
                        .lineWidth(lineWidth)
                        .dashStyle(.shortDot)
                        .data(dataArr)
                    ,
                    AASeriesElement()
                        .name(AAChartLineDashStyleType.shortDashDot.rawValue)
                        .lineWidth(lineWidth)
                        .dashStyle(.shortDashDot)
                        .data(dataArr)
                    ,
                    AASeriesElement()
                        .name(AAChartLineDashStyleType.shortDashDotDot.rawValue)
                        .lineWidth(lineWidth)
                        .dashStyle(.shortDashDotDot)
                        .data(dataArr)
                    ,
                    AASeriesElement()
                        .name(AAChartLineDashStyleType.dot.rawValue)
                        .lineWidth(lineWidth)
                        .dashStyle(.dot)
                        .data(dataArr)
                    ,
                    AASeriesElement()
                        .name(AAChartLineDashStyleType.dash.rawValue)
                        .lineWidth(lineWidth)
                        .dashStyle(.dash)
                        .data(dataArr)
                    ,
                    AASeriesElement()
                        .name(AAChartLineDashStyleType.longDash.rawValue)
                        .lineWidth(lineWidth)
                        .dashStyle(.longDash)
                        .data(dataArr)
                    ,
                    AASeriesElement()
                        .name(AAChartLineDashStyleType.dashDot.rawValue)
                        .lineWidth(lineWidth)
                        .dashStyle(.dashDot)
                        .data(dataArr)
                    ,
                    AASeriesElement()
                        .name(AAChartLineDashStyleType.longDashDot.rawValue)
                        .lineWidth(lineWidth)
                        .dashStyle(.longDashDot)
                        .data(dataArr)
                    ,
                    AASeriesElement()
                        .name(AAChartLineDashStyleType.longDashDotDot.rawValue)
                        .lineWidth(lineWidth)
                        .dashStyle(.longDashDotDot)
                        .data(dataArr)
                    ,
                ]}())
    }
    
    static func lineChartWithShadow() -> AAChartModel {
        AAChartModel()
            .chartType(.line)
            .title("Line Chart With Shadow")
            .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun","Jul", "Aug", "Sep", "Oct", "Nov", "Dec"])
            .legendEnabled(false)
            .dataLabelsEnabled(false)
            .markerSymbolStyle(.borderBlank)
            .series([
                AASeriesElement()
                    .data([7.0, 6.9, 9.5, 9.6, 13.9, 14.5, 18.3, 18.2, 21.5, 25.2, 26.5, 23.3])
                    .lineWidth(4)
                    .shadow(AAShadow()
                        .offsetX(15.0)
                        .offsetY(15.0)
                        .opacity(0.1)
                        .width(9.0)
                        .color(AAColor.red))
            ])
    }
    
    //https://github.com/AAChartModel/AAChartKit/issues/1291
    static func customLineChartWithColorfulMarkersAndLines() -> AAChartModel {
        AAChartModel()
            .chartType(.line)
            .title("Custom Line Chart With Colorful Markers And Lines")
            .markerRadius(18.0)//marker点半径为8个像素
            .yAxisLineWidth(0)
            .legendEnabled(false)
            .series([
                AASeriesElement()
                    .name("Tokyo Hot")
                    .lineWidth(5.0)
                    .marker(AAMarker()
                        .states(AAMarkerStates()
                            .hover(AAMarkerHover()
                                .radius(40)
                                .lineWidth(5))))
                    .data([
                        2, 4, 8, 16, 32, 64, 128,
                        AADataElement()
                            .y(256.0)
                            .color(AAColor.red)
                            .toDic() as Any
                    ])
                    .zoneAxis(.x)
                    .zones([
                        AAZonesElement()
                            .value(1)
                            .color(AAColor.red),
                        AAZonesElement()
                            .value(2)
                            .color(AAColor.orange),
                        AAZonesElement()
                            .value(3)
                            .color(AAColor.yellow),
                        AAZonesElement()
                            .value(4)
                            .color(AAColor.green),
                        AAZonesElement()
                            .value(5)
                            .color(AAColor.cyan),
                        AAZonesElement()
                            .value(6)
                            .color(AAColor.blue),
                        AAZonesElement()
                            .value(7)
                            .color(AAColor.purple),
                    ])
                ,
            ])
    }
    
    //https://github.com/AAChartModel/AAChartKit/issues/1291
    //https://github.com/AAChartModel/AAChartKit/issues/1293
    static func customLineChartWithColorfulMarkersAndLines2() -> AAChartModel {
        AAChartModel()
            .chartType(.line)
            .title("Custom Line Chart With Colorful Markers And Lines")
            .markerRadius(25.0)//marker点半径为8个像素
            .markerSymbol(.circle)
            .yAxisLineWidth(0)
            .legendEnabled(true)
            .stacking(.normal)
            .series([
                AASeriesElement()
                    .name(AAColor.blue)
                    .lineWidth(20.0)
                    .data([
                        2048, 1024, 1024, 1024, 1024,
                        AADataElement()
                            .y(2048)
                            .color(AARgba(30, 144, 255, 1.0))
                            .toDic() as Any,
                    ])
                    .zoneAxis(.x)
                    .zones([
                        AAZonesElement()
                            .value(1)
                            .color(AARgba(30, 144, 255, 1.0)),
                        AAZonesElement()
                            .value(2)
                            .color(AARgba(30, 144, 255, 0.8)),
                        AAZonesElement()
                            .value(3)
                            .color(AARgba(30, 144, 255, 0.6)),
                        AAZonesElement()
                            .value(4)
                            .color(AARgba(30, 144, 255, 0.4)),
                        AAZonesElement()
                            .value(5)
                            .color(AARgba(30, 144, 255, 0.2)),
                    ])
                ,
                AASeriesElement()
                    .name(AAColor.red)
                    .lineWidth(20.0)
                    .data([
                        2048, 1024, 1024, 1024, 1024,
                        AADataElement()
                            .y(2048)
                            .color(AARgba(255, 0, 0, 1.0))
                            .toDic() as Any,
                    ])
                    .zoneAxis(.x)
                    .zones([
                        AAZonesElement()
                            .value(1)
                            .color(AARgba(255, 0, 0, 1.0)),
                        AAZonesElement()
                            .value(2)
                            .color(AARgba(255, 0, 0, 0.8)),
                        AAZonesElement()
                            .value(3)
                            .color(AARgba(255, 0, 0, 0.6)),
                        AAZonesElement()
                            .value(4)
                            .color(AARgba(255, 0, 0, 0.4)),
                        AAZonesElement()
                            .value(5)
                            .color(AARgba(255, 0, 0, 0.2)),
                    ])
                ,
                AASeriesElement()
                    .name(AAColor.yellow)
                    .lineWidth(20.0)
                    .data([
                        2048, 1024, 1024, 1024, 1024,
                        AADataElement()
                            .y(2048)
                            .color(AARgba(255, 215, 0, 1.0))
                            .toDic() as Any,
                    ])
                    .zoneAxis(.x)
                    .zones([
                        AAZonesElement()
                            .value(1)
                            .color(AARgba(255, 215, 0, 1.0)),
                        AAZonesElement()
                            .value(2)
                            .color(AARgba(255, 215, 0, 0.8)),
                        AAZonesElement()
                            .value(3)
                            .color(AARgba(255, 215, 0, 0.6)),
                        AAZonesElement()
                            .value(4)
                            .color(AARgba(255, 215, 0, 0.4)),
                        AAZonesElement()
                            .value(5)
                            .color(AARgba(255, 215, 0, 0.2)),
                    ])
                ,
                AASeriesElement()
                    .name(AAColor.green)
                    .lineWidth(20.0)
                    .data([
                        2048, 1024, 1024, 1024, 1024,
                        AADataElement()
                            .y(2048)
                            .color(AARgba(50, 205, 50, 1.0))
                            .toDic() as Any,
                    ])
                    .zoneAxis(.x)
                    .zones([
                        AAZonesElement()
                            .value(1)
                            .color(AARgba(50, 205, 50, 1.0)),
                        AAZonesElement()
                            .value(2)
                            .color(AARgba(50, 205, 50, 0.8)),
                        AAZonesElement()
                            .value(3)
                            .color(AARgba(50, 205, 50, 0.6)),
                        AAZonesElement()
                            .value(4)
                            .color(AARgba(50, 205, 50, 0.4)),
                        AAZonesElement()
                            .value(5)
                            .color(AARgba(50, 205, 50, 0.2)),
                    ])
                ,
                AASeriesElement()
                    .name(AAColor.purple)
                    .lineWidth(20.0)
                    .data([
                        2048, 1024, 1024, 1024, 1024,
                        AADataElement()
                            .y(2048)
                            .color(AARgba(138, 43, 226, 1.0))
                            .toDic() as Any,
                    ])
                    .zoneAxis(.x)
                    .zones([
                        AAZonesElement()
                            .value(1)
                            .color(AARgba(138, 43, 226, 1.0)),
                        AAZonesElement()
                            .value(2)
                            .color(AARgba(138, 43, 226, 0.8)),
                        AAZonesElement()
                            .value(3)
                            .color(AARgba(138, 43, 226, 0.6)),
                        AAZonesElement()
                            .value(4)
                            .color(AARgba(138, 43, 226, 0.4)),
                        AAZonesElement()
                            .value(5)
                            .color(AARgba(138, 43, 226, 0.2)),
                    ])
                ,
            ])
    }
    
    //https://github.com/AAChartModel/AAChartKit/issues/1401
    static func connectNullsForSingleAASeriesElement() -> AAChartModel {
        AAChartModel()
            .chartType(.spline)
            .subtitle("虚拟数据")
            .colorsTheme(["#1e90ff", "#ef476f", "#ffd066", "#04d69f"])
            .yAxisTitle("摄氏度")
            .dataLabelsEnabled(false)
            .yAxisGridLineWidth(0)
            .stacking(.normal)
            .markerRadius(8)
            .markerSymbolStyle(.borderBlank)
            .series({
                let dataArr = [
                    0.45, NSNull(), NSNull(),
                    0.55, 0.58, 0.62, NSNull(), NSNull(),
                    0.56, 0.67, 0.50, 0.34, 0.50, NSNull(), NSNull(), NSNull(), NSNull(),
                    0.23, 0.47, 0.46, 0.38, 0.56, 0.48, 0.36, NSNull(), NSNull(), NSNull(), NSNull(), NSNull(), NSNull(), NSNull(), NSNull(),
                    0.74, 0.66, 0.65, 0.71, 0.59, 0.65, 0.77, 0.52, 0.53, 0.58, 0.53,
                ] as [Any]
                return [
                    AASeriesElement()
                        .name("Do NOT Connect Nulls")
                        .lineWidth(5)
                        .connectNulls(false)
                        .data(dataArr),
                    AASeriesElement()
                        .name("Connect Nulls")
                        .lineWidth(5)
                        .connectNulls(true)
                        .data(dataArr),
                    AASeriesElement()
                        .name("Do NOT Connect Nulls")
                        .lineWidth(5)
                        .connectNulls(false)
                        .data(dataArr),
                    AASeriesElement()
                        .name("Connect Nulls")
                        .lineWidth(5)
                        .connectNulls(true)
                        .data(dataArr)
                ]
            }())
    }

    //https://github.com/AAChartModel/AAChartKit/issues/1419
    static func lineChartsWithLargeDifferencesInTheNumberOfDataInDifferentSeriesElement() -> AAChartModel {
        AAChartModel()
            .chartType(.line)
            .backgroundColor(AAColor.black)
            .colorsTheme(["#1e90ff", "#04d69f", "#ef476f", "#ffd066"])
            .dataLabelsEnabled(false)
            .markerRadius(0)
            .series({
                func generateRandomNumberArray(length: Int,
                                               randomRange: Int,
                                               minNum: Int) -> [Any] {
                    var randomNumArrA = [Any]()
                    for _ in 0 ..< length {
                        let randomNum = Int(arc4random()) % randomRange + minNum
                        randomNumArrA.append(randomNum)
                    }
                    return randomNumArrA
                }
                
                func generateRandomNumberMixedNullArray(length: Int,
                                                        randomRange: Int,
                                                        minNum: Int) -> [Any] {
                    var randomNumArrA = [Any]()
                    for x in 0 ..< length {
                        if (100 < x && x < 150) || (300 < x && x < 350) {
                            let randomNum = Int(arc4random()) % randomRange + minNum
                            randomNumArrA.append(randomNum)
                        } else {
                            randomNumArrA.append(NSNull())
                        }
                    }
                    return randomNumArrA
                }
                return [
                    AASeriesElement()
                        .name("2017")
                        .lineWidth(6)
                        .data(generateRandomNumberMixedNullArray(length: 3550, randomRange: 5, minNum: 100)),
                    AASeriesElement()
                        .name("2018")
                        .lineWidth(6)
                        .data(generateRandomNumberArray(length: 3550, randomRange: 100, minNum: 200)),
                    AASeriesElement()
                        .name("2019")
                        .lineWidth(6)
                        .data(generateRandomNumberArray(length: 3550, randomRange: 150, minNum: 400)),
                    AASeriesElement()
                        .name("2020")
                        .lineWidth(6)
                        .data(generateRandomNumberArray(length: 3550, randomRange: 150, minNum: 600)),
                ]
            }())
    }
    
    static func customDifferentDataLabelsShapeForColumnChart() -> AAChartModel {
        AAChartModel()
            .chartType(.line)
            .dataLabelsStyle(AAStyle(color: AAColor.white, fontSize: 50, weight: .bold))
            .series([
                AASeriesElement()
                    .name("Virtual Data")
                    .data([
                        AADataElement()
                            .y(2)
                            .dataLabels(AADataLabels()
                                .backgroundColor(AAColor.red)
                                .shape(.square)),
                        AADataElement()
                            .y(4)
                            .dataLabels(AADataLabels()
                                .backgroundColor(AAColor.orange)
                                .y(-30)
                                .shape(.callout)),
                        AADataElement()
                            .y(8)
                            .dataLabels(AADataLabels()
                                .backgroundColor(AAColor.yellow)
                                .shape(.circle)),
                        AADataElement()
                            .y(16)
                            .dataLabels(AADataLabels()
                                .backgroundColor(AAColor.green)
                                .shape(.diamond)),
                        AADataElement()
                            .y(32)
                            .dataLabels(AADataLabels()
                                .backgroundColor(AAColor.cyan)
                                .shape(.triangle)),
                    ])
            ])
    }
}
