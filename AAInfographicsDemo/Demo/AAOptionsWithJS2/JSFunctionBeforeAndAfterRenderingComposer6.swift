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
        
        return configureCircularRadarChartWithDashedGridAndImageLabels2()
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
//                .polar(true)
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
  
    //⚠️有点邪门了, 这个示例放在网格列表视图里面, 就不能正常显示 Base64 图片标签
    //后面把这个示例单独放在一个视图控制器里面就可以正常显示 Base64 图片标签了
    //有时间再研究研究这是为什么吧
    //https://github.com/AAChartModel/AAChartKit-Swift/issues/555
    static func configureCircularRadarChartWithDashedGridAndImageLabels2() -> AAOptions {
        // 使用 EmojiProvider 提供的表情符号(截取数组中的前 12 个表情符号)
        let emojis = Array(EmojiProvider.clothingAndAccessories().prefix(12))
        
        // 将每个 emoji 转换为 Base64 编码的 PNG 图像
        let base64Images = emojis.compactMap { emojiToBase64PNG($0) }
        let categories = ["远看山有色", "近听水无声", "春去花还在", "人来鸟不惊", "山水画"]
        // 将 Base64 编码的图像转换为 JavaScript 数组格式
        // 注意: 这里的字符串需要用单引号包裹, 因为 Highcharts 的 formatter 函数使用单引号来包裹字符串
        // 这样可以避免与 JavaScript 中的双引号冲突
        // 生成 JavaScript 数组字符串
        // 将 Base64 编码的图像转换为 JavaScript 数组格式
        let imagesJSArray = base64Images.map { "'\($0)'" }.joined(separator: ",")
        
        // chart
        let aaChart = AAChart()
            .type(.area)
            .polar(true)
        
        // title
        let aaTitle = AATitle()
            .text("圆形雷达图（x / y 双虚线网格 + 图片标签）")
        
        // pane
        let aaPane = AAPane()
            .size("80%")
        
        // xAxis with HTML image labels and dashed radial grid lines
        let xLabelsFormatter = """
            function() {
                const images = [
                    \(imagesJSArray)
                ];
                const idx = this.pos;
                const img = images[idx] || images[0];
                let extraStyle = '';
                    if (this.pos === 0) {
                        extraStyle = 'padding-bottom: 50px;'; 
                    }
         
                return `
                <div style="text-align:center; padding-top:10px; ${extraStyle} ">
                    <img src=\"data:image/png;base64,${img}\" style="width:28px;height:28px;"><br>
                    <span style="font-size:18px;">${this.value}</span>
                </div>
                `;
            }
         """
  

        let aaXAxis = AAXAxis()
            .categories(categories) // categories
            .tickmarkPlacement(.on) // tickmarkPlacement: 'on'
            .lineWidth(0) // lineWidth: 0
            .gridLineColor("#999") // gridLineColor: '#999'
            .gridLineWidth(1) // gridLineWidth: 1
            .gridLineDashStyle(.dash) // gridLineDashStyle: 'Dash'
            .labels(AALabels()
                .distance(15) // distance: 15
                .useHTML(true) // useHTML: true
                .formatter(xLabelsFormatter) // formatter: function () { ... }
            )
        
        // yAxis with circular grid and dashed lines
        let aaYAxis = AAYAxis()
            .gridLineInterpolation("circle") // gridLineInterpolation: 'circle'
            .gridLineDashStyle(.dash) // gridLineDashStyle: 'Dash'
            .gridLineColor("#999")
            .lineWidth(0)
            .min(0)
            .max(10)
            .tickInterval(2)
        
        // tooltip
        let aaTooltip = AATooltip()
            .shared(true)
            .pointFormat("<span style=\"color:{series.color}\">{series.name}: <b>{point.y}</b><br/>".aa_toPureHTMLString())
        
        // series
        let series = [
            AASeriesElement()
                .name("水果甜食评分")
                .data([8, 6, 7, 5, 9])
                .pointPlacement("on") // pointPlacement: 'on'
        ]
        
        // assemble options
        let aaOptions = AAOptions()
            .beforeDrawChartJavaScript("""
            Highcharts.AST.allowedReferences = [
                ...Highcharts.AST.allowedReferences,
                'data:image/png;base64',
                'data:image/svg+xml;base64'
            ];
            """)
            .chart(aaChart)
            .title(aaTitle)
            .pane(aaPane)
            .xAxis(aaXAxis)
            .yAxis(aaYAxis)
            .tooltip(aaTooltip)
            .series(series)
        
        
        return aaOptions
    }
}
