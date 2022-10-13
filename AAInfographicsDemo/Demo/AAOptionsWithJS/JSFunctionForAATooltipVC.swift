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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 *********************************************************************************
 */

import UIKit
import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class JSFunctionForAATooltipVC: AABaseChartVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func chartConfigurationWithSelectedIndex(_ selectedIndex: Int) -> Any? {
        switch selectedIndex {
        case 0: return customAreaChartTooltipStyleWithSimpleFormatString() //自定义区域图表的浮动提示框样式(使用简单的字符串格式化功能)
        case 1: return customAreaChartTooltipStyleWithDifferentUnitSuffix() //自定义区域图表的浮动提示框样式(使用不同单位后缀)
        case 2: return customAreaChartTooltipStyleWithColorfulHtmlLabels() //自定义区域图表的浮动提示框样式(使用多彩的 HTML 标签格式)
        case 3: return customLineChartTooltipStyleWhenValueBeZeroDoNotShow() //自定义折线图表的浮动提示框样式(当值为零时,不显示浮动提示框)
        case 4: return customBoxplotTooltipContent() //自定义箱线图的浮动提示框内容
        case 5: return customStackedAndGroupedColumnChartTooltip() //自定义堆积柱状图和分组柱状图的浮动提示框内容
        case 6: return customArearangeChartTooltip() //自定义区域范围图的浮动提示框内容
        case 7: return customLineChartOriginalPointPositionByConfiguringXAxisFormatterAndTooltipFormatter() //自定义折线图的原始点位置(通过配置 X 轴的数据格式化字符串和浮动提示框的数据格式化字符串)
        case 8: return customTooltipWhichDataSourceComeFromOutSideRatherThanSeries() //自定义浮动提示框,其数据源来自于外部,而不是来自于图表的 series 数据
        case 9: return customAreasplineChartTooltipStyleByDivWithCSS() //自定义曲线图的浮动提示框样式(通过 div 标签和 CSS 样式)
        default:
            return AAOptions()
        }
    }


    //https://github.com/AAChartModel/AAChartKit/issues/569
    private func customAreaChartTooltipStyleWithSimpleFormatString() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.area)//图形类型
            .title("近三个月金价起伏周期图")//图表主标题
            .subtitle("金价(元/克)")//图表副标题
            .markerSymbolStyle(.borderBlank)//折线连接点样式为外边缘空白
            .dataLabelsEnabled(false)
            .categories([
                "10-01", "10-02", "10-03", "10-04", "10-05", "10-06", "10-07", "10-08", "10-09", "10-10", "10-11",
                "10-12", "10-13", "10-14", "10-15", "10-16", "10-17", "10-18", "10-19", "10-20", "10-21", "10-22",
                "10-23", "10-24", "10-25", "10-26", "10-27", "10-28", "10-29", "10-30", "10-31", "11-01", "11-02",
                "11-03", "11-04", "11-05", "11-06", "11-07", "11-08", "11-09", "11-10", "11-11", "11-12", "11-13",
                "11-14", "11-15", "11-16", "11-17", "11-18", "11-19", "11-20", "11-21", "11-22", "11-23", "11-24",
                "11-25", "11-26", "11-27", "11-28", "11-29", "11-30", "12-01", "12-02", "12-03", "12-04", "12-05",
                "12-06", "12-07", "12-08", "12-09", "12-10", "12-11", "12-12", "12-13", "12-14", "12-15", "12-16",
                "12-17", "12-18", "12-19", "12-20", "12-21", "12-22", "12-23", "12-24" ,"12-25" ,"12-26" ,"12-27",
                "12-28", "12-29", "12-30"
            ])
            .series([
                AASeriesElement()
                    .name("2020")
                    .lineWidth(3)
                    .color("#FFD700"/*纯金色*/)
                    .fillOpacity(0.5)
                    .data([
                        1.51, 6.70, 0.94, 1.44, 1.60, 1.63, 1.56, 1.91, 2.45, 3.87, 3.24, 4.90, 4.61, 4.10,
                        4.17, 3.85, 4.17, 3.46, 3.46, 3.55, 3.50, 4.13, 2.58, 2.28, 1.51, 12.7, 0.94, 1.44,
                        18.6, 1.63, 1.56, 1.91, 2.45, 3.87, 3.24, 4.90, 4.61, 4.10, 4.17, 3.85, 4.17, 3.46,
                        3.46, 3.55, 3.50, 4.13, 2.58, 2.28, 1.33, 4.68, 1.31, 1.10, 13.9, 1.10, 1.16, 1.67,
                        2.64, 2.86, 3.00, 3.21, 4.14, 4.07, 3.68, 3.11, 3.41, 3.25, 3.32, 3.07, 3.92, 3.05,
                        2.18, 3.24, 3.23, 3.15, 2.90, 1.81, 2.11, 2.43, 5.59, 3.09, 4.09, 6.14, 5.33, 6.05,
                        5.71, 6.22, 6.56, 4.75, 5.27, 6.02, 5.48
                    ])
            ])
        
        let aaOptions = aaChartModel.aa_toAAOptions()
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
            .backgroundColor(AAColor.black)
            .borderColor(AAColor.black)
            .style(AAStyle(color: "#FFD700", fontSize: 12))
        
        return aaOptions
    }
    
    //https://github.com/AAChartModel/AAChartKit/issues/647
    //https://github.com/AAChartModel/AAChartKit/issues/891
    private func customAreaChartTooltipStyleWithDifferentUnitSuffix() -> AAOptions {
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
        
        let aaOptions = aaChartModel.aa_toAAOptions()
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
        
        //禁用图例点击事件
        aaOptions.plotOptions?.series?.events = AAEvents()
            .legendItemClick(#"""
                        function() {
                          return false;
                        }
            """#)
        
        return aaOptions
    }
    
    //https://github.com/AAChartModel/AAChartKit/issues/653
    private func customAreaChartTooltipStyleWithColorfulHtmlLabels() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.areaspline)//图形类型
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
        
        let aaOptions = aaChartModel.aa_toAAOptions()
        aaOptions.tooltip?
            .useHTML(true)
            .formatter(#"""
function () {
        let wholeContentStr ='<span style=\"' + 'color:lightGray; font-size:13px\"' + '>◉ Time: ' + this.x + ' year</span><br/>';
        let length = this.points.length;
        for (let i = 0; i < length; i++) {
            let thisPoint = this.points[i];
            let yValue = thisPoint.y;
            if (yValue != 0) {
                let spanStyleStartStr = '<span style=\"' + 'color:'+ thisPoint.color + '; font-size:13px\"' + '>◉ ';
                let spanStyleEndStr = '</span> <br/>';
                wholeContentStr += spanStyleStartStr + thisPoint.series.name + ': ' + thisPoint.y + '℃' + spanStyleEndStr;
            }
        }
        return wholeContentStr;
    }
"""#)
            .backgroundColor("#050505")
            .borderColor("#050505")
        
        return aaOptions
    }
    
    //https://github.com/AAChartModel/AAChartKit/issues/651
    private func customLineChartTooltipStyleWhenValueBeZeroDoNotShow() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.line)//图形类型
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
        
        let aaOptions = aaChartModel.aa_toAAOptions()
        aaOptions.tooltip?
            .useHTML(true)
            .formatter(#"""
    function () {
        let wholeContentStr = this.points[0].x + '<br/>';
        let length = this.points.length;
        for (let i = 0; i < length; i++) {
            let thisPoint = this.points[i];
            let yValue = thisPoint.y;
            if (yValue != 0) {
                let prefixStr = '<span style=\"' + 'color:'+ thisPoint.color + '; font-size:13px\"' + '>◉ ';
                wholeContentStr += prefixStr + thisPoint.series.name + ': ' + yValue + '<br/>';
            }
        }
        return wholeContentStr;
    }
    """#)
        
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
        
        //https://jshare.com.cn/demos/hhhhiQ
        //https://jsfiddle.net/gh/get/library/pure/highcharts/highcharts/tree/master/samples/highcharts/tooltip/footerformat/
        //pointFormat: '' + // eslint-disable-line no-dupe-keys
        let pointFormatStr = (
            "◉</span> <b> {series.name}</b><br/>"
            + "最大值: {point.high}<br/>"
            + "Q2: {point.q3}<br/>"
            + "中位数: {point.median}<br/>"
            + "Q1: {point.q1}<br/>"
            + "最小值: {point.low}<br/>"
        )
        
        let aaOptions = aaChartModel.aa_toAAOptions()
        aaOptions.tooltip?
            .useHTML(true)
            .headerFormat("<em>实验号码： {point.key}</em><br/>")
            .pointFormat(pointFormatStr)
            .valueDecimals(2)//设置取值精确到小数点后几位//设置取值精确到小数点后几位
            .backgroundColor(AAColor.black)
            .borderColor(AAColor.black)
            .style(AAStyle(color: "#1e90ff", fontSize: 12))
        
        return aaOptions
    }

    //https://github.com/AAChartModel/AAChartKit/issues/685
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
        let aaOptions = aaChartModel.aa_toAAOptions()
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
        
        return aaOptions
    }

    //https://github.com/AAChartModel/AAChartKit/issues/781
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
                ])
        
          let aaOptions = aaChartModel.aa_toAAOptions()
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
                    .backgroundColor(AAColor.black)
                    .borderColor(AAColor.black)
                    .style(AAStyle(color: "#FFD700", fontSize: 12))
                
                return aaOptions
    }
    
    //https://github.com/AAChartModel/AAChartKit/issues/577
    //https://github.com/AAChartModel/AAChartKit/issues/937
    private func customLineChartOriginalPointPositionByConfiguringXAxisFormatterAndTooltipFormatter() -> AAOptions {
        let categories = ["Jan", "Feb", "Mar", "Apr", "May", "Jun","Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        
        let categoryJSArrStr = categories.aa_toJSArray()
        
        let tooltipFormatter = """
        function () {
        return  'The value for <b>' + \(categoryJSArrStr)[this.x] +
        '</b> is <b>' + this.y + '</b> ' + "℃";
        }
        """
        
        let xAxisLabelsFormatter = """
        function () {
        return \(categoryJSArrStr)[this.value];
        }
        """
        
        let aaChartModel = AAChartModel()
            .chartType(.line)
            .colorsTheme(["#1e90ff","#ef476f","#ffd066","#04d69f","#25547c",])//Colors theme
            .xAxisLabelsStyle(AAStyle(color: AAColor.white))
            .dataLabelsEnabled(false)
            .tooltipValueSuffix("℃")
            .animationType(.bounce)
            .backgroundColor("#22324c")//To make the chart background color transparent, set backgroundColor to "rgba (0,0,0,0)" or "# 00000000". Also make sure `aaChartView!.IsClearBackgroundColor = true`
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
        
        let aaOptions = aaChartModel.aa_toAAOptions()
        
        aaOptions.tooltip?
            .useHTML(true)
            .formatter(tooltipFormatter)
        
        aaOptions.xAxis?.labels?
            .formatter(xAxisLabelsFormatter)
        
        return aaOptions
    }
    
    //https://github.com/AAChartModel/AAChartKit/issues/826
    private func customTooltipWhichDataSourceComeFromOutSideRatherThanSeries() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.column)//图表类型
            .yAxisTitle("")//设置 Y 轴标题
            .yAxisLineWidth(1)//Y轴轴线线宽为0即是隐藏Y轴轴线
            .yAxisGridLineWidth(1)//y轴横向分割线宽度为1(为0即是隐藏分割线)
            .colorsTheme(["#FFD700"/*纯金色*/])
            .categories(["一月", "二月", "三月", "四月", "五月", "六月",
                         "七月", "八月", "九月", "十月", "十一月", "十二月"])
            .yAxisMax(110)
            .series([
                AASeriesElement()
                    .name("2017")
                    .data([55, 55, 55, 55, 55, 55, 55, 55, 55, 55, 55, 55, ])
            ])
        
        let 看近时长数组 = [70, 69, 95, 14, 18, 21, 25, 26, 23, 18, 13, 96]
        let 看中时长数组 = [20, 80, 57, 11, 17, 22, 24, 24, 20, 14, 86, 25]
        let 看远时长数组 = [90, 60, 35, 84, 13, 17, 18, 17, 14, 90, 39, 10]
        
        var 总时长数组 = [Float]()
        
        for i in 0 ..< 12 {
            let 单个总时长 = 看近时长数组[i] + 看中时长数组[i] + 看远时长数组[i]
            总时长数组.append(Float(单个总时长))
        }
        
        let 有效时长数组 = [39, 42, 57, 85, 19, 15, 17, 16, 14, 13, 66, 48]
        
        let 切换次数数组 = [
            arc4random() % 10, arc4random() % 10, arc4random() % 10,
            arc4random() % 10, arc4random() % 10, arc4random() % 10,
            arc4random() % 10, arc4random() % 10, arc4random() % 10,
            arc4random() % 10, arc4random() % 10, arc4random() % 10,
        ]
        
        let 停止次数数组 = [
            arc4random() % 10, arc4random() % 10, arc4random() % 10,
            arc4random() % 10, arc4random() % 10, arc4random() % 10,
            arc4random() % 10, arc4random() % 10, arc4random() % 10,
            arc4random() % 10, arc4random() % 10, arc4random() % 10,
        ]
        
        let 干预次数数组 = [
            arc4random() % 10, arc4random() % 10, arc4random() % 10,
            arc4random() % 10, arc4random() % 10, arc4random() % 10,
            arc4random() % 10, arc4random() % 10, arc4random() % 10,
            arc4random() % 10, arc4random() % 10, arc4random() % 10,
        ]
        
        let 总时长JS数组 = 总时长数组.aa_toJSArray()
        let 有效时长JS数组 = 有效时长数组.aa_toJSArray()
        let 看近时长JS数组 = 看近时长数组.aa_toJSArray()
        let 看中时长JS数组 = 看中时长数组.aa_toJSArray()
        let 看远时长JS数组 = 看远时长数组.aa_toJSArray()
        let 切换次数JS数组 = 切换次数数组.aa_toJSArray()
        let 停止次数JS数组 = 停止次数数组.aa_toJSArray()
        let 干预次数JS数组 = 干预次数数组.aa_toJSArray()
        
        let jsFormatterStr = """
        function () {
        let 总时长数组 = \(总时长JS数组);
        let 有效时长数组 = \(有效时长JS数组);
        let 看近时长数组 = \(看近时长JS数组);
        let 看中时长数组 = \(看中时长JS数组);
        let 看远时长数组 = \(看远时长JS数组);
        let 切换次数数组 = \(切换次数JS数组);
        let 停止次数数组 = \(停止次数JS数组);
        let 干预次数数组 = \(干预次数JS数组);
        let 时间单位后缀 = "min<br/>";
        let 频率单位后缀 = "次<br/>";
        
        let pointIndex = this.point.index;
        let 单个总时长字符串 = "总时长: &nbsp &nbsp" + 总时长数组[pointIndex] + 时间单位后缀;
        let 单个有效时长字符串 = "有效时长: &nbsp" + 有效时长数组[pointIndex] + 时间单位后缀;
        let 单个看近时长字符串 = "看近时长: &nbsp" + 看近时长数组[pointIndex] + 时间单位后缀;
        let 单个看中时长字符串 = "看中时长: &nbsp" + 看中时长数组[pointIndex] + 时间单位后缀;
        let 单个看远时长字符串 = "看远时长: &nbsp" + 看远时长数组[pointIndex] + 时间单位后缀;
        let 单个切换次数字符串 = "切换次数: &nbsp" + 切换次数数组[pointIndex] + 频率单位后缀;
        let 单个停止次数字符串 = "停止次数: &nbsp" + 停止次数数组[pointIndex] + 频率单位后缀;
        let 单个干预次数字符串 = "干预次数: &nbsp" + 干预次数数组[pointIndex] + 频率单位后缀;
        
        let wholeContentString =  单个总时长字符串 + 单个有效时长字符串 + 单个看近时长字符串 + 单个看中时长字符串 + 单个看远时长字符串 + 单个切换次数字符串 + 单个停止次数字符串 + 单个干预次数字符串;
        
        return wholeContentString;
        }
        """
        
        let aaOptions = aaChartModel.aa_toAAOptions()
        
        aaOptions.tooltip?
            //‼️‼️‼️
            //以 this.point.index 这种方式获取选中的点的索引必须设置 tooltip 的 shared 为 false
            //共享时是 this.points (由多个 point 组成的 points 数组)
            //非共享时是 this.point (单个 point 对象)
            .shared(false)
            .useHTML(true)
            .formatter(jsFormatterStr)
            .backgroundColor(AAColor.black)//黑色背景色
            .borderColor("#FFD700")//边缘颜色纯金色
            .style(AAStyle(color: "#FFD700", fontSize: 12))
        
        return aaOptions
    }

    //https://github.com/AAChartModel/AAChartKit/issues/970
    //https://github.com/AAChartModel/AAChartKit-Swift/issues/239
    //通过自定义 div 的 css 样式来自定义复杂效果的 tooltip 浮动提示框
    private func customAreasplineChartTooltipStyleByDivWithCSS() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.areaspline)//图形类型
            .stacking(.normal)
            .categories([
                "10-01", "10-02", "10-03", "10-04", "10-05", "10-06", "10-07", "10-08", "10-09", "10-10", "10-11",
                "10-12", "10-13", "10-14", "10-15", "10-16", "10-17", "10-18", "10-19", "10-20", "10-21", "10-22",
                "10-23", "10-24", "10-25", "10-26", "10-27", "10-28", "10-29", "10-30", "10-31", "11-01", "11-02",
                "11-03", "11-04", "11-05", "11-06", "11-07", "11-08", "11-09", "11-10", "11-11", "11-12", "11-13",
                "11-14", "11-15", "11-16", "11-17", "11-18", "11-19", "11-20", "11-21", "11-22", "11-23", "11-24",
                "11-25", "11-26", "11-27", "11-28", "11-29", "11-30", "12-01", "12-02", "12-03", "12-04", "12-05",
                "12-06", "12-07", "12-08", "12-09", "12-10", "12-11", "12-12", "12-13", "12-14", "12-15", "12-16",
                "12-17", "12-18", "12-19", "12-20", "12-21", "12-22", "12-23", "12-24" ,"12-25" ,"12-26" ,"12-27",
                "12-28", "12-29", "12-30"
            ])
            .series([
                AASeriesElement()
                    .name("黄金上涨")
                    .lineWidth(3)
                    .color("#FFD700"/*纯金色*/)
                    .fillOpacity(0.5)
                    .data([
                        1.51, 6.70, 0.94, 1.44, 1.60, 1.63, 1.56, 1.91, 2.45, 3.87, 3.24, 4.90, 4.61, 4.10,
                        4.17, 3.85, 4.17, 3.46, 3.46, 3.55, 3.50, 4.13, 2.58, 2.28, 1.51, 12.7, 0.94, 1.44,
                        18.6, 1.63, 1.56, 1.91, 2.45, 3.87, 3.24, 4.90, 4.61, 4.10, 4.17, 3.85, 4.17, 3.46,
                        3.46, 3.55, 3.50, 4.13, 2.58, 2.28, 1.33, 4.68, 1.31, 1.10, 13.9, 1.10, 1.16, 1.67,
                        2.64, 2.86, 3.00, 3.21, 4.14, 4.07, 3.68, 3.11, 3.41, 3.25, 3.32, 3.07, 3.92, 3.05,
                        2.18, 3.24, 3.23, 3.15, 2.90, 1.81, 2.11, 2.43, 5.59, 3.09, 4.09, 6.14, 5.33, 6.05,
                        5.71, 6.22, 6.56, 4.75, 5.27, 6.02, 5.48
                    ])
                ,
                AASeriesElement()
                    .name("房价下跌")
                    .lineWidth(3)
                    .color("#ffc069")
                    .fillOpacity(0.5)
                    .data([
                        1.51, 6.70, 0.94, 1.44, 1.60, 1.63, 1.56, 1.91, 2.45, 3.87, 3.24, 4.90, 4.61, 4.10,
                        4.17, 3.85, 4.17, 3.46, 3.46, 3.55, 3.50, 4.13, 2.58, 2.28, 1.51, 12.7, 0.94, 1.44,
                        18.6, 1.63, 1.56, 1.91, 2.45, 3.87, 3.24, 4.90, 4.61, 4.10, 4.17, 3.85, 4.17, 3.46,
                        3.46, 3.55, 3.50, 4.13, 2.58, 2.28, 1.33, 4.68, 1.31, 1.10, 13.9, 1.10, 1.16, 1.67,
                        2.64, 2.86, 3.00, 3.21, 4.14, 4.07, 3.68, 3.11, 3.41, 3.25, 3.32, 3.07, 3.92, 3.05,
                        2.18, 3.24, 3.23, 3.15, 2.90, 1.81, 2.11, 2.43, 5.59, 3.09, 4.09, 6.14, 5.33, 6.05,
                        5.71, 6.22, 6.56, 4.75, 5.27, 6.02, 5.48
                    ])
                ,
            ])
        
        //https://zhidao.baidu.com/question/301691908.html
        //https://jshare.com.cn/highcharts/hhhhGc
        let aaOptions = aaChartModel.aa_toAAOptions()
        
        aaOptions.tooltip?
            .useHTML(true)
            .padding(0)
            .borderWidth(0)
            .formatter(#"""
            function () {
                let box1Text = "&nbsp 2021-" + this.x + this.points[0].series.name + this.y;
                let box2Text = "&nbsp 2021-" + this.x + this.points[1].series.name + this.y;
                
                return '<style>\
                div{margin:0;padding:0}\
                #container{width:300px;height:40px;border:80px;}\
                #container .box1{width:150px;height:40px;float:left;background:red;line-height:40px;color:#fff}\
                #container .box2{width:150px;height:40px;float:right;background:green;line-height:40px;color:#fff}\
                </style>\
                <div id=\"container\">'
                +
                '<div class=\"box1\">' + box1Text + '</div>'
                +
                '<div class=\"box2\">' + box2Text + '</div>'
                +
                '</div>';
            }
            """#)
        
        //禁用图例点击事件
        aaOptions.plotOptions?.series?.events = AAEvents()
            .legendItemClick(#"""
                        function() {
                          return false;
                        }
            """#)
        
        return aaOptions
    }

}

