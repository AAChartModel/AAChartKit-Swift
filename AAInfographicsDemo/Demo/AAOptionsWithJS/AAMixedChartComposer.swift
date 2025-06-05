//
//  AAMixedChartComposer.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/6/5.
//  Copyright © 2025 An An. All rights reserved.
//

import AAInfographics

class AAMixedChartComposer {
    
    static func barMixedColumnrangeWithPatternFillChart() -> AAOptions {
        // 配置常量 - 使用二级枚举
        let Colors = [
            "darker": ["#603EAC", "#7560B1", "#4390AD", "#AF8D0E"],
            "actual": ["#8B5CF6", "#A78BFA", "#60CDF5", "#FACC15"]
        ]
        
        let Dimensions = [
            "pointWidth": 20 as Float,
            "capHeight": 32 as Float,
            "capWidth": 2 as Float
        ]
        
        let YAxis = [
            "min": 0 as Double,
            "max": 100 as Double,
            "tickInterval": 10 as Float
        ] as [String : Any]

        // 原始数据
        let sleepData = [
            "ideal": [
                ["low": 20, "high": 32, "category": "深睡"],
                ["low": 40, "high": 60, "category": "浅睡"],
                ["low": 10, "high": 25, "category": "REM"],
                ["low": 0, "high": 5, "category": "清醒"]
            ],
            "actual": [
                ["value": 27, "label": "1小时22分钟（27%）"],
                ["value": 53, "label": "3小时42分钟（53%）"],
                ["value": 18, "label": "1小时49分钟（18%）"],
                ["value": 2, "label": "5分钟（2%）"]
            ]
        ]
        
        /**
         // 数据处理函数
         function createCategories() {
             return sleepData.ideal.map(item => item.category);
         }

         */

        // 数据处理函数
        func createCategories() -> [String] {
            return sleepData["ideal"]!.map { item in
                return item["category"] as! String
            }
        }

        func createBoxplotData() -> [[String: Any]] {
            return sleepData["ideal"]!.enumerated().map { index, item in
                let low = item["low"] as! Int
                let high = item["high"] as! Int
                return [
                    "x": index,
                    "low": low,
                    "q1": low,
                    "median": low,
                    "q3": high,
                    "high": high,
                    "fillColor": "url(#customPattern\(index))",
                    "whiskerColor": Colors["darker"]![index]
                ]
            }
        }

        func createActualData() -> [[String: Any]] {
            return sleepData["actual"]!.enumerated().map { index, item in
                let value = item["value"] as! Int
                let label = item["label"] as! String
                return [
                    "y": value,
                    "color": Colors["actual"]![index],
                    "label": label
                ]
            }
        }
  
        // 创建plotLines函数
        func createPlotLines() -> [AAPlotLinesElement] {
            return sleepData["ideal"]!.enumerated().map { index, item in
                let category = item["category"] as! String
                let label = sleepData["actual"]![index]["label"] as! String
                return AAPlotLinesElement()
                    .value(Double(index))
                    .width(0)
                    .label(AALabel()
                        .text("<span style=\"color:#999999\">\(category)</span>  <span style=\"color:#000000\">\(label)</span>".aa_toPureHTMLString())
                        .useHTML(true)
                        .align(.left)
                        .x(10)
                        .y(-20)
                        .style(AAStyle()
                            .fontSize(20)))
            }
        }

        // 图表配置
        let aaChart = AAChart()
            .type(.columnrange)
            .inverted(true)
            .events(AAChartEvents()
                .load("""
   function() {
                const renderer = this.renderer;
                let defs = renderer.defs;
                if (!defs) {
                    defs = renderer.createElement('defs').add();
                    renderer.defs = defs;
                }

                const Colors = {
                    darker: ['#603EAC', '#7560B1', '#4390AD', '#AF8D0E']
                };

                const patternHTML = Colors.darker
                    .map((color, index) => `
                        <pattern id="customPattern${index}"
                                 patternUnits="userSpaceOnUse"
                                 width="3"
                                 height="3"
                                 patternTransform="scale(1.4 1.4)">
                          <path d="M 0 3 L 3 0 M -0.5 0.5 L 0.5 -0.5 M 2.5 3.5 L 3.5 2.5"
                                fill="none"
                                stroke="${color}"
                                stroke-width="1"
                                stroke-dasharray="none"/>
                        </pattern>`)
                    .join('');

                defs.element.innerHTML += patternHTML;
            }
"""))

        let aaXAxis = AAXAxis()
            .categories(createCategories())
            .lineWidth(0)
            .labels(AALabels()
                .enabled(false))
            .plotLines(createPlotLines())

        let aaYAxis = AAYAxis()
            .min(YAxis["min"] as! Double)
            .max(YAxis["max"] as! Double)
            .tickInterval(YAxis["tickInterval"] as! Float)
            .title(nil)
            .gridLineWidth(0)
            .labels(AALabels().enabled(false))

        let aaPlotOptions = AAPlotOptions()
            .bar(AABar()
                .grouping(false)
                .borderWidth(0)
                .pointWidth(Dimensions["pointWidth"] as! Float)
                .dataLabels(AADataLabels().enabled(false)))
            .boxplot(AABoxplot()
                .grouping(false)
                .lineWidth(0)
                .medianWidth(0)
                .medianColor("transparent")
                .stemWidth(0)
//                .pointWidth(Dimensions["pointWidth"] as! Float)
//                .whiskerLength(Dimensions["capHeight"] as! Float)
                .whiskerWidth(Dimensions["capWidth"] as! Float)
                .whiskerColor("transparent"))

        let aaTooltip = AATooltip()
            .enabled(false)

        let aaSeries = [
            AASeriesElement()
                .name("实际睡眠")
                .type(.bar)
                .data(createActualData())
                .zIndex(0),
            AASeriesElement()
                .name("理想睡眠区间")
                .type(.boxplot)
                .data(createBoxplotData())
                .zIndex(1)
                .showInLegend(true)
                .clip(false)
        ]

        let aaOptions = AAOptions()
            .chart(aaChart)
            .title(AATitle().text("睡眠阶段 vs 理想区间"))
            .xAxis(aaXAxis)
            .yAxis(aaYAxis)
            .plotOptions(aaPlotOptions)
            .legend(AALegend().enabled(true))
            .tooltip(aaTooltip)
            .series(aaSeries)

        return aaOptions
    }
}
