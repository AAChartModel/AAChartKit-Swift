//
//  CustomTooltipWithJSFunctionVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/6/21.
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

class JSFormatterFunctionVC: UIViewController {
    private var aaChartModel: AAChartModel?
    private var aaChartView: AAChartView?
    public var selectedIndex: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "JS Function Formatter"
        
        let aaChartView = setUpChartView()
        let aaOptions = configureAAOptions()
        
        aaChartView.aa_drawChartWithChartOptions(aaOptions)
    }
    
    private func configureAAOptions() -> AAOptions {
        switch self.selectedIndex {
        case 0: return customAreaChartTooltipStyleWithFormatterFunction1()
        case 1: return customAreaChartTooltipStyleWithFormatterFunction2()
        case 2: return customAreaChartTooltipStyleWithFormatterFunction3()
        case 3: return customAreaChartTooltipStyleWithFormatterFunction4()
        case 4: return customBoxplotTooltipContent()
        case 5: return customYAxisLabels()
        case 6: return customYAxisLabels2()
        case 7: return customStackedAndGroupedColumnChartTooltip()
        case 8: return customDoubleXAxesChart()
        case 9: return customArearangeChartTooltip()
        default:
            return AAOptions()
        }
    }
    
    private func setUpChartView() -> AAChartView {
        let aaChartView = AAChartView()
        let chartWidth = view.frame.size.width
        let chartHeight = view.frame.size.height
        aaChartView.frame = CGRect(x: 0,
                                   y: 60,
                                   width: chartWidth,
                                   height: chartHeight)
        aaChartView.contentHeight = view.frame.size.height - 80
        view.addSubview(aaChartView)
        aaChartView.scrollEnabled = false
        return aaChartView
    }
    
    private func customAreaChartTooltipStyleWithFormatterFunction1() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.area)//图形类型
            .title("近三个月金价起伏周期图")//图表主标题
            .subtitle("金价(元/克)")//图表副标题
            .markerSymbolStyle(.borderBlank)//折线连接点样式为外边缘空白
            .dataLabelsEnabled(false)
            .categories([
                "10-01","10-02","10-03","10-04","10-05","10-06","10-07","10-08","10-09","10-10","10-11",
                "10-12","10-13","10-14","10-15","10-16","10-17","10-18","10-19","10-20","10-21","10-22",
                "10-23","10-024","10-25","10-26","10-27","10-28","10-29","10-30","10-31","11-01","11-02",
                "11-03","11-04","11-05","11-06","11-07","11-08","11-09","11-10","11-11","11-12","11-13",
                "11-14","11-15","11-16","11-17","11-18","11-19","11-20","11-21","11-22","11-23","11-024",
                "11-25","11-26","11-27","11-28","11-29","11-30","12-01","12-02","12-03","12-04","12-05",
                "12-06","12-07","12-08","12-09","12-10","12-11","12-12","12-13","12-14","12-15","12-16",
                "12-17","12-18","12-19","12-20","12-21","12-22","12-23","12-024","12-25","12-26","12-27",
                "12-28","12-29","12-30"])
            .series([
                AASeriesElement()
                    .name("2020")
                    .lineWidth(3)
                    .color("#FFD700"/*纯金色*/)
                    .fillOpacity(0.5)
                    .data([
                        1.51, 6.7, 0.94, 1.44, 1.6, 1.63, 1.56, 1.91, 2.45, 3.87, 3.24, 4.90, 4.61, 4.10,
                        4.17, 3.85, 4.17, 3.46, 3.46, 3.55, 3.50, 4.13, 2.58, 2.28,1.51, 12.7, 0.94, 1.44,
                        18.6, 1.63, 1.56, 1.91, 2.45, 3.87, 3.24, 4.90, 4.61, 4.10, 4.17, 3.85, 4.17, 3.46,
                        3.46, 3.55, 3.50, 4.13, 2.58, 2.28,1.33, 4.68, 1.31, 1.10, 13.9, 1.10, 1.16, 1.67,
                        2.64, 2.86, 3.00, 3.21, 4.14, 4.07, 3.68, 3.11, 3.41, 3.25, 3.32, 3.07, 3.92, 3.05,
                        2.18, 3.24,3.23, 3.15, 2.90, 1.81, 2.11, 2.43, 5.59, 3.09, 4.09, 6.14, 5.33, 6.05,
                        5.71, 6.22, 6.56, 4.75, 5.27, 6.02, 5.48
                    ])
                    ,
                ])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        aaOptions.tooltip?
            .useHTML(true)
            .formatter("""
function () {
        return ' 🌕 🌖 🌗 🌘 🌑 🌒 🌓 🌔 <br/> '
        + ' Support JavaScript Function Just Right Now !!! <br/> '
        + ' The Gold Price For <b>2020 '
        +  this.x
        + ' </b> Is <b> '
        +  this.y
        + ' </b> Dollars ';
        }
""")
            .valueDecimals(2)//设置取值精确到小数点后几位//设置取值精确到小数点后几位
            .backgroundColor("#000000")
            .borderColor("#000000")
            .style(AAStyle()
                .color("#FFD700")
                .fontSize(12)
        )
        
        return aaOptions
    }
    
    private func customAreaChartTooltipStyleWithFormatterFunction2() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.areaspline)//图形类型
            .title("2014 ~ 2020 汪星人生存指数")//图表主标题
            .subtitle("数据来源：www.无任何可靠依据.com")//图表副标题
            .markerSymbolStyle(.innerBlank)
            .colorsTheme([
                AAGradientColor.oceanBlue,
                AAGradientColor.sanguine,
            ])
            .dataLabelsEnabled(false)
            .stacking(.normal)
            .series([
                AASeriesElement()
                    .name("🐶狗子")
                    .lineWidth(5.0)
                    .data([0.45, 0.43, 0.50, 0.55, 0.58, 0.62, 0.83, 0.39, 0.56, 0.67, 0.50, 0.34, 0.50, 0.67, 0.58, 0.29, 0.46, 0.23, 0.47, 0.46, 0.38, 0.56, 0.48, 0.36])
                ,
                AASeriesElement()
                    .name("🌲树木")
                    .lineWidth(5.0)
                    .data([0.38, 0.31, 0.32, 0.32, 0.64, 0.66, 0.86, 0.47, 0.52, 0.75, 0.52, 0.56, 0.54, 0.60, 0.46, 0.63, 0.54, 0.51, 0.58, 0.64, 0.60, 0.45, 0.36, 0.67])
                ,
                ])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        aaOptions.tooltip?
            .useHTML(true)
            .enabled(true)
            .formatter(#"""
function () {
        var s = '第' + '<b>' +  this.x + '</b>' + '年' + '<br/>';
        let colorDot1 = '<span style=\"' + 'color:#1e90ff; font-size:13px\"' + '>◉</span> ';
        let colorDot2 = '<span style=\"' + 'color:#ef476f; font-size:13px\"' + '>◉</span> ';
        let s1 = colorDot1  + this.points[0].series.name + ': ' + this.points[0].y + '只' + '<br/>';
        let s2 =  colorDot2 + this.points[1].series.name + ': ' + this.points[1].y + '棵';
        s += s1 + s2;
        return s;
    }
"""#)
        
        return aaOptions
    }
    
    private func customAreaChartTooltipStyleWithFormatterFunction3() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.line)//图形类型
            .title("")//图表主标题
            .markerSymbolStyle(.borderBlank)//折线连接点样式为外边缘空白
            .dataLabelsEnabled(false)
            .categories(["临床一期","临床二期","临床三期"])
            .series([
                AASeriesElement()
                    .name("上市")
                    .data([0,0,7])
                    ,
                AASeriesElement()
                    .name("中止")
                    .data([4,5,1])
                    ,
                AASeriesElement()
                    .name("无进展")
                    .data([2,0,1])
                    ,
                AASeriesElement()
                    .name("进行中")
                    .data([3,5,2])
                    ,
                ])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        aaOptions.tooltip?
            .useHTML(true)
            .formatter(#"""
function () {
        let colorDot0 = '<span style=\"' + 'color:red; font-size:13px\"' + '>◉</span> ';
        let colorDot1 = '<span style=\"' + 'color:mediumspringgreen; font-size:13px\"' + '>◉</span> ';
        let colorDot2 = '<span style=\"' + 'color:deepskyblue; font-size:13px\"' + '>◉</span> ';
        let colorDot3 = '<span style=\"' + 'color:sandybrown; font-size:13px\"' + '>◉</span> ';
        let colorDotArr = [colorDot0, colorDot1, colorDot2, colorDot3];
        let wholeContentString = this.points[0].x + '<br/>';
        for (let i = 0;i < 4;i++) {
            let yValue = this.points[i].y;
            if (yValue != 0) {
                let prefixStr = colorDotArr[i];
                wholeContentString += prefixStr + this.points[i].series.name + ': ' + this.points[i].y + '<br/>';
            }
        }
        return wholeContentString;
    }
"""#)
        
        return aaOptions
    }
    
    private func customAreaChartTooltipStyleWithFormatterFunction4() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.areaspline)//图形类型
            .title("")//图表主标题
            .markerSymbolStyle(.borderBlank)//折线连接点样式为外边缘空白
            .dataLabelsEnabled(false)
            .colorsTheme(["#04d69f","#1e90ff","#ef476f","#ffd066",])
            .stacking(.normal)
            .markerRadius(0)
            .series([
                AASeriesElement()
                    .name("Tokyo Hot")
                    .lineWidth(5.0)
                    .fillOpacity(0.4)
                    .data([0.45, 0.43, 0.50, 0.55, 0.58, 0.62, 0.83, 0.39, 0.56, 0.67, 0.50, 0.34, 0.50, 0.67, 0.58, 0.29, 0.46, 0.23, 0.47, 0.46, 0.38, 0.56, 0.48, 0.36])
                    ,
                AASeriesElement()
                    .name("Berlin Hot")
                    .lineWidth(5.0)
                    .fillOpacity(0.4)
                    .data([0.38, 0.31, 0.32, 0.32, 0.64, 0.66, 0.86, 0.47, 0.52, 0.75, 0.52, 0.56, 0.54, 0.60, 0.46, 0.63, 0.54, 0.51, 0.58, 0.64, 0.60, 0.45, 0.36, 0.67])
                    ,
                AASeriesElement()
                    .name("New York Hot")
                    .lineWidth(5.0)
                    .fillOpacity(0.4)
                    .data([0.46, 0.32, 0.53, 0.58, 0.86, 0.68, 0.85, 0.73, 0.69, 0.71, 0.91, 0.74, 0.60, 0.50, 0.39, 0.67, 0.55, 0.49, 0.65, 0.45, 0.64, 0.47, 0.63, 0.64])
                    ,
                AASeriesElement()
                    .name("London Hot")
                    .lineWidth(5.0)
                    .fillOpacity(0.4)
                    .data([0.60, 0.51, 0.52, 0.53, 0.64, 0.84, 0.65, 0.68, 0.63, 0.47, 0.72, 0.60, 0.65, 0.74, 0.66, 0.65, 0.71, 0.59, 0.65, 0.77, 0.52, 0.53, 0.58, 0.53])
                    ,
                ])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        aaOptions.tooltip?
            .useHTML(true)
            .formatter(#"""
function () {
        let colorsArr = ["mediumspringgreen", "deepskyblue", "red", "sandybrown"];
        let wholeContentString ='<span style=\"' + 'color:lightGray; font-size:13px\"' + '>◉ Time: ' + this.x + ' year</span><br/>';
        for (let i = 0;i < 4;i++) {
            let thisPoint = this.points[i];
            let yValue = thisPoint.y;
            if (yValue != 0) {
                let spanStyleStartStr = '<span style=\"' + 'color:'+ colorsArr[i] + '; font-size:13px\"' + '>◉ ';
                let spanStyleEndStr = '</span> <br/>';
                wholeContentString += spanStyleStartStr + thisPoint.series.name + ': ' + thisPoint.y + '℃' + spanStyleEndStr;
            }
        }
        return wholeContentString;
    }
"""#)
            .backgroundColor("#050505")
            .borderColor("#050505")
        
        return aaOptions
    }
    
    private func customBoxplotTooltipContent() -> AAOptions {
       let aaChartModel = AAChartModel()
            .chartType(.boxplot)
            .title("BOXPLOT CHART")
            .subtitle("virtual data")
            .yAxisTitle("℃")
            .yAxisVisible(true)
            .series([
                AASeriesElement()
                    .name("Observed Data")
                    .color("#ef476f")
                    .fillColor(AAGradientColor.deepSea)
                    .data([
                        [760, 801, 848, 895, 965],
                        [733, 853, 939, 980, 1080],
                        [714, 762, 817, 870, 918],
                        [724, 802, 806, 871, 950],
                        [834, 836, 864, 882, 910]
                        ])
                    ,
                ])
        let pointFormatStr = (
            "◉</span> <b> {series.name}</b><br/>"
            + "最大值: {point.high}<br/>"
            + "Q2: {point.q3}<br/>"
            + "中位数: {point.median}<br/>"
            + "Q1: {point.q1}<br/>"
            + "最小值: {point.low}<br/>"
        )
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        aaOptions.tooltip?
            .useHTML(true)
            .headerFormat("<em>实验号码： {point.key}</em><br/>")
            .pointFormat(pointFormatStr)
            .valueDecimals(2)//设置取值精确到小数点后几位//设置取值精确到小数点后几位
            .backgroundColor("#000000")
            .borderColor("#000000")
            .style(AAStyle()
                .color("#1e90ff")
                .fontSize(12)
        )
        
        return aaOptions
    }
    
    private func customYAxisLabels() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.line)//图形类型
            .title("")//图表主标题
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
                    .data([29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4])
                    ,
                ])
        
        let aaYAxisLabels = AALabels()
            .formatter(#"""
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
"""#)
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        aaOptions.yAxis?.labels(aaYAxisLabels)

        return aaOptions
    }
    
    private func customYAxisLabels2() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.line)//图形类型
            .title("")//图表主标题
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
                ,
                ])
        
        let aaYAxisLabels = AALabels()
            .style(AAStyle()
                .fontSize(10)
                .fontWeight(.bold)
                .color(AAColor.gray)//Y轴文字颜色
            )
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
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
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
    
    private func customStackedAndGroupedColumnChartTooltip() -> AAOptions {
        let aaChartModel = AAChartModel()
            .title("Total fruit consumtion, grouped by gender")
            .subtitle("stacked and grouped")
            .yAxisTitle("Number of fruits")
            .chartType(.column)
            .legendEnabled(false)//隐藏图例(底部可点按的小圆点)
            .stacking(.normal)
            .categories(["Apples", "Oranges", "Pears","Grapes","Bananas",])
            .dataLabelsEnabled(true)
            .series([
                AASeriesElement()
                    .name("John")
                    .data([5,3,4,7,2,])
                    .stack("male")
                    ,
                AASeriesElement()
                    .name("Joe")
                    .data([3,4,4,2,5,])
                    .stack("male")
                    ,
                AASeriesElement()
                    .name("Jane")
                    .data([2,5,6,2,1,])
                    .stack("female")
                    ,
                AASeriesElement()
                    .name("Janet")
                    .data([3,0,4, 4,3,])
                    .stack("female")
                    ,
                ])
        
        /*Custom Tooltip Style --- 自定义图表浮动提示框样式及内容*/
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        aaOptions.tooltip?
            .shared(false)
            .formatter(#"""
function () {
                return '<b>'
                + this.x
                + '</b><br/>'
                + this.series.name
                + ': '
                + this.y
                + '<br/>'
                + 'Total: '
                + this.point.stackTotal;
     }
"""#)
        
        return aaOptions;
    }
    
    private func customDoubleXAxesChart() -> AAOptions {
        let gradientColorDic1 = AAGradientColor.linearGradient(
            direction: .toTop,
            startColor: "#7052f4",
            endColor: "#00b0ff"//颜色字符串设置支持十六进制类型和 rgba 类型
        )
        
        let gradientColorDic2 = AAGradientColor.linearGradient(
            direction: .toTop,
            startColor: "#EF71FF",
            endColor: "#4740C8"//颜色字符串设置支持十六进制类型和 rgba 类型
        )
        
        let aaChart = AAChart()
            .type(.bar)
        
        let aaTitle = AATitle()
            .text("2015 年德国人口金字塔")
            .style(AAStyle()
                .color("#000000")
                .fontSize(12.0))
        
        let aaCategories = ["0-4", "5-9", "10-14", "15-19",
        "20-24", "25-29", "30-34", "35-39", "40-44",
        "45-49", "50-54", "55-59", "60-64", "65-69",
        "70-74", "75-79", "80-84", "85-89", "90-94",
        "95-99", "100 + "]

        let aaXAxis1 = AAXAxis()
            .reversed(true)
            .categories(aaCategories)
            .labels(
                AALabels()
                .step(1))
        
        let aaXAxis2 = AAXAxis()
            .reversed(true)
            .opposite(true)
            .categories(aaCategories)
            .linkedTo(0)
            .labels(
                AALabels()
                  .step(1))
        
        let aaYAxis = AAYAxis()
            .gridLineWidth(0)// Y 轴网格线宽度
            .title(
                AATitle()
                .text(""))//Y 轴标题
            .labels(
                AALabels()
                .formatter("""
function () {
    return (Math.abs(this.value) / 1000000) + 'M';
}
"""))
            .min( -4000000)
            .max( 4000000)
        
        let aaPlotOptions = AAPlotOptions()
            .series(
                AASeries()
                .animation(
                   AAAnimation()
                    .duration(800)
                    .easing(.bounce)
                )
                .stacking(.normal))
        
        let aaTooltip = AATooltip()
            .enabled(true)
            .shared(false)
            .formatter("""
function () {
    return '<b>' + this.series.name + ', age ' + this.point.category + '</b><br/>' +
        '人口: ' + Highcharts.numberFormat(Math.abs(this.point.y), 0);
}
""")
        
        let aaSeriesElement1 = AASeriesElement()
            .name("Men")
            .color(gradientColorDic1)
            .data([-1746181, -1884428, -2089758, -2222362, -2537431, -2507081, -2443179,
            -2664537, -3556505, -3680231, -3143062, -2721122, -2229181, -2227768,
            -2176300, -1329968, -836804, -354784, -90569, -28367, -3878])
        
        let aaSeriesElement2 = AASeriesElement()
            .name("Women")
            .color(gradientColorDic2)
            .data([1656154, 1787564, 1981671, 2108575, 2403438, 2366003, 2301402, 2519874,
            3360596, 3493473, 3050775, 2759560, 2304444, 2426504, 2568938, 1785638,
            1447162, 1005011, 330870, 130632, 21208])
                
        let aaOptions = AAOptions()
            .chart(aaChart)
            .title(aaTitle)
            .xAxisArray([aaXAxis1,aaXAxis2])
            .yAxis(aaYAxis)
            .plotOptions(aaPlotOptions)
            .tooltip(aaTooltip)
            .series([aaSeriesElement1,aaSeriesElement2])
        
        return aaOptions
    }
    
    private func customArearangeChartTooltip() -> AAOptions {
        let aaChartModel = AAChartModel()
            .title("LANGUAGE MARKET SHARES JANUARY,2020 TO MAY")
            .subtitle("virtual data")
            .chartType(.arearange)
            .markerSymbolStyle(.innerBlank)
            .series([
                AASeriesElement()
                    .name("Range")
                    .color("#1E90FF")
                    .type(.arearange)
                    .lineWidth(0)
                    .fillOpacity(0.3)
                    .data([
                        [12464064, 14.3, 27.7],
                        [12464928, 14.5, 27.8],
                        [12465792, 15.5, 29.6],
                        [12466656, 16.7, 30.7],
                        [12467520, 16.5, 25.0],
                        [12468384, 17.8, 25.7],
                        [12469248, 13.5, 24.8],
                        [12470112, 10.5, 21.4],
                        [12470976, 9.2,  23.8],
                        [12471840, 11.6, 21.8],
                        [12472704, 10.7, 23.7],
                        [12473568, 11.0, 23.3],
                        [12474432, 11.6, 23.7],
                        [12475296, 11.8, 20.7],
                        [12476160, 12.6, 22.4],
                        [12477024, 13.6, 19.6],
                        [12477888, 11.4, 22.6],
                        [12478752, 13.2, 25.0],
                        [12479616, 14.2, 21.6],
                        [12480480, 13.1, 17.1],
                        [12481344, 12.2, 15.5],
                        [12482208, 12.0, 20.8],
                        [12483072, 12.0, 17.1],
                        [12483936, 12.7, 18.3],
                        [12484800, 12.4, 19.4],
                        [12485664, 12.6, 19.9],
                        [12486528, 11.9, 20.2],
                        [12487392, 11.0, 19.3],
                        [12488256, 10.8, 17.8],
                        [12489120, 11.8, 18.5],
                        [12489984, 10.8, 16.1]
                        ])
                    .zIndex(0)
                    ,
                ])
        
          let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
                aaOptions.tooltip?
                    .useHTML(true)
                    .formatter("""
        function () {
            let myPointOptions = this.points[0].point.options;
            let xValue = myPointOptions.x;
            let lowValue = myPointOptions.low;
            let highValue = myPointOptions.high;
            let titleStr = '🌕 this is my custom tooltip description text content <br>';
            let xValueStr = '🌖 this is x value  : ' + xValue + '<br>';
            let lowValueStr = ' 🌗 this is low value  : ' + lowValue + '<br>';
            let highValueStr = '🌘 this is high value : ' + highValue + '<br>';
            let tooltipDescStr =  titleStr + xValueStr + lowValueStr + highValueStr;
            return tooltipDescStr;
        }
        """)
                    .backgroundColor("#000000")
                    .borderColor("#000000")
                    .style(AAStyle()
                        .color("#FFD700")
                        .fontSize(12)
                )
                
                return aaOptions
    }

}
