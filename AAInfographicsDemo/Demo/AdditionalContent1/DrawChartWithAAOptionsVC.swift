//
//  DrawChartWithAAOptionsVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2018/12/19.
//  Copyright © 2018 An An. All rights reserved.
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

class DrawChartWithAAOptionsVC: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func chartConfigurationWithSelectedIndex(_ selectedIndex: Int) -> Any? {
        switch selectedIndex {
        case 0: return configureLegendStyle()
        case 1: return simpleGaugeChart()
        case 2: return gaugeChartWithPlotBand()
        case 3: return configureChartWithBackgroundImage()
        case 4: return yAxisOnTheRightSideChart()
        case 5: return adjustYAxisMinValueForChart()
        case 6: return configureTheMirrorColumnChart()
        case 7: return adjustTheXAxisLabels()
        case 8: return adjustGroupPaddingBetweenColumns()
        case 9: return configureAAPlotBandsForChart()
        case 10: return configureAAPlotLinesForChart()
        case 11: return customAATooltipWithJSFuntion()
        case 12: return customXAxisCrosshairStyle()
        case 13: return configureXAxisLabelsFontColorWithHTMLString()
        case 14: return configureXAxisLabelsFontColorAndFontSizeWithHTMLString()
        case 15: return configure_DataLabels_XAXis_YAxis_Legend_Style()
        case 16: return configureXAxisPlotBand()
        case 17: return configureDoubleYAxisChartOptions()
        case 18: return configureTripleYAxesMixedChart()
        case 19: return configureDoubleYAxesAndColumnLineMixedChart()
        case 20: return configureDoubleYAxesMarketDepthChart()
        case 21: return customAreaChartTooltipStyleLikeHTMLTable()
        case 22: return customAxesGridLineStyle()
        case 23: return customRadarChartStyle()
        case 24: return customColumnrangeChartStyle()
        case 25: return customXAxisLabelsBeImages()//自定义曲线面积图 X 轴 labels 为一组图片🖼
        case 26: return configureTriangleRadarChart()//带有颜色标志带の三角形雷达图
        case 27: return configureQuadrangleRadarChart()//带有颜色标志带の四角形雷达图
        case 28: return configurePentagonRadarChart()//带有颜色标志带の五角形雷达图
        case 29: return configureHexagonRadarChart()//带有颜色标志带の六角形雷达图
        case 30: return configureSpiderWebRadarChart()//带有颜色标志带の🕸蜘蛛网状雷达图
            
        default:
            return AAOptions()
        }
    }

    
    private func configureLegendStyle() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.areaspline)
            .animationType(.easeFrom)//设置图表渲染动画类型为 EaseFrom
            .dataLabelsEnabled(false)
            .colorsTheme([
                AAGradientColor.oceanBlue,
                AAGradientColor.sanguine,
                AAGradientColor.lusciousLime,
                AAGradientColor.mysticMauve
            ])
            .markerSymbol(.circle)
            .markerSymbolStyle(.innerBlank)
            .stacking(.normal)
            .series([
                AASeriesElement()
                    .name("Tokyo Hot")
                    .data([0.45, 0.43, 0.50, 0.55, 0.58, 0.62, 0.83, 0.39, 0.56, 0.67, 0.50, 0.34, 0.50, 0.67, 0.58, 0.29, 0.46, 0.23, 0.47, 0.46, 0.38, 0.56, 0.48, 0.36])                ,
                AASeriesElement()
                    .name("Berlin Hot")
                    .data([0.38, 0.31, 0.32, 0.32, 0.64, 0.66, 0.86, 0.47, 0.52, 0.75, 0.52, 0.56, 0.54, 0.60, 0.46, 0.63, 0.54, 0.51, 0.58, 0.64, 0.60, 0.45, 0.36, 0.67])
                ,
                AASeriesElement()
                    .name("New York Hot")
                    .data([0.46, 0.32, 0.53, 0.58, 0.86, 0.68, 0.85, 0.73, 0.69, 0.71, 0.91, 0.74, 0.60, 0.50, 0.39, 0.67, 0.55, 0.49, 0.65, 0.45, 0.64, 0.47, 0.63, 0.64])
                ,
                AASeriesElement()
                    .name("London Hot")
                    .data([0.60, 0.51, 0.52, 0.53, 0.64, 0.84, 0.65, 0.68, 0.63, 0.47, 0.72, 0.60, 0.65, 0.74, 0.66, 0.65, 0.71, 0.59, 0.65, 0.77, 0.52, 0.53, 0.58, 0.53])
                ,
            ])
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        
        aaOptions.plotOptions?.series?.events = AAEvents()
            .legendItemClick(#"""
            function() {
              return false;
            }
"""#)
        
        
        aaOptions.legend!
            .itemMarginTop(20)
            .symbolRadius(10)//图标圆角
            .symbolHeight(20)//标志高度
            .symbolWidth(20)//图标宽度
            .align(.right)
            .layout(.vertical)
            .verticalAlign(.top)
            .itemStyle(AAItemStyle()
                .color(AAColor.red)
                .fontSize(20)
                .fontWeight(.bold))
        
        return aaOptions
    }
    
    private func configureChartWithBackgroundImage() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.pie)
            .title("编程语言热度")
            .subtitle("虚拟数据")
            .dataLabelsEnabled(true)//是否直接显示扇形图数据
            .yAxisTitle("摄氏度")
            .series([
                AASeriesElement()
                    .name("语言热度占比")
                    .data([
                        ["Java"  , 67],
                        ["Swift" , 44],
                        ["Python", 83],
                        ["OC"    , 11],
                        ["Ruby"  , 42],
                        ["PHP"   , 31],
                        ["Go"    , 63],
                        ["C"     , 24],
                        ["C#"    , 888],
                        ["C++"   , 66],
                    ])
            ])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        aaOptions.chart?.plotBackgroundImage("https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2859216016,2109779587&fm=27&gp=0.jpg")
        
        return aaOptions
    }
    
    private func yAxisOnTheRightSideChart() -> AAOptions  {
        let aaChartModel = AAChartModel()
            .chartType(.line)//图表类型
            .title("yAxis on the right side 📈")//图表主标题
            .subtitle("set aaOptions.yAxis.opposite = YES")//图表副标题
            .markerSymbolStyle(.borderBlank)
            .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun","Jul", "Aug", "Sep", "Oct", "Nov", "Dec"])
            .markerRadius(8)
            .series([
                AASeriesElement()
                    .name("2020")
                    .lineWidth(5.5)
                    .color(AAGradientColor.sanguine)
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
            ])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        //是否将坐标轴显示在对立面，默认情况下 x 轴是在图表の下方显示，y 轴是在左方，
        //坐标轴显示在对立面后，x 轴是在上方显示，y 轴是在右方显示（即坐标轴会显示在对立面）。
        //该配置一般是用于多坐标轴区分展示，另外在 Highstock 中，y 轴默认是在对立面显示の。
        //默认是：false.
        aaOptions.yAxis?.opposite(true)
        return aaOptions
    }
    
    private func adjustYAxisMinValueForChart() -> AAOptions  {
        let aaChartModel = AAChartModel()
            .chartType(.column)//图表类型
            .borderRadius(5)
            .series([
                AASeriesElement()
                    .name("2020")
                    .data([1003.9, 1004.2, 1005.7, 1008.5, 1011.9, 1015.2,])
                    .color(AAGradientColor.sanguine)
            ])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        aaOptions.yAxis?.min(1000)
        return aaOptions
    }
    
    private func configureTheMirrorColumnChart() -> AAOptions {
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
            .type(.column)
        
        let aaTitle = AATitle()
            .text("正负镜像柱状图")
            .style(AAStyle()
                .color("#000000")
                .fontSize(12.0))
        
        let aaXAxis = AAXAxis()
            .categories([
                "一月", "二月", "三月", "四月", "五月", "六月",
                "七月", "八月", "九月", "十月", "十一月", "十二月"
            ])
        
        let aaYAxis1 = AAYAxis()
            .gridLineWidth(0)// Y 轴网格线宽度
            .title(AATitle()
                .text("收入"))//Y 轴标题
        
        let aaYAxis2 = AAYAxis()
            .opposite(true)
            .title(AATitle()
                .text("支出"))
        
        let YAxisArr = [aaYAxis1,aaYAxis2]
        
        let aaSeries = AASeries()
            .animation(AAAnimation()
                .duration(800)
                .easing(.bounce))
        
        let aaColumn = AAColumn()
            .grouping(false)
            .borderWidth(0)
            .borderRadius(5)
        
        let aaPlotOptions = AAPlotOptions()
            .series(aaSeries)
            .column(aaColumn)
        
        let aaSeriesElement1 = AASeriesElement()
            .name("收入")
            .color(gradientColorDic1)
            .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9,7.0, 6.9, 9.5, 14.5,])
        
        let aaSeriesElement2 = AASeriesElement()
            .name("支出")
            .color(gradientColorDic2)
            .data([-20.1, -14.1, -8.6, -2.5, -0.8, -5.7, -11.3, -17.0, -22.0, -24.8, -24.1, -20.1, -14.1, -8.6, -2.5])
        
        let aaSeriesArr = [aaSeriesElement1,aaSeriesElement2]
        
        let aaOptions = AAOptions()
            .chart(aaChart)
            .title(aaTitle)
            .xAxis(aaXAxis)
            .yAxisArray(YAxisArr)
            .plotOptions(aaPlotOptions)
            .series(aaSeriesArr)
        return aaOptions
    }
    
    private func adjustTheXAxisLabels() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.column)
            .colorsTheme(["#ffc069","#fe117c","#06caf4","#7dffc0"])
            .categories([
                "January", "February", "March", "April", "May", "June",
                "July", "August", "Septembel", "October", "November", "December",
                "January", "February", "March", "April", "May", "June",
                "July", "August", "Septembel", "October", "November", "December",])
            .dataLabelsEnabled(false)
            .legendEnabled(false)
            .series([
                AASeriesElement()
                    .name("2020")
                    .color(AAGradientColor.sanguine)
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
                ,
                AASeriesElement()
                    .name("2021")
                    .color(AAGradientColor.deepSea)
                    .data([
                        NSNull(),NSNull(),NSNull(),NSNull(),NSNull(),NSNull(),
                        NSNull(),NSNull(),NSNull(),NSNull(),NSNull(),NSNull(),
                        0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5])
                ,
                
            ])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        
        aaOptions.xAxis?
            .tickInterval(3)
            .labels(AALabels()
                .autoRotation([-10, -20, -30, -40, -50, -60, -70, -80, -90] as AnyObject))
        
        return aaOptions
    }
    
    private func adjustGroupPaddingBetweenColumns() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.column)
            .categories(["January", "February", "March", "April", "May", "June",
                         "July", "August", "Septembel", "October", "November", "December"])
            .dataLabelsEnabled(false)
            .legendEnabled(false)
            .series([
                AASeriesElement()
                    .name("2020")
                    .color(AAGradientColor.coastalBreeze)
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
                
            ])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        //    * 关于 `pointPadding`
        //https://api.highcharts.com.cn/highcharts#plotOptions.column.groupPadding
        //
        //    * 关于 `pointPadding`
        //https://api.highcharts.com.cn/highcharts#plotOptions.column.pointPadding
        aaOptions.plotOptions?.column?
            .groupPadding(0.05)//Padding between each column or bar, in x axis units. default：0.1.
            .pointPadding(0)//Padding between each value groups, in x axis units. default：0.2.
        
        return aaOptions
    }
    
    private func simpleGaugeChart() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.gauge)
            .yAxisMin(0)
            .yAxisMax(100)
            .backgroundColor(["#555555"])
            .series([
                AASeriesElement()
                    .data([80]
                )])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        
        aaOptions.pane(
            AAPane()
                .startAngle(-150)
                .endAngle(150)
        )
        
        aaOptions.tooltip?.crosshairs(false)
        aaOptions.yAxis?
            .gridLineColor(AAColor.white)
            .plotBands([
                AAPlotBandsElement()
                    .from(0)
                    .to(60)
                    .color("#FF0000")
                    .outerRadius("105%")
                    .thickness("5%")
                
            ])
        return aaOptions
    }
    
    private func gaugeChartWithPlotBand() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.gauge)
            .backgroundColor(["#555555"])
            .yAxisMin(0)
            .yAxisMax(200)
            .yAxisTitle("km/h")
            .series([
                AASeriesElement()
                    .name("Speed")
                    .data([80]
                )])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        
        aaOptions.pane(
            AAPane()
                .startAngle(-150)
                .endAngle(150)
        )
        
        aaOptions.tooltip?.crosshairs(false)
        aaOptions.yAxis?
            .gridLineColor(AAColor.white)
            .plotBands([
                AAPlotBandsElement()
                    .from(0)
                    .to(120)
                    .color("#1e90ff"),
                AAPlotBandsElement()
                    .from(120)
                    .to(160)
                    .color("#ef476f"),
                AAPlotBandsElement()
                    .from(160)
                    .to(200)
                    .color("#ffd066"),
            ])
        
        return aaOptions
    }
    
    private func configureAAPlotBandsForChart() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.spline)//图形类型
            .dataLabelsEnabled(false)
            .markerRadius(0)
            .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun","Jul", "Aug", "Sep", "Oct", "Nov", "Dec"])
            .legendEnabled(false)
            .series([
                AASeriesElement()
                    .name("Tokyo")
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
                    .color(AAColor.white)
                    .lineWidth(10)
                ,
            ])
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        let aaPlotBandsArr = [
            AAPlotBandsElement()
                .from(0)
                .to(5)
                .color("#BC2B44"),
            AAPlotBandsElement()
                .from(5)
                .to(10)
                .color("#EC6444"),
            AAPlotBandsElement()
                .from(10)
                .to(15)
                .color("#f19742"),
            AAPlotBandsElement()
                .from(15)
                .to(20)
                .color("#f3da60"),
            AAPlotBandsElement()
                .from(20)
                .to(25)
                .color("#9bd040"),
            AAPlotBandsElement()
                .from(25)
                .to(50)
                .color("#acf08f"),
        ]
        aaOptions.yAxis?.plotBands(aaPlotBandsArr)
        
        return aaOptions
    }
    
    private func configureAAPlotLinesForChart() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.areaspline)
            .dataLabelsEnabled(false)
            .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun","Jul", "Aug", "Sep", "Oct", "Nov", "Dec"])
            .legendEnabled(false)
            .series([
                AASeriesElement()
                    .name("Tokyo")
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
                    .fillOpacity(0.5)
                    .lineWidth(10)
                    .zones([
                        AAZonesElement()
                            .value(12)
                            .color("#1e90ff"),
                        AAZonesElement()
                            .value(24)
                            .color("#ef476f"),
                        AAZonesElement()
                            .value(36)
                            .color("#04d69f"),
                        AAZonesElement()
                            .color("#ffd066"),
                        
                    ])
                ,
            ])
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        
        
        let aaPlotLinesArr = [
            AAPlotLinesElement()
                .color("#1e90ff")//颜色值(16进制)
                .dashStyle(.longDashDotDot)//样式：Dash,Dot,Solid等,默认Solid
                .width((1.0)) //标示线粗细
                .value((12)) //所在位置
                .zIndex((1)) //层叠,标示线在图表中显示の层叠级别，值越大，显示越向前
                .label(AALabel()
                    .text("PLOT LINES ONE")
                    .style(AAStyle()
                        .color("#1e90ff")
                        .fontWeight(.bold)
                    )
            )
            ,
            
            AAPlotLinesElement()
                .color("#ef476f")
                .dashStyle(.longDashDot)
                .width((1))
                .value((24))
                .label(AALabel()
                    .text("PLOT LINES TWO")
                    .style(AAStyle()
                        .color("#ef476f")
                        .fontWeight(.bold)
                    )
            )
            ,
            
            AAPlotLinesElement()
                .color("#04d69f")
                .dashStyle(.longDash)
                .width((1))
                .value((36))
                .label(AALabel()
                    .text("PLOT LINES THREE")
                    .style(AAStyle()
                        .color("#04d69f")
                        .fontWeight(.bold)
                    )
            )
        ]
        
        aaOptions.yAxis?.plotLines(aaPlotLinesArr)
        
        return aaOptions
    }
    
    private func customAATooltipWithJSFuntion() -> AAOptions {
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
                        5.71, 6.22, 6.56, 4.75, 5.27, 6.02, 5.48])
                ,
            ])
        
        let aaTooltip = AATooltip()
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
        
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        aaOptions.tooltip(aaTooltip)
        
        return aaOptions
    }
    
    private func customXAxisCrosshairStyle() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.line)//图表类型
            .series([
                AASeriesElement()
                    .name("2020")
                    .color(AAGradientColor.deepSea)
                    .data([
                        [12464064, 21.5],
                        [12464928, 22.1],
                        [12465792,   23],
                        [12466656, 23.8],
                        [12467520, 21.4],
                        [12468384, 21.3],
                        [12469248, 18.3],
                        [12470112, 15.4],
                        [12470976, 16.4],
                        [12471840, 17.7],
                        [12472704, 17.5],
                        [12473568, 17.6],
                        [12474432, 17.7],
                        [12475296, 16.8],
                        [12476160, 17.7],
                        [12477024, 16.3],
                        [12477888, 17.8],
                        [12478752, 18.1],
                        [12479616, 17.2],
                        [12480480, 14.4],
                        [12481344, 13.7],
                        [12482208, 15.7],
                        [12483072, 14.6],
                        [12483936, 15.3],
                        [12484800, 15.3],
                        [12485664, 15.8],
                        [12486528, 15.2],
                        [12487392, 14.8],
                        [12488256, 14.4],
                        [12489120,   15],
                        [12489984, 13.6]
                    ])
                
            ])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        let aaCrosshair = AACrosshair()
            .dashStyle(.longDashDot)
            .color(AAColor.red)
            .width(1)
        
        aaOptions.xAxis?.crosshair(aaCrosshair)
        
        return aaOptions
    }
    
    private func configureXAxisLabelsFontColorWithHTMLString() -> AAOptions {
        let categories = [
            "<font color=\\\"#CC0066\\\">孤岛危机<\\/font>",
            "<font color=\\\"#CC0033\\\">使命召唤<\\/font>",
            "<font color=\\\"#FF0066\\\">荣誉勋章<\\/font>",
            "<font color=\\\"##66FF99\\\">狙击精英<\\/font>",
            "<font color=\\\"#00FF00\\\">神秘海域<\\/font>",
            "<font color=\\\"#00CC00\\\">美国末日<\\/font>",
            "<font color=\\\"#666FF\\\">巫师狂猎<\\/font>",
            "<font color=\\\"#000CC\\\">死亡搁浅<\\/font>",
            "<font color=\\\"#9933CC\\\">地狱边境<\\/font>",
            "<font color=\\\"##FFCC99\\\">忍者之印<\\/font>",
            "<font color=\\\"#FFCC00\\\">合金装备<\\/font>",
            "<font color=\\\"#CC99090\\\">全战三国<\\/font>",
        ]
        
        let aaChartModel = AAChartModel()
            .chartType(.areaspline)
            .stacking(.normal)
            .categories(categories)
            .dataLabelsEnabled(false)
            .markerRadius(0)
            .series([
                AASeriesElement()
                    .name("Berlin Hot")
                    .color(AAGradientColor.mysticMauve)
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
                ,
            ])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        aaOptions.xAxis?.labels?.useHTML(true)
        return aaOptions
    }
    
    private func configureXAxisLabelsFontColorAndFontSizeWithHTMLString() -> AAOptions {
        let categories = [
            "<span style=\\\"color:#CC0066;font-weight:bold;font-size:10px\\\">使命召唤</span>",
            "<span style=\\\"color:#CC0033;font-weight:bold;font-size:11px\\\">荣誉勋章</span>",
            "<span style=\\\"color:#FF0066;font-weight:bold;font-size:12px\\\">狙击精英</span>",
            "<span style=\\\"color:#66FF99;font-weight:bold;font-size:13px\\\">神秘海域</span>",
            "<span style=\\\"color:#00FF00;font-weight:bold;font-size:14px\\\">美国末日</span>",
            "<span style=\\\"color:#00CC00;font-weight:bold;font-size:15px\\\">巫师狂猎</span>",
            "<span style=\\\"color:#000CCC;font-weight:bold;font-size:15px\\\">孤岛危机</span>",
            "<span style=\\\"color:#666FFF;font-weight:bold;font-size:14px\\\">地狱边境</span>",
            "<span style=\\\"color:#9933CC;font-weight:bold;font-size:13px\\\">忍者之印</span>",
            "<span style=\\\"color:#FFCC99;font-weight:bold;font-size:12px\\\">合金装备</span>",
            "<span style=\\\"color:#FFCC00;font-weight:bold;font-size:11px\\\">全战三国</span>",
            "<span style=\\\"color:#CC9909;font-weight:bold;font-size:10px\\\">死亡搁浅</span>",
        ]
        
        let aaChartModel = AAChartModel()
            .chartType(.areaspline)
            .stacking(.normal)
            .yAxisVisible(false)
            .categories(categories)
            .markerRadius(0)
            .dataLabelsEnabled(false)
            .series([
                AASeriesElement()
                    .name("Berlin Hot")
                    .color(AAGradientColor.deepSea)
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
                ,
            ])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        aaOptions.xAxis?.labels?.useHTML(true)
        
        return aaOptions
    }
    
    private func configure_DataLabels_XAXis_YAxis_Legend_Style() -> AAOptions {
        let backgroundColorGradientColor = AAGradientColor.linearGradient(
            direction: .toTop,
            startColor: "#4F00BC",
            endColor: "#29ABE2"//颜色字符串设置支持十六进制类型和 rgba 类型
        )
        
        let fillColorGradientColor = AAGradientColor.linearGradient(
            direction: .toTop,
            startColor: "rgba(256,256,256,0.3)",
            endColor: "rgba(256,256,256,1.0)"//颜色字符串设置支持十六进制类型和 rgba 类型
        )
        
        let aaChartModel = AAChartModel()
            .chartType(.areaspline)
            .backgroundColor(backgroundColorGradientColor)
            .yAxisVisible(true)
            .yAxisTitle("")
            .categories(["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"])
            .markerRadius(0)
            .axesTextColor(AAColor.white)
            .series([
                AASeriesElement()
                    .name("Berlin Hot")
                    .color(AAColor.white)
                    .lineWidth(7)
                    .fillColor(fillColorGradientColor)
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6]),
            ])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        aaOptions.plotOptions?.areaspline?.dataLabels?
            .enabled(true)
            .style(AAStyle()
                .color(AAColor.white)
                .fontSize(14)
                .fontWeight(.thin)
                .textOutline("0px 0px contrast")//文字轮廓描边
        )
        
        let aaCrosshair = AACrosshair()
            .dashStyle(.longDashDot)
            .color(AAColor.white)
            .width(1)
        
        let aaStyle = AAStyle()
            .fontSize(10)
            .fontWeight(.bold)
            .color(AAColor.white)//轴文字颜色
        
        aaOptions.xAxis?
            .tickWidth(2)//X轴刻度线宽度
            .lineWidth(1.5)//X轴轴线宽度
            .lineColor(AAColor.white)//X轴轴线颜色
            .crosshair(aaCrosshair)
            .labels(AALabels()
                .style(aaStyle)
        )
        
        aaOptions.yAxis?
            .opposite(true)
            .tickWidth(2)
            .lineWidth(1.5)//Y轴轴线颜色
            .lineColor(AAColor.white)//Y轴轴线颜色
            .gridLineWidth(0)//Y轴网格线宽度
            .crosshair(aaCrosshair)
            .labels(AALabels()
                .format("{value} ℃")//给y轴添加单位
                .style(aaStyle)
        )
        
        return aaOptions
    }
    
    private func configureXAxisPlotBand() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.areaspline)
            .categories([
                "一月", "二月", "三月", "四月", "五月", "六月",
                "七月", "八月", "九月", "十月", "十一月", "十二月"
            ])
            .yAxisTitle("")
            .yAxisGridLineWidth(0)
            .markerRadius(8)
            .markerSymbolStyle(.innerBlank)
            .series([
                AASeriesElement()
                    .name("New York Hot")
                    .lineWidth(5.0)
                    .color("rgba(220,20,60,1)")//猩红色, alpha 透明度 1
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6]),
                AASeriesElement()
                    .type(.column)
                    .name("Berlin Hot")
                    .color("#25547c")
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6]),
            ])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        let aaPlotBandsArr = [
            AAPlotBandsElement()
                .from(-0.25)//值域颜色带X轴起始值
                .to(4.75)//值域颜色带X轴结束值
                .color("#ef476f66")//值域颜色带填充色
                .zIndex(0)//层叠,标示线在图表中显示の层叠级别，值越大，显示越向前
            ,
            AAPlotBandsElement()
                .from(4.75)
                .to(8.25)
                .color("#ffd06666")
                .zIndex(0)
            ,
            AAPlotBandsElement()
                .from(8.25)
                .to(11.25)
                .color("#04d69f66")
                .zIndex(0)
            ,        ]
        
        aaOptions.xAxis?.plotBands(aaPlotBandsArr)
        
        return aaOptions
    }
    
    private func configureDoubleYAxisChartOptions() -> AAOptions {
        let aaTitle = AATitle()
            .text("")
        
        let aaXAxis = AAXAxis()
            .visible(true)
            .min(0)
            .categories([
                "Java", "Swift", "Python", "Ruby", "PHP", "Go","C",
                "C#", "C++", "Perl", "R", "MATLAB", "SQL"
            ])
        
        let aaYAxisTitleStyle = AAStyle()
            .color("#1e90ff")//Title font color
            .fontSize(14)//Title font size
            .fontWeight(.bold)//Title font weight
            .textOutline("0px 0px contrast")
        
        let aaYAxisLabels = AALabels()
            .enabled(true)//设置 y 轴是否显示数字
            .format("{value:.,0f}mm")//让y轴の值完整显示 而不是100000显示为100k,同时单位后缀为°C
            .style(AAStyle()
                .color("#ff0000")//yAxis Label font color
                .fontSize(15)//yAxis Label font size
                .fontWeight(.bold)//yAxis Label font weight
        )
        
        let yAxisOne = AAYAxis()
            .visible(true)
            .labels(aaYAxisLabels)
            .title(AATitle()
                .text("冬季降雨量")
                .style(aaYAxisTitleStyle))
            .opposite(true)
        
        
        let yAxisTwo = AAYAxis()
            .visible(true)
            .labels(aaYAxisLabels)
            .title(AATitle()
                .text("夏季降雨量")
                .style(aaYAxisTitleStyle))
        
        let aaTooltip = AATooltip()
            .enabled(true)
            .shared(true)
        
        let gradientColorDic1 = AAGradientColor.linearGradient(
            direction: .toTop,
            startColor: "#f54ea2",
            endColor: "#ff7676"//颜色字符串设置支持十六进制类型和 rgba 类型
        )
        
        let gradientColorDic2 = AAGradientColor.linearGradient(
            direction: .toTop,
            startColor: "#17ead9",
            endColor: "#6078ea"//颜色字符串设置支持十六进制类型和 rgba 类型
        )
        
        let aaMarker = AAMarker()
            .radius(7)//曲线连接点半径，默认是4
            .symbol(AAChartSymbolType.circle.rawValue)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
            .fillColor("#ffffff")//点の填充色(用来设置折线连接点の填充色)
            .lineWidth(3)//外沿线の宽度(用来设置折线连接点の轮廓描边の宽度)
            .lineColor("")//外沿线の颜色(用来设置折线连接点の轮廓描边颜色，当值为空字符串时，默认取数据点或数据列の颜色)
        
        let element1 = AASeriesElement()
            .name("2017")
            .type(.areaspline)
            //          .borderRadius(4)
            .color(gradientColorDic1)
            .marker(aaMarker)
            .yAxis(1)
            .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
        
        let element2 = AASeriesElement()
            .name("2018")
            .type(.column)
            .color(gradientColorDic2)
            .yAxis(0)
            .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
        
        let aaOptions = AAOptions()
            .title(aaTitle)
            .xAxis(aaXAxis)
            .yAxisArray([yAxisOne,yAxisTwo])
            .tooltip(aaTooltip)
            .series([element1,element2])
        
        return aaOptions
    }
    
    private func configureTripleYAxesMixedChart() -> AAOptions {
        let colorsThemeArr = [
            "red",
            "mediumspringgreen",
            "deepskyblue",
        ]
        
        let aaTitle = AATitle()
            .text("东京月平均天气数据")
        
        let aaSubtitle = AASubtitle()
            .text("数据来源: WorldClimate.com")
        
        let aaXAxis = AAXAxis()
            .visible(true)
            .min(0)
            .categories([
                "一月", "二月", "三月", "四月", "五月", "六月",
                "七月", "八月", "九月", "十月", "十一月", "十二月"
            ])
        
        let yAxis1 = AAYAxis()
            .visible(true)
            .gridLineWidth(0)
            .labels(AALabels()
                .enabled(true)//设置 y 轴是否显示数字
                .format("{value}°C")
                .style(AAStyle()
                    .color(colorsThemeArr[2])//yAxis Label font color
            ))
            .title(AATitle()
                .text("温度")
                .style(AAStyle()
                    .color(colorsThemeArr[2])))
            .opposite(true)
        
        let yAxis2 = AAYAxis()
            .visible(true)
            .gridLineWidth(0)
            .labels(AALabels()
                .enabled(true)//设置 y 轴是否显示数字
                .format("{value}°mm")
                .style(AAStyle()
                    .color(colorsThemeArr[0])//yAxis Label font color
            ))
            .title(AATitle()
                .text("降雨量")
                .style(AAStyle()
                    .color(colorsThemeArr[0])))
        
        let yAxis3 = AAYAxis()
            .visible(true)
            .gridLineWidth(0)
            .labels(AALabels()
                .enabled(true)//设置 y 轴是否显示数字
                .format("{value}°mb")
                .style(AAStyle()
                    .color(colorsThemeArr[1])//yAxis Label font color
            ))
            .title(AATitle()
                .text("海平面气压")
                .style(AAStyle()
                    .color(colorsThemeArr[1])))
            .opposite(true)
        
        
        let aaTooltip = AATooltip()
            .enabled(true)
            .shared(true)
        
        let aaLegend = AALegend()
            .enabled(true)
            .floating(true)
            .layout(.vertical)
            .align(.left)
            .x(80)
            .verticalAlign(.top)
            .y(55)
        
        let element1 = AASeriesElement()
            .name("降雨量")
            .type(.column)
            .yAxis(1)
            .data([49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4])
            .tooltip(AATooltip()
                .valueSuffix(" mm"))
        
        let element2 = AASeriesElement()
            .name("海平面气压")
            .type(.line)
            .yAxis(2)
            .data([1016, 1016, 1015.9, 1015.5, 1012.3, 1009.5, 1009.6, 1010.2, 1013.1, 1016.9, 1018.2, 1016.7])
            .dashStyle(.shortDot)
            .tooltip(AATooltip()
                .valueSuffix(" mb"))
        
        let element3 = AASeriesElement()
            .name("温度")
            .type(.line)
            .yAxis(0)
            .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
            .tooltip(AATooltip()
                .valueSuffix(" ℃"))
        
        let aaOptions = AAOptions()
            .title(aaTitle)
            .subtitle(aaSubtitle)
            .colors(colorsThemeArr)
            .xAxis(aaXAxis)
            .yAxisArray([yAxis1,yAxis2,yAxis3])
            .tooltip(aaTooltip)
            .legend(aaLegend)
            .series([element1,element2,element3,])
        
        return aaOptions
    }
    
    private func configureDoubleYAxesAndColumnLineMixedChart() -> AAOptions {
        let stopsArr = [
            [0.0, "rgba(156,107,211,0.5)"],//颜色字符串设置支持十六进制类型和 rgba 类型
            [0.2, "rgba(156,107,211,0.3)"],
            [1.0, "rgba(156,107,211,0)"]
        ]
        
        let gradientColorDic1 = AAGradientColor.linearGradient(
            direction: .toBottom,
            stops: stopsArr)
        
        let gradientColorDic2 = AAGradientColor.linearGradient(
            direction: .toBottom,
            startColor: "#956FD4",
            endColor: "#3EACE5"//颜色字符串设置支持十六进制类型和 rgba 类型
        )
        
        let category = [
            "市区","万州","江北","南岸","北碚","綦南","长寿","永川","璧山","江津",
            "城口","大足","垫江","丰都","奉节","合川","江津区","开州","南川","彭水",
            "黔江","石柱","铜梁","潼南","巫山","巫溪","武隆","秀山","酉阳","云阳",
            "忠县","川东","检修"
        ]
        
        let goalValuesArr = [
            18092,20728,24045,28348,32808
            ,36097,39867,44715,48444,50415
            ,56061,62677,59521,67560,18092,20728,24045,28348,32808
            ,36097,39867,44715,48444,50415,36097,39867,44715,48444,50415
            ,50061,32677,49521,32808
        ]
        
        let realValuesArr = [
            4600,5000,5500,6500,7500
            ,8500,9900,12500,14000,21500
            ,23200,24450,25250,33300,4600,5000,5500,6500,7500
            ,8500,9900,22500,14000,21500,8500,9900,12500,14000,21500
            ,23200,24450,25250,7500
        ]
        
        var rateValuesArr = [Float]()
        
        for i in 0 ..< 33 {
            let goalValue = goalValuesArr[i]
            let realValue = realValuesArr[i]
            let rateValue = Float(realValue) / Float(goalValue)
            rateValuesArr.append(rateValue)
        }
        
        let aaChart = AAChart()
            .backgroundColor("#191E40")
        
        let aaTitle = AATitle()
            .text("")
        
        let aaLabels = AALabels()
            .enabled(true)
            .style(AAStyle()
                .color(AAColor.lightGray))
        
        let aaXAxis = AAXAxis()
            .visible(true)
            .labels(aaLabels)
            .min(0)
            .categories(category)
        
        let aaYAxisTitleStyle = AAStyle()
            .color("#1e90ff")//Title font color
            .fontSize(14)//Title font size
            .fontWeight(AAChartFontWeightType.bold)//Title font weight
            .textOutline("0px 0px contrast")
        
        let yAxis1 = AAYAxis()
            .visible(true)
            .labels(aaLabels)
            .gridLineWidth(0)
            .title(AATitle()
                .text("已贯通 / 计划贯通")
                .style(aaYAxisTitleStyle))
        
        let yAxis2 = AAYAxis()
            .visible(true)
            .labels(aaLabels)
            .gridLineWidth(0)
            .title(AATitle()
                .text("贯通率")
                .style(aaYAxisTitleStyle))
            .opposite(true)
        
        let aaTooltip = AATooltip()
            .enabled(true)
            .shared(true)
        
        let aaPlotOptions = AAPlotOptions()
            .series(AASeries()
                .animation(AAAnimation()
                    .easing(.easeTo)
                    .duration(1000)))
            .column(AAColumn()
                .grouping(false)
                .pointPadding(0)
                .pointPlacement((0))
        )
        
        let aaLegend = AALegend()
            .enabled(true)
            .itemStyle(AAItemStyle()
                .color(AAColor.lightGray))
            .floating(true)
            .layout(.horizontal)
            .align(.left)
            .x(30)
            .verticalAlign(.top)
            .y(10)
        
        let goalValuesElement = AASeriesElement()
            .name("计划贯通")
            .type(.column)
            .borderWidth(0)
            .color(gradientColorDic1)
            .yAxis(0)
            .data(goalValuesArr)
        
        let realValuesElement = AASeriesElement()
            .name("已贯通")
            .type(.column)
            .borderWidth(0)
            .color(gradientColorDic2)
            .yAxis(0)
            .data(realValuesArr)
        
        let rateValuesElement = AASeriesElement()
            .name("贯通率")
            .type(.spline)
            .marker(AAMarker()
                .radius(7)//曲线连接点半径，默认是4
                .symbol(AAChartSymbolType.circle.rawValue)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                .fillColor("#ffffff")//点の填充色(用来设置折线连接点の填充色)
                .lineWidth(3)//外沿线の宽度(用来设置折线连接点の轮廓描边の宽度)
                .lineColor("")//外沿线の颜色(用来设置折线连接点の轮廓描边颜色，当值为空字符串时，默认取数据点或数据列の颜色)
        )
            .color("#F02FC2")
            .yAxis(1)
            .data(rateValuesArr)
        
        let aaOptions = AAOptions()
            .chart(aaChart)
            .title(aaTitle)
            .xAxis(aaXAxis)
            .yAxisArray([yAxis1,yAxis2])
            .tooltip(aaTooltip)
            .plotOptions(aaPlotOptions)
            .legend(aaLegend)
            .series([
                goalValuesElement,
                realValuesElement,
                rateValuesElement])
        
        return aaOptions
    }
    
    private func configureDoubleYAxesMarketDepthChart() -> AAOptions {
        let aaChart = AAChart()
            .type(.area)
        
        let aaTitle = AATitle()
            .text("ETH-BTC 市场深度图")
        
        let aaSubtitle = AASubtitle()
            .text("数据来源: https://github.com/AAChartModel")
        
        let aaXAxis = AAXAxis()
            .visible(true)
            .plotLines([
                AAPlotLinesElement()
                    .color(AAColor.red)
                    .value(0.1523)
                    .width(1.1)
                    .dashStyle(.longDashDotDot)
                    .label(AALabel()
                        .text("实际价格")
                        .rotation(90))
            ])
        
        let yAxis1 = AAYAxis()
            .visible(true)
            .lineWidth(1)
            .tickWidth(1)
            .tickLength(5)
            .tickPosition("inside")
            .gridLineWidth(1)
            .title(AATitle()
                .text(""))
            .labels(AALabels()
                .enabled(true)//设置 y 轴是否显示数字
                .align("left")
                .x(8)
        )
        
        let yAxis2 = AAYAxis()
            .opposite(true)
            .visible(true)
            .lineWidth(1)
            .tickWidth(1)
            .tickLength(5)
            .tickPosition("inside")
            .gridLineWidth(0)
            .title(AATitle()
                .text(""))
            .labels(AALabels()
                .enabled(true)//设置 y 轴是否显示数字
                .align("right")
                .x(-8)
        )
        
        let aaTooltip = AATooltip()
            .enabled(true)
            .headerFormat("<span style=\\\"font-size=10px;\\\">Price: {point.key}</span><br/>")
            .valueDecimals(2)
        
        let aaLegend = AALegend()
            .enabled(false)
        
        let element1 = AASeriesElement()
            .name("Bids")
            .color("#04d69f")
            .step(true)
            .data([
                [0.1524, 0.948665],
                [0.1539, 35.510715],
                [0.154,  39.883437],
                [0.1541, 40.499661],
                [0.1545, 43.262994000000006],
                [0.1547, 60.14799400000001],
                [0.1553, 60.30799400000001],
                [0.1558, 60.55018100000001],
                [0.1564, 68.381696],
                [0.1567, 69.46518400000001],
                [0.1569, 69.621464],
                [0.157,  70.398015],
                [0.1574, 70.400197],
                [0.1575, 73.199217],
                [0.158,  77.700017],
                [0.1583, 79.449017],
                [0.1588, 79.584064],
                [0.159,  80.584064],
                [0.16,   81.58156],
                [0.1608, 83.38156]
            ])
        
        let element2 = AASeriesElement()
            .name("Asks")
            .color("#1e90ff")
            .step(true)
            .data([
                [0.1435, 242.521842],
                [0.1436, 206.49862099999999],
                [0.1437, 205.823735],
                [0.1438, 197.33275],
                [0.1439, 153.677454],
                [0.144,  146.007722],
                [0.1442, 82.55212900000001],
                [0.1443, 59.152814000000006],
                [0.1444, 57.942260000000005],
                [0.1445, 57.483850000000004],
                [0.1446, 52.39210800000001],
                [0.1447, 51.867208000000005],
                [0.1448, 44.104697],
                [0.1449, 40.131217],
                [0.145,  31.878217],
                [0.1451, 22.794916999999998],
                [0.1453, 12.345828999999998],
                [0.1454, 10.035642],
                [0.148,  9.326642],
                [0.1522, 3.76317]
            ])
        
        let aaOptions = AAOptions()
            .chart(aaChart)
            .title(aaTitle)
            .subtitle(aaSubtitle)
            .xAxis(aaXAxis)
            .yAxisArray([yAxis1,yAxis2])
            .tooltip(aaTooltip)
            .legend(aaLegend)
            .series([element1,element2])
        return aaOptions
    }
    
    // Chart Sample Online:   https://jshare.com.cn/highcharts/hhhhG1
    private func customAreaChartTooltipStyleLikeHTMLTable() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.areaspline)//图形类型
            .markerSymbolStyle(.borderBlank)//折线连接点样式为外边缘空白
            .dataLabelsEnabled(false)
            .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])
            .stacking(.normal)
            .markerRadius(0)
            .series([
                AASeriesElement()
                    .name("TokyoHot")
                    .lineWidth(5.0)
                    .fillOpacity(0.4)
                    .data([0.45, 0.43, 0.50, 0.55, 0.58, 0.62, 0.83, 0.39, 0.56, 0.67, 0.50, 0.34, 0.50, 0.67, 0.58, 0.29, 0.46, 0.23, 0.47, 0.46, 0.38, 0.56, 0.48, 0.36])
                ,
                AASeriesElement()
                    .name("BerlinHot")
                    .lineWidth(5.0)
                    .fillOpacity(0.4)
                    .data([0.38, 0.31, 0.32, 0.32, 0.64, 0.66, 0.86, 0.47, 0.52, 0.75, 0.52, 0.56, 0.54, 0.60, 0.46, 0.63, 0.54, 0.51, 0.58, 0.64, 0.60, 0.45, 0.36, 0.67])
                ,
                AASeriesElement()
                    .name("NewYorkHot")
                    .lineWidth(5.0)
                    .fillOpacity(0.4)
                    .data([0.46, 0.32, 0.53, 0.58, 0.86, 0.68, 0.85, 0.73, 0.69, 0.71, 0.91, 0.74, 0.60, 0.50, 0.39, 0.67, 0.55, 0.49, 0.65, 0.45, 0.64, 0.47, 0.63, 0.64])
                ,
                AASeriesElement()
                    .name("LondonHot")
                    .lineWidth(5.0)
                    .fillOpacity(0.4)
                    .data([0.60, 0.51, 0.52, 0.53, 0.64, 0.84, 0.65, 0.68, 0.63, 0.47, 0.72, 0.60, 0.65, 0.74, 0.66, 0.65, 0.71, 0.59, 0.65, 0.77, 0.52, 0.53, 0.58, 0.53])
                ,
            ])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        aaOptions.tooltip?
            .shared(true)
            .useHTML(true)
            .headerFormat("<small>{point.key}</small><table>")
            .pointFormat("<tr><td style=\\\"color: {series.color}\\\">{series.name}: </td>"
                + "<td style=\\\"text-align: right\\\"><b>{point.y}EUR</b></td></tr>")
            .footerFormat("</table>")
        
        return aaOptions
    }
    
    
    private func customAxesGridLineStyle() -> AAOptions  {
        let aaChartModel = AAChartModel()
            .chartType(.line)//图表类型
            .title("custom Axes Grid Line Style")//图表主标题
            .markerSymbolStyle(.borderBlank)
            .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun","Jul", "Aug", "Sep", "Oct", "Nov", "Dec"])
            .markerRadius(8)
            .series([
                AASeriesElement()
                    .name("2020")
                    .lineWidth(5.5)
                    .color(AAGradientColor.sanguine)
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
            ])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        
        aaOptions.yAxis?
            .opposite(true)
            .gridLineDashStyle(.shortDashDot)
            .gridLineWidth(3)
            .gridLineColor(AAColor.lightGray)
        
        aaOptions.xAxis?
            .gridLineDashStyle(.shortDashDotDot)
            .gridLineWidth(3)
            .gridLineColor(AAColor.gray)
        
        return aaOptions
    }
    
    // https://github.com/AAChartModel/AAChartKit-Swift/issues/213
    private func customRadarChartStyle() -> AAOptions {
        let aaChartModel = AAChartModel()
            .colorsTheme(["#5BCCC8"])
            .chartType(.area)
            .dataLabelsEnabled(false)
            .xAxisVisible(true)
            .yAxisVisible(true)
            .yAxisLabelsEnabled(false)
            .polar(true)
            .markerRadius(8)
            .markerSymbol(.circle)
            .markerSymbolStyle(.borderBlank)
            .legendEnabled(false)
            .touchEventEnabled(false)
            .series([
                AASeriesElement()
                    .data([86, 90, 65])
            ])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        
        let categories = ["智力感", "距离感", "成熟感"]
        let categoryJSArrStr = javaScriptArrayStringWithSwiftArray(categories)
        
        let xAxisLabelsFormatter = """
        function () {
        return \(categoryJSArrStr)[this.value];
        }
        """
        
        aaOptions.yAxis?
            .tickPositions([0, 25, 50, 75, 100])
            .gridLineColor("#DDDDDD")
            .gridLineWidth(2.0)
            .gridLineDashStyle(.dash)
        
        aaOptions.xAxis?
            .lineColor("#5BCCC8")
            .lineWidth(5)
            .gridLineColor(AAColor.red)
            .gridLineWidth(3)
            .gridLineDashStyle(.longDashDotDot)
            .tickPositions([0,1,2,0])
        
        aaOptions.xAxis?.labels?
            
            .formatter(xAxisLabelsFormatter)
        
        return aaOptions
    }
    
    private func customColumnrangeChartStyle() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.columnrange)
            .title("TEMPERATURE VARIATION BY MONTH")
            .subtitle("observed in Gotham city")
            .yAxisTitle("℃")
            .colorsTheme(["#fe117c","#06caf4",])//Colors theme
            .borderRadius(6)
            .categories([
                "January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"
            ])
            .series([
                AASeriesElement()
                    .name("temperature1")
                    .data([
                        [-9.7,  9.4],
                        [-8.7,  6.5],
                        [-3.5,  9.4],
                        [-1.4, 19.9],
                        [0.0,  22.6],
                        [2.9,  29.5],
                        [-9.7,  9.4],
                        [-8.7,  6.5],
                        [-3.5,  9.4],
                        [-1.4, 19.9],
                        [0.0,  22.6],
                        [2.9,  29.5],
                    ]),
                AASeriesElement()
                    .name("temperature2")
                    .data([
                        [9.2,  30.7],
                        [7.3,  26.5],
                        [4.4,  18.0],
                        [-3.1, 11.4],
                        [-5.2, 10.4],
                        [-13.5, 9.8],
                        [9.2,  30.7],
                        [7.3,  26.5],
                        [4.4,  18.0],
                        [-3.1, 11.4],
                        [-5.2, 10.4],
                        [-13.5, 9.8]
                    ]),
            ])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        
        //    *  关于 `pointPadding`
        //https://api.highcharts.com.cn/highcharts#plotOptions.column.groupPadding
        //
        //    * 关于 `pointPadding`
        //https://api.highcharts.com.cn/highcharts#plotOptions.column.pointPadding
        
        aaOptions.plotOptions?.columnrange?
            .grouping(false)
            .groupPadding(0.003)
        
        return aaOptions
    }
    
    private func customXAxisLabelsBeImages() -> AAOptions {
        let imageLinkStrArr = [
            "<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197582.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>",
            "<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197604.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>",
            "<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197507.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>",
            "<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197571.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>",
            "<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197408.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>",
            "<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197375.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>",
            "<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197374.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>",
            "<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197484.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>"
        ]
        
        let aaChartModel = AAChartModel()
            .chartType(.areaspline)
            .stacking(.normal)
            .yAxisVisible(false)
            .categories(imageLinkStrArr)
            .markerRadius(0)
            .series([
                AASeriesElement()
                    .name("Berlin Hot")
                    .color(AAGradientColor.sanguine)
                    .data([7.0, 6.9, 2.5, 14.5, 13.2, 18.2, 29.5, 21.5, ]),
            ])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        aaOptions.xAxis?.labels?.useHTML = true
        return aaOptions
    }
    
    //三角形雷达图
    private func configureTriangleRadarChart() -> AAOptions  {
        let aaChartModel = AAChartModel()
            .chartType(.area)
            .backgroundColor(AAColor.white)
            .markerRadius(0)
            .yAxisMax(25)
            .yAxisGridLineWidth(1)
            .polar(true)
            .legendEnabled(false)
            .tooltipEnabled(false)
            .xAxisGridLineWidth(1)
            .yAxisGridLineWidth(1)
            .dataLabelsEnabled(true)
            .series([
                AASeriesElement()
                    .color(AAColor.white)
                    .fillOpacity(0.01)
                    .dataLabels(AADataLabels()
                        .color(AAColor.rgbaColor(30, 144, 255, 1.0)))
                    .data([17.0, 16.9, 12.5,]),
            ])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        
        aaOptions.xAxis?
            .tickInterval(1)
            .lineWidth(0)//避免多边形外环之外有额外套了一层无用の外环
            .gridLineColor(AAColor.rgbaColor(30, 144, 255, 0.6))
            .crosshair(AACrosshair()
                .width(1.5)
                .color(AAColor.white)
                .dashStyle(.longDashDotDot))
        
        aaOptions.yAxis?
            .gridLineInterpolation("polygon")
            .lineWidth(0)
            .gridLineColor(AAColor.rgbaColor(30, 144, 255, 1.0))
            .crosshair(AACrosshair()
                .width(1.5)
                .color(AAColor.white)
                .dashStyle(.longDashDotDot))
            .tickPositions([5,10,15,20,25,])
        
        let aaPlotBandsArr = [
            AAPlotBandsElement()
                .from(0)
                .to(5)
                .color(AAColor.rgbaColor(30, 144, 255, 1.0)),
            AAPlotBandsElement()
                .from(5)
                .to(10)
                .color(AAColor.rgbaColor(30, 144, 255, 0.8)),
            AAPlotBandsElement()
                .from(10)
                .to(15)
                .color(AAColor.rgbaColor(30, 144, 255, 0.6)),
            AAPlotBandsElement()
                .from(15)
                .to(20)
                .color(AAColor.rgbaColor(30, 144, 255, 0.4)),
            AAPlotBandsElement()
                .from(20)
                .to(25)
                .color(AAColor.rgbaColor(30, 144, 255, 0.2)),
        ]
        
        let aaYAxis = aaOptions.yAxis
        aaYAxis?.plotBands = aaPlotBandsArr
        return aaOptions
    }
    
    //四边形雷达图
    private func configureQuadrangleRadarChart() -> AAOptions {
        let aaOptions: AAOptions = configureTriangleRadarChart()
        aaOptions.yAxis?.plotBands = [
            AAPlotBandsElement()
                .from(0)
                .to(5)
                .color(AAColor.rgbaColor(255, 0, 0, 1.0)),
            AAPlotBandsElement()
                .from(5)
                .to(10)
                .color(AAColor.rgbaColor(255, 0, 0, 0.8)),
            AAPlotBandsElement()
                .from(10)
                .to(15)
                .color(AAColor.rgbaColor(255, 0, 0, 0.6)),
            AAPlotBandsElement()
                .from(15)
                .to(20)
                .color(AAColor.rgbaColor(255, 0, 0, 0.4)),
            AAPlotBandsElement()
                .from(20)
                .to(25)
                .color(AAColor.rgbaColor(255, 0, 0, 0.2)),
        ]
        
        aaOptions.xAxis?.gridLineColor = AAColor.rgbaColor(255, 0, 0, 0.6)
        aaOptions.yAxis?.gridLineColor = AAColor.rgbaColor(255, 0, 0, 1.0)
        
        let element = aaOptions.series![0] as! AASeriesElement
        element
            .data([17.0, 16.9, 12.5, 14.5,])
            .dataLabels(AADataLabels()
                .color(AAColor.rgbaColor(255, 0, 0, 1.0)))
        
        
        return aaOptions
    }
    
    //五边形雷达图
    private func configurePentagonRadarChart() -> AAOptions {
        let aaOptions = configureTriangleRadarChart()
        aaOptions.yAxis?.plotBands = [
            AAPlotBandsElement()
                .from(0)
                .to(5)
                .color(AAColor.rgbaColor(255, 215, 0, 1.0)),
            AAPlotBandsElement()
                .from(5)
                .to(10)
                .color(AAColor.rgbaColor(255, 215, 0, 0.8)),
            AAPlotBandsElement()
                .from(10)
                .to(15)
                .color(AAColor.rgbaColor(255, 215, 0, 0.6)),
            AAPlotBandsElement()
                .from(15)
                .to(20)
                .color(AAColor.rgbaColor(255, 215, 0, 0.4)),
            AAPlotBandsElement()
                .from(20)
                .to(25)
                .color(AAColor.rgbaColor(255, 215, 0, 0.2)),
        ]
        
        aaOptions.xAxis?.gridLineColor = AAColor.rgbaColor(255, 215, 0, 0.6)
        aaOptions.yAxis?.gridLineColor = AAColor.rgbaColor(255, 215, 0, 1.0)
        
        let element = aaOptions.series![0] as! AASeriesElement
        element
            .data([17.0, 16.9, 12.5, 14.5, 18.2,])
            .dataLabels(AADataLabels()
                .color(AAColor.rgbaColor(255, 215, 0, 1.0)))
        
        
        return aaOptions
    }
    
    //六边形雷达图
    private func configureHexagonRadarChart() -> AAOptions {
        let aaOptions = configureTriangleRadarChart()
        aaOptions.yAxis?.plotBands = [
            AAPlotBandsElement()
                .from(0)
                .to(5)
                .color(AAColor.rgbaColor(50, 205, 50, 1.0)),
            AAPlotBandsElement()
                .from(5)
                .to(10)
                .color(AAColor.rgbaColor(50, 205, 50, 0.8)),
            AAPlotBandsElement()
                .from(10)
                .to(15)
                .color(AAColor.rgbaColor(50, 205, 50, 0.6)),
            AAPlotBandsElement()
                .from(15)
                .to(20)
                .color(AAColor.rgbaColor(50, 205, 50, 0.4)),
            AAPlotBandsElement()
                .from(20)
                .to(25)
                .color(AAColor.rgbaColor(50, 205, 50, 0.2)),
        ]
        
        aaOptions.xAxis?.gridLineColor = AAColor.rgbaColor(50, 205, 50, 0.6)
        aaOptions.yAxis?.gridLineColor = AAColor.rgbaColor(50, 205, 50, 1.0)
        
        let element = aaOptions.series![0] as! AASeriesElement
        element
            .data([17.0, 16.9, 12.5, 14.5, 18.2, 21.5,])
            .dataLabels(AADataLabels()
                .color(AAColor.rgbaColor(50, 205, 50, 1.0)))
        
        
        return aaOptions
    }
    
    //🕸蜘蛛网状雷达图
    private func configureSpiderWebRadarChart() -> AAOptions {
        let aaOptions = configureTriangleRadarChart()
        aaOptions.yAxis?.plotBands = [
            AAPlotBandsElement()
                .from(0)
                .to(5)
                .color(AAColor.rgbaColor(138, 43, 226, 1.0)),
            AAPlotBandsElement()
                .from(5)
                .to(10)
                .color(AAColor.rgbaColor(138, 43, 226,  0.8)),
            AAPlotBandsElement()
                .from(10)
                .to(15)
                .color(AAColor.rgbaColor(138, 43, 226,  0.6)),
            AAPlotBandsElement()
                .from(15)
                .to(20)
                .color(AAColor.rgbaColor(138, 43, 226, 0.4)),
            AAPlotBandsElement()
                .from(20)
                .to(25)
                .color(AAColor.rgbaColor(138, 43, 226, 0.2)),
        ]
        
        aaOptions.xAxis?.gridLineColor = AAColor.rgbaColor(138, 43, 226,  0.6)
        aaOptions.yAxis?.gridLineColor = AAColor.rgbaColor(138, 43, 226,  1.0)
        
        let element = aaOptions.series![0] as! AASeriesElement
        element
            .data([2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24])
            .dataLabels(AADataLabels()
                .color(AAColor.rgbaColor(138, 43, 226, 1.0)))
        
        
        return aaOptions
    }
    
    
    //Convert Swift array to be JavaScript array
    private func javaScriptArrayStringWithSwiftArray(_ swiftArray: [Any]) -> String {
        var originalJsArrStr = ""
        for element in swiftArray {
            originalJsArrStr = originalJsArrStr + "'\(element)',"
        }
        
        let finalJSArrStr = "[\(originalJsArrStr)]"
        return finalJSArrStr
    }
}


