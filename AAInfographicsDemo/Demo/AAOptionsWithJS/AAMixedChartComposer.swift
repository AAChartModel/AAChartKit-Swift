//
//  AAMixedChartComposer.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/6/5.
//  Copyright © 2025 An An. All rights reserved.
//

import AAInfographics

class AAMixedChartComposer {
    
    /// 构建带有图案填充的混合柱状/箱线图的 AAOptions 配置
    static func barMixedColumnrangeWithPatternFillChart() -> AAOptions {
        /// 睡眠阶段枚举，便于类型安全访问
        enum SleepStage: Int, CaseIterable {
            case deep = 0
            case light
            case rem
            case awake
            
            /// 阶段对应的中文名称
            var category: String {
                switch self {
                case .deep: return "深睡"
                case .light: return "浅睡"
                case .rem: return "REM"
                case .awake: return "清醒"
                }
            }
        }
        
        /// 理想睡眠区间数据结构
        struct IdealSleep {
            let low: Int
            let high: Int
            let stage: SleepStage
        }
        
        /// 实际睡眠数据结构
        struct ActualSleep {
            let value: Int
            let label: String
            let stage: SleepStage
        }
        
        /// 配置常量，包含颜色、尺寸和数据
        struct Config {
            static let darkerColors = ["#603EAC", "#7560B1", "#4390AD", "#AF8D0E"] // 理想区间颜色
            static let actualColors = ["#8B5CF6", "#A78BFA", "#60CDF5", "#FACC15"] // 实际数据颜色
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
        
        // MARK: - 数据处理函数
        
        /// 获取所有阶段的中文名称，用于 X 轴分类
        func createCategories() -> [String] {
            return Config.ideal.map { $0.stage.category }
        }

        /// 构建箱线图（理想区间）数据
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

        /// 构建实际睡眠数据
        func createActualData() -> [[String: Any]] {
            return Config.actual.enumerated().map { index, item in
                [
                    "y": item.value,
                    "color": Config.actualColors[index],
                    "label": item.label
                ]
            }
        }
  
        /// 构建每个阶段的 plotLine，用于显示阶段和实际时长标签
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

        // MARK: - 图表配置
        
        // 配置图表类型、事件（用于注入 SVG pattern）
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

        // 配置 X 轴
        let aaXAxis = AAXAxis()
            .categories(createCategories())
            .lineWidth(0)
            .labels(AALabels()
                .enabled(false))
            .plotLines(createPlotLines())

        // 配置 Y 轴
        let aaYAxis = AAYAxis()
            .min(0)
            .max(100)
            .title(AATitle()
                .text("")) // 设置 y 轴标题为空
            .gridLineWidth(0)
            .labels(AALabels()
                .enabled(false))

        // 配置图表选项
        let aaPlotOptions = AAPlotOptions()
            .bar(AABar()
                .grouping(false) // 禁用分组，确保每个系列独立显示
                .borderWidth(0) // 柱状图无边框
                .pointWidth(Config.pointWidth) // 设置柱宽
                .dataLabels(AADataLabels()
                    .enabled(false))) // 不显示柱状图数据标签
            .boxplot(AABoxplot()
                .grouping(false) // 禁用分组，确保每个系列独立显示
                .lineWidth(0) // 箱线图主线宽度为0
                .medianWidth(0) // 中位线宽度为0
                .medianColor("transparent") // 中位线颜色透明
                .stemWidth(0) // 茎线宽度为0
                .pointWidth(Config.pointWidth) // 设置箱线宽度
                .whiskerLength(Config.capHeight) // 须长度
                .whiskerWidth(Config.capWidth) // 须宽度
                .whiskerColor("transparent")) // 须颜色透明

        // 配置 tooltip
        let aaTooltip = AATooltip()
            .enabled(false)

        // 配置数据系列
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

        // 汇总所有配置
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
