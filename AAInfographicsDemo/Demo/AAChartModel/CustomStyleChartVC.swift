//
//  CustomStyleChartVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/8/21.
//  Copyright © 2019 An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************
/*
 
 *********************************************************************************
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
 *********************************************************************************
 
 */

import UIKit
import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class CustomStyleChartVC: AABaseChartVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func chartConfigurationWithSelectedIndex(_ selectedIndex: Int) -> Any? {
        switch selectedIndex {
        case 0:  return CustomStyleForColumnChartComposer.colorfulColumnChart()
        case 1:  return CustomStyleForColumnChartComposer.colorfulGradientColorColumnChart()
        case 2:  return CustomStyleForColumnChartComposer.discontinuousDataColumnChart()
        case 3:  return configureMixedLineChart()
        case 4:  return CustomStyleForColumnChartComposer.randomColorfulColumnChart()
        case 5:  return configureGradientColorBarChart()
        case 6:  return CustomStyleForColumnChartComposer.normalStackingPolarColumnChart()
        case 7:  return configureWithMinusNumberChart()
        case 8:  return configureStepLineChart()
        case 9:  return configureStepAreaChart()
        case 10: return configureNightingaleRoseChart()
        case 11: return configureCustomSingleDataLabelChart()
        case 12: return configureChartWithShadowStyle()
        case 13: return configureColorfulGradientAreaChart()
        case 14: return configureColorfulGradientSplineChart()
        case 15: return configureGradientColorAreasplineChart()
        case 16: return CustomStyleForColumnChartComposer.specialStyleForTheSingleDataElementOfColumnChart()
        case 17: return configureSpecialStyleColumnOfSingleDataElementChart()
        case 18: return configureAreaChartThreshold()
        case 19: return CustomStyleForScatterChartComposer.customScatterChartMarkerSymbolContent()
        case 20: return customLineChartMarkerSymbolContent()
        case 21: return configureTriangleRadarChart()
        case 22: return configureQuadrangleRadarChart()
        case 23: return configurePentagonRadarChart()
        case 24: return configureHexagonRadarChart()
        case 25: return drawLineChartWithPointsCoordinates()
        case 26: return customSpecialStyleDataLabelOfSingleDataElementChart()
        case 27: return customBarChartHoverColorAndSelectColor()
        case 28: return customChartHoverAndSelectHaloStyle()
        case 29: return customSplineChartMarkerStatesHoverStyle()
        case 30: return customNormalStackingChartDataLabelsContentAndStyle()
        case 31: return upsideDownPyramidChart()
        case 32: return doubleLayerPieChart()
        case 33: return doubleLayerDoubleColorsPieChart()
        case 34: return disableSomeOfLinesMouseTrackingEffect()
        case 35: return configureColorfulShadowSplineChart()
        case 36: return configureColorfulDataLabelsStepLineChart()
        case 37: return configureColorfulGradientColorAndColorfulDataLabelsStepAreaChart()
        case 38: return disableSplineChartMarkerHoverEffect()
        case 39: return configureMaxAndMinDataLabelsForChart()
        case 40: return customVerticalXAxisCategoriesLabelsByHTMLBreakLineTag()
        case 41: return CustomStyleForColumnChartComposer.noMoreGroupingAndOverlapEachOtherColumnChart()
        case 42: return CustomStyleForColumnChartComposer.noMoreGroupingAndNestedColumnChart()
        case 43: return CustomStyleForColumnChartComposer.topRoundedCornersStackingColumnChart()
        case 44: return CustomStyleForColumnChartComposer.freeStyleRoundedCornersStackingColumnChart()
        case 45: return CustomStyleForColumnChartComposer.customBorderStyleAndStatesHoverColorColumnChart()
            
        case 46: return CustomStyleForLineChartComposer.customLineChartWithColorfulMarkersAndLines()
        case 47: return CustomStyleForLineChartComposer.customLineChartWithColorfulMarkersAndLines2()
        case 48: return CustomStyleForScatterChartComposer.drawLineMixedScatterChartWithPointsCoordinates2()
        case 49: return CustomStyleForColumnChartComposer.negativeDataMixedPositiveDataColumnChart()
        case 50: return MixedChartComposer.configureMultiLevelStopsArrGradientColorAreasplineMixedLineChart()
        case 51: return CustomStyleForLineChartComposer.connectNullsForSingleAASeriesElement()
        case 52: return CustomStyleForLineChartComposer.lineChartsWithLargeDifferencesInTheNumberOfDataInDifferentSeriesElement()
        case 53: return CustomStyleForAreaChartComposer.customAreasplineChartWithColorfulGradientColorZones()

        default:
            return configureTriangleRadarChart()
        }
    }

    
    private func configureMixedLineChart() -> AAChartModel {
        AAChartModel()
            .chartType(.line)
            .subtitle("虚拟数据")
            .categories(["Java","Swift","Python","Ruby", "PHP","Go","C","C#","C++","Perl","R","MATLAB","SQL"])
            .yAxisTitle("摄氏度")
            .dataLabelsEnabled(true)
            .series([
                AASeriesElement()
                    .name("本专业")
                    .data([45,88,49,43,65,56,47,28,49,44,89,55])
                    .zoneAxis("x")
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


        
    private func configureGradientColorBarChart() -> AAChartModel {
        AAChartModel()
            .chartType(.bar)
            .title("Bar Chart")
            .subtitle("gradient color bar")
            .borderRadius(5)
            .xAxisReversed(true)
            .series([
                AASeriesElement()
                    .name("2020")
                    .data([211,183,157,133,111,91,73,57,43,31,21,13,7,3])
                    .color(AAGradientColor.oceanBlue),
                AASeriesElement()
                    .name("2021")
                    .data([111,83,187,163,151,191,173,157,143,131,121,113,97,93])
                    .color(AAGradientColor.sanguine),
                ])
    }
    

    
    private func configureWithMinusNumberChart() -> AAChartModel {
        AAChartModel()
            .chartType(.area)
            .title("带有负数的区域填充图")
            .markerRadius(0)//设置折线连接点宽度为0,即是隐藏连接点
            .subtitle("横屏查看效果更佳")
            .yAxisGridLineWidth(0)
            .dataLabelsEnabled(false)
            .categories(["Java","Swift","Python","Ruby", "PHP","Go","C","C#","C++","HTML","CSS","Perl","R","MATLAB","SQL"])
            .yAxisTitle("")
            .colorsTheme(["#49C1B6", "#FDC20A", "#F78320", "#068E81", "#EA007B"])
            .series([
                AASeriesElement()
                    .name("2017")
                    .data([0, (-7.5), (-1.0), 3.7, 0, (-3), 8, 0,(-3.6), 4, (-2), 0]),
                AASeriesElement()
                    .name("2018")
                    .data([0, (-2.2), 2, (-2.2), 0, (-1.5), 0, 2.4, (-1), 3, (-1), 0]),
                AASeriesElement()
                    .name("2019")
                    .data([0, 2.3, 0, 1.2, (-1), 3, 0, (-3.3), 0, 2, (-0.3), 0]),
                AASeriesElement()
                    .name("2020")
                    .data([0, 10, 0.13,2,0, 2, 0, 3.7, 0, 1, (-3), 0]),
                AASeriesElement()
                    .name("2020")
                    .data([0, (-4.5), (-0.9), 5.5, (-1.9), 1.3, (-2.8), 0, (-1.7), 0, 3, 0, ]),
                ])
    }
    
    private func configureStepLineChart() -> AAChartModel {
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
                    .step("right"), //折线连接点靠右👉
                AASeriesElement()
                    .name("New York")
                    .data([220, 282, 201, 234, 290, 430, 410])
                    .step("center"),//折线连接点居中
                AASeriesElement()
                    .name("Tokyo")
                    .data([120, 132, 101, 134, 90, 230, 210])
                    .step("left"),//折线连接点靠左边👈
                ])
    }
    
    private func configureStepAreaChart() -> AAChartModel {
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
    
    private func configureNightingaleRoseChart() -> AAChartModel {
        AAChartModel()
            .title("南丁格尔玫瑰图")
            .subtitle("极地图中的一种")
            .yAxisTitle("cm")
            .chartType(.column)
            //.xAxisVisible(true)//是否显示最外一层圆环
            //.yAxisVisible(false)//是否显示中间的多个圆环
            .legendEnabled(false)//隐藏图例(底部可点按的小圆点)
            .categories(["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"])
            .dataLabelsEnabled(true)
            .polar(true)//极地化图形
            .series([
                AASeriesElement()
                    .name("东京")
                    .data([7.0, 6.9, 9.5, 9.6, 13.9, 14.5, 18.3, 18.2, 21.5, 25.2, 26.5, 23.3])
                ])
    }
    
    private func configureCustomSingleDataLabelChart() -> AAChartModel {
        let dataElement = AADataElement()
            .y(1.25)
            .dataLabels(
                AADataLabels()
                    .enabled(true)
                    .format("{y} 美元🇺🇸💲")
                    .x(3)
                    .verticalAlign(.middle)
                    .style(AAStyle(color: AAColor.red, fontSize: 20, weight: .bold, outline: "1px 1px contrast")))
            .toDic()!
        
        return AAChartModel()
            .title("单独自定义某个指定数据元素的DataLabel")
            .colorsTheme([AAGradientColor.mysticMauve])
            .series([
                AASeriesElement()
                    .name("货币")
                    .data([0.38, 0.31, 0.32, 0.32, 0.64, 0.66, 0.86, dataElement, 0.52, 0.75, 0.52, 0.56, 0.54, 0.60, 0.46, 0.63, 0.54, 0.51, 0.58, 0.64, 0.60, 0.45, 0.36, 0.67])
            ])
    }
    
    private func configureChartWithShadowStyle() -> AAChartModel {
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
    
    private func configureColorfulGradientAreaChart() -> AAChartModel {
        let gradientColorDic1 = AAGradientColor.linearGradient(
            direction: .toRight,
            stops: [
                [0.0, "#febc0f"],//颜色字符串设置支持十六进制类型和 rgba 类型
                [0.5, "#FF14d4"],
                [1.0, "#0bf8f5"]
            ]
        )
        
        return AAChartModel()
            .chartType(.areaspline)
            .categories(["一月", "二月", "三月", "四月", "五月", "六月",
                         "七月", "八月", "九月", "十月", "十一月", "十二月"])
            .yAxisTitle("")
            .backgroundColor(AAColor.white)
            .markerRadius(0)
            .legendEnabled(false)
            .dataLabelsEnabled(false)
            .series([
                AASeriesElement()
                    .name("Tokyo Hot")
                    .color(gradientColorDic1)
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6]),
                ])
    }
    
    private func configureColorfulGradientSplineChart() -> AAChartModel {
        let gradientColorDic1 = AAGradientColor.linearGradient(
            direction: .toRight,
            stops: [
                [0.00, "#febc0f"] as [Any],//颜色字符串设置支持十六进制类型和 rgba 类型
                [0.25, "#FF14d4"],
                [0.50, "#0bf8f5"],
                [0.75, "#F33c52"],
                [1.00, "#1904dd"],
            ]
        )
        
        return AAChartModel()
            .chartType(.spline)
            .categories(["一月", "二月", "三月", "四月", "五月", "六月",
                         "七月", "八月", "九月", "十月", "十一月", "十二月"])
            .yAxisTitle("")
            .markerRadius(0)
            .legendEnabled(false)
            .dataLabelsEnabled(false)
            .series([
                AASeriesElement()
                    .name("Tokyo Hot")
                    .lineWidth(13)
                    .color(gradientColorDic1)
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6]),
                ])
    }
    
    private func configureGradientColorAreasplineChart() -> AAChartModel {
        let gradientColorDic1 = AAGradientColor.linearGradient(
            direction: .toBottom,
            startColor: AARgba(255, 20, 147, 1),//深粉色, alpha 透明度 1
            endColor: AARgba(255, 20, 147, 0.3)//热情的粉红, alpha 透明度 0.3
        )
        
        return AAChartModel()
            .chartType(.areaspline)
            .categories(["一月", "二月", "三月", "四月", "五月", "六月",
                         "七月", "八月", "九月", "十月", "十一月", "十二月"])
            .yAxisTitle("")
            .markerRadius(8)//marker点半径为8个像素
            .markerSymbolStyle(.innerBlank)//marker点为空心效果
            .markerSymbol(.circle)//marker点为圆形点○
            .legendEnabled(false)
            .dataLabelsEnabled(false)
            .series([
                AASeriesElement()
                    .name("Tokyo Hot")
                    .lineWidth(5.0)
                    .color(AARgba(220, 20, 60, 1))//猩红色, alpha 透明度 1
                    .fillColor(gradientColorDic1)
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6]),
                ])
    }
    

    
    private func configureSpecialStyleColumnOfSingleDataElementChart() -> AAChartModel {
        let singleSpecialData = AADataElement()
            .color(AAGradientColor.freshPapaya)
            .y(49.5)
            .toDic()!
        
        return AAChartModel()
            .chartType(.column)
            .yAxisTitle("")//设置Y轴标题
            .dataLabelsEnabled(false)//是否显示值
            .tooltipEnabled(false)
            .markerRadius(0)
            .xAxisVisible(false)
            .yAxisVisible(false)
            .series([
                AASeriesElement()
                    .name("Virtual Data")
                    .lineWidth(6)
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, singleSpecialData, 5.2, 26.5, 23.3, 26.5, 13.9, 9.6])
                    .color(AAGradientColor.oceanBlue)
            ])
    }
    
    private func configureAreaChartThreshold() -> AAChartModel {
        let gradientColorDic1 = AAGradientColor.linearGradient(
            direction: .toBottom,
            startColor: AARgba(30, 144, 255, 1), //DodgerBlue, alpha 透明度 1
            endColor: AARgba(30, 144, 255, 0.1)//DodgerBlue, alpha 透明度 0.1
        )
        
        return AAChartModel()
            .chartType(.area)
            .yAxisTitle("")//设置Y轴标题
            .yAxisGridLineWidth(0)
            .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun","July", "Aug", "Spe", "Oct", "Nov", "Dec"])
            .dataLabelsEnabled(false)//是否显示值
            .markerRadius(8)
            .markerSymbol(.circle)
            .markerSymbolStyle(.innerBlank)
            .legendEnabled(false)
            .series([
                AASeriesElement()
                    .threshold((-200))
                    .data([106.4, 129.2, 269.9, -100.5, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4])
                    .lineWidth(6)
                    .color(AARgba(30, 144, 255,1))
                    .fillColor(gradientColorDic1)
                ])
    }

    
    //refer to online sample https://jshare.com.cn/github/highcharts/highcharts/tree/master/samples/highcharts/plotoptions/series-marker-symbol/
    private func customLineChartMarkerSymbolContent() -> AAChartModel {
        let aaChartModel = CustomStyleForScatterChartComposer.customScatterChartMarkerSymbolContent()
        aaChartModel.chartType = .line
        return aaChartModel
    }

    private func configureTriangleRadarChart() -> AAChartModel {
        AAChartModel()
            .chartType(.area)
            .dataLabelsEnabled(false)
            .xAxisVisible(false)
            .markerRadius(0)
            .polar(true)
            .series([
                AASeriesElement()
                .data([15.0,15.0,15.0,]),
                AASeriesElement()
                .data([9.0,9.0,9.0,]),
                AASeriesElement()
                .data([6.0,6.0,6.0,]),
                AASeriesElement()
                .data([3.0,3.0,3.0,]),
                ])
    }
    
    private func configureQuadrangleRadarChart() -> AAChartModel {
        AAChartModel()
            .chartType(.area)
            .dataLabelsEnabled(false)
            .xAxisVisible(false)
            .markerRadius(0)
            .polar(true)
            .series([
                AASeriesElement()
                    .data([15.0,15.0,15.0,15.0,]),
                AASeriesElement()
                    .data([9.0,9.0,9.0,9.0,]),
                AASeriesElement()
                    .data([6.0,6.0,6.0,6.0,]),
                AASeriesElement()
                    .data([3.0,3.0,3.0,3.0,]),
                ])
    }
    
    private func configurePentagonRadarChart() -> AAChartModel {
        AAChartModel()
            .chartType(.area)
            .dataLabelsEnabled(false)
            .xAxisVisible(false)
            .markerRadius(0)
            .polar(true)
            .series([
                AASeriesElement()
                    .data([15.0,15.0,15.0,15.0,15.0,]),
                AASeriesElement()
                    .data([9.0,9.0,9.0,9.0,9.0,]),
                AASeriesElement()
                    .data([6.0,6.0,6.0,6.0,6.0,]),
                AASeriesElement()
                    .data([3.0,3.0,3.0,3.0,3.0,]),
                ])
    }
    
    private func configureHexagonRadarChart() -> AAChartModel {
        AAChartModel()
            .chartType(.area)
            .dataLabelsEnabled(false)
            .xAxisVisible(false)
            .markerRadius(0)
            .polar(true)
            .series([
                AASeriesElement()
                    .data([15.0,15.0,15.0,15.0,15.0,15.0,]),
                AASeriesElement()
                    .data([9.0,9.0,9.0,9.0,9.0,9.0,]),
                AASeriesElement()
                    .data([6.0,6.0,6.0,6.0,6.0,6.0,]),
                AASeriesElement()
                    .data([3.0,3.0,3.0,3.0,3.0,3.0,]),
                ])
    }
    
    private func drawLineChartWithPointsCoordinates() -> AAChartModel {
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
    
    private func customSpecialStyleDataLabelOfSingleDataElementChart() -> AAChartModel {
        let gradientColorDic1 = AAGradientColor.linearGradient(
            direction: .toBottom,
            startColor: AARgba(255, 215, 0, 0.1),//gold color, alpha: 0.1
            endColor: AARgba(255, 215, 0, 0.6)// gold color, alpha: 0.6
        )
        
        let formatStr = (
            "<img src=https://www.highcharts.com/samples/graphics/sun.png>"
          + "<span style=color:#FFFFFF;font-weight:thin;font-size:25px>{y}</span>"
          + "<span style=color:#FFFFFF;font-weight:thin;font-size:17px> m</span>"
        )

        let singleSpecialData = AADataElement()
            .dataLabels(AADataLabels()
                .enabled(true)
                .useHTML(true)
                .format(formatStr)
                .style(AAStyle()
                    .fontWeight(.bold)
                    .color(AAColor.white)
                    .fontSize(16))
                .y(-35)
                .align(.center)
                .verticalAlign(.top)
                .overflow("none")
                .crop(false))
            .y(26.5)
            .toDic()!
        
        return AAChartModel()
            .chartType(.areaspline)
            .backgroundColor("#4b2b7f")
            .yAxisTitle("")//设置Y轴标题
            .dataLabelsEnabled(false)//是否显示值
            .tooltipEnabled(true)
            .markerRadius(0)
            .xAxisVisible(false)
            .yAxisVisible(false)
            .series([
                AASeriesElement()
                    .name("Virtual Data")
                    .lineWidth(6)
                    .color(AARgba(255, 215, 0, 1))
                    .fillColor(gradientColorDic1)// gold color, alpha: 1.0
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, singleSpecialData, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
            ])
    }
        
    private func customBarChartHoverColorAndSelectColor() -> AAChartModel {
        AAChartModel()
            .chartType(.bar)
            .title("Custom Bar Chart select color")
            .yAxisTitle("")
            .yAxisReversed(true)
            .xAxisReversed(true)
            .series([
                AASeriesElement()
                    .name("ElementOne")
                    .data([211,183,157,133,111,91,73,57,43,31,21,13,7,3])
                    .allowPointSelect(true)
                    .states(AAStates()
                        .hover(AAHover()
                            .color(AARgba(220, 20, 60, 1)))//猩红色, alpha 透明度 1
                        .select(AASelect()
                            .color(AAColor.red)))
            ])
    }

    private func customChartHoverAndSelectHaloStyle() -> AAChartModel {
        AAChartModel()
            .chartType(.line)
            .title("Custom Chart Hover And Select Halo Style")
            .colorsTheme([AAColor.red])
            .yAxisTitle("")
            .yAxisReversed(true)
            .xAxisReversed(true)
            .markerRadius(20)
            .series([
                AASeriesElement()
                    .name("ElementOne")
                    .data([211,183,157,133,111,91,73,57,43,31,21,13,7,3])
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
                                        .fill(AARgba(138,43,226,1))
                                        .stroke(AARgba(30,144,255,1))))))
            ])
    }

    private func customSplineChartMarkerStatesHoverStyle() -> AAChartModel {
        AAChartModel()
            .chartType(.areaspline)
            .title("Custom Spline Chart Marker States Hover Style")
            .categories(["一月", "二月", "三月", "四月", "五月", "六月",
                         "七月", "八月", "九月", "十月", "十一月", "十二月"])
            .yAxisTitle("")
            .markerRadius(8.0)//marker点半径为8个像素
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
                                .fillColor(AAColor.white)
                                .radius(40)
                                .lineColor(AAColor.green)
                                .lineWidth(20))
                    ))
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6]),
            ])
    }

    private func customNormalStackingChartDataLabelsContentAndStyle() -> AAChartModel {
        let categories = [
            "孤岛危机",
            "使命召唤",
            "荣誉勋章",
            "狙击精英",
            "神秘海域",
            "最后生还者",
            "巫师3狂猎",
            "对马之魂",
            "死亡搁浅",
            "地狱边境",
            "闪客",
            "忍者之印"
        ]
        
        let colorsTheme = [
            "#fe117c",
            "#ffc069",
            "#06caf4",
            "#7dffc0"
        ]
        
        let element1 = AASeriesElement()
            .name("2017")
            .dataLabels(AADataLabels()
                .enabled(true)
                .y(-10)
                .format("{total} mm")
                .color(AAColor.red)
                .shape("callout")
                .backgroundColor(AAColor.white)
                .borderColor(AAColor.red)
                .borderRadius(1)
                .borderWidth(1))
            .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
        
        
        let element2 = AASeriesElement()
            .name("2018")
            .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5])
        let element3 = AASeriesElement()
            .name("2019")
            .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0])
        let element4 = AASeriesElement()
            .name("2020")
            .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8])
                
        return AAChartModel()
            .chartType(.column)
            .stacking(.normal)
            .yAxisTitle("")
            .yAxisGridLineWidth(0)
            .markerRadius(0)
            .categories(categories)
            .colorsTheme(colorsTheme)
            .series([element1, element2, element3, element4])
    }

    private func upsideDownPyramidChart() -> AAChartModel {
        AAChartModel()
            .chartType(.pyramid)
            .title("THE HEAT OF PROGRAM LANGUAGE")
            .subtitle("virtual data")
            .yAxisTitle("℃")
            .series([
                AASeriesElement()
                .name("2020")
                .reversed(false)
                .data([
                    ["swift",      11850],
                    ["Objective-C",12379],
                    ["JavaScript", 14286],
                    ["Go",         15552],
                    ["Python",     18654],
                ])
            ])
    }

    private func doubleLayerPieChart() -> AAChartModel {
        CustomStyleForPieChartComposer.doubleLayerPieChart()
    }
    
    //https://github.com/AAChartModel/AAChartKit/issues/1234
    private func doubleLayerDoubleColorsPieChart() -> AAChartModel {
        CustomStyleForPieChartComposer.doubleLayerDoubleColorsPieChart()
    }
    
    //GitHub issue https://github.com/AAChartModel/AAChartKit/issues/903
    private func disableSomeOfLinesMouseTrackingEffect() -> AAChartModel {
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
    private func configureColorfulShadowSplineChart() -> AAChartModel {
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
                        .color("#1e90ff")
                ),
                AASeriesElement()
                    .name("2018")
                    .lineWidth(5)
                    .data([0.38, 0.31, 0.32, 0.32, 0.64, 0.66, 0.86, 0.47, 0.52, 0.75, 0.52, 0.56, 0.54, 0.60, 0.46, 0.63, 0.54, 0.51, 0.58, 0.64, 0.60, 0.45, 0.36, 0.67])
                    .shadow(AAShadow()
                        .offsetX(15.0)
                        .offsetY(15.0)
                        .opacity(0.2)
                        .width(8.0)
                        .color("#ef476f")
                ),
                AASeriesElement()
                    .name("2019")
                    .lineWidth(5)
                    .data([0.46, 0.32, 0.53, 0.58, 0.86, 0.68, 0.85, 0.73, 0.69, 0.71, 0.91, 0.74, 0.60, 0.50, 0.39, 0.67, 0.55, 0.49, 0.65, 0.45, 0.64, 0.47, 0.63, 0.64])
                    .shadow(AAShadow()
                        .offsetX(15.0)
                        .offsetY(15.0)
                        .opacity(0.2)
                        .width(8.0)
                        .color("#ffd066")
                ),
                AASeriesElement()
                    .name("2020")
                    .lineWidth(5)
                    .data([0.60, 0.51, 0.52, 0.53, 0.64, 0.84, 0.65, 0.68, 0.63, 0.47, 0.72, 0.60, 0.65, 0.74, 0.66, 0.65, 0.71, 0.59, 0.65, 0.77, 0.52, 0.53, 0.58, 0.53])
                    .shadow(AAShadow()
                        .offsetX(15.0)
                        .offsetY(15.0)
                        .opacity(0.2)
                        .width(8.0)
                        .color("#04d69f")
                ),
            ])
    }
    
    // GitHub issue https://github.com/AAChartModel/AAChartKit/issues/905
    private func configureColorfulDataLabelsStepLineChart() -> AAChartModel {
        AAChartModel()
            .chartType(.line)
            .yAxisVisible(false)
            .stacking(.normal)
            .colorsTheme(["#1e90ff","#ef476f","#ffd066","#04d69f"])
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
    
    // GitHub issue https://github.com/AAChartModel/AAChartKit-Swift/issues/223
    private func configureColorfulGradientColorAndColorfulDataLabelsStepAreaChart() -> AAChartModel {
        let blueStopsArr = [
            [0.0, AARgba(30, 144, 255, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
            [0.6, AARgba(30, 144, 255, 0.2)],
            [1.0, AARgba(30, 144, 255, 0.0)]
        ]
        let gradientBlueColorDic = AAGradientColor.linearGradient(
            direction: .toBottom,
            stops: blueStopsArr
        )
        
        let redStopsArr = [
            [0.0, AARgba(255, 0, 0, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
            [0.6, AARgba(255, 0, 0, 0.2)],
            [1.0, AARgba(255, 0, 0, 0.0)]
        ]
        let gradientRedColorDic = AAGradientColor.linearGradient(
            direction: .toBottom,
            stops: redStopsArr
        )
        
        
        let goldStopsArr = [
            [0.0, AARgba(255, 215, 0, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
            [0.6, AARgba(255, 215, 0, 0.2)],
            [1.0, AARgba(255, 215, 0, 0.0)]
        ]
        let gradientGoldColorDic = AAGradientColor.linearGradient(
            direction: .toBottom,
            stops: goldStopsArr
        )
        
        
        let greenStopsArr = [
            [0.0, AARgba(50, 205, 50, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
            [0.6, AARgba(50, 205, 50, 0.2)],
            [1.0, AARgba(50, 205, 50, 0.0)]
        ]
        let gradientGreenColorDic = AAGradientColor.linearGradient(
            direction: .toBottom,
            stops: greenStopsArr
        )
        
        
        return AAChartModel()
            .chartType(.area)
            .yAxisVisible(false)
            .stacking(.normal)
            .colorsTheme(["#1e90ff","#ef476f","#ffd066","#04d69f"])
            .markerSymbol(.circle)
            .markerRadius(5)
            .dataLabelsEnabled(true)
            .markerSymbolStyle(.innerBlank)
            .series([
                AASeriesElement()
                    .name("2017")
                    .fillColor(gradientBlueColorDic)
                    .lineWidth(6)
                    .step((true))
                    .dataLabels(AADataLabels()
                        .style(AAStyle(color: "#1e90ff", fontSize: 11)))
                    .data([2.10, 2.54, 2.78, 3.62, 4.41, 4.09, 3.83, 4.47, 4.20, 3.94, 3.80, 3.58, 3.19, 4.30, 3.69, 3.52, 3.02, 3.30]),
                AASeriesElement()
                    .name("2018")
                    .fillColor(gradientRedColorDic)
                    .lineWidth(6)
                    .step((true))
                    .dataLabels(AADataLabels()
                        .style(AAStyle(color: "#ef476f", fontSize: 11)))
                    .data([1.56, 1.91, 2.45, 3.87, 3.24, 4.90, 4.61, 4.10, 4.17, 3.85, 4.17, 3.46, 3.46, 3.55, 3.50, 4.13, 2.58, 2.28]),
                AASeriesElement()
                    .name("2019")
                    .fillColor(gradientGoldColorDic)
                    .lineWidth(6)
                    .step((true))
                    .dataLabels(AADataLabels()
                        .style(AAStyle(color: "#ffd066", fontSize: 11)))
                    .data([1.16, 1.67, 2.64, 2.86, 3.00, 3.21, 4.14, 4.07, 3.68, 3.11, 3.41, 3.25, 3.32, 3.07, 3.92, 3.05, 2.18, 3.24]),
                AASeriesElement()
                    .name("2020")
                    .fillColor(gradientGreenColorDic)
                    .lineWidth(6)
                    .step((true))
                    .dataLabels(AADataLabels()
                        .style(AAStyle(color: "#04d69f", fontSize: 11)))
                    .data([5.59, 3.09, 4.09, 6.14, 5.33, 6.05, 5.71, 6.22, 6.56, 4.75, 5.27, 6.02, 5.22, 5.77, 6.19, 5.68, 4.33, 5.48]),
            ])
    }
    
    // https://github.com/AAChartModel/AAChartKit/issues/1318
    // Refer to https://api.highcharts.com.cn/highcharts#plotOptions.spline.marker.states.hover.enabled
    private func disableSplineChartMarkerHoverEffect() -> AAChartModel {
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
    private func configureMaxAndMinDataLabelsForChart() -> AAChartModel {
        let aaDataLabels = AADataLabels()
            .enabled(true)
            .format("{y} 美元")
            .shape("callout")
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
        
        return AAChartModel()
            .chartType(.spline)
            .dataLabelsEnabled(false)//是否显示值
            .tooltipEnabled(false)
            .markerRadius(0)
            .xAxisVisible(false)
            .yAxisVisible(false)
            .series([
                AASeriesElement()
                    .name("Show The Max and Min values Data Labels")
                    .lineWidth(7)
                    .data([7.0, 6.9, minData, 14.5, 18.2, maxData, 5.2, 26.5, 23.3, 26.5, 13.9, 9.6])
                    .color(AAGradientColor.oceanBlue)
            ])
    }

    //https://github.com/AAChartModel/AAChartKit/issues/1201
    private func customVerticalXAxisCategoriesLabelsByHTMLBreakLineTag() -> AAChartModel {
        AAChartModel()
            .chartType(.area)
            .categories([
                "孤<br>岛<br>危<br>机",
                "使<br>命<br>召<br>唤",
                "荣<br>誉<br>勋<br>章",
                "狙<br>击<br>精<br>英",
                "神<br>秘<br>海<br>域",
                "最<br>后<br>生<br>还<br>者",
                "巫<br>师<br>3<br>狂<br>猎",
                "对<br>马<br>之<br>魂",
                "蝙<br>蝠<br>侠<br>阿<br>甘<br>骑<br>士<br>",
                "地<br>狱<br>边<br>境",
                "闪<br>客",
                "忍<br>者<br>之<br>印"
            ])
            .tooltipEnabled(false)
            .borderRadius(3)
            .markerSymbolStyle(.innerBlank)
            .xAxisLabelsStyle(AAStyle(color: AAColor.black, fontSize: 16, weight: .bold))
            .series([
                AASeriesElement()
                    .name("2017")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]),
                AASeriesElement()
                    .name("2018")
                    .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]),
                AASeriesElement()
                    .name("2019")
                    .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]),
                AASeriesElement()
                    .name("2020")
                    .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]),
            ])
    }



}
