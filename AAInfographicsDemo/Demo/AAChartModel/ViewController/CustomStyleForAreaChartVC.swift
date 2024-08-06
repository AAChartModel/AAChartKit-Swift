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
        case "withMinusNumberChart": return CustomStyleForAreaChartComposer.withMinusNumberAreaChart()
        case "colorfulGradientAreaChart": return CustomStyleForAreaChartComposer.colorfulGradientAreaChart()
        case "gradientColorAreasplineChart": return CustomStyleForAreaChartComposer.gradientColorAreaChart()
        case "areaChartThreshold": return CustomStyleForAreaChartComposer.thresholdForAreaChart()
        case "customSpecialStyleDataLabelOfSingleDataElementChart": return CustomStyleForAreaChartComposer.customSpecialStyleDataLabelOfSingleDataElementForAreaChart()
        case "customSplineChartMarkerStatesHoverStyle": return CustomStyleForAreaChartComposer.customMarkerStatesHoverStyleForAreaChart()
        case "colorfulGradientColorAndColorfulDataLabelsStepAreaChart": return CustomStyleForAreaChartComposer.colorfulGradientColorAndColorfulDataLabelsStepAreaChart()
        case "negativeColorMixedAreasplineChart": return CustomStyleForAreaChartComposer.negativeColorMixedAreaChart()
        case "customAreasplineChartWithColorfulGradientColorZones": return CustomStyleForAreaChartComposer.customColorfulGradientColorZonesForAreaChart()
            
        default: return nil
        }
    }

}
