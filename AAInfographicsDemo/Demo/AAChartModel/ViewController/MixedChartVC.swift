//
//  MixedChartVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/2/4.
//  Copyright © 2024 An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************
/*
 
 *********************************************************************************
 *
 *  🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit-Swift/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 *********************************************************************************
 
 */

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
    
