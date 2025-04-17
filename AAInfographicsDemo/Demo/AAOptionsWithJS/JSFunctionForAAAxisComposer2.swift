//
//  JSFunctionForAAAxisComposer2.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/4/1.
//  Copyright © 2025 An An. All rights reserved.
//

import AAInfographics

class JSFunctionForAAAxisComposer2 {
    
    //https://github.com/AAChartModel/AAChartCore-Kotlin/issues/246
    class func customWidthForXAxisLabels() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.column))
            .xAxis(AAXAxis()
                .categories([
                    "很长的标题1三国演义",
                    "很长的标题2水浒传",
                    "很长的标题3红楼梦",
                    "很长的标题4西游记",
                    "很长的标题5金瓶梅"
                ])
                .labels(AALabels()
                    .useHTML(true)
                    .autoRotation(false)
                    .formatter(#"""
                        function() {
                          return '<div style=\"width:50px; text-align:left; word-wrap:break-word; overflow-wrap:break-word; white-space:normal;\">' + this.value + '</div>';
                        }
                    """#)))
            .series([
                AASeriesElement()
                    .data([29.9, 71.5, 106.4, 129.2, 144.0])
            ])
    }
    
    /**
    Highcharts.chart('container', {
        chart: {
            type: 'column'
        },
        title: {
            text: 'X轴标签使用图片示例'
        },
        xAxis: {
            categories: ['苹果', '香蕉', '橙子'],
            labels: {
                useHTML: true,  // 启用HTML渲染
                formatter: function() {
                    // 图片URL映射
                    const imgMap = {
                        '苹果': 'https://cdn-icons-png.flaticon.com/512/415/415733.png',
                        '香蕉': 'https://cdn-icons-png.flaticon.com/512/3144/3144456.png',
                        '橙子': 'https://cdn-icons-png.flaticon.com/512/3081/3081840.png'
                    };
                    return `<img src="${imgMap[this.value]}" width="30" height="30"
                    alt="${this.value}" title="${this.value}">`;
                }
            }
        },
        yAxis: {
            title: {
                text: '销量 (吨)'
            }
        },
        series: [{
            name: '2023年',
            data: [120, 85, 95]
        }]
    });
     */
    //https://github.com/AAChartModel/AAChartKit-Swift/issues/530
    class func customSimpleXAxisLabelsBeImages() -> AAOptions {
        let aaOptions = AAOptions()
            .chart(AAChart()
                .type(.column))
            .title(AATitle()
                .text("X轴标签使用图片示例"))
            .xAxis(AAXAxis()
                .categories(["苹果", "香蕉", "橙子"])
                .labels(AALabels()
                    .useHTML(true)
                    .formatter("""
                        function() {
                            const imgMap = {
                                '苹果': 'https://cdn-icons-png.flaticon.com/512/415/415733.png',
                                '香蕉': 'https://cdn-icons-png.flaticon.com/512/3144/3144456.png',
                                '橙子': 'https://cdn-icons-png.flaticon.com/512/3081/3081840.png'
                            };
                            return `<img src="${imgMap[this.value]}" width="30" height="30" alt="${this.value}" title="${this.value}">`;
                        }
                    """)))
            .yAxis(AAYAxis()
                .title(AATitle()
                    .text("销量 (吨)")))
            .series([
                AASeriesElement()
                    .name("2023年")
                    .data([120, 85, 95])
            ])

        return aaOptions
    }
    
}
