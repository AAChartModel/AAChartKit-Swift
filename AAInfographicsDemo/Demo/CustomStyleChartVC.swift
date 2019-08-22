//
//  CustomStyleChartVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/8/21.
//  Copyright © 2019 An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************
/*
 
 *********************************************************************************
 *
 *  🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit-Swift/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 *********************************************************************************
 
 */

import UIKit

class CustomStyleChartVC: UIViewController {
    open var chartType: Int!
    open var aaChartModel: AAChartModel!
    open var aaChartView: AAChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setUpAAChartView()
    }
    
    private func setUpAAChartView() {
        aaChartView = AAChartView()
        let chartWidth = view.frame.size.width
        let chartHeight = view.frame.size.height
        aaChartView!.frame = CGRect(x: 0,
                                    y: 60,
                                    width: chartWidth,
                                    height: chartHeight)
        aaChartView!.contentHeight = view.frame.size.height - 80
        view.addSubview(aaChartView!)
        aaChartView!.scrollEnabled = false
        
        aaChartModel = configureTheAAChartModel()
        aaChartView!.aa_drawChartWithChartModel(aaChartModel!)
    }
    
    private func configureTheAAChartModel() -> AAChartModel {
        switch chartType {
        case 0:  return configureColorfulBarChart()
        case 1:  return configureColorfulGradientColorBarChart()
        case 2:  return configureDiscontinuousDataChart()
        case 3:  return configureMixedLineChart()
        case 4:  return configureColorfulColumnChart()
        case 5:  return configureGradientColorBarChart()
//        case 6:  return configureHavePlotLinesChart()
        case 7:  return configrueWithMinusNumberChart()
        case 8:  return configureStepLineChart()
        case 9:  return configureStepAreaChart()
        case 10: return configureNightingaleRoseChart()
        case 11: return configureCustomSingleDataLabelChart()
        case 12: return configureChartWithShadowStyle()
        case 13: return configureColorfulGradientAreaChart()
        case 14: return configureColorfulGradientSplineChart()
        case 15: return configureGradientColorAreasplineChart()
        case 16: return configureSpecialStyleMarkerOfSingleDataElementChart()
        case 17: return configureSpecialStyleColumnOfSingleDataElementChart()
        case 18: return configureAreaChartThreshold()
        case 19: return customScatterChartMarkerSymbolContent()
        case 20: return customLineChartMarkerSymbolContent()
        case 21: return configureTriangleRadarChart()
        case 22: return configureQuadrangleRadarChart()
        case 23: return configurePentagonRadarChart()
        case 24: return configureHexagonRadarChart()
        default:
            return configureTriangleRadarChart()
        }
    }
    
    private func configureColorfulBarChart() -> AAChartModel {
        let colorsNameArr = [
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
        ]
        
        let colorsArr = [
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
        ]
        
        return AAChartModel()
            .chartType(.bar)
            .animationType(.bounce)
            .title("Colorful Chart")
            .subtitle("use AAColor to get color string")
            .dataLabelsEnabled(false)
            .categories(colorsNameArr)
            .colorsTheme(colorsArr as [Any])
            .stacking(.percent)
            .series(([
                AASeriesElement()
                    .name("Tokyo")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6, 5.5])
                    .colorByPoint(true)
                ,
                ])
        )
    }
    
    private func configureColorfulGradientColorBarChart() -> AAChartModel {
        let gradientColorNamesArr = [
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
        ]
        
        let gradientColorArr = [
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
        ]
        
        return AAChartModel()
            .chartType(.bar)
            .title("Colorful Gradient Chart")
            .backgroundColor("#5E5E5E")
            .categories(gradientColorNamesArr)
            .colorsTheme(gradientColorArr as [Any])
            .stacking(.percent)
            .titleColor("#ffffff")
            .axisColor("#ffffff")
            .dataLabelsEnabled(false)
            .series([
                AASeriesElement()
                    .name("2018")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9,
                           9.6, 7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3,])
                    .colorByPoint(true)
                ]
        )
    }
    
    private func configureDiscontinuousDataChart() -> AAChartModel {
        return AAChartModel()
            .chartType(.column)
            .yAxisTitle("")//设置Y轴标题
            .dataLabelsEnabled(true)//是否显示值
            .tooltipEnabled(true)
            .series([
                AASeriesElement()
                    .name("所有专业")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2,NSNull(),NSNull(),NSNull(),NSNull(), 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6,])
                    .color(AAGradientColor.firebrick!)
                ])
    }
    
    private func configureMixedLineChart() -> AAChartModel {
        return AAChartModel()
            .chartType(.line)
            .title("")
            .subtitle("虚拟数据")
            .categories(["Java","Swift","Python","Ruby", "PHP","Go","C","C#","C++","Perl","R","MATLAB","SQL"])
            .yAxisTitle("摄氏度")
            .dataLabelsEnabled(true)
            .series([
                AASeriesElement()
                    .name("本专业")
                    .data([45,88,49,43,65,56,47,28,49,44,89,55])
                    //    .zoneAxis("x")
                    .color(AAGradientColor.freshPapaya!)
                    .lineWidth(5)
                    .zones([["value": 8],
                            ["dashStyle": AALineDashStyleType.dot.rawValue]
                        ]),
                AASeriesElement()
                    .name("所有专业")
                    .color(AAGradientColor.pixieDust!)
                    .lineWidth(5)
                    .data([NSNull(), NSNull(), 100, 109, 89, NSNull(), NSNull(), 120, NSNull(), NSNull(), NSNull(), NSNull()])
                ])
    }

    private func configureColorfulColumnChart() -> AAChartModel {
        return AAChartModel()
            .chartType(.column)
            .title("Colorful Column Chart")
            .subtitle("single data array colorful column chart")
            .colorsTheme(configureTheRandomColorArray(colorsNumber: 14))
            .series([
                AASeriesElement()
                    .name("ElementOne")
                    .data([211,183,157,133,111,91,73,57,43,31,21,13,7,3])
                    .colorByPoint(true),//When using automatic point colors pulled from the options.colors collection, this option determines whether the chart should receive one color per series or one color per point. Default Value：false.
                ])
    }
    
    private func configureTheRandomColorArray(colorsNumber: Int) -> [Any] {
        let colorStringArr = NSMutableArray()
        for _ in 0 ..< colorsNumber {
            let R = (arc4random() % 256)
            let G = (arc4random() % 256)
            let B = (arc4random() % 256)
            let rgbaColorStr = "rgba(\(R),\(G),\(B),0.9)"
            colorStringArr.add(rgbaColorStr)
        }
        return colorStringArr as! [Any]
    }
    
    private func configureGradientColorBarChart() -> AAChartModel {
        return AAChartModel()
            .chartType(.bar)
            .title("Bar Chart")
            .subtitle("gradient color bar")
            .borderRadius(5)
            .xAxisReversed(true)
            .series([
                AASeriesElement()
                    .name("2020")
                    .data([211,183,157,133,111,91,73,57,43,31,21,13,7,3])
                    .color(AAGradientColor.oceanBlue!),
                AASeriesElement()
                    .name("2021")
                    .data([111,83,187,163,151,191,173,157,143,131,121,113,97,93])
                    .color(AAGradientColor.sanguine!),
                ]
        )
    }
    
    private func configrueWithMinusNumberChart() -> AAChartModel {
        return AAChartModel()
            .chartType(.area)
            .title("带有负数的区域填充图")
            .markerRadius(0)//设置折线连接点宽度为0,即是隐藏连接点
            .subtitle("横屏查看效果更佳")
            .yAxisGridLineWidth(0)
            .dataLabelsEnabled(false)
            .categories(["Java","Swift","Python","Ruby", "PHP","Go","C","C#","C++","HTML","CSS","Perl","R","MATLAB","SQL"])
            .yAxisTitle("")
            .colorsTheme(["#49C1B6", "#FDC20A", "#F78320", "#068E81", "#EA007B"])
            .series([
                AASeriesElement()
                    .name("2017")
                    .data([0, (-7.5), (-1.0), 3.7, 0, (-3), 8, 0,(-3.6), 4, (-2), 0]),
                AASeriesElement()
                    .name("2018")
                    .data([0, (-2.2), 2, (-2.2), 0, (-1.5), 0, 2.4, (-1), 3, (-1), 0]),
                AASeriesElement()
                    .name("2019")
                    .data([0, 2.3, 0, 1.2, (-1), 3, 0, (-3.3), 0, 2, (-0.3), 0]),
                AASeriesElement()
                    .name("2020")
                    .data([0, 10, 0.13,2,0, 2, 0, 3.7, 0, 1, (-3), 0]),
                AASeriesElement()
                    .name("2020")
                    .data([0, (-4.5), (-0.9), 5.5, (-1.9), 1.3, (-2.8), 0, (-1.7), 0, 3, 0, ]),
                ]
        )
    }
    
    private func configureStepLineChart() -> AAChartModel {
        return AAChartModel()
            .chartType(.line)//图形类型
            .animationType(.bounce)//图形渲染动画类型为"bounce"
            .title("STEP LINE CHART")//图形标题
            .subtitle("2020/08/08")//图形副标题
            .dataLabelsEnabled(false)//是否显示数字
            .symbolStyle(.borderBlank)//折线连接点样式
            .markerRadius(7)//折线连接点半径长度,为0时相当于没有折线连接点
            .series([
                AASeriesElement()
                    .name("Berlin")
                    .data([450, 432, 401, 454, 590, 530, 510])
                    .step("right"), //折线连接点靠右👉
                AASeriesElement()
                    .name("New York")
                    .data([220, 282, 201, 234, 290, 430, 410])
                    .step("center"),//折线连接点居中
                AASeriesElement()
                    .name("Tokyo")
                    .data([120, 132, 101, 134, 90, 230, 210])
                    .step("left"),//折线连接点靠左边👈
                ]
        )
    }
    
    private func configureStepAreaChart() -> AAChartModel {
        return AAChartModel()
            .chartType(.area)//图形类型
            .animationType(.bounce)//图形渲染动画类型为"bounce"
            .title("STEP AREA CHART")//图形标题
            .subtitle("2020/08/08")//图形副标题
            .dataLabelsEnabled(false)//是否显示数字
            .symbolStyle(.innerBlank)//折线连接点样式
            .markerRadius(0)//折线连接点半径长度,为0时相当于没有折线连接点
            .series([
                AASeriesElement()
                    .name("Berlin")
                    .data([450, 432, 401, 454, 590, 530, 510])
                    .step((true))//设置折线样式为直方折线,连接点位置默认靠左👈
                ,
                AASeriesElement()
                    .name("New York")
                    .data([220, 282, 201, 234, 290, 430, 410])
                    .step((true))//设置折线样式为直方折线,连接点位置默认靠左👈
                ,
                AASeriesElement()
                    .name("Tokyo")
                    .data([120, 132, 101, 134, 90, 230, 210])
                    .step((true))//设置折线样式为直方折线,连接点位置默认靠左👈
                ,
                ]
        )
    }
    
    private func configureNightingaleRoseChart() -> AAChartModel {
        return AAChartModel()
            .title("南丁格尔玫瑰图")
            .subtitle("极地图中的一种")
            .yAxisTitle("cm")
            .chartType(.column)
            //.xAxisVisible(true)//是否显示最外一层圆环
            //.yAxisVisible(false)//是否显示中间的多个圆环
            .legendEnabled(false)//隐藏图例(底部可点按的小圆点)
            .categories(["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"])
            .dataLabelsEnabled(true)
            .polar(true)//极地化图形
            .series([
                AASeriesElement()
                    .name("东京")
                    .data([7.0, 6.9, 9.5, 9.6, 13.9, 14.5, 18.3, 18.2, 21.5, 25.2, 26.5, 23.3]),
                ]
        )
    }
    
    private func configureCustomSingleDataLabelChart() -> AAChartModel {
        let dataElement = AADataElement()
            .y(1.25)
            .dataLabels(
                AADataLabels()
                    .enabled(true)
                    .format("{y} 美元🇺🇸💲")
                    .x(3)
                    .verticalAlign("middle")
                    .style(AAStyle()
                        .fontSize(20)
                        .fontWeight(.bold)
                        .color(AAColor.red)
                        .textOutline("1px 1px contrast")
                )
        )
        
        return AAChartModel()
            .title("单独自定义某个指定数据元素的DataLabel")
            .subtitle("")
            .colorsTheme([AAGradientColor.mysticMauve!])
            .series([
                AASeriesElement()
                    .name("货币")
                    .data([0.38, 0.31, 0.32, 0.32, 0.64, 0.66, 0.86, dataElement.toDic()!, 0.52, 0.75, 0.52, 0.56, 0.54, 0.60, 0.46, 0.63, 0.54, 0.51, 0.58, 0.64, 0.60, 0.45, 0.36, 0.67]),
                ]
        )
    }
    
    private func configureChartWithShadowStyle() -> AAChartModel {
        return AAChartModel()
            .title("")
            .subtitle("")
            .yAxisVisible(false)
            .chartType(.spline)
            .legendEnabled(false)//隐藏图例(底部可点按的小圆点)
            .categories(["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"])
            .symbolStyle(.innerBlank)
            .markerRadius(8)
            .series([
                AASeriesElement()
                    .name("Tokoyo")
                    .lineWidth(8.0)
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
                    .shadow(AAShadow()
                        .offsetX(15.0)
                        .offsetY(15.0)
                        .opacity(0.2)
                        .width(8.0)
                        .color(AAColor.red)
                ),
                ])
    }
    
    private func configureColorfulGradientAreaChart() -> AAChartModel {
        let stopsArr = [
            [0.0, "#febc0f"],//颜色字符串设置支持十六进制类型和 rgba 类型
            [0.5, "#FF14d4"],
            [1.0, "#0bf8f5"]
        ]
        
        let gradientColorDic1 = AAGradientColor.gradientColorDictionary(
            direction: .toRight,
            stops: stopsArr)
        
        return AAChartModel()
            .chartType(.areaspline)
            .title("")
            .subtitle("")
            .categories(["一月", "二月", "三月", "四月", "五月", "六月",
                         "七月", "八月", "九月", "十月", "十一月", "十二月"])
            .yAxisTitle("")
            .backgroundColor("#FFFFFF")
            .markerRadius(0)
            .legendEnabled(false)
            .series([
                AASeriesElement()
                    .name("Tokyo Hot")
                    .color(gradientColorDic1)
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6]),
                ]
        )
    }
    
    private func configureColorfulGradientSplineChart() -> AAChartModel {
        let stopsArr = [
            [0.00, "#febc0f"],//颜色字符串设置支持十六进制类型和 rgba 类型
            [0.25, "#FF14d4"],
            [0.50, "#0bf8f5"],
            [0.75, "#F33c52"],
            [1.00, "#1904dd"],
        ]
        
        let gradientColorDic1 = AAGradientColor.gradientColorDictionary(
            direction: .toRight,
            stops: stopsArr)
        
        return AAChartModel()
            .chartType(.spline)
            .title("")
            .subtitle("")
            .categories(["一月", "二月", "三月", "四月", "五月", "六月",
                         "七月", "八月", "九月", "十月", "十一月", "十二月"])
            .yAxisTitle("")
            .markerRadius(0)
            .legendEnabled(false)
            .series([
                AASeriesElement()
                    .name("Tokyo Hot")
                    .lineWidth(13)
                    .color(gradientColorDic1)
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6]),
                ]
        )
    }
    
    private func configureGradientColorAreasplineChart() -> AAChartModel {
        let gradientColorDic1 = AAGradientColor.gradientColorDictionary(
            direction: .toBottom,
            startColor: "rgba(255,20,147,1)",//深粉色, alpha 透明度 1
            endColor: "rgba(255,20,147,0.3)"//热情的粉红, alpha 透明度 0.3
        )
        
        return AAChartModel()
            .chartType(.areaspline)
            .title("")
            .subtitle("")
            .categories(["一月", "二月", "三月", "四月", "五月", "六月",
                         "七月", "八月", "九月", "十月", "十一月", "十二月"])
            .yAxisTitle("")
            .markerRadius(8)//marker点半径为8个像素
            .symbolStyle(.innerBlank)//marker点为空心效果
            .symbol(.circle)//marker点为圆形点○
            .legendEnabled(false)
            .series([
                AASeriesElement()
                    .name("Tokyo Hot")
                    .lineWidth(5.0)
                    .color("rgba(220,20,60,1)")//猩红色, alpha 透明度 1
                    .fillColor(gradientColorDic1)
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6]),
                ]
        )
    }
    
    private func configureSpecialStyleMarkerOfSingleDataElementChart() -> AAChartModel {
        let stopsArr = [
            [0.00, "#febc0f"],//颜色字符串设置支持十六进制类型和 rgba 类型
            [0.25, "#FF14d4"],
            [0.50, "#0bf8f5"],
            [0.75, "#F33c52"],
            [1.00, "#1904dd"],
        ]
        
        let gradientColorDic1 = AAGradientColor.gradientColorDictionary(
            direction: .toRight,
            stops: stopsArr)
        
        let singleSpecialData = AADataElement()
            .marker(AAMarker()
                .radius(8)//曲线连接点半径
                .symbol(AAChartSymbolType.circle.rawValue)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                .fillColor("#FFFFFF")//点的填充色(用来设置折线连接点的填充色)
                .lineWidth(5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                .lineColor("#FF0000")//外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
            )
            .y(26.5)
        
        return AAChartModel()
            .chartType(.spline)
            .title("")
            .backgroundColor("#4b2b7f")
            .yAxisTitle("")//设置Y轴标题
            .dataLabelsEnabled(false)//是否显示值
            .tooltipEnabled(true)
            .markerRadius(0)
            .xAxisVisible(false)
            .yAxisVisible(false)
            .series([
                AASeriesElement()
                    .name("Virtual Data")
                    .lineWidth(6)
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, singleSpecialData.toDic()!, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
                    .color(gradientColorDic1)
                ])
    }
    
    private func configureSpecialStyleColumnOfSingleDataElementChart() -> AAChartModel {
        let singleSpecialData = AADataElement()
            .color(AAGradientColor.freshPapaya!)
            .y(49.5)
        
        return AAChartModel()
            .chartType(.column)
            .title("")
            .yAxisTitle("")//设置Y轴标题
            .dataLabelsEnabled(false)//是否显示值
            .tooltipEnabled(false)
            .markerRadius(0)
            .xAxisVisible(false)
            .yAxisVisible(false)
            .series([
                AASeriesElement()
                    .name("Virtual Data")
                    .lineWidth(6)
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, singleSpecialData.toDic()!, 5.2, 26.5, 23.3, 26.5, 13.9, 9.6])
                    .color(AAGradientColor.oceanBlue!)
                ])
    }
    
    private func configureAreaChartThreshold() -> AAChartModel {
        let gradientColorDic1 = AAGradientColor.gradientColorDictionary(
            direction: .toBottom,
            startColor: "rgba(30, 144, 255,1)", //DodgerBlue, alpha 透明度 1
            endColor: "rgba(30, 144, 255,0.1)"//DodgerBlue, alpha 透明度 0.1
        )
        
        return AAChartModel()
            .chartType(.area)
            .title("")
            .yAxisTitle("")//设置Y轴标题
            .yAxisGridLineWidth(0)
            .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun","July", "Aug", "Spe", "Oct", "Nov", "Dec"])
            .dataLabelsEnabled(false)//是否显示值
            .markerRadius(8)
            .symbol(.circle)
            .symbolStyle(.innerBlank)
            .legendEnabled(false)
            .series([
                AASeriesElement()
                    .threshold((-200))
                    .data([106.4, 129.2, 269.9, -100.5, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4])
                    .lineWidth(6)
                    .color("rgba(30, 144, 255,1)")
                    .fillColor(gradientColorDic1)
                ])
    }
    
    //refer to online sample https://jshare.com.cn/github/highcharts/highcharts/tree/master/samples/highcharts/plotoptions/series-marker-symbol/
    private func customScatterChartMarkerSymbolContent() -> AAChartModel {
        let predefinedSymbol1 = AAChartSymbolType.triangle.rawValue
        let predefinedSymbol2 = AAChartSymbolType.circle.rawValue
        let imageSymbol = "url(https://www.highcharts.com/samples/graphics/sun.png)"
        let base64Symbol = "url(data:image/png;base64,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 1dT1gvWd+ 1YfqGnRs+FYmKrhTbF5cVf9go3HjlG4dvyr+Z3JS0qavEuWTPZtJm6ebeLZ5bDpaql+aXDm4N2dq0Dd9WtO319kXbL5fNKNu7g7ZDuaO/PLi8ZafJzs07P1SkVPRU+lQ27tLdtWHX+G7R7ht7vPY07NXbW7z3/T7JvttVAVVN1WbVZftJ+7P3P66Jqun4lvttXa1ObXHtxwPSA/0HIw6217nU1R3SPVRSj9Yr60cOxx+ 1/p3vdy0NNg1VjZzG4iNwRHnk6fcJ3/ceDTradox7rOEH0x92HWcdL2pCmvKaRptTmvtbYlu6T8w+0dbq3nr8R9sfD5w0PFl5SvNUyWna6YLTk2fyz4ydlZ19fi753GDborZ752PO32oPb+ 16EHTh0kX/i +c7vDvOXPK4dPKy2+UTV7hXmq86X23qdOo8/pPTT8e7nLuarrlca7nuer21e2b36RueN87d9L158Rb/1tWeOT3dvfN6b/fF9/XfFt1+cif9zsu72Xcn7q28T7xf9EDtQdlD3YfVP1v+3Njv3H9qwHeg89HcR/cGhYPP/pH1jw9DBY+Zj8uGDYbrnjg+OTniP3L96fynQ89kzyaeF/6i/suuFxYvfvjV69fO0ZjRoZfyl5O/bXyl/erA6xmv28bCxh6+yXgzMV70VvvtwXfcdx3vo98PT+R8IH8o/2j5sfVT0Kf7kxmTk/8EA5jz/GMzLdsAAAAgY0hSTQAAeiUAAICDAAD5/wAAgOkAAHUwAADqYAAAOpgAABdvkl/FRgAAAVVJREFUeNpi/P37NwOxYM2pHtm7lw8uYmBgYGAiVtPC3RWh+88vuneT474Dv4DkcUZibJy8PG72le/nkn+zMzAaMhnNyY1clMpCjKbz/86lMLAzMMA0MTAwMOC1Ea6JgYFB9pPwncbMg6owOaY1p3pk15zqkcWnie8j63ddY18nZHmWI2eW3vzN/Jf168c3UfGuHathAXHl+7lkBnYGBtafDP8NVd3jQ8xKHiNrZMyeqPPtE/9vTgYGBgb1H4oHlHXt43ZfWfDwNzsDIwMDA4POX831RXGrg9BdxLhob63VgTurjsAUsv5k+A9jC3/g/NCdfVoQm/+ZIu3qjhnyW3XABJANMNL19cYVcPBQrZpq9eyFwCdJmIT6D8UD5cmbHXFphKccI9Mgc84vTH9goYhPE4rGELOSx0bSjsUMDAwMunJ2FQST0+/fv1Hw5BWJbehi2DBgAHTKsWmiz+rJAAAAAElFTkSuQmCC)"
        
        let element1 = AASeriesElement()
            .name("Predefined symbol")
            .data([0.45, 0.43, 0.50, 0.55, 0.58, 0.62, 0.83, 0.39, 0.56, 0.67, 0.50, 0.34, 0.50, 0.67, 0.58, 0.29, 0.46, 0.23, 0.47, 0.46, 0.38, 0.56, 0.48, 0.36])
            .marker(AAMarker()
                .symbol(predefinedSymbol1))
        
        let element2 = AASeriesElement()
            .name("Image symbol")
            .data([0.38, 0.31, 0.32, 0.32, 0.64, 0.66, 0.86, 0.47, 0.52, 0.75, 0.52, 0.56, 0.54, 0.60, 0.46, 0.63, 0.54, 0.51, 0.58, 0.64, 0.60, 0.45, 0.36, 0.67])
            .marker(AAMarker()
                .symbol(imageSymbol))
        
        let element3 = AASeriesElement()
            .name("Base64 symbol (*)")
            .data([0.46, 0.32, 0.53, 0.58, 0.86, 0.68, 0.85, 0.73, 0.69, 0.71, 0.91, 0.74, 0.60, 0.50, 0.39, 0.67, 0.55, 0.49, 0.65, 0.45, 0.64, 0.47, 0.63, 0.64])
            .marker(AAMarker()
                .symbol(base64Symbol))
        
        let element4 = AASeriesElement()
            .name("Custom symbol")
            .data([0.60, 0.51, 0.52, 0.53, 0.64, 0.84, 0.65, 0.68, 0.63, 0.47, 0.72, 0.60, 0.65, 0.74, 0.66, 0.65, 0.71, 0.59, 0.65, 0.77, 0.52, 0.53, 0.58, 0.53])
            .marker(AAMarker()
                .symbol(predefinedSymbol2))
        
        return AAChartModel()
            .chartType(.scatter)
            .title("")
            .subtitle("")
            .yAxisTitle("")
            .yAxisGridLineWidth(0)
            .stacking(.normal)
            .markerRadius(8)
            .dataLabelsEnabled(false)
            .series([element1,element2,element3,element4])
    }
    
    //refer to online sample https://jshare.com.cn/github/highcharts/highcharts/tree/master/samples/highcharts/plotoptions/series-marker-symbol/
    private func customLineChartMarkerSymbolContent() -> AAChartModel {
        let predefinedSymbol1 = AAChartSymbolType.triangle.rawValue
        let predefinedSymbol2 = AAChartSymbolType.circle.rawValue
        let imageSymbol = "url(https://www.highcharts.com/samples/graphics/sun.png)"
        let base64Symbol = "url(data:image/png;base64,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 1dT1gvWd+ 1YfqGnRs+FYmKrhTbF5cVf9go3HjlG4dvyr+Z3JS0qavEuWTPZtJm6ebeLZ5bDpaql+aXDm4N2dq0Dd9WtO319kXbL5fNKNu7g7ZDuaO/PLi8ZafJzs07P1SkVPRU+lQ27tLdtWHX+G7R7ht7vPY07NXbW7z3/T7JvttVAVVN1WbVZftJ+7P3P66Jqun4lvttXa1ObXHtxwPSA/0HIw6217nU1R3SPVRSj9Yr60cOxx+ 1/p3vdy0NNg1VjZzG4iNwRHnk6fcJ3/ceDTradox7rOEH0x92HWcdL2pCmvKaRptTmvtbYlu6T8w+0dbq3nr8R9sfD5w0PFl5SvNUyWna6YLTk2fyz4ydlZ19fi753GDborZ752PO32oPb+ 16EHTh0kX/i +c7vDvOXPK4dPKy2+UTV7hXmq86X23qdOo8/pPTT8e7nLuarrlca7nuer21e2b36RueN87d9L158Rb/1tWeOT3dvfN6b/fF9/XfFt1+cif9zsu72Xcn7q28T7xf9EDtQdlD3YfVP1v+3Njv3H9qwHeg89HcR/cGhYPP/pH1jw9DBY+Zj8uGDYbrnjg+OTniP3L96fynQ89kzyaeF/6i/suuFxYvfvjV69fO0ZjRoZfyl5O/bXyl/erA6xmv28bCxh6+yXgzMV70VvvtwXfcdx3vo98PT+R8IH8o/2j5sfVT0Kf7kxmTk/8EA5jz/GMzLdsAAAAgY0hSTQAAeiUAAICDAAD5/wAAgOkAAHUwAADqYAAAOpgAABdvkl/FRgAAAVVJREFUeNpi/P37NwOxYM2pHtm7lw8uYmBgYGAiVtPC3RWh+88vuneT474Dv4DkcUZibJy8PG72le/nkn+zMzAaMhnNyY1clMpCjKbz/86lMLAzMMA0MTAwMOC1Ea6JgYFB9pPwncbMg6owOaY1p3pk15zqkcWnie8j63ddY18nZHmWI2eW3vzN/Jf168c3UfGuHathAXHl+7lkBnYGBtafDP8NVd3jQ8xKHiNrZMyeqPPtE/9vTgYGBgb1H4oHlHXt43ZfWfDwNzsDIwMDA4POX831RXGrg9BdxLhob63VgTurjsAUsv5k+A9jC3/g/NCdfVoQm/+ZIu3qjhnyW3XABJANMNL19cYVcPBQrZpq9eyFwCdJmIT6D8UD5cmbHXFphKccI9Mgc84vTH9goYhPE4rGELOSx0bSjsUMDAwMunJ2FQST0+/fv1Hw5BWJbehi2DBgAHTKsWmiz+rJAAAAAElFTkSuQmCC)"
        
        let element1 = AASeriesElement()
            .name("Predefined symbol")
            .data([0.45, 0.43, 0.50, 0.55, 0.58, 0.62, 0.83, 0.39, 0.56, 0.67, 0.50, 0.34, 0.50, 0.67, 0.58, 0.29, 0.46, 0.23, 0.47, 0.46, 0.38, 0.56, 0.48, 0.36])
            .marker(AAMarker()
                .symbol(predefinedSymbol1))
        
        let element2 = AASeriesElement()
            .name("Image symbol")
            .data([0.38, 0.31, 0.32, 0.32, 0.64, 0.66, 0.86, 0.47, 0.52, 0.75, 0.52, 0.56, 0.54, 0.60, 0.46, 0.63, 0.54, 0.51, 0.58, 0.64, 0.60, 0.45, 0.36, 0.67])
            .marker(AAMarker()
                .symbol(imageSymbol))
        
        let element3 = AASeriesElement()
            .name("Base64 symbol (*)")
            .data([0.46, 0.32, 0.53, 0.58, 0.86, 0.68, 0.85, 0.73, 0.69, 0.71, 0.91, 0.74, 0.60, 0.50, 0.39, 0.67, 0.55, 0.49, 0.65, 0.45, 0.64, 0.47, 0.63, 0.64])
            .marker(AAMarker()
                .symbol(base64Symbol))
        
        let element4 = AASeriesElement()
            .name("Custom symbol")
            .data([0.60, 0.51, 0.52, 0.53, 0.64, 0.84, 0.65, 0.68, 0.63, 0.47, 0.72, 0.60, 0.65, 0.74, 0.66, 0.65, 0.71, 0.59, 0.65, 0.77, 0.52, 0.53, 0.58, 0.53])
            .marker(AAMarker()
                .symbol(predefinedSymbol2))
        
        return AAChartModel()
            .chartType(.line)
            .title("")
            .subtitle("")
            .yAxisTitle("")
            .yAxisGridLineWidth(0)
            .stacking(.normal)
            .markerRadius(8)
            .dataLabelsEnabled(false)
            .series([element1,element2,element3,element4])
    }

    private func configureTriangleRadarChart() -> AAChartModel {
        return AAChartModel()
            .chartType(.area)
            .dataLabelsEnabled(false)
            .xAxisVisible(false)
            .markerRadius(0)
            .polar(true)
            .series([
                AASeriesElement()
                .data([15.0,15.0,15.0,]),
                AASeriesElement()
                .data([9.0,9.0,9.0,]),
                AASeriesElement()
                .data([6.0,6.0,6.0,]),
                AASeriesElement()
                .data([3.0,3.0,3.0,]),
                ])
    }
    
    private func configureQuadrangleRadarChart() -> AAChartModel {
        return AAChartModel()
            .chartType(.area)
            .dataLabelsEnabled(false)
            .xAxisVisible(false)
            .markerRadius(0)
            .polar(true)
            .series([
                AASeriesElement()
                    .data([15.0,15.0,15.0,15.0,]),
                AASeriesElement()
                    .data([9.0,9.0,9.0,9.0,]),
                AASeriesElement()
                    .data([6.0,6.0,6.0,6.0,]),
                AASeriesElement()
                    .data([3.0,3.0,3.0,3.0,]),
                ])
    }
    
    private func configurePentagonRadarChart() -> AAChartModel {
        return AAChartModel()
            .chartType(.area)
            .dataLabelsEnabled(false)
            .xAxisVisible(false)
            .markerRadius(0)
            .polar(true)
            .series([
                AASeriesElement()
                    .data([15.0,15.0,15.0,15.0,15.0,]),
                AASeriesElement()
                    .data([9.0,9.0,9.0,9.0,9.0,]),
                AASeriesElement()
                    .data([6.0,6.0,6.0,6.0,6.0,]),
                AASeriesElement()
                    .data([3.0,3.0,3.0,3.0,3.0,]),
                ])
    }
    
    private func configureHexagonRadarChart() -> AAChartModel {
        return AAChartModel()
            .chartType(.area)
            .dataLabelsEnabled(false)
            .xAxisVisible(false)
            .markerRadius(0)
            .polar(true)
            .series([
                AASeriesElement()
                    .data([15.0,15.0,15.0,15.0,15.0,15.0,]),
                AASeriesElement()
                    .data([9.0,9.0,9.0,9.0,9.0,9.0,]),
                AASeriesElement()
                    .data([6.0,6.0,6.0,6.0,6.0,6.0,]),
                AASeriesElement()
                    .data([3.0,3.0,3.0,3.0,3.0,3.0,]),
                ])
    }
}
