//
// Created by AnAn on 2024/1/18.
// Copyright (c) 2024 An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 *  🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit-Swift/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

import AAInfographics

class CustomStyleForColumnChartComposer {
    
    static func colorfulColumnChart() -> AAChartModel {
        AAChartModel()
            .chartType(.column)
            .animationType(.bounce)
            .title("Colorful Chart")
            .subtitle("use AAColor to get color string")
            .dataLabelsEnabled(false)
            .categories([
                "red",
                "orange",
                "yellow",
                "green",
                "cyan",
                "blue",
                "purple",
                "gray",
                "darkGray",
                "lightGray",
                "magenta",
                "brown",
                "black"
            ])
            .colorsTheme([
                AAColor.red,
                AAColor.orange,
                AAColor.yellow,
                AAColor.green,
                AAColor.cyan,
                AAColor.blue,
                AAColor.purple,
                AAColor.gray,
                AAColor.darkGray,
                AAColor.lightGray,
                AAColor.magenta,
                AAColor.brown,
                AAColor.black
            ] as [Any])
            .stacking(.percent)
            .margin(AAMargin(left: 68, right: 0))
            .series([
                AASeriesElement()
                    .name("Tokyo")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6, 5.5])
                    .colorByPoint(true)
            ])
    }
    
    static func colorfulGradientColorColumnChart() -> AAChartModel {
        AAChartModel()
            .chartType(.column)
            .title("Colorful Gradient Chart")
            .backgroundColor("#5E5E5E")
            .categories([
                "oceanBlue",
                "sanguine",
                "lusciousLime",
                "purpleLake",
                "freshPapaya",
                "ultramarine",
                "pinkSugar",
                "lemonDrizzle",
                "victoriaPurple",
                "springGreens",
                "mysticMauve",
                "reflexSilver",
                "newLeaf",
                "cottonCandy",
                "pixieDust",
                "fizzyPeach",
                "sweetDream",
                "firebrick",
                "wroughtIron",
                "deepSea",
                "coastalBreeze",
                "eveningDelight",
            ])
            .colorsTheme([
                AAGradientColor.oceanBlue,
                AAGradientColor.sanguine,
                AAGradientColor.lusciousLime,
                AAGradientColor.purpleLake,
                AAGradientColor.freshPapaya,
                AAGradientColor.ultramarine,
                AAGradientColor.pinkSugar,
                AAGradientColor.lemonDrizzle,
                AAGradientColor.victoriaPurple,
                AAGradientColor.springGreens,
                AAGradientColor.mysticMauve,
                AAGradientColor.reflexSilver,
                AAGradientColor.newLeaf,
                AAGradientColor.cottonCandy,
                AAGradientColor.pixieDust,
                AAGradientColor.fizzyPeach,
                AAGradientColor.sweetDream,
                AAGradientColor.firebrick,
                AAGradientColor.wroughtIron,
                AAGradientColor.deepSea,
                AAGradientColor.coastalBreeze,
                AAGradientColor.eveningDelight,
            ] as [Any])
            .stacking(.percent)
            .xAxisLabelsStyle(AAStyle(color: AAColor.white))
            .dataLabelsEnabled(false)
            .margin(AAMargin(top: 60, bottom: 60))
            .series([
                AASeriesElement()
                    .name("2018")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9,
                           9.6, 7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3,])
                    .colorByPoint(true)
            ])
    }
    
    static func discontinuousDataColumnChart() -> AAChartModel {
        AAChartModel()
            .chartType(.column)
            .dataLabelsEnabled(true)//是否显示值
            .tooltipEnabled(true)
            .series([
                AASeriesElement()
                    .name("所有专业")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, NSNull(), NSNull(), NSNull(), NSNull(), 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6,])
                    .color(AAGradientColor.firebrick)
            ])
    }
    
    static func randomColorfulColumnChart() -> AAChartModel {
        AAChartModel()
            .chartType(.column)
            .title("Colorful Column Chart")
            .subtitle("single data array colorful column chart")
            .colorsTheme({
                var colorStringArr = [String]()
                for _ in 0..<14 {
                    let R = arc4random_uniform(256)
                    let G = arc4random_uniform(256)
                    let B = arc4random_uniform(256)
                    let rgbaColorStr = AARgba(Int(R), Int(G), Int(B), 0.9)
                    colorStringArr.append(rgbaColorStr)
                }
                return colorStringArr
            }())
            .series([
                AASeriesElement()
                    .name("ElementOne")
                    .data([211, 183, 157, 133, 111, 91, 73, 57, 43, 31, 21, 13, 7, 3])
                    .colorByPoint(true)//When using automatic point colors pulled from the options.colors collection, this option determines whether the chart should receive one color per series or one color per point. Default Value：false.
            ])
    }
    
    static func noneStackingPolarColumnChart() -> AAChartModel {
        AAChartModel()
            .chartType(.column)
            .xAxisLabelsStyle(AAStyle(color: AAColor.white))
            .dataLabelsEnabled(false)
            .backgroundColor("#22324c")//To make the chart background color transparent, set backgroundColor to "rgba (0,0,0,0)" or "# 00000000". Also make sure `aaChartView!.IsClearBackgroundColor = true`
            .polar(true)
            .stacking(.none)
            .series([
                AASeriesElement()
                    .name("Tokyo")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
                ,
                AASeriesElement()
                    .name("New York")
                    .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5])
                ,
                AASeriesElement()
                    .name("Berlin")
                    .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0])
                ,
                AASeriesElement()
                    .name("London")
                    .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8])
                ,
            ])
    }
    
    static func normalStackingPolarColumnChart() -> AAChartModel {
        noneStackingPolarColumnChart()
            .stacking(.normal)
    }
    
    static func percentStackingPolarColumnChart() -> AAChartModel {
        noneStackingPolarColumnChart()
            .stacking(.percent)
    }
    
    static func specialStyleForTheSingleDataElementOfColumnChart() -> AAChartModel {
        AAChartModel()
            .chartType(.column)
            .dataLabelsEnabled(false)//是否显示值
            .tooltipEnabled(false)
            .markerRadius(0)
            .xAxisVisible(false)
            .yAxisVisible(false)
            .series([
                AASeriesElement()
                    .name("Virtual Data")
                    .lineWidth(6)
                    .color(AAGradientColor.oceanBlue)
                    .data([
                        7.0, 6.9, 2.5, 14.5, 18.2,
                        AADataElement()
                            .color(AAGradientColor.freshPapaya)
                            .y(49.5)
                            .toDic(),
                        5.2, 26.5, 23.3, 26.5, 13.9, 9.6])
            ])
    }
    
    
    //https://github.com/AAChartModel/AAChartKit/issues/1269
    static func noMoreGroupingAndOverlapEachOtherColumnChart() -> AAChartModel {
        AAChartModel()
            .chartType(.column)
            .categories(["11/23", "11/24", "11/25", "11/26", "11/27", "11/28", "11/29"])
            .yAxisTickPositions([0, 10, 20, 30, 40, 50])
            .yAxisMax(50)
            .yAxisMin(0)
            .borderRadius(5)
            .series([
                AAColumn()
                    .name("总做题")
                    .color("#D8D8D8")
                    .data([30, 20, 28, 40, 42 ,48, 50])
                    .grouping(false)
                ,
                AAColumn()
                    .name("正确做题")
                    .color("#00D9CD")
                    .data([28, 18, 26, 40, 40, 46, 39])
            ])
    }
    
    //https://github.com/AAChartModel/AAChartKit/issues/1271
    static func noMoreGroupingAndNestedColumnChart() -> AAChartModel {
        AAChartModel()
            .chartType(.column)
            .categories(["11/23","11/24", "11/25","11/26","11/27","11/28","11/29"])
            .yAxisTickPositions([0, 10, 20, 30, 40, 50])
            .yAxisMax(50)
            .yAxisMin(0)
            .borderRadius(5)
            .series([
                AAColumn()
                    .name("总目标")
                    .color("DeepSkyBlue")
                    .data([30, 20, 28, 40, 42 ,48, 50])
                    .grouping(false)
                    .pointPadding(0.05)
                ,
                AAColumn()
                    .name("完成度")
                    .color("#FF3030") //Firebrick1 color
                    .data([28, 18, 26, 40, 40, 46, 39])
                    .grouping(false)
                    .pointPadding(0.2)
            ])
    }
    
    //https://github.com/AAChartModel/AAChartKit/issues/842
    static func topRoundedCornersStackingColumnChart() -> AAChartModel {
        AAChartModel()
            .chartType(.column)
            .stacking(.normal)
            .title("Top Rounded Corners Stacking Column Chart")
            .colorsTheme(["#fe117c", "#ffc069", "#06caf4",])
            .series([
                AASeriesElement()
                    .name("Tokyo Hot")
                    .borderRadius("50%")
                    .data([2.10, 2.54, 2.78, 3.62, 4.41, 4.09, 3.83, 4.47, 4.20, 3.94, 3.80, 3.58, 3.19, 4.30, 3.69, 3.52, 3.02, 3.30]),
                
                AASeriesElement()
                    .name("Berlin Hot")
                    .data([1.56, 1.91, 2.45, 3.87, 3.24, 4.90, 4.61, 4.10, 4.17, 3.85, 4.17, 3.46, 3.46, 3.55, 3.50, 4.13, 2.58, 2.28]),
                
                AASeriesElement()
                    .name("Beijing Hot")
                    .data([1.16, 1.67, 2.64, 2.86, 3.00, 3.21, 4.14, 4.07, 3.68, 3.11, 3.41, 3.25, 3.32, 3.07, 3.92, 3.05, 2.18, 3.24]),
            ])
    }
    
    //https://github.com/AAChartModel/AAChartKit-Swift/issues/323
    //https://github.com/AAChartModel/AAChartKit-Swift/issues/346
    //https://github.com/highcharts/rounded-corners
    static func freeStyleRoundedCornersStackingColumnChart() -> AAChartModel {
        AAChartModel()
            .chartType(.column)
            .stacking(.percent)
            .title("Free-Style Rounded Corners Stacking Column Chart")
            .colorsTheme([
                AAGradientColor.linearGradient(startColor: AARgb(128, 255, 165), endColor: AARgb(1  , 191, 236)),
                AAGradientColor.linearGradient(startColor: AARgb(0  , 221, 255), endColor: AARgb(77 , 119, 255)),
                AAGradientColor.linearGradient(startColor: AARgb(55 , 162, 255), endColor: AARgb(116, 21 , 219)),
                AAGradientColor.linearGradient(startColor: AARgb(255, 0  , 135), endColor: AARgb(135, 0  , 157)),
                AAGradientColor.linearGradient(startColor: AARgb(255, 191, 0  ), endColor: AARgb(224, 62 , 76 )),
            ])
            .series([
                AARoundedCornersSeriesElement()
                    .name("Tokyo Hot")
                    .borderRadiusTopLeft("50%")
                    .borderRadiusTopRight("50%")
                    .data([2.10, 2.54, 2.78, 3.62, 4.41, 4.09, 3.83, 4.47, 4.20, 3.94, 3.80, 3.58, 3.19, 4.30, 3.69, 3.52, 3.02, 3.30]),
                
                AARoundedCornersSeriesElement()
                    .name("Berlin Hot")
                    .borderRadiusBottomLeft("50%")
                    .borderRadiusBottomRight("50%")
                    .data([1.56, 1.91, 2.45, 3.87, 3.24, 4.90, 4.61, 4.10, 4.17, 3.85, 4.17, 3.46, 3.46, 3.55, 3.50, 4.13, 2.58, 2.28]),
                
                AARoundedCornersSeriesElement()
                    .name("Beijing Hot")
                    .borderRadiusTopLeft("50%")
                    .borderRadiusBottomRight("50%")
                    .data([1.16, 1.67, 2.64, 2.86, 3.00, 3.21, 4.14, 4.07, 3.68, 3.11, 3.41, 3.25, 3.32, 3.07, 3.92, 3.05, 2.18, 3.24]),
                
                AARoundedCornersSeriesElement()
                    .name("London Hot")
                    .borderRadiusTopRight("50%")
                    .borderRadiusBottomLeft("50%")
                    .data([5.59, 3.09, 4.09, 6.14, 5.33, 6.05, 5.71, 6.22, 6.56, 4.75, 5.27, 6.02, 5.22, 5.77, 6.19, 5.68, 4.33, 5.48]),
                
                AARoundedCornersSeriesElement()
                    .name("NewYork Hot")
                    .borderRadius(20)
                    .data([2.10, 2.54, 2.78, 3.62, 4.41, 4.09, 3.83, 4.47, 4.20, 3.94, 3.80, 3.58, 3.19, 4.30, 3.69, 3.52, 3.02, 3.30]),
            ])
    }
    
    //https://github.com/AAChartModel/AAChartKit-Swift/issues/365
    static func customBorderStyleAndStatesHoverColorColumnChart() -> AAChartModel {
        AAChartModel()
            .chartType(.column)
            .stacking(.normal)
            .colorsTheme([AAColor.darkGray, AAColor.lightGray])//Colors theme
            .categories([
                "January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"
            ])
            .series([
                AASeriesElement()
                    .name("Berlin Hot")
                    .borderColor(AAColor.white)
                    .borderWidth(3)
                    .borderRadius(10)
                    .states(AAStates()
                        .hover(AAHover()
                            .color(AAColor.red)))
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]),
                
                AASeriesElement()
                    .name("Beijing Hot")
                    .borderColor(AAColor.white)
                    .borderWidth(3)
                    .borderRadius(10)
                    .states(AAStates()
                        .hover(AAHover()
                            .color("dodgerblue")))// Dodgerblue／道奇藍／#1e90ff十六进制颜色代码
                    .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]),
            ])
    }
    
    //https://github.com/AAChartModel/AAChartKit/issues/1351
    static func negativeDataMixedPositiveDataColumnChart() -> AAChartModel {
        AAChartModel()
            .chartType(.column)
            .categories([
                "立春", "雨水", "惊蛰", "春分", "清明", "谷雨", "立夏", "小满", "芒种", "夏至", "小暑", "大暑",
                "立秋", "处暑", "白露", "秋分", "寒露", "霜降", "立冬", "小雪", "大雪", "冬至", "小寒", "大寒"
            ])
            .tooltipEnabled(false)
            .yAxisVisible(false)
            .series([
                AASeriesElement()
                    .name("虚构数据")
                    .data({
                        let dataArr = [
                            -70, -69, -25, -145, -182, -215, -52, -265, -233, -453, -139, -96,
                            +70, +69, +25, +145, +182, +215, +52, +265, +233, +453, +139, +96,
                        ]
                        
                        var newDataArr = [[String: Any]]()
                        
                        dataArr.forEach { dataElement in
                            let aaDataLabels = AADataLabels()
                                .enabled(true)
                                .verticalAlign(.middle)
                                .x(0)
                                .y(-10)
                            
                            let dataElementValue = Float(dataElement)
                            if dataElementValue < 0 {
                                let negativeDataElement = AADataElement()
                                    .y((-dataElementValue))
                                    .color(AAColor.green)
                                    .dataLabels(aaDataLabels
                                        .format("-{y} 美元")
                                        .style(AAStyle(color: AAColor.green, fontSize: 11, weight: .thin))
                                    )
                                newDataArr.append(negativeDataElement.toDic())
                            } else {
                                let positiveDataElement = AADataElement()
                                    .y((dataElementValue))
                                    .color(AAColor.red)
                                    .dataLabels(aaDataLabels
                                        .format("+{y} 美元")
                                        .style(AAStyle(color: AAColor.red, fontSize: 11, weight: .thin))
                                    )
                                newDataArr.append(positiveDataElement.toDic())
                            }
                        }
                        return newDataArr
                    }())
            ])
    }
    
    static func configureNegativeColorMixedColumnChart() -> AAChartModel {
        AAChartModel()
            .dataLabelsEnabled(false)//是否显示数字
            .series([
                AASeriesElement()
                    .name("Column")
                    .type(.column)
                    .data([
                         -6.4, -5.2, -3.0, 0.2, 2.3, 5.5, 8.4, 8.3, 5.1, 0.9, -1.1, -4.0,
                         -6.4, -5.2, -3.0, 0.2, 2.3, 5.5, 8.4, 8.3, 5.1, 0.9, -1.1, -4.0,
                         -6.4, -5.2, -3.0, 0.2, 2.3, 5.5, 8.4, 8.3, 5.1, 0.9, -1.1, -4.0,
                    ])
                    .color("#0088FF")
                    .negativeColor(AAColor.red)
                    .threshold(4)//default:0
            ])
    }
    
    static func customSingleDataElementSpecialStyleForColumnChart() -> AAChartModel {
        AAChartModel()
            .chartType(.column)
            .dataLabelsEnabled(false)//是否显示值
            .tooltipEnabled(false)
            .markerRadius(0)
            .xAxisVisible(false)
            .yAxisVisible(false)
            .series([
                AASeriesElement()
                    .name("Virtual Data")
                    .color(AAGradientColor.oceanBlue)
                    .data([
                        7.0, 6.9, 2.5, 14.5, 18.2,
                        AADataElement()
                            .color(AAGradientColor.freshPapaya)
                            .y(49.5)
                            .toDic(),
                        5.2, 26.5, 23.3, 26.5, 13.9, 9.6
                    ])
            ])
    }
    
    static func customHoverColorAndSelectColorForColumnChart() -> AAChartModel {
        AAChartModel()
            .chartType(.column)
            .title("Custom Column Chart select color")
            .yAxisReversed(true)
            .xAxisReversed(true)
            .series([
                AASeriesElement()
                    .name("ElementOne")
                    .data([211, 183, 157, 133, 111, 91, 73, 57, 43, 31, 21, 13, 7, 3])
                    .allowPointSelect(true)
                    .states(AAStates()
                        .hover(AAHover()
                            .color(AARgba(220, 20, 60, 1)))//猩红色, alpha 透明度 1
                        .select(AASelect()
                            .color(AAColor.red)))
            ])
    }
    
    static func customNormalStackingChartDataLabelsContentAndStyleForColumnChart() -> AAChartModel {
        AAChartModel()
            .chartType(.column)
            .stacking(.normal)
            .yAxisGridLineWidth(0)
            .markerRadius(0)
            .categories([
                "孤岛危机",
                "使命召唤",
                "荣誉勋章",
                "狙击精英",
                "神秘海域",
                "最后生还者",
                "巫师3狂猎",
                "对马之魂",
                "死亡搁浅",
                "地狱边境",
                "闪客",
                "忍者之印"
            ])
            .colorsTheme([
                "#fe117c",
                "#ffc069",
                "#06caf4",
                "#7dffc0"
            ])
            .series([
                AASeriesElement()
                    .name("2017")
                    .dataLabels(AADataLabels()
                        .enabled(true)
                        .y(-10)
                        .format("{total} mm")
                        .color(AAColor.red)
                        .shape(.callout)
                        .backgroundColor(AAColor.white)
                        .borderColor(AAColor.red)
                        .borderRadius(1)
                        .borderWidth(1))
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]),
                AASeriesElement()
                    .name("2018")
                    .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]),
                AASeriesElement()
                    .name("2019")
                    .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]),
                AASeriesElement()
                    .name("2020")
                    .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8])
            ])
    }
    
    // https://jsfiddle.net/gh/get/library/pure/highcharts/highcharts/tree/master/samples/highcharts/plotoptions/series-animation-easing/
    // https://github.com/AAChartModel/AAChartKit-Swift/issues/542
    static func customAnimationForColumnChart() -> AAChartModel {
        AAChartModel()
            .chartType(.column)
            .categories(["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"])
            .series([
                AASeriesElement()
                    .data([29.9, 71.5, 106.4, 129.2, 111])
                    .animation(AAAnimation()
                        .duration(2000)
                        .easing(.easeOutBounce))
                ,
                AASeriesElement()
                    .data([29.9, 71.5, 106.4, 129.2, 111])
                    .animation(AAAnimation()
                        .duration(1500)
                        .easing(.easeOutBounce))
                
            ])
    }
    
}
