//
//  CustomStyleForScatterChartVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/3/1.
//  Copyright © 2024 An An. All rights reserved.
//

import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class CustomStyleForScatterChartVC: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    override func chartConfigurationWithSelectedChartTypeString(_ selectedChartTypeStr: String) -> Any? {
        switch selectedChartTypeStr {
        case "customScatterChartMarkerSymbolContent": return CustomStyleForScatterChartComposer.customScatterChartMarkerSymbolContent()
        case "drawLineMixedScatterChartWithPointsCoordinates2": return CustomStyleForScatterChartComposer.drawLineMixedScatterChartWithPointsCoordinates2()
            
        default: return nil
        }
    }

}
