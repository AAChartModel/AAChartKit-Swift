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

class DrawChartWithAAOptionsVC: UIViewController {
    private var aaChartModel: AAChartModel?
    private var aaChartView: AAChartView?
    public var chartType: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "DrawChartWithAAOptions"
        
        let aaChartView = setUpChartView()
        let aaOptions = configureAAOptions()
        
        aaChartView.aa_drawChartWithChartOptions(aaOptions)
    }
    
    private func configureAAOptions() -> AAOptions {
        switch self.chartType {
        case 0: return setUpOptions0()
        case 1: return setUpOptions1()
        case 2: return setUpOptions2()
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
    
    private func setUpOptions0() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.area)//图形类型
            .axisColor("#ffffff")
            .title("")//图形标题
            .subtitle("")//图形副标题
            .dataLabelsEnabled(false)//是否显示数字
            .tooltipValueSuffix("℃")//浮动提示框单位后缀
            .animationType(.bounce)//图形渲染动画类型为"bounce"
            .series([
                AASeriesElement()
                    .name("Tokyo")
                    .fillColor(AAGradientColor.berrySmoothie)
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
                    ,
                ])
        let aaOptions = AAOptionsComposer.configureAAOptions(aaChartModel: aaChartModel)
        
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
                
                ]
        )
        
        let aaOptions = AAOptionsComposer.configureAAOptions(aaChartModel: aaChartModel)
    aaOptions.chart?.plotBackgroundImage("https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2859216016,2109779587&fm=27&gp=0.jpg")
        
        return aaOptions
    }
    
    private func yAxisOnTheRightSideChart() -> AAOptions  {
        let aaChartModel = AAChartModel()
            .chartType(.column)//图表类型
            .title("Y轴在右侧的柱状图📊")//图表主标题
            .subtitle("设置 aaOptions.yAxis.opposite = YES 即可")//图表副标题
            .series([
                AASeriesElement()
                    .name("2020")
                    .color(AAGradientColor.cottonCandy)
                    .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2,])
                
                ]
        )
        
        let aaOptions = AAOptionsComposer.configureAAOptions(aaChartModel: aaChartModel)
        //是否将坐标轴显示在对立面，默认情况下 x 轴是在图表的下方显示，y 轴是在左方，
        //坐标轴显示在对立面后，x 轴是在上方显示，y 轴是在右方显示（即坐标轴会显示在对立面）。
        //该配置一般是用于多坐标轴区分展示，另外在 Highstock 中，y 轴默认是在对立面显示的。
        //默认是：false.
        aaOptions.yAxis?.opposite(true)
        return aaOptions
    }
    
    private func adjustYAxisMinValueForChart() -> AAOptions  {
        let aaChartModel = AAChartModel()
            .chartType(.column)//图表类型
            .title("")//图表主标题
            .subtitle("")//图表副标题
            .borderRadius(5)
            .series([
                AASeriesElement()
                    .name("2020")
                    .data([1003.9, 1004.2, 1005.7, 1008.5, 1011.9, 1015.2,])
                    .color(AAGradientColor.sanguine)
                
                ]
        )
        
        let aaOptions = AAOptionsComposer.configureAAOptions(aaChartModel: aaChartModel)
        aaOptions.yAxis?.min(1000)
        return aaOptions
    }
    
    private func configureTheMirrorColumnChart() -> AAOptions  {
        let aaChart = NSMutableDictionary()
        aaChart["type"] = AAChartType.column.rawValue
        
        let aaTitle = NSMutableDictionary()
        aaTitle["text"] = "正负镜像柱状图"
        aaTitle["style"] = [
            "color":"#000000",//标题颜色
            "fontSize":"12px"
        ]
        
        let aaXAxis = NSMutableDictionary()
        aaXAxis["categories"] = [
            "一月", "二月", "三月", "四月", "五月", "六月",
            "七月", "八月", "九月", "十月", "十一月", "十二月"
        ]
        
        let aaYAxis1 = NSMutableDictionary()
        aaYAxis1["gridLineWidth"] = 0 // Y 轴网格线宽度
        aaYAxis1["title"] = ["text":"收入"]//Y 轴标题
        
        let aaYAxis2 = NSMutableDictionary()
        aaYAxis2["title"] = ["text":"支出"]
        aaYAxis2["opposite"] = true
        
        let YAxisArr = [aaYAxis1,aaYAxis2]
        
        
        let aaSeries = NSMutableDictionary()
        let aaAnimation = [
            "duration":800,
            "easing":AAChartAnimationType.bounce.rawValue
            ] as [String : Any]
        aaSeries["animation"] = aaAnimation
        
        let aaColumn = NSMutableDictionary()
        aaColumn["grouping"] = false
        aaColumn["borderWidth"] = 0
        aaColumn["borderRadius"] = 5
        
        let aaPlotOptions = NSMutableDictionary()
        aaPlotOptions["series"] = aaSeries
        aaPlotOptions["column"] = aaColumn
        
        let aaOptions = NSMutableDictionary()
        aaOptions["chart"] = aaChart
        aaOptions["title"] = aaTitle
        aaOptions["xAxis"] = aaXAxis
        aaOptions["yAxis"] = YAxisArr
        aaOptions["plotOptions"] = aaPlotOptions
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
        
        aaOptions["series"] = [
            ["name": "收入",
                "data": [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9,7.0, 6.9, 9.5, 14.5,],
                "color":gradientColorDic1
            ],
            ["name": "支出",
                "data": [-20.1, -14.1, -8.6, -2.5, -0.8, -5.7, -11.3, -17.0, -22.0, -24.8, -24.1, -20.1, -14.1, -8.6, -2.5],
                "color":gradientColorDic2
            ],
        ]
        return AAOptions()
    }
    
    private func adjustTheXAxisLabels() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.column)
            .title("")
            .subtitle("")
            .colorsTheme(["#ffc069","#fe117c","#06caf4","#7dffc0"])
            .categories(["January", "February", "March", "April", "May", "June",
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
                    .data([NSNull(),NSNull(),NSNull(),NSNull(),NSNull(),NSNull(),
                           NSNull(),NSNull(),NSNull(),NSNull(),NSNull(),NSNull(),
                           0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5])
                    ,
                
                ]
        )
        
        let aaOptions = AAOptionsComposer.configureAAOptions(aaChartModel: aaChartModel)
        
        aaOptions.xAxis?
            .tickInterval(3)
            .labels(AALabels()
                .autoRotation([-10, -20, -30, -40, -50, -60, -70, -80, -90] as AnyObject))
       
        return aaOptions
    }

    private func adjustGroupPaddingBetweenColumns() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.column)
            .title("")
            .subtitle("")
            .categories(["January", "February", "March", "April", "May", "June",
                         "July", "August", "Septembel", "October", "November", "December"])
            .dataLabelsEnabled(false)
            .legendEnabled(false)
            .series([
                AASeriesElement()
                    .name("2020")
                    .color(AAGradientColor.coastalBreeze)
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
                
                ]
        )
        
        let aaOptions = AAOptionsComposer.configureAAOptions(aaChartModel: aaChartModel)
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
    
    private func setUpOptions1() -> AAOptions {
        let aaOptions = [
                "chart": [
                    "type": "gauge"
                ],
                "pane": [
                    "startAngle": -150,
                    "endAngle": 150
                ],
                "yAxis": [
                    "min": 0,
                    "max": 100,
                    "plotBands": [
                        [
                            "from": 0,
                            "to": 60,
                            "color": "#FF0000",
                            "outerRadius": "105%",
                            "thickness": "5%"
                        ]]
                ],
                "series": [[
                    "data": [80]
                    ]]
                ] as NSMutableDictionary
        return AAOptions()
    }
    
    private func setUpOptions2() -> AAOptions {
        let aaOptions = [
            "chart": [
                "type": "gauge",
            ],
            "title": [
                "text": "速度仪"
            ],
            "pane": [
                "startAngle": -150,
                "endAngle": 150,
            ],
            // the value axis
            "yAxis": [
                "min": 0,
                "max": 200,
                
                "title": [
                    "text": "km/h"
                ],
                "plotBands": [[
                    "from": 0,
                    "to": 120,
                    "color": "#ffc069"
                    ], [
                        "from": 120,
                        "to": 160,
                        "color": "#fe117c"
                    ], [
                        "from": 160,
                        "to": 200,
                        "color": "#06caf4"
                    ]]
            ],
            "series": [[
                "name": "Speed",
                "data": [80],
                ]]
            ] as NSMutableDictionary
        return AAOptions()
    }
    
   private func configureAAPlotBandsForChart() -> AAOptions {
        let aaChartModel = AAChartModel()
            .title("")
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
        let aaOptions = AAOptionsComposer.configureAAOptions(aaChartModel: aaChartModel)
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
            .title("")
            .chartType(.areaspline)//图形类型chartOptions.toDic()!
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
                        ["value": 12, "color": "#1e90ff"],
                        ["value": 24, "color": "#ef476f"],
                        ["value": 36, "color": "#04d69f"],
                        ["color": "#ffd066"]
                        ])
                    ,
                ])
        let aaOptions = AAOptionsComposer.configureAAOptions(aaChartModel: aaChartModel)
        
        
        let aaPlotLinesArr = [
            AAPlotLinesElement()
                .color("#1e90ff")//颜色值(16进制)
                .dashStyle(.longDashDotDot)//样式：Dash,Dot,Solid等,默认Solid
                .width((1.0)) //标示线粗细
                .value((12)) //所在位置
                .zIndex((1)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
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
            .symbolStyle(.borderBlank)//折线连接点样式为外边缘空白
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
                    .data([1.51, 6.7, 0.94, 1.44, 1.6, 1.63, 1.56, 1.91, 2.45, 3.87, 3.24, 4.90, 4.61, 4.10,
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
        
        
    let aaOptions = AAOptionsComposer.configureAAOptions(aaChartModel: aaChartModel)
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
                
                ]
        )
        
        let aaOptions = AAOptionsComposer.configureAAOptions(aaChartModel: aaChartModel)
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
            .title("")
            .subtitle("")
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
                ]
            );
        
        let aaOptions = AAOptionsComposer.configureAAOptions(aaChartModel: aaChartModel)
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
        "<span style=\\\"color:#666FF;font-weight:bold;font-size:15px\\\">孤岛危机</span>",
        "<span style=\\\"color:#000CC;font-weight:bold;font-size:14px\\\">地狱边境</span>",
        "<span style=\\\"color:#9933CC;font-weight:bold;font-size:13px\\\">忍者之印</span>",
        "<span style=\\\"color:#FFCC99;font-weight:bold;font-size:12px\\\">合金装备</span>",
        "<span style=\\\"color:#FFCC00;font-weight:bold;font-size:11px\\\">全战三国</span>",
        "<span style=\\\"color:#CC99090;font-weight:bold;font-size:10px\\\">死亡搁浅</span>",
        ]

        let aaChartModel = AAChartModel()
            .chartType(.areaspline)
            .title("")
            .subtitle("")
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
                ]
        )
        
        let aaOptions = AAOptionsComposer.configureAAOptions(aaChartModel: aaChartModel)
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
            .title("")
            .subtitle("")
            .backgroundColor(backgroundColorGradientColor)
            .yAxisVisible(true)
            .yAxisTitle("")
            .categories(["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"])
            .markerRadius(0)
            .axisColor(AAColor.white)
            .series([
                AASeriesElement()
                    .name("Berlin Hot")
                    .color(AAColor.white)
                    .lineWidth(7)
                    .fillColor(fillColorGradientColor)
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6]),
                ])
        
        let aaOptions = AAOptionsComposer.configureAAOptions(aaChartModel: aaChartModel)
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
        
        let aaLabels = AALabels()
            .style(AAStyle()
                .fontSize(10)
                .fontWeight(.bold)
                .color(AAColor.white)//轴文字颜色
        )
        
       aaOptions.xAxis?
        .tickWidth(2)//X轴刻度线宽度
        .lineWidth(1.5)//X轴轴线宽度
        .lineColor(AAColor.white)//X轴轴线颜色
        .crosshair(aaCrosshair)
        .labels(aaLabels)
        
        aaOptions.yAxis?
            .opposite(true)
            .tickWidth(2)
            .lineWidth(1.5)//Y轴轴线颜色
            .lineColor(AAColor.white)//Y轴轴线颜色
            .gridLineWidth(0)//Y轴网格线宽度
            .crosshair(aaCrosshair)
            .labels(aaLabels
                .format("{value} ℃")//给y轴添加单位
        )
        
        return aaOptions;
    }
    
    private func configureXAxisPlotBand() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.areaspline)
            .title("")
            .subtitle("")
            .categories(["一月", "二月", "三月", "四月", "五月", "六月",
                         "七月", "八月", "九月", "十月", "十一月", "十二月"])
            .yAxisTitle("")
            .yAxisGridLineWidth(0)
            .markerRadius(8)
            .symbolStyle(.innerBlank)
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
        
        let aaOptions = AAOptionsComposer.configureAAOptions(aaChartModel: aaChartModel)
        let aaPlotBandsArr = [
            AAPlotBandsElement()
                .from(-0.25)//值域颜色带X轴起始值
                .to(4.75)//值域颜色带X轴结束值
                .color("#ef476f66")//值域颜色带填充色
                .zIndex(0)//层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
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
}


