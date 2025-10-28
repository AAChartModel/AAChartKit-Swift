//
//  CustomStyleForLineChartVC2.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/10/28.
//  Copyright © 2025 An An. All rights reserved.
//


import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class CustomStyleForLineChartVC2: AABaseChartVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func chartConfigurationWithSelectedChartTypeString(_ selectedChartTypeStr: String) -> Any? {
        switch selectedChartTypeStr {
        case "colorfulMarkerWithZonesChart": return CustomStyleForLineChartComposer2.colorfulMarkerWithZonesChart()
      
            
        default: return nil
        }
    }
}
