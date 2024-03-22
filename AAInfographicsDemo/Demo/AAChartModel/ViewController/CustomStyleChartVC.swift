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
        case 3:  return CustomStyleForLineChartComposer.mixedLineChart()
        case 4:  return CustomStyleForColumnChartComposer.randomColorfulColumnChart()
        case 5:  return configureGradientColorBarChart()
        case 6:  return CustomStyleForColumnChartComposer.normalStackingPolarColumnChart()
        case 7:  return CustomStyleForAreaChartComposer.withMinusNumberChart()
        case 8:  return CustomStyleForLineChartComposer.stepLineChart()
        case 9:  return CustomStyleForLineChartComposer.stepAreaChart()
        case 10: return configureNightingaleRoseChart()
        case 11: return CustomStyleForLineChartComposer.customSingleDataLabelChart()
        case 12: return CustomStyleForLineChartComposer.chartWithShadowStyle()
        case 13: return CustomStyleForAreaChartComposer.colorfulGradientAreaChart()
        case 14: return CustomStyleForLineChartComposer.colorfulGradientSplineChart()
        case 15: return CustomStyleForAreaChartComposer.gradientColorAreasplineChart()
        case 16: return CustomStyleForColumnChartComposer.specialStyleForTheSingleDataElementOfColumnChart()
        case 17: return CustomStyleForColumnChartComposer.customSingleDataElementSpecialStyleForColumnChart()
        case 18: return CustomStyleForAreaChartComposer.areaChartThreshold()
        case 19: return CustomStyleForScatterChartComposer.customScatterChartMarkerSymbolContent()
        case 20: return CustomStyleForLineChartComposer.customLineChartMarkerSymbolContent()
        case 21: return configureTriangleRadarChart()
        case 22: return configureQuadrangleRadarChart()
        case 23: return configurePentagonRadarChart()
        case 24: return configureHexagonRadarChart()
        case 25: return CustomStyleForLineChartComposer.drawLineChartWithPointsCoordinates()
        case 26: return CustomStyleForAreaChartComposer.customSpecialStyleDataLabelOfSingleDataElementChart()
        case 27: return CustomStyleForColumnChartComposer.customHoverColorAndSelectColorForColumnChart()
        case 28: return CustomStyleForLineChartComposer.customChartHoverAndSelectHaloStyle()
        case 29: return CustomStyleForAreaChartComposer.customSplineChartMarkerStatesHoverStyle()
        case 30: return CustomStyleForColumnChartComposer.customNormalStackingChartDataLabelsContentAndStyleForColumnChart()
        case 31: return upsideDownPyramidChart()
        case 32: return CustomStyleForPieChartComposer.doubleLayerPieChart()
        case 33: return CustomStyleForPieChartComposer.doubleLayerDoubleColorsPieChart()
        case 34: return CustomStyleForLineChartComposer.disableSomeOfLinesMouseTrackingEffect()
        case 35: return CustomStyleForLineChartComposer.colorfulShadowSplineChart()
        case 36: return CustomStyleForLineChartComposer.colorfulDataLabelsStepLineChart()
        case 37: return CustomStyleForAreaChartComposer.colorfulGradientColorAndColorfulDataLabelsStepAreaChart()
        case 38: return CustomStyleForLineChartComposer.disableSplineChartMarkerHoverEffect()
        case 39: return CustomStyleForLineChartComposer.maxAndMinDataLabelsForChart()
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
        case 50: return MixedChartComposer.multiLevelStopsArrGradientColorAreasplineMixedLineChart()
        case 51: return CustomStyleForLineChartComposer.connectNullsForSingleAASeriesElement()
        case 52: return CustomStyleForLineChartComposer.lineChartsWithLargeDifferencesInTheNumberOfDataInDifferentSeriesElement()
        case 53: return CustomStyleForAreaChartComposer.customAreasplineChartWithColorfulGradientColorZones()

        default:
            return configureTriangleRadarChart()
        }
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
