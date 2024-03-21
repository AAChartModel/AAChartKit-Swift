//
//  CustomStyleForLineChartVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/3/1.
//  Copyright © 2024 An An. All rights reserved.
//

import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class CustomStyleForLineChartVC: AABaseChartVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func chartConfigurationWithSelectedChartTypeString(_ selectedChartTypeStr: String) -> Any? {
        switch selectedChartTypeStr {
        case "mixedLineChart": return CustomStyleForLineChartComposer.mixedLineChart()
        case "stepLineChart": return CustomStyleForLineChartComposer.stepLineChart()
        case "stepAreaChart": return CustomStyleForLineChartComposer.stepAreaChart()
        case "customSingleDataLabelChart": return CustomStyleForLineChartComposer.customSingleDataLabelChart()
        case "chartWithShadowStyle": return CustomStyleForLineChartComposer.chartWithShadowStyle()
        case "colorfulGradientSplineChart": return CustomStyleForLineChartComposer.colorfulGradientSplineChart()
        case "customLineChartMarkerSymbolContent": return CustomStyleForLineChartComposer.customLineChartMarkerSymbolContent()
        case "drawLineChartWithPointsCoordinates": return CustomStyleForLineChartComposer.drawLineChartWithPointsCoordinates()
        case "customChartHoverAndSelectHaloStyle": return CustomStyleForLineChartComposer.customChartHoverAndSelectHaloStyle()
        case "disableSomeOfLinesMouseTrackingEffect": return CustomStyleForLineChartComposer.disableSomeOfLinesMouseTrackingEffect()
        case "colorfulShadowSplineChart": return CustomStyleForLineChartComposer.colorfulShadowSplineChart()
        case "colorfulDataLabelsStepLineChart": return CustomStyleForLineChartComposer.colorfulDataLabelsStepLineChart()
        case "disableSplineChartMarkerHoverEffect": return CustomStyleForLineChartComposer.disableSplineChartMarkerHoverEffect()
        case "maxAndMinDataLabelsForChart": return CustomStyleForLineChartComposer.maxAndMinDataLabelsForChart()
        case "dashStyleTypesMixedChart": return CustomStyleForLineChartComposer.dashStyleTypesMixedChart()
        case "allLineDashStyleTypesMixedChart": return CustomStyleForLineChartComposer.allLineDashStyleTypesMixedChart()
        case "lineChartWithShadow": return CustomStyleForLineChartComposer.lineChartWithShadow()
        case "customLineChartWithColorfulMarkersAndLines": return CustomStyleForLineChartComposer.customLineChartWithColorfulMarkersAndLines()
        case "customLineChartWithColorfulMarkersAndLines2": return CustomStyleForLineChartComposer.customLineChartWithColorfulMarkersAndLines2()
        case "connectNullsForSingleAASeriesElement": return CustomStyleForLineChartComposer.connectNullsForSingleAASeriesElement()
        case "lineChartsWithLargeDifferencesInTheNumberOfDataInDifferentSeriesElement": return CustomStyleForLineChartComposer.lineChartsWithLargeDifferencesInTheNumberOfDataInDifferentSeriesElement()
        case "customDifferentDataLabelsShapeForColumnChart": return CustomStyleForLineChartComposer.customDifferentDataLabelsShapeForColumnChart()
            
        default: return nil
        }
    }
}
