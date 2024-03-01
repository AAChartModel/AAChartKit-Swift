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
        case "configureWithMinusNumberChart": return CustomStyleForAreaChartComposer.configureWithMinusNumberChart()
        case "configureColorfulGradientAreaChart": return CustomStyleForAreaChartComposer.configureColorfulGradientAreaChart()
        case "configureGradientColorAreasplineChart": return CustomStyleForAreaChartComposer.configureGradientColorAreasplineChart()
        case "configureAreaChartThreshold": return CustomStyleForAreaChartComposer.configureAreaChartThreshold()
        case "customSpecialStyleDataLabelOfSingleDataElementChart": return CustomStyleForAreaChartComposer.customSpecialStyleDataLabelOfSingleDataElementChart()
        case "customSplineChartMarkerStatesHoverStyle": return CustomStyleForAreaChartComposer.customSplineChartMarkerStatesHoverStyle()
        case "configureColorfulGradientColorAndColorfulDataLabelsStepAreaChart": return CustomStyleForAreaChartComposer.configureColorfulGradientColorAndColorfulDataLabelsStepAreaChart()
        case "configureNegativeColorMixedAreasplineChart": return CustomStyleForAreaChartComposer.configureNegativeColorMixedAreasplineChart()
        case "customAreasplineChartWithColorfulGradientColorZones": return CustomStyleForAreaChartComposer.customAreasplineChartWithColorfulGradientColorZones()
            
        default: return nil
        }
    }

}
