//
//  CustomStyleForAreaChartVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/3/1.
//  Copyright © 2024 An An. All rights reserved.
//

import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class CustomStyleForAreaChartVC: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func chartConfigurationWithSelectedChartTypeString(_ selectedChartTypeStr: String) -> Any? {
        switch selectedChartTypeStr {
        case "withMinusNumberAreaChart": return CustomStyleForAreaChartComposer.withMinusNumberAreaChart()
        case "colorfulGradientAreaChart": return CustomStyleForAreaChartComposer.colorfulGradientAreaChart()
        case "gradientColorAreaChart": return CustomStyleForAreaChartComposer.gradientColorAreaChart()
        case "thresholdForAreaChart": return CustomStyleForAreaChartComposer.thresholdForAreaChart()
        case "customSpecialStyleDataLabelOfSingleDataElementForAreaChart": return CustomStyleForAreaChartComposer.customSpecialStyleDataLabelOfSingleDataElementForAreaChart()
        case "customMarkerStatesHoverStyleForAreaChart": return CustomStyleForAreaChartComposer.customMarkerStatesHoverStyleForAreaChart()
        case "colorfulGradientColorAndColorfulDataLabelsStepAreaChart": return CustomStyleForAreaChartComposer.colorfulGradientColorAndColorfulDataLabelsStepAreaChart()
        case "negativeColorMixedAreaChart": return CustomStyleForAreaChartComposer.negativeColorMixedAreaChart()
        case "customColorfulGradientColorZonesForAreaChart": return CustomStyleForAreaChartComposer.customColorfulGradientColorZonesForAreaChart()
            
        default: return nil
        }
    }

}
