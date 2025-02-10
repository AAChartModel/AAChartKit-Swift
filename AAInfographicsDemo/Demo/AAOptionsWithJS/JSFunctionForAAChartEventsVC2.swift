//
//  JSFunctionForAAChartEventsVC2.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/1/26.
//  Copyright © 2024 An An. All rights reserved.
//

import AAInfographics

class JSFunctionForAAChartEventsVC2: AABaseChartVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func chartConfigurationWithSelectedIndex(_ selectedIndex: Int) -> Any? {
        switch (selectedIndex) {
        case 0: return JSFunctionForAAChartEventsComposer2.disableHoverEventTooltipEffect()
        case 1: return JSFunctionForAAChartEventsComposer2.addClickEventToXAxisLabelAndAccessData()
        case 2: return JSFunctionForAAChartEventsComposer2.defaultSelectedAPointForLineChart()
        case 3: return JSFunctionForAAChartEventsComposer2.configureBlinkMarkerChart()
        case 4: return JSFunctionForAAChartEventsComposer2.toggleDataLabelsOnTouch()
        case 5: return JSFunctionForAAChartEventsComposer2.autoCrosshairAndTooltip()
        case 6: return JSFunctionForAAChartEventsComposer2.simpleZoomingChart()
        case 7: return JSFunctionForAAChartEventsComposer2.simpleZoomingChart2()
            
        default: return nil
        }
    }
    
}
