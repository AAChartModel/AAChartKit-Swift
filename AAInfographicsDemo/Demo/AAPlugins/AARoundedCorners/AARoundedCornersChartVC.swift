//
//  AARoundedCornersVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/4/16.
//  Copyright © 2025 An An. All rights reserved.
//



import AAInfographics
import UIKit

@available(iOS 10.0, macCatalyst 13.1, *)
class AARoundedCornersChartVC: AABaseChartVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
       
    }
  
    override func chartConfigurationWithSelectedChartType(_ selectedChartType: AAChartType) -> Any? {
        switch selectedChartType {
        case .column, .bar:
            //⚠️: 添加 JS 插件的路径, 需要在加载图表之前添加
            self.aaChartView?.userPluginPaths = [
                Bundle.main.path(forResource: "AARounded-Corners", ofType: "js")!,
            ]
        case .columnrange:
            print("通过 `AAOptions` 的 `beforeDrawChartJavaScript` 方法来加载 JavaScript 插件")
            
        default: break
        }
        
        
        switch selectedChartType {
        case .column:      return AARoundedCornersChartComposer.freeStyleRoundedCornersStackingColumnChart()
        case .bar:         return AARoundedCornersChartComposer.freeStyleRoundedCornersStackingBarChart()
        case .columnrange:
            if selectedIndex == 2 {
                return JSFunctionBeforeAndAfterRenderingComposer5.columnrangeChartSinglePrismDifferentColorZoningEffect()
            } else {
                let aaoptions = JSFunctionBeforeAndAfterRenderingComposer5.columnrangeChartSinglePrismDifferentColorZoningEffect()
                aaoptions.chart?.inverted(true)
                return aaoptions
            }
        default: return SpecialChartComposer.polarColumnChart()
        }
    }
    
}
