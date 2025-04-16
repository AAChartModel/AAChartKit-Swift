//
//  AARoundedCornersVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/4/16.
//  Copyright © 2025 An An. All rights reserved.
//



import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class AARoundedCornersVC: AABaseChartVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.aaChartView?.userPluginPaths = [
            Bundle.main.path(forResource: "AARounded-Corners", ofType: "js")!,
        ]
    }
    
    override func chartConfigurationWithSelectedChartTypeString(_ selectedChartTypeStr: String) -> Any? {
//        switch selectedChartTypeStr {
//        case "freeStyleRoundedCornersStackingColumnChart": return CustomStyleForColumnChartComposer.freeStyleRoundedCornersStackingColumnChart()
//  
//        default: return MixedChartComposer.arearangeMixedLineChart()
//        }
        
        return CustomStyleForColumnChartComposer.freeStyleRoundedCornersStackingColumnChart()
    }
  
}
