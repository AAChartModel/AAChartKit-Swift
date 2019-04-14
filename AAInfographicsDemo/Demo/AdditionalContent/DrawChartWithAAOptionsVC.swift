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
    
    private func configureAAOptions() -> NSMutableDictionary {
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
        case 10:return configureAAPlotLinesForChart()
        default:
            return NSMutableDictionary()
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
    
    private func setUpOptions0() -> NSMutableDictionary {
        let aaChartModel = AAChartModel()
            .chartType(.area)//图形类型
            .colorsTheme(["#1e90ff","#ef476f","#ffd066","#04d69f","#25547c",])//主题颜色数组
            .axisColor("#ffffff")
            .title("")//图形标题
            .subtitle("")//图形副标题
            .dataLabelEnabled(false)//是否显示数字
            .tooltipValueSuffix("℃")//浮动提示框单位后缀
            .animationType(.bounce)//图形渲染动画类型为"bounce"
            .series([
                AASeriesElement()
                    .name("Tokyo")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
                    .toDic()!,
                ])
        let aaOptions = AAOptionsConstructor.configureAAoptions(aaChartModel: aaChartModel)
        
        return aaOptions
    }
    
    private func configureChartWithBackgroundImage() -> NSMutableDictionary {
        let aaChartModel = AAChartModel()
            .chartType(.pie)
            .title("编程语言热度")
            .subtitle("虚拟数据")
            .dataLabelEnabled(true)//是否直接显示扇形图数据
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
                .toDic()!
                ]
        )
        
        let aaOptions = AAOptionsConstructor.configureAAoptions(aaChartModel: aaChartModel)
        let aaChart = aaOptions["chart"] as! NSMutableDictionary
        aaChart["plotBackgroundImage"] = "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2859216016,2109779587&fm=27&gp=0.jpg"
        
        return aaOptions
    }
    
    private func yAxisOnTheRightSideChart() -> NSMutableDictionary  {
        let aaChartModel = AAChartModel()
            .chartType(.column)//图表类型
            .title("Y轴在右侧的柱状图📊")//图表主标题
            .subtitle("设置 aaOptions.yAxis.opposite = YES 即可")//图表副标题
            .series([
                AASeriesElement()
                    .name("2020")
                    .color(AAGradientColor.cottonCandy!)
                    .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2,])
                    .toDic()!
                ]
        )
        
        let aaOptions = AAOptionsConstructor.configureAAoptions(aaChartModel: aaChartModel)
        //是否将坐标轴显示在对立面，默认情况下 x 轴是在图表的下方显示，y 轴是在左方，
        //坐标轴显示在对立面后，x 轴是在上方显示，y 轴是在右方显示（即坐标轴会显示在对立面）。
        //该配置一般是用于多坐标轴区分展示，另外在 Highstock 中，y 轴默认是在对立面显示的。
        //默认是：false.
        let aaYAxis = aaOptions["yAxis"] as! NSMutableDictionary
        aaYAxis["opposite"] = true
        return aaOptions;
    }
    
    private func adjustYAxisMinValueForChart() -> NSMutableDictionary  {
        let aaChartModel = AAChartModel()
            .chartType(.column)//图表类型
            .title("")//图表主标题
            .subtitle("")//图表副标题
            .borderRadius(5)
            .series([
                AASeriesElement()
                    .name("2020")
                    .data([1003.9, 1004.2, 1005.7, 1008.5, 1011.9, 1015.2,])
                    .color(AAGradientColor.sanguine!)
                    .toDic()!
                ]
        )
        
        let aaOptions = AAOptionsConstructor.configureAAoptions(aaChartModel: aaChartModel)
        let aaYAxis = aaOptions["yAxis"] as! NSMutableDictionary
        aaYAxis["min"] = 1000
        return aaOptions;
    }
    
    private func configureTheMirrorColumnChart() -> NSMutableDictionary  {
       let gradientColorDic1 = [
            "linearGradient": [
                "x1": 0,
                "y1": 1,
                "x2": 0,
                "y2": 0
            ],
            "stops": [[0,"#7052f4"],
                      [1,"#00b0ff"]]//颜色字符串设置支持十六进制类型和 rgba 类型
        ] as [String : Any]
        
        let gradientColorDic2 = [
            "linearGradient": [
                "x1": 0,
                "y1": 1,
                "x2": 0,
                "y2": 0
            ],
            "stops": [[0,"#EF71FF"],
                      [1,"#4740C8"]]//颜色字符串设置支持十六进制类型和 rgba 类型
            ] as [String : Any]
        
        let aaChart = NSMutableDictionary()
        aaChart["type"] = AAChartType.column.rawValue
        
        let aaTitle = NSMutableDictionary()
        aaTitle["text"] = "正负镜像柱状图"
        aaTitle["style"] = ["color":"#000000",//标题颜色
                            "fontSize":"12px"]//标题字体大小
        
        let aaXAxis = NSMutableDictionary()
        aaXAxis["categories"] = ["一月", "二月", "三月", "四月", "五月", "六月",
                                 "七月", "八月", "九月", "十月", "十一月", "十二月"]
        
        let aaYAxis1 = NSMutableDictionary()
        aaYAxis1["gridLineWidth"] = 0 // Y 轴网格线宽度
        aaYAxis1["title"] = ["text":"收入"]//Y 轴标题
        
        let aaYAxis2 = NSMutableDictionary()
        aaYAxis2["title"] = ["text":"支出"]
        aaYAxis2["opposite"] = true
        
        let YAxisArr = [aaYAxis1,aaYAxis2]
        
        
        let aaSeries = NSMutableDictionary()
        let aaAnimation = ["duration":800,
                           "easing":AAChartAnimationType.bounce.rawValue]
            as [String : Any]
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
        aaOptions["series"] = [
            AASeriesElement()
                .name("收入")
                .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9,7.0, 6.9, 9.5, 14.5,])
                .color(gradientColorDic1)
                .toDic()!,
            AASeriesElement()
                .name("支出")
                .data([-20.1, -14.1, -8.6, -2.5, -0.8, -5.7, -11.3, -17.0, -22.0, -24.8, -24.1, -20.1, -14.1, -8.6, -2.5])
                .color(gradientColorDic2)
                .toDic()!,
        ]
        return aaOptions;
    }
    
    private func adjustTheXAxisLabels() -> NSMutableDictionary {
        let aaChartModel = AAChartModel()
            .chartType(.column)
            .title("")
            .subtitle("")
            .colorsTheme(["#ffc069","#fe117c","#06caf4","#7dffc0"])
            .categories(["January", "February", "March", "April", "May", "June",
                         "July", "August", "Septembel", "October", "November", "December",
                         "January", "February", "March", "April", "May", "June",
                         "July", "August", "Septembel", "October", "November", "December",])
            .dataLabelEnabled(false)
            .legendEnabled(false)
            .series([
                AASeriesElement()
                    .name("2020")
                    .color(AAGradientColor.sanguine!)
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
                    .toDic()!,
                AASeriesElement()
                    .name("2021")
                    .color(AAGradientColor.deepSea!)
                    .data([NSNull(),NSNull(),NSNull(),NSNull(),NSNull(),NSNull(),
                           NSNull(),NSNull(),NSNull(),NSNull(),NSNull(),NSNull(),
                           0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5])
                    .toDic()!,
                
                ]
        )
        
        let aaOptions = AAOptionsConstructor.configureAAoptions(aaChartModel: aaChartModel)
        
        let aaXAxisLabels =  ["autoRotation": [-10, -20, -30, -40, -50, -60, -70, -80, -90]]
        
        let aaXAxis = aaOptions["xAxis"] as! NSMutableDictionary
        
        aaXAxis["labels"] = aaXAxisLabels
        
        return aaOptions;
    }
    
    
    private func adjustGroupPaddingBetweenColumns() -> NSMutableDictionary {
        let aaChartModel = AAChartModel()
            .chartType(.column)
            .title("")
            .subtitle("")
            .categories(["January", "February", "March", "April", "May", "June",
                         "July", "August", "Septembel", "October", "November", "December"])
            .dataLabelEnabled(false)
            .legendEnabled(false)
            .series([
                AASeriesElement()
                    .name("2020")
                    .color(AAGradientColor.coastalBreeze!)
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
                    .toDic()!
                ]
        )
        
        let aaOptions = AAOptionsConstructor.configureAAoptions(aaChartModel: aaChartModel)
        
        let aaPlotOptions =  aaOptions["plotOptions"]! as! NSMutableDictionary
        
        let aaColumn = aaPlotOptions["column"]! as! NSMutableDictionary
        
        //    * 关于 `pointPadding`
        //https://api.highcharts.com.cn/highcharts#plotOptions.column.groupPadding
        //
        //    * 关于 `pointPadding`
        //https://api.highcharts.com.cn/highcharts#plotOptions.column.pointPadding
        aaColumn["groupPadding"] = 0.05 //Padding between each column or bar, in x axis units. default：0.1.
        aaColumn["pointPadding"] = 0 //Padding between each value groups, in x axis units. default：0.2.
        
        return aaOptions;
    }
    
    private func setUpOptions1() -> NSMutableDictionary {
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
        return aaOptions
    }
    
    private func setUpOptions2() -> NSMutableDictionary {
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
        return aaOptions
    }
    
    func configureAAPlotBandsForChart() -> NSMutableDictionary {
        let aaChartModel = AAChartModel()
            .chartType(.spline)//图形类型
            .dataLabelEnabled(false)
            .markerRadius(0)
            .series([
                AASeriesElement()
                    .name("Tokyo")
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
                    .color(AAColor.white!)
                    .lineWidth(10)
                    .toDic()!,
                ])
        let aaOptions = AAOptionsConstructor.configureAAoptions(aaChartModel: aaChartModel)
        let aaPlotBandsArr = [
            AAPlotBandsElement()
                .from(0)
                .to(5)
                .color("#BC2B44")
                .toDic()!,
            AAPlotBandsElement()
                .from(5)
                .to(10)
                .color("#EC6444")
                .toDic()!,
            AAPlotBandsElement()
                .from(10)
                .to(15)
                .color("#f19742")
                .toDic()!,
            AAPlotBandsElement()
                .from(15)
                .to(20)
                .color("#f3da60")
                .toDic()!,
            AAPlotBandsElement()
                .from(20)
                .to(25)
                .color("#9bd040")
                .toDic()!,
            AAPlotBandsElement()
                .from(25)
                .to(50)
                .color("#acf08f")
                .toDic()!,
        ]
        
        let aaYAxis = aaOptions["yAxis"] as! NSMutableDictionary
        aaYAxis["plotBands"] = aaPlotBandsArr
        return aaOptions
    }
    
    func configureAAPlotLinesForChart() -> NSMutableDictionary {
        let aaChartModel = AAChartModel()
            .chartType(.areaspline)//图形类型
            .dataLabelEnabled(false)
            .series([
                AASeriesElement()
                    .name("Tokyo")
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
                    .fillOpacity(0.5)
                    .lineWidth(10)
                    .zones([
                        ["value": 12,"color": "#1e90ff"],
                        ["value": 24,"color": "#ef476f"],
                        ["value": 36,"color": "#04d69f"],
                        ["color": "#ffd066"]
                        ])
                    .toDic()!,
                ])
        let aaOptions = AAOptionsConstructor.configureAAoptions(aaChartModel: aaChartModel)
        
        
        let aaPlotLinesArr = [
            AAPlotLinesElement()
                .color("#1e90ff")//颜色值(16进制)
                .dashStyle(.longDashDotDot)//样式：Dash,Dot,Solid等,默认Solid
                .width((1)) //标示线粗细
                .value((12)) //所在位置
                .zIndex((1)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
                .label(AALabel()
                    .text("PLOT LINES ONE")
                    .style(AAStyle()
                        .color("#1e90ff")
                        .fontWeight(.bold)
                        .toDic()!)
                    .toDic()!
                )
                .toDic()!
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
                        .toDic()!)
                    .toDic()!)
                .toDic()!
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
                        .toDic()!)
                    .toDic()!)
                .toDic()!
        ]
        
        let aaYAxis = aaOptions["yAxis"] as! NSMutableDictionary
        aaYAxis["plotLines"] = aaPlotLinesArr
        
        return aaOptions
    }
    
    
    
}


