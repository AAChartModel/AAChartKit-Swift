//
//  CustomStyleForSplineChartVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/8/6.
//  Copyright © 2024 An An. All rights reserved.
//

import AAInfographics

class CustomStyleForSplineChartVC: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func chartConfigurationWithSelectedChartTypeString(_ selectedChartTypeStr: String) -> Any? {
        switch selectedChartTypeStr {
        case "mixedSplineChart": return CustomStyleForSplineChartComposer.mixedSplineChart()
        case "stepSplineChart": return CustomStyleForSplineChartComposer.stepSplineChart()
        case "stepAreaChart": return CustomStyleForSplineChartComposer.stepAreaChart()
        case "customSingleDataLabelForSplineChart": return CustomStyleForSplineChartComposer.customSingleDataLabelForSplineChart()
        case "shadowStyleSplineChart": return CustomStyleForSplineChartComposer.shadowStyleSplineChart()
        case "colorfulGradientSplineChart": return CustomStyleForSplineChartComposer.colorfulGradientSplineChart()
        case "customMarkerSymbolContentSplineChart": return CustomStyleForSplineChartComposer.customMarkerSymbolContentSplineChart()
        case "drawPointsWithCoordinatesForSplineChart": return CustomStyleForSplineChartComposer.drawPointsWithCoordinatesForSplineChart()
        case "customHoverAndSelectHaloStyleForSplineChart": return CustomStyleForSplineChartComposer.customHoverAndSelectHaloStyleForSplineChart()
        case "disableSomeOfLinesMouseTrackingEffectForSplineChart": return CustomStyleForSplineChartComposer.disableSomeOfLinesMouseTrackingEffectForSplineChart()
        case "colorfulShadowSplineChart": return CustomStyleForSplineChartComposer.colorfulShadowSplineChart()
        case "colorfulDataLabelsStepSplineChart": return CustomStyleForSplineChartComposer.colorfulDataLabelsStepSplineChart()
        case "disableMarkerHoverEffectForSplineChart": return CustomStyleForSplineChartComposer.disableMarkerHoverEffectForSplineChart()
        case "maxAndMinDataLabelsForSplineChart": return CustomStyleForSplineChartComposer.maxAndMinDataLabelsForSplineChart()
        case "dashStyleTypesMixedSplineChart": return CustomStyleForSplineChartComposer.dashStyleTypesMixedSplineChart()
        case "allLineDashStyleTypesMixedSplineChart": return CustomStyleForSplineChartComposer.allLineDashStyleTypesMixedSplineChart()
        case "shadowSplineChart": return CustomStyleForSplineChartComposer.shadowSplineChart()
        case "colorfulMarkersAndLinesSplineChart": return CustomStyleForSplineChartComposer.colorfulMarkersAndLinesSplineChart()
        case "colorfulMarkersAndLinesSplineChart2": return CustomStyleForSplineChartComposer.colorfulMarkersAndLinesSplineChart2()
        case "connectNullsForSingleAASeriesElementSplineChart": return CustomStyleForSplineChartComposer.connectNullsForSingleAASeriesElementSplineChart()
        case "largeDifferencesInTheNumberOfDataInDifferentSeriesElementSplineChart": return CustomStyleForSplineChartComposer.largeDifferencesInTheNumberOfDataInDifferentSeriesElementSplineChart()
        case "customDifferentDataLabelsShapeForSplineChart": return CustomStyleForSplineChartComposer.customDifferentDataLabelsShapeForSplineChart()
            
        default: return nil
        }
    }

}
