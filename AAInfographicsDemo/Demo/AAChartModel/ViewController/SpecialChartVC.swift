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

import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class SpecialChartVC: AABaseChartVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func chartConfigurationWithSelectedChartType(_ selectedChartType: AAChartType) -> Any? {
        switch selectedChartType {
        /*Basic Chart Mutant*/
        case .column:          return SpecialChartComposer.polarColumnChart()
        case .bar:             return SpecialChartComposer.polarBarChart()
        case .line:            return SpecialChartComposer.polarLineChart()
        case .area:            return SpecialChartComposer.polarAreaChart()
        case .spline:          return SpecialChartComposer.stepLineChart()
        case .areaspline:      return SpecialChartComposer.stepAreaChart()
        /*True Special Chart*/
        case .pie:             return SpecialChartComposer.pieChart()
        case .bubble:          return SpecialChartComposer.bubbleChart()
        case .packedbubble:    return SpecialChartComposer.packedbubbleChart()
        case .scatter:         return SpecialChartComposer.scatterChart()
        case .arearange:       return SpecialChartComposer.arearangeChart()
        case .areasplinerange: return SpecialChartComposer.areasplinerangeChart()
        case .columnrange:     return SpecialChartComposer.columnrangeChart()
        case .boxplot:         return SpecialChartComposer.boxplotChart()
        case .waterfall:       return SpecialChartComposer.waterfallChart()
        case .pyramid:         return SpecialChartComposer.pyramidChart()
        case .funnel:          return SpecialChartComposer.funnelChart()
        case .errorbar:        return SpecialChartComposer.errorbarChart()
        case .gauge :          return SpecialChartComposer.gaugeChart()
        case .polygon:         return SpecialChartComposer.polygonChart()
        }
    }
  
}

