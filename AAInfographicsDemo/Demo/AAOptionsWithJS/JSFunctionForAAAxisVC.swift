//
//  JSFunctionForAAAxisVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2022/9/28.
//  Copyright © 2022 An An. All rights reserved.
//

import UIKit
import AAInfographics

class JSFunctionForAAAxisVC: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func chartConfigurationWithSelectedIndex(_ selectedIndex: Int) -> Any? {
        switch (selectedIndex) {
        case 0: return customYAxisLabels()//自定义Y轴文字
        case 1: return customYAxisLabels2()//自定义Y轴文字2
        case 2: return customAreaChartXAxisLabelsTextUnitSuffix1()//自定义X轴文字单位后缀(通过 formatter 函数)
        case 3: return customAreaChartXAxisLabelsTextUnitSuffix2()//自定义X轴文字单位后缀(不通过 formatter 函数)
        case 4: return configureTheAxesLabelsFormattersOfDoubleYAxesChart()//配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数 示例 1
        case 5: return configureTheAxesLabelsFormattersOfDoubleYAxesChart2()//配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数 示例 2
        case 6: return configureTheAxesLabelsFormattersOfDoubleYAxesChart3()//配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数 示例 3
        case 7: return customColumnChartXAxisLabelsTextByInterceptTheFirstFourCharacters()//通过截取前四个字符来自定义 X 轴 labels
        case 8: return customSpiderChartStyle()//自定义蜘蛛🕷🕸图样式
        case 9: return customizeEveryDataLabelSinglelyByDataLabelsFormatter()//通过 DataLabels 的 formatter 函数来实现单个数据标签🏷自定义
        case 10: return customXAxisLabelsBeImages()//自定义 X轴 labels 为一组图片
        default:
            return nil
        }
    }

    
    //https://github.com/AAChartModel/AAChartKit/issues/675
    private func customYAxisLabels() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.line)//图形类型
            .markerSymbolStyle(.borderBlank)//折线连接点样式为外边缘空白
            .dataLabelsEnabled(false)
            .colorsTheme(["#04d69f","#1e90ff","#ef476f","#ffd066",])
            .stacking(.normal)
            .markerRadius(8)
            .series([
                AASeriesElement()
                    .name("Scores")
                    .lineWidth(5.0)
                    .fillOpacity(0.4)
                    .data([29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4])
                    ,
                ])
        
        let aaYAxisLabels = AALabels()
            .formatter(#"""
function () {
        let yValue = this.value;
        if (yValue >= 200) {
            return "Excellent";
        } else if (yValue >= 150 && yValue < 200) {
            return "Very Good";
        } else if (yValue >= 100 && yValue < 150) {
            return "Good";
        } else if (yValue >= 50 && yValue < 100) {
            return "Not Bad";
        } else {
            return "Just So So";
        }
    }
"""#)
        
        let aaOptions = aaChartModel.aa_toAAOptions()
        aaOptions.yAxis?.labels(aaYAxisLabels)

        return aaOptions
    }
    
    private func customYAxisLabels2() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.line)//图形类型
            .markerSymbolStyle(.borderBlank)//折线连接点样式为外边缘空白
            .dataLabelsEnabled(false)
            .colorsTheme(["#04d69f","#1e90ff","#ef476f","#ffd066",])
            .stacking(.normal)
            .markerRadius(8)
            .series([
                AASeriesElement()
                    .name("Tokyo Hot")
                    .lineWidth(5.0)
                    .fillOpacity(0.4)
                    .data([229.9, 771.5, 1106.4, 1129.2, 6644.0, 1176.0, 8835.6, 148.5, 8816.4, 6694.1, 7795.6, 9954.4])
                ])
        
        let aaYAxisLabels = AALabels()
            .style(AAStyle(color: AAColor.gray, fontSize: 10, weight: .bold))
            .formatter(#"""
function () {
        let yValue = this.value;
        if (yValue == 0) {
            return "0";
        } else if (yValue == 2500) {
            return "25%";
        } else if (yValue == 5000) {
            return "50%";
        } else if (yValue == 7500) {
            return "75%";
        } else if (yValue == 10000) {
            return "100%";
        }
    }
"""#)
        
        let aaOptions = aaChartModel.aa_toAAOptions()
        aaOptions.yAxis?
            .opposite(true)
            .tickWidth(2)
            .lineWidth(1.5)//Y轴轴线颜色
            .lineColor(AAColor.lightGray)//Y轴轴线颜色
            .gridLineWidth(0)//Y轴网格线宽度
            .tickPositions([0,2500,5000,7500,10000])
            .labels(aaYAxisLabels)

        return aaOptions
    }

    //Stupid method
    private func customAreaChartXAxisLabelsTextUnitSuffix1() -> AAOptions {
        let gradientColorDic1 = AAGradientColor.linearGradient(
            direction: .toTop,
            startColor: "#7052f4",
            endColor: "#00b0ff"
        )

        let aaChartModel = AAChartModel()
            .chartType(.area)
            .title("Custom X Axis Labels Text")
            .subtitle("By Using JavaScript Formatter Function")
            .markerSymbolStyle(.borderBlank)
            .yAxisGridLineWidth(0)
            .series([
                AASeriesElement()
                    .lineWidth(1.5)
                    .color("#00b0ff")
                    .fillColor(gradientColorDic1)
                    .name("2018")
                    .data([
                        1.51, 6.7, 0.94, 1.44, 1.6, 1.63, 1.56, 1.91, 2.45, 3.87, 3.24, 4.90, 4.61, 4.10,
                        4.17, 3.85, 4.17, 3.46, 3.46, 3.55, 3.50, 4.13, 2.58, 2.28,1.51, 12.7, 0.94, 1.44,
                        18.6, 1.63, 1.56, 1.91, 2.45, 3.87, 3.24, 4.90, 4.61, 4.10, 4.17, 3.85, 4.17, 3.46,
                        3.46, 3.55, 3.50, 4.13, 2.58, 2.28,1.33, 4.68, 1.31, 1.10, 13.9, 1.10, 1.16, 1.67,
                        2.64, 2.86, 3.00, 3.21, 4.14, 4.07, 3.68, 3.11, 3.41, 3, 3.32, 3.07, 3.92, 3.05,
                        2.18, 3.24,3.23, 3.15, 2.90, 1.81, 2.11, 2.43, 5.59, 3.09, 4.09, 6.14, 5.33, 6.05,
                        5.71, 6.22, 6.56, 4.75, 5.27, 6.02, 5.48,
                    ])
            ])

        let aaOptions = aaChartModel.aa_toAAOptions()
        aaOptions.xAxis?.labels?
                .formatter("""
                           function () {
                               const xValue = this.value;
                               if (xValue%10 == 0) {
                                   return xValue + " sec"
                               } else {
                                   return "";
                               }
                           }
"""
                )

        return aaOptions
    }

    //Smart method
    private func customAreaChartXAxisLabelsTextUnitSuffix2() -> AAOptions {
        let aaOptions = customAreaChartXAxisLabelsTextUnitSuffix1()
        aaOptions.xAxis?
                .labels(AALabels()
                .step(10)
                .format("{value} sec"))

        return aaOptions
    }

    
    //https://github.com/AAChartModel/AAChartKit/issues/901
    //https://github.com/AAChartModel/AAChartKit/issues/952
    func configureTheAxesLabelsFormattersOfDoubleYAxesChart() -> AAOptions {
        let aaChart = AAChart()
            .backgroundColor(AAColor.white)
        
        let aaTitle = AATitle()
            .text("")
        
        let aaXAxis = AAXAxis()
            .visible(true)
            .min(0)
            .categories([
                "Java", "Swift", "Python", "Ruby", "PHP", "Go","C",
                "C#", "C++", "Perl", "R", "MATLAB", "SQL"
            ])
        
        let aaPlotOptions = AAPlotOptions()
                .series(AASeries()
                        .marker(AAMarker()
                                .radius(7)//曲线连接点半径，默认是4
                                .symbol(AAChartSymbolType.circle.rawValue)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                                .fillColor(AAColor.white)//点的填充色(用来设置折线连接点的填充色)
                                .lineWidth(3)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                                .lineColor("")//外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
                        ))
        
        let yAxis1 = AAYAxis()
            .visible(true)
            .lineWidth(1)
            .startOnTick(false)
            .endOnTick(false)
            .tickPositions([0, 50, 100, 150, 200])
            .labels(AALabels()
                        .enabled(true)
                        .style(AAStyle()
                                .color("DodgerBlue"))
                        .formatter("""
            function () {
                let yValue = this.value;
                if (yValue >= 200) {
                    return "极佳";
                } else if (yValue >= 150 && yValue < 200) {
                    return "非常棒";
                } else if (yValue >= 100 && yValue < 150) {
                    return "相当棒";
                } else if (yValue >= 50 && yValue < 100) {
                    return "还不错";
                } else {
                    return "一般";
                }
            }
            """))
            .gridLineWidth(0)
            .title(AATitle()
                    .text("中文")
                    .style(AAStyle(color: "DodgerBlue", fontSize: 14, weight: .bold)))
        
        let yAxis2 = AAYAxis()
            .visible(true)
            .lineWidth(1)
            .startOnTick(false)
            .endOnTick(false)
            .tickPositions([0, 50, 100, 150, 200])
            .labels(AALabels()
                        .enabled(true)
                        .style(AAStyle()
                                .color(AAColor.red))
                        .formatter("""
            function () {
                let yValue = this.value;
                if (yValue >= 200) {
                    return "Awesome";
                } else if (yValue >= 150 && yValue < 200) {
                    return "Great";
                } else if (yValue >= 100 && yValue < 150) {
                    return "Very Good";
                } else if (yValue >= 50 && yValue < 100) {
                    return "Not Bad";
                } else {
                    return "Just So So";
                }
            }
           """))
            .gridLineWidth(0)
            .title(AATitle()
                    .text("ENGLISH")
                    .style(AAStyle(color: AAColor.red, fontSize: 14, weight: .bold)))
            .opposite(true)
        
        let aaTooltip = AATooltip()
            .enabled(true)
            .shared(true)
        
        let seriesArr = [
            AASeriesElement()
                .name("2020")
                .type(.spline)
                .lineWidth(7)
                .color(AAGradientColor.deepSea)
                .yAxis(1)
                .data([
                    0, 71.5, 106.4, 129.2, 144.0, 176.0,
                    135.6, 148.5, 216.4, 194.1, 95.6, 54.4
                ]),
            AASeriesElement()
                .name("2021")
                .type(.spline)
                .lineWidth(7)
                .color(AAGradientColor.sanguine)
                .yAxis(0)
                .data([
                    135.6, 148.5, 216.4, 194.1, 95.6, 54.4,
                    0, 71.5, 106.4, 129.2, 144.0, 176.0
                ])
        ]
        
        let aaOptions = AAOptions()
            .chart(aaChart)
            .title(aaTitle)
            .plotOptions(aaPlotOptions)
            .xAxis(aaXAxis)
            .yAxisArray([yAxis1,yAxis2])
            .tooltip(aaTooltip)
            .series(seriesArr)
        
        return aaOptions
    }
    
    //https://github.com/AAChartModel/AAChartKit/issues/1324
    func configureTheAxesLabelsFormattersOfDoubleYAxesChart2() -> AAOptions {
        let aaChart = AAChart()
            .backgroundColor(AAColor.white)
        
        let aaTitle = AATitle()
            .text("")
        
        let aaXAxis = AAXAxis()
            .visible(true)
            .min(0)
            .categories([
                "Java", "Swift", "Python", "Ruby", "PHP", "Go","C",
                "C#", "C++", "Perl", "R", "MATLAB", "SQL"
            ])
        
        let aaPlotOptions = AAPlotOptions()
            .series(AASeries()
                .marker(AAMarker()
                    .radius(7)//曲线连接点半径，默认是4
                    .symbol(AAChartSymbolType.circle.rawValue)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                    .fillColor(AAColor.white)//点的填充色(用来设置折线连接点的填充色)
                    .lineWidth(3)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                    .lineColor("")//外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
                ))
        
        let yAxis1 = AAYAxis()
            .visible(true)
            .lineWidth(1)
            .startOnTick(true)
            .endOnTick(true)
            .tickPositions([0, 50, 100, 150, 200, 250, 300])
            .labels(AALabels()
                .enabled(true)
                .style(AAStyle()
                    .color("DodgerBlue"))
                    .formatter("""
                function () {
                    let yValue = this.value;
                    let formattedYValue = (yValue / 1000).toFixed(3) + '千';
                    return formattedYValue;
                }
               """)
            )
            .gridLineWidth(0)
            .title(AATitle()
                .text(#"以「千」为单位"#)
                .style(AAStyle(color: "DodgerBlue", fontSize: 14, weight: .bold)))
        
        let yAxis2 = AAYAxis()
            .visible(true)
            .lineWidth(1)
            .startOnTick(true)
            .endOnTick(true)
            .tickPositions([0, 50, 100, 150, 200, 250, 300])
            .labels(AALabels()
                .enabled(true)
                .style(AAStyle()
                    .color(AAColor.red))
                    .formatter("""
                function () {
                    let yValue = this.value;
                    let formattedYValue = (yValue / 10000).toFixed(4) + '万';
                    return formattedYValue;
                }
               """)
            )
            .gridLineWidth(0)
            .title(AATitle()
                .text("以『万』为单位")
                .style(AAStyle(color: AAColor.red, fontSize: 14, weight: .bold)))
            .opposite(true)
        
        let aaTooltip = AATooltip()
            .enabled(true)
            .shared(true)
        
        let seriesArr = [
            AASeriesElement()
                .name("2020")
                .type(.spline)
                .lineWidth(7)
                .color(AAGradientColor.deepSea)
                .yAxis(1)
                .data([
                    0, 71.5, 106.4, 129.2, 144.0, 176.0,
                    135.6, 148.5, 216.4, 194.1, 95.6, 54.4
                ]),
            AASeriesElement()
                .name("2021")
                .type(.spline)
                .lineWidth(7)
                .color(AAGradientColor.sanguine)
                .yAxis(0)
                .data([
                    135.6, 148.5, 216.4, 194.1, 95.6, 54.4,
                    0, 71.5, 106.4, 129.2, 144.0, 176.0
                ])
        ]
        
        let aaOptions = AAOptions()
            .chart(aaChart)
            .title(aaTitle)
            .plotOptions(aaPlotOptions)
            .xAxis(aaXAxis)
            .yAxisArray([yAxis1,yAxis2])
            .tooltip(aaTooltip)
            .series(seriesArr)
        
        return aaOptions
    }
    
    //https://github.com/AAChartModel/AAChartKit/issues/1324
    //https://github.com/AAChartModel/AAChartKit/issues/1330
    func configureTheAxesLabelsFormattersOfDoubleYAxesChart3() -> AAOptions {
        let aaChart = AAChart()
            .backgroundColor(AAColor.white)
        
        let aaTitle = AATitle()
            .text("")
        
        let aaXAxis = AAXAxis()
            .visible(true)
            .min(0)
            .categories([
                "Java", "Swift", "Python", "Ruby", "PHP", "Go","C",
                "C#", "C++", "Perl", "R", "MATLAB", "SQL"
            ])
        
        let aaPlotOptions = AAPlotOptions()
            .series(AASeries()
                .marker(AAMarker()
                    .radius(7)//曲线连接点半径，默认是4
                    .symbol(AAChartSymbolType.circle.rawValue)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                    .fillColor(AAColor.white)//点的填充色(用来设置折线连接点的填充色)
                    .lineWidth(3)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                    .lineColor("")//外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
                ))
        
        let yAxis1 = AAYAxis()
            .visible(true)
            .lineWidth(1)
            .startOnTick(true)
            .endOnTick(true)
            .tickPositions([0, 50, 100, 150, 200, 250, 300])
            .labels(AALabels()
                .enabled(true)
                .style(AAStyle()
                    .color("DodgerBlue"))
                    .formatter("""
                function () {
                    let yValue = this.value;
                    let unitStr = '千';
                    if (yValue == 0) {
                        unitStr = '';
                    }
                    let formattedYValue = (yValue / 1000).toFixed(3) + unitStr;
                    return formattedYValue;
                }
               """)//Y轴文字数值为 0 的时候, 不显示单位
            )
            .gridLineWidth(0)
            .title(AATitle()
                .text(#"以「千」为单位"#)
                .style(AAStyle(color: "DodgerBlue", fontSize: 14, weight: .bold)))
        
        let yAxis2 = AAYAxis()
            .visible(true)
            .lineWidth(1)
            .startOnTick(true)
            .endOnTick(true)
            .tickPositions([0, 50, 100, 150, 200, 250, 300])
            .labels(AALabels()
                .enabled(true)
                .style(AAStyle()
                    .color(AAColor.red))
                    .formatter("""
                function () {
                    let yValue = this.value;
                    let unitStr = '万';
                    if (yValue == 0) {
                        unitStr = '';
                    }
                    let formattedYValue = (yValue / 10000).toFixed(4) + unitStr;
                    return formattedYValue;
                }
               """)//Y轴文字数值为 0 的时候, 不显示单位
            )
            .gridLineWidth(0)
            .title(AATitle()
                .text("以『万』为单位")
                .style(AAStyle(color: AAColor.red, fontSize: 14, weight: .bold)))
            .opposite(true)
        
        let aaTooltip = AATooltip()
            .enabled(true)
            .shared(true)
        
        let seriesArr = [
            AASeriesElement()
                .name("2020")
                .type(.spline)
                .lineWidth(7)
                .color(AAGradientColor.deepSea)
                .yAxis(1)
                .data([
                    0, 71.5, 106.4, 129.2, 144.0, 176.0,
                    135.6, 148.5, 216.4, 194.1, 95.6, 54.4
                ]),
            AASeriesElement()
                .name("2021")
                .type(.spline)
                .lineWidth(7)
                .color(AAGradientColor.sanguine)
                .yAxis(0)
                .data([
                    135.6, 148.5, 216.4, 194.1, 95.6, 54.4,
                    0, 71.5, 106.4, 129.2, 144.0, 176.0
                ])
        ]
        
        let aaOptions = AAOptions()
            .chart(aaChart)
            .title(aaTitle)
            .plotOptions(aaPlotOptions)
            .xAxis(aaXAxis)
            .yAxisArray([yAxis1,yAxis2])
            .tooltip(aaTooltip)
            .series(seriesArr)
        
        return aaOptions
    }
    
    //https://github.com/AAChartModel/AAChartKit/issues/1217
    func customColumnChartXAxisLabelsTextByInterceptTheFirstFourCharacters() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.bar)//图表类型
            .title("春江花月夜")//图表主标题
            .subtitle("张若虚")//图表副标题
            .xAxisReversed(true)
            .xAxisLabelsStyle(AAStyle(color: AAColor.black))
            .legendEnabled(false)
            .categories([
                "春江潮水连海平", "海上明月共潮生",
                "滟滟随波千万里", "何处春江无月明",
                "江流宛转绕芳甸", "月照花林皆似霰",
                "空里流霜不觉飞", "汀上白沙看不见",
                "江天一色无纤尘", "皎皎空中孤月轮",
                "江畔何人初见月", "江月何年初照人",
                "人生代代无穷已", "江月年年望相似",
                "不知江月待何人", "但见长江送流水",
                "白云一片去悠悠", "青枫浦上不胜愁",
                "谁家今夜扁舟子", "何处相思明月楼",
                "可怜楼上月裴回", "应照离人妆镜台",
                "玉户帘中卷不去", "捣衣砧上拂还来",
                "此时相望不相闻", "愿逐月华流照君",
                "鸿雁长飞光不度", "鱼龙潜跃水成文",
                "昨夜闲潭梦落花", "可怜春半不还家",
                "江水流春去欲尽", "江潭落月复西斜",
                "斜月沉沉藏海雾", "碣石潇湘无限路",
                "不知乘月几人归", "落月摇情满江树",
            ])
            .series([
                AASeriesElement()
                    .lineWidth(1.5)
                    .color(AAGradientColor.linearGradient(
                        direction: .toTop,
                        startColor: "#7052f4",
                        endColor: "#00b0ff"
                    ))
                    .name("2018")
                    .data([
                        1.51, 3.7, 0.94, 1.44, 1.6, 1.63, 1.56, 1.91, 2.45, 3.87, 3.24, 4.90, 4.61, 4.10,
                        4.17, 3.85, 4.17, 3.46, 3.46, 3.55, 3.50, 4.13, 2.58, 2.28,1.51, 2.7, 0.94, 1.44,
                        3.6, 1.63, 1.56, 1.91, 2.45, 3.87, 3.24, 4.90,
                    ])
            ]);
        
        let aaOptions = aaChartModel.aa_toAAOptions()
        aaOptions.xAxis?.labels?
            .formatter("""
        function () {
            let xAxisCategory = this.value;
            if (xAxisCategory.length > 4) {
                return xAxisCategory.substr(0, 4);
            } else {
                return xAxisCategory;
            }
        }
        """)
        
        return aaOptions
    }


    //https://github.com/AAChartModel/AAChartKit/issues/852 自定义蜘蛛🕷图样式
    private func customSpiderChartStyle() -> AAOptions {
        let categoryArr = [
            "周转天数(天)",
            "订单满足率",
            "订单履约时效",
            "动销率",
            "畅销商品缺货率",
            "高库存金额占比",
            "不动销金额占比",
            "停采金额占比",
        ]
        let categoryJSArrStr = categoryArr.aa_toJSArray()

        let xAxisLabelsFormatter = """
                                   function () {
                                   return \(categoryJSArrStr)[this.value];
                                   }
                                   """;

        let aaChartModel = AAChartModel()
                .chartType(.line)//图表类型
                .title("健康体检表")//图表主标题
                .colorsTheme(["#fe117c", "#ffc069",])//设置主体颜色数组
                .yAxisLineWidth(0)
                .yAxisGridLineWidth(1)//y轴横向分割线宽度为0(即是隐藏分割线)
                .yAxisTickPositions([0, 5, 10, 15, 20, 25, 30, 35])
                .markerRadius(5)
                .markerSymbol(.circle)
                .polar(true)
                .series([
                    AASeriesElement()
                            .name("本月得分")
                            .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5,]),
                    AASeriesElement()
                            .name("上月得分")
                            .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, ]),
                ])

        let aaOptions = aaChartModel.aa_toAAOptions()

        aaOptions.chart?
                .marginLeft(80)
                .marginRight(80)

        aaOptions.xAxis?
                .lineWidth(0)//避免多边形外环之外有额外套了一层无用的外环
                .labels?
                .style(AAStyle(color: AAColor.black))
                .formatter(xAxisLabelsFormatter)

        aaOptions.yAxis?
                .gridLineInterpolation("polygon")//设置蜘蛛网🕸图表的网线为多边形
                .labels(AALabels()
                        .style(AAStyle()
                                .color(AAColor.black)))

        //设定图例项的CSS样式。只支持有关文本的CSS样式设定。
        /* 默认是：{
         "color": "#333333",
         "cursor": "pointer",
         "fontSize": "12px",
         "fontWeight": "bold"
         }
         */
        let aaItemStyle = AAItemStyle()
                .color(AAColor.gray)//字体颜色
                .cursor("pointer")//(在移动端这个属性没什么意义,其实不用设置)指定鼠标滑过数据列时鼠标的形状。当绑定了数据列点击事件时，可以将此参数设置为 "pointer"，用来提醒用户改数据列是可以点击的。
                .fontSize(14)//字体大小
                .fontWeight(.thin)//字体为细体字


        aaOptions.legend?
                .enabled(true)
                .align(.center)//设置图例位于水平方向上的右侧
                .layout(.horizontal)//设置图例排列方式为垂直排布
                .verticalAlign(.top)//设置图例位于竖直方向上的顶部
                .itemStyle(aaItemStyle)


        return aaOptions
    }


    // Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/589
    private func customizeEveryDataLabelSinglelyByDataLabelsFormatter() -> AAOptions  {
        let aaChartModel = AAChartModel()
                .chartType(.areaspline)//图表类型
                .dataLabelsEnabled(true)
                .tooltipEnabled(false)
                .colorsTheme([AAGradientColor.fizzyPeach])
                .markerRadius(0)
                .legendEnabled(false)
                .categories(["美国🇺🇸","欧洲🇪🇺","中国🇨🇳","日本🇯🇵","韩国🇰🇷","越南🇻🇳","中国香港🇭🇰",])
                .series([
                    AASeriesElement()
                            .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2])
                ])

        let aaOptions = aaChartModel.aa_toAAOptions()
        aaOptions.yAxis?.gridLineDashStyle = AAChartLineDashStyleType.longDash.rawValue//设置Y轴的网格线样式为 AAChartLineDashStyleTypeLongDash

        aaOptions.tooltip?.shared = true


        let unitArr = ["美元", "欧元", "人民币", "日元", "韩元", "越南盾", "港币", ]
        let unitJSArrStr = unitArr.aa_toJSArray()
        //单组 series 图表, 获取选中的点的索引是 this.point.index ,多组并且共享提示框,则是this.points[0].index
        let dataLabelsFormatter = """
                                  function () {
                                  return this.y + \(unitJSArrStr)[this.point.index];
                                  }
                                  """

        let aaDataLabels = AADataLabels()
                .style(AAStyle(color: AAColor.red, fontSize: 10, weight: .bold))
                .formatter(dataLabelsFormatter)
                .backgroundColor(AAColor.white)// white color
                .borderColor(AAColor.red)// red color
                .borderRadius(1.5)
                .borderWidth(1.3)
                .x(3).y(-20)
                .verticalAlign(.middle)

        aaOptions.plotOptions?.series?.dataLabels = aaDataLabels

        return aaOptions
    }


    // Refer to GitHub issue: https://github.com/AAChartModel/AAChartKit/issues/938
    // Refer to online chart sample: https://www.highcharts.com/demo/column-comparison
    private func customXAxisLabelsBeImages() -> AAOptions {
        let nameArr = [
            "South Korea",
            "Japan",
            "Australia",
            "Germany",
            "Russia",
            "China",
            "Great Britain",
            "United States"
        ]

        let colorArr = [
            "rgb(201, 36, 39)",
            "rgb(201, 36, 39)",
            "rgb(0, 82, 180)",
            "rgb(0, 0, 0)",
            "rgb(240, 240, 240)",
            "rgb(255, 217, 68)",
            "rgb(0, 82, 180)",
            "rgb(215, 0, 38)"
        ]


        let imageLinkFlagArr = [
            "197582",
            "197604",
            "197507",
            "197571",
            "197408",
            "197375",
            "197374",
            "197484"
        ]

        let aaChartModel = AAChartModel()
                .chartType(.column)
                .title("Custom X Axis Labels Be Images")
                .subtitle("use HTML")
                .categories(nameArr)
                .colorsTheme(colorArr)
                .borderRadius(5)
                .series([
                    AASeriesElement()
                            .name("AD 2020")
                            .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5])
                            .colorByPoint(true)
                ])

        let imageLinkFlagJSArrStr = imageLinkFlagArr.aa_toJSArray()
        let xLabelsFormatter = """
                               function () {
                                   let imageFlag = \(imageLinkFlagJSArrStr)[this.pos];
                                   let imageLink = "<span><img src=\"https://image.flaticon.com/icons/svg/197/" + imageFlag + ".svg\" style=\"width: 30px; height: 30px;\"/><br></span>";
                                   return imageLink;
                               }
                               """

        //    https://api.highcharts.com.cn/highcharts#xAxis.labels.formatter
        let aaOptions = aaChartModel.aa_toAAOptions()
        aaOptions.xAxis?.labels?
                .useHTML(true)
                .formatter(xLabelsFormatter)


        aaOptions.plotOptions?.column?.groupPadding(0.005)

        //Custom tooltip style
        let tooltipFormatter = """
                               function () {
                                   let imageFlag = \(imageLinkFlagJSArrStr)[this.point.index];
                                   let imageLink = "<span><img src=\"https://image.flaticon.com/icons/svg/197/" + imageFlag + ".svg\" style=\"width: 30px; height: 30px;\"/><br></span>";
                                   return imageLink
                                   + " 🌕 🌖 🌗 🌘 🌑 🌒 🌓 🌔 <br/> "
                                   + " Support JavaScript Function Just Right Now !!! <br/> "
                                   + " The Gold Price For <b>2020 "
                                   +  this.x
                                   + " </b> Is <b> "
                                   +  this.y
                                   + " </b> Dollars ";
                               }
                               """

        aaOptions.tooltip?
                .shared(false)
                .useHTML(true)
                .formatter(tooltipFormatter)

        return aaOptions
    }
}
