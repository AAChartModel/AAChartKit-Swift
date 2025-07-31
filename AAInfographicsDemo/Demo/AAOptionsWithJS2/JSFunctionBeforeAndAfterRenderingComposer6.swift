//
//  JSFunctionBeforeAndAfterRenderingComposer6.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/7/31.
//  Copyright © 2025 An An. All rights reserved.
//

import AAInfographics
import UIKit

class JSFunctionBeforeAndAfterRenderingComposer6 {
    
    //https://github.com/AAChartModel/AAChartKit-Swift/issues/546
    //https://www.highcharts.com/forum/viewtopic.php?t=49610
    //https://jsfiddle.net/BlackLabel/q65az9us/
    static func customXAxisLabelsWithBase64ImageChart() -> AAOptions {
        let aaOptions = AAOptions()
            .beforeDrawChartJavaScript("""
            Highcharts.AST.allowedReferences = [
                ...Highcharts.AST.allowedReferences,
                'data:image/png;base64',
                'data:image/svg+xml;base64'
            ];
""")
            .chart(AAChart()
                .type(.spline)
            )
            .title(AATitle()
                .text("Custom X Axis Labels with Base64 Image")
            )
            .xAxis(AAXAxis()
                .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun","Jul", "Aug", "Sep", "Oct", "Nov", "Dec"])
                .labels(AALabels()
                    .useHTML(true)
                    .formatter("""
                           function() {
                               const redDot = "\(base64ImageStr)";
                               return `<img src="data:image/png;base64,${redDot}" style="width:32px; height:32px; vertical-align:middle;" /> ${this.value}`;
                           }
                           """)
                )
            )
            .series([
                AASeriesElement()
                    .name("Monthly Data")
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
            ])
        
        return aaOptions
    }
    
    //添加一个方法, 将 emoji 转换成 png 格式的 Base64 字符串
    static func emojiToBase64PNG(_ emoji: String, size: CGFloat = 32) -> String? {
        let font = UIFont.systemFont(ofSize: size)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font
        ]
        let attributedString = NSAttributedString(string: emoji, attributes: attributes)
        let imageSize = CGSize(width: size, height: size)
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
        attributedString.draw(in: CGRect(origin: .zero, size: imageSize))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let pngData = image?.pngData() else { return nil }
        return pngData.base64EncodedString()
    }
    
    static func customXAxisLabelsWithBase64ImageChart2() -> AAOptions {
        // 使用 EmojiProvider 提供的表情符号(截取数组中的前 12 个表情符号)
        let emojis = Array(EmojiProvider.clothingAndAccessories().prefix(12))

        // 将每个 emoji 转换为 Base64 编码的 PNG 图像
        let base64Images = emojis.compactMap { emojiToBase64PNG($0) }
        let categories = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        // 将 Base64 编码的图像转换为 JavaScript 数组格式
        // 注意: 这里的字符串需要用单引号包裹, 因为 Highcharts 的 formatter 函数使用单引号来包裹字符串
        // 这样可以避免与 JavaScript 中的双引号冲突
        // 生成 JavaScript 数组字符串
        // 将 Base64 编码的图像转换为 JavaScript 数组格式
        let imagesJSArray = base64Images.map { "'\($0)'" }.joined(separator: ",")
        // 使用 JavaScript 函数来格式化 x 轴标签
        // 这里使用了模板字符串来插入 Base64 编码的图像
        let formatterJS = """
            function() {
                const images = [
                    \(imagesJSArray)
                ];
                const idx = this.pos;
                const img = images[idx] || images[0];
                return `<img src=\"data:image/png;base64,${img}\" style=\"width:64px; height:64px; vertical-align:middle;\" /> ${this.value}`;
            }
        """
        let aaOptions = AAOptions()
            .beforeDrawChartJavaScript("""
            Highcharts.AST.allowedReferences = [
                ...Highcharts.AST.allowedReferences,
                'data:image/png;base64',
                'data:image/svg+xml;base64'
            ];
            """)
            .chart(AAChart()
                .type(.spline)
            )
            .title(AATitle()
                .text("Custom X Axis Labels with Emoji Base64 Images")
            )
            .xAxis(AAXAxis()
                .categories(categories)
                .labels(AALabels()
                    .useHTML(true)
                    .formatter(formatterJS)
                )
            )
            .series([
                AASeriesElement()
                    .name("Monthly Data")
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
            ])
        return aaOptions
    }
}
