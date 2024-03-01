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
        case "configureMixedLineChart": return CustomStyleForLineChartComposer.configureMixedLineChart()
        case "configureStepLineChart": return CustomStyleForLineChartComposer.configureStepLineChart()
        case "configureStepAreaChart": return CustomStyleForLineChartComposer.configureStepAreaChart()
        case "configureCustomSingleDataLabelChart": return CustomStyleForLineChartComposer.configureCustomSingleDataLabelChart()
        case "configureChartWithShadowStyle": return CustomStyleForLineChartComposer.configureChartWithShadowStyle()
        case "configureColorfulGradientSplineChart": return CustomStyleForLineChartComposer.configureColorfulGradientSplineChart()
        case "customLineChartMarkerSymbolContent": return CustomStyleForLineChartComposer.customLineChartMarkerSymbolContent()
        case "drawLineChartWithPointsCoordinates": return CustomStyleForLineChartComposer.drawLineChartWithPointsCoordinates()
        case "customChartHoverAndSelectHaloStyle": return CustomStyleForLineChartComposer.customChartHoverAndSelectHaloStyle()
        case "disableSomeOfLinesMouseTrackingEffect": return CustomStyleForLineChartComposer.disableSomeOfLinesMouseTrackingEffect()
        case "configureColorfulShadowSplineChart": return CustomStyleForLineChartComposer.configureColorfulShadowSplineChart()
        case "configureColorfulDataLabelsStepLineChart": return CustomStyleForLineChartComposer.configureColorfulDataLabelsStepLineChart()
        case "disableSplineChartMarkerHoverEffect": return CustomStyleForLineChartComposer.disableSplineChartMarkerHoverEffect()
        case "configureMaxAndMinDataLabelsForChart": return CustomStyleForLineChartComposer.configureMaxAndMinDataLabelsForChart()
        case "configureDashStyleTypesMixedChart": return CustomStyleForLineChartComposer.configureDashStyleTypesMixedChart()
        case "configureAllLineDashStyleTypesMixedChart": return CustomStyleForLineChartComposer.configureAllLineDashStyleTypesMixedChart()
        case "configureLineChartWithShadow": return CustomStyleForLineChartComposer.configureLineChartWithShadow()
        case "customLineChartWithColorfulMarkersAndLines": return CustomStyleForLineChartComposer.customLineChartWithColorfulMarkersAndLines()
        case "customLineChartWithColorfulMarkersAndLines2": return CustomStyleForLineChartComposer.customLineChartWithColorfulMarkersAndLines2()
        case "connectNullsForSingleAASeriesElement": return CustomStyleForLineChartComposer.connectNullsForSingleAASeriesElement()
        case "lineChartsWithLargeDifferencesInTheNumberOfDataInDifferentSeriesElement": return CustomStyleForLineChartComposer.lineChartsWithLargeDifferencesInTheNumberOfDataInDifferentSeriesElement()
        case "customDifferentDataLabelsShapeForColumnChart": return CustomStyleForLineChartComposer.customDifferentDataLabelsShapeForColumnChart()
            
        default: return nil
        }
    }
}
