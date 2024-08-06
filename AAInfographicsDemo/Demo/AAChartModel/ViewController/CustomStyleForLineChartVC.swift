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
        case "customSingleDataLabelForLineChart": return CustomStyleForLineChartComposer.customSingleDataLabelForLineChart()
        case "shadowStyleLineChart": return CustomStyleForLineChartComposer.shadowStyleLineChart()
        case "colorfulGradientLineChart": return CustomStyleForLineChartComposer.colorfulGradientLineChart()
        case "customMarkerSymbolContentLineChart": return CustomStyleForLineChartComposer.customMarkerSymbolContentLineChart()
        case "drawPointsWithCoordinatesForLineChart": return CustomStyleForLineChartComposer.drawPointsWithCoordinatesForLineChart()
        case "customHoverAndSelectHaloStyleForLineChart": return CustomStyleForLineChartComposer.customHoverAndSelectHaloStyleForLineChart()
        case "disableSomeOfLinesMouseTrackingEffectForLineChart": return CustomStyleForLineChartComposer.disableSomeOfLinesMouseTrackingEffectForLineChart()
        case "colorfulShadowLineChart": return CustomStyleForLineChartComposer.colorfulShadowLineChart()
        case "colorfulDataLabelsStepLineChart": return CustomStyleForLineChartComposer.colorfulDataLabelsStepLineChart()
        case "disableMarkerHoverEffectForLineChart": return CustomStyleForLineChartComposer.disableMarkerHoverEffectForLineChart()
        case "maxAndMinDataLabelsForLineChart": return CustomStyleForLineChartComposer.maxAndMinDataLabelsForLineChart()
        case "dashStyleTypesMixedLineChart": return CustomStyleForLineChartComposer.dashStyleTypesMixedLineChart()
        case "allLineDashStyleTypesMixedLineChart": return CustomStyleForLineChartComposer.allLineDashStyleTypesMixedLineChart()
        case "shadowLineChart": return CustomStyleForLineChartComposer.shadowLineChart()
        case "colorfulMarkersAndLinesLineChart": return CustomStyleForLineChartComposer.colorfulMarkersAndLinesLineChart()
        case "colorfulMarkersAndLinesLineChart2": return CustomStyleForLineChartComposer.colorfulMarkersAndLinesLineChart2()
        case "connectNullsForSingleAASeriesElementLineChart": return CustomStyleForLineChartComposer.connectNullsForSingleAASeriesElementLineChart()
        case "largeDifferencesInTheNumberOfDataInDifferentSeriesElementLineChart": return CustomStyleForLineChartComposer.largeDifferencesInTheNumberOfDataInDifferentSeriesElementLineChart()
        case "customDifferentDataLabelsShapeForLineChart": return CustomStyleForLineChartComposer.customDifferentDataLabelsShapeForLineChart()
            
        default: return nil
        }
    }
}
