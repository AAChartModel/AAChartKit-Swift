//
//  MixedChartVC2.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/2/6.
//  Copyright © 2025 An An. All rights reserved.
//

import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class MixedChartVC2: AABaseChartVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func chartConfigurationWithSelectedChartTypeString(_ selectedChartTypeStr: String) -> Any? {
        switch selectedChartTypeStr {
        case "scatterPlotWithTrendLine": return MixedChartComposer2.scatterPlotWithTrendLine()
        case "scatterPlotWithTrendLine2": return MixedChartComposer2.scatterPlotWithTrendLine2()
        case "pieMixedLineMixedColumnChart": return MixedChartComposer2.pieMixedLineMixedColumnChart()
        case "pieMixedLineMixedColumnChart2": return MixedChartComposer2.pieMixedLineMixedColumnChart2()
  
        default: return MixedChartComposer2.scatterPlotWithTrendLine()
        }
    }
}
