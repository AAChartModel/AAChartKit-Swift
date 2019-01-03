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
            .colorsTheme(["#ffc069","#fe117c","#06caf4","#7dffc0"])//设置主体颜色数组
            .series([
                AASeriesElement()
                    .name("2020")
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
                    .color(AAGradientColor.sanguine)
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
        aaChart.setValue(AAChartType.column.rawValue, forKey: "type")//图表类型
        
        let aaTitle = NSMutableDictionary()
        aaTitle.setValue("正负镜像柱状图", forKey: "text")//标题文本内容
        aaTitle.setValue(
            ["color":"#000000",//标题颜色
                "fontSize":"12px"],//标题字体大小
            forKey: "style")
        
        let aaXAxis = NSMutableDictionary()
        aaXAxis.setValue(["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"], forKey: "categories")
        
        let aaYAxis1 = NSMutableDictionary()
        aaYAxis1.setValue(0, forKey: "gridLineWidth") // Y 轴网格线宽度
        aaYAxis1.setValue(["text":"收入"], forKey: "title")//Y 轴标题
//        aaYAxis1.setValue(0, forKey: "min")
        
        let aaYAxis2 = NSMutableDictionary()
        aaYAxis2.setValue(["text":"支出"], forKey: "title")//Y 轴标题
        aaYAxis2.setValue(true, forKey: "opposite")
        
        let YAxisArr = [aaYAxis1,aaYAxis2]
        
        let aaPlotOptions = NSMutableDictionary()
        
        let aaSeries = NSMutableDictionary()
        let animation = ["duration":800,
                         "easing":AAChartAnimationType.bounce.rawValue]
            as [String : Any]
        aaSeries.setValue(animation, forKey: "animation")
        
        let aaColumn = NSMutableDictionary()
        aaColumn .setValue(false, forKey: "grouping")
        aaColumn.setValue(0, forKey: "borderWidth")
        aaColumn.setValue(5, forKey: "borderRadius")
        
        aaPlotOptions.setValue(aaSeries, forKey: "series")
        aaPlotOptions.setValue(aaColumn, forKey: "column")

        let aaSeriesElementArr = [
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
        
        let aaOptions = NSMutableDictionary()
        aaOptions.setValue(aaChart, forKey: "chart")
        aaOptions.setValue(aaTitle, forKey: "title")
        aaOptions.setValue(aaXAxis, forKey: "xAxis")
        aaOptions.setValue(YAxisArr, forKey: "yAxis")
        aaOptions.setValue(aaPlotOptions, forKey: "plotOptions")
        aaOptions.setValue(aaSeriesElementArr, forKey: "series")
        
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
    
}


