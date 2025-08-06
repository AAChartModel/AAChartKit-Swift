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
            .series([
                AASeriesElement()
                    .name("Monthly Data")
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
            ])
        
        return aaOptions
    }

}
