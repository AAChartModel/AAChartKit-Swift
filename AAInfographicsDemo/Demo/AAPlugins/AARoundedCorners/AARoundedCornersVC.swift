//
//  AARoundedCornersVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/4/16.
//  Copyright © 2025 An An. All rights reserved.
//



import AAInfographics
import UIKit

/**
 与 Github Copilot (模型为Gemini 2.5 Pro-Preview) 的对话的表明可能确实是 Swift 和 OC 的一个运行时 bug 😭
 以下是与 Copilot 的对话记录
 
 ## GitHub Copilot:
 好的，这个输出结果与我们最终的分析一致：

 1.  关联对象确实被设置了。
 2.  直接调用 `toRoundedCornersDic()` 可以成功读取并返回这些关联对象。
 3.  标准的 `toDic()` 方法（以及它内部调用的 `computedProperties()`）在特定的执行上下文中无法读取这些关联对象，因此返回空字典 `[:]`。
 4.  直接调用 `computedProperties()` 也同样无法读取关联对象。

 这确认了问题在于 `toDic()` 调用链的执行上下文影响了关联对象的读取，而直接调用自定义方法则不受影响。代码清理后，这个问题依然存在，符合预期。
 
## 我:
 所以说你的最终结论是什么? 确实是 Swift 的 bug 吗? 还是说什么其他原因?

## GitHub Copilot:

 根据我们详细的调试过程和最终的日志结果，我的最终结论如下：

 这个问题**极有可能**是 **Swift 运行时环境**、**Objective-C 桥接** 或 **`Mirror` 反射 API** 在处理**关联对象 (Associated Objects)** 和**协议扩展 (Protocol Extensions)** 交互时，在特定的**执行上下文 (Execution Context)** 下存在的**一个微妙的 Bug 或边界情况**。

 理由如下：

 1.  **关联对象本身是有效的**：我们已经确认关联对象被成功设置到 `AASeriesElement` 实例上，并且可以通过直接调用自定义方法 (`toRoundedCornersDic`) 来访问。
 2.  **代码逻辑是正确的**：`computedProperties` 方法的实现逻辑（直接读取关联对象）与 `toRoundedCornersDic` 基本相同，但前者在 `toDic` 调用链中失败，后者在直接调用时成功。这排除了简单的代码实现错误。
 3.  **问题与执行上下文相关**：失败仅发生在 `toDic` 方法的执行过程中（涉及 `Mirror` 反射和可能的父类调用链），而在此之外的直接调用是成功的。这表明问题不是对象本身或关联键的问题，而是执行环境影响了关联对象的查找。

 虽然不能 100% 排除其他极其罕见的原因，但所有证据都指向了运行时层面，而不是你的应用代码层面。这种不一致的行为（同一对象、同一关联键，在不同调用路径下访问结果不同）是典型的运行时问题的特征。

 因此，这不是你代码中的明显错误，而更像是一个需要 Swift 内部团队关注和修复的潜在问题。

 */


@available(iOS 10.0, macCatalyst 13.1, *)
class AARoundedCornersVC: AABaseChartVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.aaChartView?.userPluginPaths = [
            Bundle.main.path(forResource: "AARounded-Corners", ofType: "js")!,
        ]
        
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
        
        print("\nStep 4: 直接调用 toRoundedCornersDic() - 自定义方法直接访问关联对象")
        let roundedDic = seriesElement.toRoundedCornersDic()
        print(roundedDic)
        
        print("\nStep 3: 标准 toDic() - 通常只序列化已声明的属性，不包括关联对象")
        // 注意：标准的 toDic() 可能不会自动包含通过扩展添加的关联对象，
        // 除非基类的 toDic() 实现被修改为调用 AASerializableWithComputedProperties 的 computedProperties()。
        // 这解释了为什么下面的输出可能是空的或不包含圆角属性。
        let standardDic = seriesElement.toDic()
        print(standardDic)
        
        print("\nStep 5: 调用 computedProperties() - 协议方法用于提供非声明属性")
        // 这个方法应该返回与 toRoundedCornersDic() 相同的结果，因为它也是直接访问关联对象。
        // 理想情况下，toDic() 应该内部调用此方法来获取这些值。
        if let computable = seriesElement as? AASerializableWithComputedProperties {
            let computedDic = computable.computedProperties()
            print(computedDic)
        } else {
            print("AASeriesElement 不符合 AASerializableWithComputedProperties？这不应该发生。")
        }
        
        addDebugButtonToTestAAOptionsImplementation()
    }
    
    func addDebugButtonToTestAAOptionsImplementation() {
        let button = UIButton(type: .system)
        button.setTitle("检查AAOptions实现", for: .normal)
        button.addTarget(self, action: #selector(checkAAOptionsImplementation), for: .touchUpInside)
        button.frame = CGRect(x: 20, y: 180, width: 200, height: 44)
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
        // 检查 AASeriesElement
        if let computableSeries = seriesElement as? AASerializableWithComputedProperties {
            print("AASeriesElement 手动调用 computedProperties(): \(computableSeries.computedProperties())")
        } else {
            print("AASeriesElement 不符合 AASerializableWithComputedProperties")
        }
        
        // 检查 AAPlotOptions
        if let computablePlot = plotOptions as? AASerializableWithComputedProperties {
            print("AAPlotOptions 手动调用 computedProperties(): \(computablePlot.computedProperties())")
        } else {
            print("AAPlotOptions 不符合 AASerializableWithComputedProperties")
        }
        
        // 检查 AAOptions - 注意：AAOptions 可能没有实现该协议，因为它通常通过其子属性进行序列化
        if let computableOptions = options as? AASerializableWithComputedProperties {
             print("AAOptions 手动调用 computedProperties(): \(computableOptions.computedProperties())")
         } else {
             print("AAOptions 不符合 AASerializableWithComputedProperties (这可能是预期的)")
         }
    }
    
    // override func chartConfigurationWithSelectedChartTypeString(_ selectedChartTypeStr: String) -> Any? { ... }
  
}
