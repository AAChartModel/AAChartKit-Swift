//
//  ViewController.swift
//  AAChartKit-Swift
//
//  Created by An An  on 17/4/18.
//  Copyright © 2017年 An An . All rights reserved.
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


import UIKit
import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class SpecialChartVC: AABaseChartVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func chartConfigurationWithSelectedChartType(_ selectedChartType: AAChartType) -> Any? {
        switch selectedChartType {
        case .column:          return SpecialChartComposer.configurePolarColumnChart()
        case .bar:             return SpecialChartComposer.configurePolarBarChart()
        case .line:            return SpecialChartComposer.configurePolarLineChart()
        case .area:            return SpecialChartComposer.configurePolarAreaChart()
        case .spline:          return SpecialChartComposer.configureStepLineChart()
        case .areaspline:      return SpecialChartComposer.configureStepAreaChart()
        case .pie:             return SpecialChartComposer.configurePieChart()
        case .bubble:          return SpecialChartComposer.configureBubbleChart()
        case .scatter:         return SpecialChartComposer.configureScatterChart()
        case .arearange:       return SpecialChartComposer.configureArearangeChart()
        case .areasplinerange: return SpecialChartComposer.configureAreasplinerangeChart()
        case .columnrange:     return SpecialChartComposer.configureColumnrangeChart()
        case .boxplot:         return SpecialChartComposer.configureBoxplotChart()
        case .waterfall:       return SpecialChartComposer.configureWaterfallChart()
        case .pyramid:         return SpecialChartComposer.configurePyramidChart()
        case .funnel:          return SpecialChartComposer.configureFunnelChart()
        case .errorbar:        return SpecialChartComposer.configureErrorbarChart()
        case .gauge :          return SpecialChartComposer.configureGaugeChart()
        case .polygon:         return SpecialChartComposer.configurePolygonChart()
        }
    }
  
}

