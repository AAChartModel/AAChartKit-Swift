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
        case "arearangeMixedLineChart": return MixedChartComposer.arearangeMixedLineChart()
        case "columnrangeMixedLineChart": return MixedChartComposer.columnrangeMixedLineChart()
        case "stackingColumnMixedLineChart": return MixedChartComposer.stackingColumnMixedLineChart()
        case "scatterMixedLineChart": return MixedChartComposer.scatterMixedLineChart()
        case "polygonMixedScatterChart": return MixedChartComposer.polygonMixedScatterChart()
        case "polarChartMixedChart": return MixedChartComposer.polarChartMixedChart()
        case "columnMixedScatterChart": return MixedChartComposer.columnMixedScatterChart()
        case "pieMixedLineMixedColumnChart": return MixedChartComposer.pieMixedLineMixedColumnChart()
        case "aerasplinerangeMixedColumnrangeMixedLineChart": return MixedChartComposer.areasplinerangeMixedColumnrangeMixedLineChart()
        case "boxplotMixedScatterChartWithJitterChart": return MixedChartComposer.boxplotMixedScatterChartWithJitter()
        case "multiLevelStopsArrGradientColorAreasplineMixedLineChart": return MixedChartComposer.multiLevelStopsArrGradientColorAreasplineMixedLineChart()
        default: return MixedChartComposer.arearangeMixedLineChart()
        }
    }
}
    
