//
//  CustomStyleForBubbleChartVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/3/1.
//  Copyright © 2024 An An. All rights reserved.
//

import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class CustomStyleForBubbleChartVC: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    override func chartConfigurationWithSelectedChartTypeString(_ selectedChartTypeStr: String) -> Any? {
        switch selectedChartTypeStr {
        case "configureNegativeColorMixedBubbleChart": return CustomStyleForBubbleChartComposer.configureNegativeColorMixedBubbleChart()
        case "showAARadialGradientPositionAllEnumValuesWithBubbleChart": return CustomStyleForBubbleChartComposer.showAARadialGradientPositionAllEnumValuesWithBubbleChart()
            
        default: return nil
        }
    }

}
