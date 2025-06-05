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
        enum SleepStage: Int, CaseIterable {
            case deep = 0
            case light
            case rem
            case awake
            
            var category: String {
                switch self {
                case .deep: return "深睡"
                case .light: return "浅睡"
                case .rem: return "REM"
                case .awake: return "清醒"
                }
            }
        }
        
        struct IdealSleep {
            let low: Int
            let high: Int
            let stage: SleepStage
        }
        
        struct ActualSleep {
            let value: Int
            let label: String
            let stage: SleepStage
        }
        
        struct Config {
            static let darkerColors = ["#603EAC", "#7560B1", "#4390AD", "#AF8D0E"]
            static let actualColors = ["#8B5CF6", "#A78BFA", "#60CDF5", "#FACC15"]
            static let pointWidth: Float = 20
            static let capHeight: Float = 32
            static let capWidth: Float = 2
            
            static let ideal: [IdealSleep] = [
                IdealSleep(low: 20, high: 32, stage: .deep),
                IdealSleep(low: 40, high: 60, stage: .light),
                IdealSleep(low: 10, high: 25, stage: .rem),
                IdealSleep(low: 0, high: 5, stage: .awake)
            ]
            
            static let actual: [ActualSleep] = [
                ActualSleep(value: 27, label: "1小时22分钟（27%）", stage: .deep),
                ActualSleep(value: 53, label: "3小时42分钟（53%）", stage: .light),
                ActualSleep(value: 18, label: "1小时49分钟（18%）", stage: .rem),
                ActualSleep(value: 2, label: "5分钟（2%）", stage: .awake)
            ]
        }
        
        // 数据处理函数
        func createCategories() -> [String] {
            return Config.ideal.map { $0.stage.category }
        }

        func createBoxplotData() -> [[String: Any]] {
            return Config.ideal.enumerated().map { index, item in
                [
                    "x": index,
                    "low": item.low,
                    "q1": item.low,
                    "median": item.low,
                    "q3": item.high,
                    "high": item.high,
                    "fillColor": "url(#customPattern\(index))",
                    "whiskerColor": Config.darkerColors[index]
                ]
            }
        }

        func createActualData() -> [[String: Any]] {
            return Config.actual.enumerated().map { index, item in
                [
                    "y": item.value,
                    "color": Config.actualColors[index],
                    "label": item.label
                ]
            }
        }
  
        func createPlotLines() -> [AAPlotLinesElement] {
            return Config.ideal.enumerated().map { index, idealItem in
                let category = idealItem.stage.category
                let label = Config.actual[index].label
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
            .min(0)
            .max(100)
            .title(AATitle()
                .text("")) // 设置 y 轴标题为空
            .gridLineWidth(0)
            .labels(AALabels()
                .enabled(false))

        let aaPlotOptions = AAPlotOptions()
            .bar(AABar()
                .grouping(false)
                .borderWidth(0)
                .pointWidth(Config.pointWidth)
                .dataLabels(AADataLabels()
                    .enabled(false)))
            .boxplot(AABoxplot()
                .grouping(false)
                .lineWidth(0)
                .medianWidth(0)
                .medianColor("transparent")
                .stemWidth(0)
                .pointWidth(Config.pointWidth)
                .whiskerLength(Config.capHeight)
                .whiskerWidth(Config.capWidth)
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
