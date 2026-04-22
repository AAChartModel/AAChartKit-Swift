//
//  JSFunctionBeforeAndAfterRenderingComposer7.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/8/6.
//  Copyright © 2025 An An. All rights reserved.
//

import AAInfographics
import UIKit

class JSFunctionBeforeAndAfterRenderingComposer7: NSObject {
    
    static func customFontFaceChart() -> AAOptions {
        let aaOptions = AAOptions()
        // 动态创建 @font-face
            .beforeDrawChartJavaScript("""
        const style = document.createElement('style');
        style.textContent = `
        @font-face {
            font-family: "Gochi Hand";
            src: url(https://fonts.gstatic.com/s/gochihand/v23/hES06XlsOjtJsgCkx1Pkfon_-w.woff2) format('woff2');
        }
        `;
        document.head.appendChild(style);
        
        Highcharts.setOptions({
            chart: {
                style: {
                    fontFamily: '"Gochi Hand", cursive'
                }
            }
        });
""")
            .chart(AAChart()
                .type(.spline)
            )
            .title(AATitle()
                .text("动态加载 Gochi Hand 字体")
            )
            .xAxis(AAXAxis()
                .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun","Jul", "Aug", "Sep", "Oct", "Nov", "Dec"])
            )
            .yAxis(AAYAxis()
                .title(AATitle().text("数据值").style(AAStyle()
                    .color("#2E4057")))
                .gridLineColor("#F5F5F5")
            )
            .plotOptions(AAPlotOptions()
                .spline(AASpline()
                    .lineWidth(3)
                )
            )
            .series([
                AASeriesElement()
                    .name("Monthly Data")
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
            ])
        
        return aaOptions
    }
    
    static func multipleFontStylesPlotLinesChart() -> AAOptions {
        let aaOptions = AAOptions()
//            .beforeDrawChartJavaScript("""
//        // 设置全局默认字体
//        Highcharts.setOptions({
//            chart: {
//                style: {
//                    fontFamily: '-apple-system, BlinkMacSystemFont, Arial, sans-serif'
//                }
//            }
//        });
//""")
            .chart(AAChart()
                .type(.spline)
                .backgroundColor("#FAFAFA")
            )
            .title(AATitle()
                .text("🎨 五种字体样式展示")
                .style(AAStyle()
                    .fontSize(20)
                    .color("#2C3E50")
                )
            )
            .xAxis(AAXAxis()
                .categories(["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"])
                .lineColor("#BDC3C7")
            )
            .yAxis(AAYAxis()
                .title(AATitle().text("数据值")
                    .style(AAStyle()
                        .color("#34495E")
                        .fontSize(14)
                    )
                )
                .min(0)
                .max(50)
                .plotLines([
                    // 1. 系统默认字体 - 简洁现代
                    AAPlotLinesElement()
                        .color("#3498DB")
                        .width(2)
                        .value(10)
                        .dashStyle(.solid)
                        .label(AALabel()
                            .text("系统默认字体")
                            .style(AAStyle()
                                .fontFamily("-apple-system, BlinkMacSystemFont, Arial, sans-serif")
                                .fontSize(28)
                                .color("#3498DB")
                                .fontWeight(.bold)
                            )
                            .align(.left)
                            .x(10)
                            .y(-5)
                        ),
                    
                    // 2. 苹方字体 - 优雅中文
                    AAPlotLinesElement()
                        .color("#E74C3C")
                        .width(2)
                        .value(20)
                        .dashStyle(.dash)
                        .label(AALabel()
                            .text("苹方字体 - 优雅现代")
                            .style(AAStyle()
                                .fontFamily("PingFang SC, -apple-system, sans-serif")
                                .fontSize(28)
                                .color("#E74C3C")
                            )
                            .align(.left)
                            .x(10)
                            .y(-5)
                        ),
                    
                    // 3. 书法字体 - 艺术翩翩
                    AAPlotLinesElement()
                        .color("#9B59B6")
                        .width(2)
                        .value(30)
                        .dashStyle(.dot)
                        .label(AALabel()
                            .text("翩翩书法字体")
                            .style(AAStyle()
                                .fontFamily("Wawati SC, Bradley Hand, Apple Chancery, cursive")
                                .fontSize(28)
                                .color("#9B59B6")
                            )
                            .align(.left)
                            .x(10)
                            .y(-5)
                        ),
                    
                    // 4. 等宽字体 - 代码风格
                    AAPlotLinesElement()
                        .color("#27AE60")
                        .width(2)
                        .value(40)
                        .dashStyle(.dashDot)
                        .label(AALabel()
                            .text("SF Mono 等宽字体")
                            .style(AAStyle()
                                .fontFamily("SF Mono, Monaco, Consolas, monospace")
                                .fontSize(28)
                                .color("#27AE60")
                            )
                            .align(.left)
                            .x(10)
                            .y(-5)
                        ),
                    
                    // 5. 衬线字体 - 经典正式
                    AAPlotLinesElement()
                        .color("#F39C12")
                        .width(2)
                        .value(35)
                        .dashStyle(.longDash)
                        .label(AALabel()
                            .text("Times 衬线字体")
                            .style(AAStyle()
                                .fontFamily("Times, Times New Roman, Georgia, serif")
                                .fontSize(28)
                                .color("#F39C12")
                            )
                            .align(.left)
                            .x(10)
                            .y(-5)
                        )
                ])
                .gridLineColor("#ECF0F1")
            )
            .plotOptions(AAPlotOptions()
                .spline(AASpline()
                    .lineWidth(3)
                 
                )
            )
            .series([
                AASeriesElement()
                    .name("数据趋势")
                    .data([15.2, 18.7, 22.1, 25.8, 28.9, 32.4, 35.7, 33.2, 29.8, 26.5, 21.3, 17.8])
                    .color("#34495E")
                    .marker(AAMarker()
                        .fillColor("#34495E")
                        .lineColor("#2C3E50")
                        .lineWidth(2)
                        .radius(5)
                    )
            ])
            .legend(AALegend()
                .enabled(true)
                .itemStyle(AAStyle()
                    .color("#2C3E50")
                    .fontSize(13)
                )
            )
            .tooltip(AATooltip()
                .enabled(true)
                .style(AAStyle()
                    .fontSize(12)
                    .color("#2C3E50")
                )
            )
        
        return aaOptions
    }

}
