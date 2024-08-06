//
//  CustomStyleForAreaSplineChartVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/8/6.
//  Copyright © 2024 An An. All rights reserved.
//

import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class CustomStyleForAreasplineChartVC: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func chartConfigurationWithSelectedChartTypeString(_ selectedChartTypeStr: String) -> Any? {
        switch selectedChartTypeStr {
        case "withMinusNumberAreasplineChart": return CustomStyleForAreasplineChartComposer.withMinusNumberAreasplineChart()
        case "colorfulGradientAreasplineChart": return CustomStyleForAreasplineChartComposer.colorfulGradientAreasplineChart()
        case "gradientColorAreasplineChart": return CustomStyleForAreasplineChartComposer.gradientColorAreasplineChart()
        case "thresholdForAreasplineChart": return CustomStyleForAreasplineChartComposer.thresholdForAreasplineChart()
        case "customSpecialStyleDataLabelOfSingleDataElementForAreasplineChart": return CustomStyleForAreasplineChartComposer.customSpecialStyleDataLabelOfSingleDataElementForAreasplineChart()
        case "customMarkerStatesHoverStyleForAreasplineChart": return CustomStyleForAreasplineChartComposer.customMarkerStatesHoverStyleForAreasplineChart()
        case "colorfulGradientColorAndColorfulDataLabelsStepAreasplineChart": return CustomStyleForAreasplineChartComposer.colorfulGradientColorAndColorfulDataLabelsStepAreasplineChart()
        case "negativeColorMixedAreasplineChart": return CustomStyleForAreasplineChartComposer.negativeColorMixedAreasplineChart()
        case "customColorfulGradientColorZonesForAreasplineChart": return CustomStyleForAreasplineChartComposer.customColorfulGradientColorZonesForAreasplineChart()
            
        default: return nil
        }
    }

}
