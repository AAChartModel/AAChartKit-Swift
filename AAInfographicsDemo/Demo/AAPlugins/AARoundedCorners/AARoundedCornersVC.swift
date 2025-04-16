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
        
        print("--- Testing AAOptions ---")
        let testOptionsDic = AAOptions()
            .borderRadiusTopLeft(1) // Changed values
            .borderRadiusTopRight(2)
            .borderRadiusBottomLeft(3)
            .borderRadiusBottomRight(4)
            .toDic()
        print(testOptionsDic)
        
        print("\n--- Testing AASeriesElement ---")
       let testDic = AASeriesElement()
            .borderRadiusTopLeft(5) // Changed values
            .borderRadiusTopRight(6)
            .borderRadiusBottomLeft(7)
            .borderRadiusBottomRight(8)
            .toDic()
        print(testDic)
        
        print("\n--- Testing AAPlotOptions ---")
        let testlineDic = AAPlotOptions()
            .borderRadiusTopLeft(9) // Changed values
            .borderRadiusTopRight(10)
            .borderRadiusBottomLeft(11)
            .borderRadiusBottomRight(12)
             .toDic()
         print(testlineDic)
        
        // 确保图表绘制逻辑被注释掉或移除，以便只关注这些测试打印
    }
    
    // override func chartConfigurationWithSelectedChartTypeString(_ selectedChartTypeStr: String) -> Any? { ... }
  
}
