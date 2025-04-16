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
class AARoundedCornersVC: AABaseChartVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.aaChartView?.userPluginPaths = [
            Bundle.main.path(forResource: "AARounded-Corners", ofType: "js")!,
        ]
        
        print("--- Testing AAOptions ---")
        let testOptions = AAOptions()
            .borderRadiusTopLeft(1) // Changed values
            .borderRadiusTopRight(2)
            .borderRadiusBottomLeft(3)
            .borderRadiusBottomRight(4)
        print(testOptions.toDic())
        
        print("\n--- Testing AASeriesElement ---")
        print("\nStep 1: 创建元素并设置属性")
        let seriesElement = AASeriesElement()
            .borderRadiusTopLeft(5) 
            .borderRadiusTopRight(6)
            .borderRadiusBottomLeft(7)
            .borderRadiusBottomRight(8)

        
        print("\nStep 2: 验证关联对象存储")
        print("borderRadiusTopLeft = \(String(describing: seriesElement.borderRadiusTopLeft))")
        print("borderRadiusTopRight = \(String(describing: seriesElement.borderRadiusTopRight))")
        print("borderRadiusBottomLeft = \(String(describing: seriesElement.borderRadiusBottomLeft))")
        print("borderRadiusBottomRight = \(String(describing: seriesElement.borderRadiusBottomRight))")
        
        print("\nStep 3: 标准 toDic()")
        let standardDic = seriesElement.toDic()
        print(standardDic)
        
        print("\nStep 4: 直接调用 toRoundedCornersDic()")
        let roundedDic = seriesElement.toRoundedCornersDic()
        print(roundedDic)
        
        print("\n--- Testing AAPlotOptions ---")
        print("\nStep 1: 创建元素并设置属性")
        let plotOptions = AAPlotOptions()
            .borderRadiusTopLeft(9)
            .borderRadiusTopRight(10)
            .borderRadiusBottomLeft(11)
            .borderRadiusBottomRight(12)
        
        print("\nStep 2: 验证关联对象存储")
        print("borderRadiusTopLeft = \(String(describing: plotOptions.borderRadiusTopLeft))")
        print("borderRadiusTopRight = \(String(describing: plotOptions.borderRadiusTopRight))")
        print("borderRadiusBottomLeft = \(String(describing: plotOptions.borderRadiusBottomLeft))")
        print("borderRadiusBottomRight = \(String(describing: plotOptions.borderRadiusBottomRight))")
        
        print("\nStep 3: 标准 toDic()")
        let poStandardDic = plotOptions.toDic()
        print(poStandardDic)
        
        print("\nStep 4: 直接调用 toRoundedCornersDic()")
        let poRoundedDic = plotOptions.toRoundedCornersDic()
        print(poRoundedDic)
        
        // 确保图表绘制逻辑被注释掉或移除，以便只关注这些测试打印
        
        // 添加调试按钮
        addDebugButtonToTestAAOptionsImplementation()
        
        print("\n--- 分析AAOptions和其他类的序列化实现差异 ---")
        let optionsClass = String(describing: type(of: AAOptions()))
        let seriesElementClass = String(describing: type(of: AASeriesElement()))
        let plotOptionsClass = String(describing: type(of: AAPlotOptions()))
        
        print("AAOptions 类名称: \(optionsClass)")
        print("AASeriesElement 类名称: \(seriesElementClass)")
        print("AAPlotOptions 类名称: \(plotOptionsClass)")
    }
    
    func addDebugButtonToTestAAOptionsImplementation() {
        let button = UIButton(type: .system)
        button.setTitle("检查AAOptions实现", for: .normal)
        button.addTarget(self, action: #selector(checkAAOptionsImplementation), for: .touchUpInside)
        button.frame = CGRect(x: 20, y: 80, width: 200, height: 44)
        self.view.addSubview(button)
    }
    
    @objc func checkAAOptionsImplementation() {
        let options = AAOptions()
        let seriesElement = AASeriesElement()
        let plotOptions = AAPlotOptions()
        
        print("==== 类的协议实现检查 ====")
        print("AAOptions 是否实现 AASerializableWithComputedProperties: \(options is AASerializableWithComputedProperties)")
        print("AASeriesElement 是否实现 AASerializableWithComputedProperties: \(seriesElement is AASerializableWithComputedProperties)")
        print("AAPlotOptions 是否实现 AASerializableWithComputedProperties: \(plotOptions is AASerializableWithComputedProperties)")
        
        print("\n==== 类继承关系检查 ====")
        print("AAOptions 是否继承自 AAObject: \(options is AAObject)")
        print("AASeriesElement 是否继承自 AAObject: \(seriesElement is AAObject)")
        print("AAPlotOptions 是否继承自 AAObject: \(plotOptions is AAObject)")
        
        let optionsMirror = Mirror(reflecting: options)
        
        print("\n==== AAOptions 类结构分析 ====")
        print("子元素数量: \(optionsMirror.children.count)")
        for (label, value) in optionsMirror.children {
            print("属性: \(String(describing: label)), 值类型: \(type(of: value))")
        }
        
        print("\n==== 测试手动调用 computedProperties() ====")
        if let computable = seriesElement as? AASerializableWithComputedProperties {
            print("AASeriesElement 手动调用 computedProperties(): \(computable.computedProperties())")
        }
        
        if let computable = plotOptions as? AASerializableWithComputedProperties {
            print("AAPlotOptions 手动调用 computedProperties(): \(computable.computedProperties())")
        }
    }
    
    // override func chartConfigurationWithSelectedChartTypeString(_ selectedChartTypeStr: String) -> Any? { ... }
  
}
