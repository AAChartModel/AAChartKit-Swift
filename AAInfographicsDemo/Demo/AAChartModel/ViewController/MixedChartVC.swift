//
//  MixedChartVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/2/4.
//  Copyright © 2024 An An. All rights reserved.
//

import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class MixedChartVC: AABaseChartVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func chartConfigurationWithSelectedChartTypeString(_ selectedChartTypeStr: String) -> Any? {
        switch selectedChartTypeStr {
        case "arearangeMixedLine": return MixedChartComposer.configureArearangeMixedLineChart()
        case "columnrangeMixedLine": return MixedChartComposer.configureColumnrangeMixedLineChart()
        case "stackingColumnMixedLine": return MixedChartComposer.configureStackingColumnMixedLineChart()
        case "scatterMixedLine": return MixedChartComposer.configureScatterMixedLineChart()
        case "polygonMixedScatter": return MixedChartComposer.configurePolygonMixedScatterChart()
        case "polarChartMixed": return MixedChartComposer.configurePolarChartMixedChart()
        case "columnMixedScatter": return MixedChartComposer.configureColumnMixedScatterChart()
        case "PieMixedLineMixedColumn": return MixedChartComposer.configurePieMixedLineMixedColumnChart()
        case "AerasplinerangeMixedColumnrangeMixedLineChart": return MixedChartComposer.configureAerasplinerangeMixedColumnrangeMixedLineChart()
        case "boxplotMixedScatterChartWithJitter": return MixedChartComposer.boxplotMixedScatterChartWithJitter()
        default: return MixedChartComposer.configureArearangeMixedLineChart()
        }
    }
}
    
