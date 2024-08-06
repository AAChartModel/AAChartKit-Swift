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
        case "customSingleDataLabelChart": return CustomStyleForLineChartComposer.customSingleDataLabelForLineChart()
        case "chartWithShadowStyle": return CustomStyleForLineChartComposer.shadowStyleLineChart()
        case "colorfulGradientSplineChart": return CustomStyleForLineChartComposer.colorfulGradientLineChart()
        case "customLineChartMarkerSymbolContent": return CustomStyleForLineChartComposer.customMarkerSymbolContentLineChart()
        case "drawLineChartWithPointsCoordinates": return CustomStyleForLineChartComposer.drawPointsWithCoordinatesForLineChart()
        case "customChartHoverAndSelectHaloStyle": return CustomStyleForLineChartComposer.customHoverAndSelectHaloStyleForLineChart()
        case "disableSomeOfLinesMouseTrackingEffect": return CustomStyleForLineChartComposer.disableSomeOfLinesMouseTrackingEffectForLineChart()
        case "colorfulShadowSplineChart": return CustomStyleForLineChartComposer.colorfulShadowLineChart()
        case "colorfulDataLabelsStepLineChart": return CustomStyleForLineChartComposer.colorfulDataLabelsStepLineChart()
        case "disableSplineChartMarkerHoverEffect": return CustomStyleForLineChartComposer.disableMarkerHoverEffectForLineChart()
        case "maxAndMinDataLabelsForChart": return CustomStyleForLineChartComposer.maxAndMinDataLabelsForLineChart()
        case "dashStyleTypesMixedChart": return CustomStyleForLineChartComposer.dashStyleTypesMixedLineChart()
        case "allLineDashStyleTypesMixedChart": return CustomStyleForLineChartComposer.allLineDashStyleTypesMixedLineChart()
        case "lineChartWithShadow": return CustomStyleForLineChartComposer.shadowLineChart()
        case "customLineChartWithColorfulMarkersAndLines": return CustomStyleForLineChartComposer.colorfulMarkersAndLinesLineChart()
        case "customLineChartWithColorfulMarkersAndLines2": return CustomStyleForLineChartComposer.colorfulMarkersAndLinesLineChart2()
        case "connectNullsForSingleAASeriesElement": return CustomStyleForLineChartComposer.connectNullsForSingleAASeriesElementLineChart()
        case "lineChartsWithLargeDifferencesInTheNumberOfDataInDifferentSeriesElement": return CustomStyleForLineChartComposer.largeDifferencesInTheNumberOfDataInDifferentSeriesElementLineChart()
        case "customDifferentDataLabelsShapeForColumnChart": return CustomStyleForLineChartComposer.customDifferentDataLabelsShapeForLineChart()
            
        default: return nil
        }
    }
}
