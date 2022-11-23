//
// Created by AnAn on 2022/11/22.
// Copyright (c) 2022 An An. All rights reserved.
//

import Foundation
import AAInfographics


class BarOrColumnChartOptionsComposer {
//var chart = Highcharts.chart('container', {

//    chart: {
//        type: 'bar'
//    },
//    title: {
//        text: '各洲不同时间的人口条形图'
//    },
//    subtitle: {
//        text: '数据来源: Wikipedia.org'
//    },
//    xAxis: {
//        categories: ['非洲', '美洲', '亚洲', '欧洲', '大洋洲'],
//        title: {
//            text: null
//        }
//    },
//    yAxis: {
//        min: 0,
//        title: {
//            text: '人口总量 (百万)',
//            align: 'high'
//        },
//        labels: {
//            overflow: 'justify'
//        }
//    },
//    tooltip: {
//        valueSuffix: ' 百万'
//    },
//    plotOptions: {
//        bar: {
//            dataLabels: {
//                enabled: true,
//                allowOverlap: true // 允许数据标签重叠
//            }
//        }
//    },
//    legend: {
//        layout: 'vertical',
//        align: 'right',
//        verticalAlign: 'top',
//        x: -40,
//        y: 100,
//        floating: true,
//        borderWidth: 1,
//        backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
//        shadow: true
//    },
//    series: [{
//        name: '1800 年',
//        data: [107, 31, 635, 203, 2]
//    }, {
//        name: '1900 年',
//        data: [133, 156, 947, 408, 6]
//    }, {
//        name: '2008 年',
//        data: [973, 914, 4054, 732, 34]
//    }]
//});

static func basicBarChart() -> AAOptions {
    AAOptions()
            .chart(AAChart()
                    .type(.bar))
            .title(AATitle()
                    .text("各洲不同时间的人口条形图"))
            .subtitle(AASubtitle()
                    .text("数据来源: Wikipedia.org"))
//            .xAxis(AAXAxis()
//                    .categories(["非洲", "美洲", "亚洲", "欧洲", "大洋洲"])
//                    .title(AATitle()
//                            .text(nil)))
//            .yAxis(AAYAxis()
//                    .min(0)
//                    .title(AATitle()
//                            .text("人口总量 (百万)")
//                            .align(.high))
//                    .labels(AALabels()
//                            .overflow(.justify)))
            .tooltip(AATooltip()
                    .valueSuffix(" 百万"))
            .plotOptions(AAPlotOptions()
                    .bar(AABar()
                            .dataLabels(AADataLabels()
                                    .enabled(true)
                                    .allowOverlap(true))))
            .legend(AALegend()
                    .layout(.vertical)
                    .align(.right)
                    .verticalAlign(.top)
                    .x(-40)
                    .y(100)
                    .floating(true)
                    .borderWidth(1)
                    .backgroundColor(AAColor.white)
                    .shadow(true))
            .series([
                AASeriesElement()
                        .name("1800 年")
                        .data([107, 31, 635, 203, 2]),
                AASeriesElement()
                        .name("1900 年")
                        .data([133, 156, 947, 408, 6]),
                AASeriesElement()
                        .name("2008 年")
                        .data([973, 914, 4054, 732, 34]),
            ])
}

//var chart = Highcharts.chart('container', {

//    chart: {
//        type: 'bar'
//    },
//    title: {
//        text: '堆叠条形图'
//    },
//    xAxis: {
//        categories: ['苹果', '橘子', '梨', '葡萄', '香蕉']
//    },
//    yAxis: {
//        min: 0,
//        title: {
//            text: '水果消费总量'
//        }
//    },
//    legend: {
//        /* 图例显示顺序反转
//         * 这是因为堆叠的顺序默认是反转的，可以设置
//         * yAxis.reversedStacks = false 来达到类似的效果
//         */
//        reversed: true
//    },
//    plotOptions: {
//        series: {
//            stacking: 'normal'
//        }
//    },
//    series: [{
//        name: '小张',
//        data: [5, 3, 4, 7, 2]
//    }, {
//        name: '小彭',
//        data: [2, 2, 3, 2, 1]
//    }, {
//        name: '小潘',
//        data: [3, 4, 4, 2, 5]
//    }]
//});

static func stackingBarChart() -> AAOptions {
    AAOptions()
            .chart(AAChart()
                    .type(.bar))
            .title(AATitle()
                    .text("堆叠条形图"))
            .xAxis(AAXAxis()
                    .categories(["苹果", "橘子", "梨", "葡萄", "香蕉"]))
            .yAxis(AAYAxis()
                    .min(0)
                    .title(AATitle()
                            .text("水果消费总量")))
            .legend(AALegend()
                    .reversed(true))
            .plotOptions(AAPlotOptions()
                    .series(AASeries()
                            .stacking(.normal)))
            .series([
                AASeriesElement()
                        .name("小张")
                        .data([5, 3, 4, 7, 2]),
                AASeriesElement()
                        .name("小彭")
                        .data([2, 2, 3, 2, 1]),
                AASeriesElement()
                        .name("小潘")
                        .data([3, 4, 4, 2, 5]),
            ])
}

//var categories = ['0-4', '5-9', '10-14', '15-19',

//                  '20-24', '25-29', '30-34', '35-39', '40-44',
//                  '45-49', '50-54', '55-59', '60-64', '65-69',
//                  '70-74', '75-79', '80-84', '85-89', '90-94',
//                  '95-99', '100 + '];
//var chart = Highcharts.chart('container', {
//    chart: {
//        type: 'bar'
//    },
//    title: {
//        text: '2015 年德国人口金字塔'
//    },
//    subtitle: {
//        useHTML: true,
//        text: '数据来源: <a href="http://populationpyramid.net/germany/2015/">1950 ~ 2100 年世界人口金字塔</a>'
//    },
//    xAxis: [{
//        categories: categories,
//        reversed: false,
//        labels: {
//            step: 1
//        }
//    }, {
//        // 显示在右侧的镜像 xAxis （通过 linkedTo 与第一个 xAxis 关联）
//        opposite: true,
//        reversed: false,
//        categories: categories,
//        linkedTo: 0,
//        labels: {
//            step: 1
//        }
//    }],
//    yAxis: {
//        title: {
//            text: null
//        },
//        labels: {
//            formatter: function () {
//                return (Math.abs(this.value) / 1000000) + 'M';
//            }
//        },
//        min: -4000000,
//        max: 4000000
//    },
//    plotOptions: {
//        series: {
//            stacking: 'normal'
//        }
//    },
//    tooltip: {
//        formatter: function () {
//            return '<b>' + this.series.name + ', age ' + this.point.category + '</b><br/>' +
//                '人口: ' + Highcharts.numberFormat(Math.abs(this.point.y), 0);
//        }
//    },
//    series: [{
//        name: '男',
//        data: [-1746181, -1884428, -2089758, -2222362, -2537431, -2507081, -2443179,
//               -2664537, -3556505, -3680231, -3143062, -2721122, -2229181, -2227768,
//               -2176300, -1329968, -836804, -354784, -90569, -28367, -3878]
//    }, {
//        name: '女',
//        data: [1656154, 1787564, 1981671, 2108575, 2403438, 2366003, 2301402, 2519874,
//               3360596, 3493473, 3050775, 2759560, 2304444, 2426504, 2568938, 1785638,
//               1447162, 1005011, 330870, 130632, 21208]
//    }]
//});

static func populationPyramidChart() -> AAOptions {
    AAOptions()
            .chart(AAChart()
                    .type(.bar))
            .title(AATitle()
                    .text("2015 年德国人口金字塔"))
//            .subtitle(AASubtitle()
//                    .useHTML(true)
//                    .text("数据来源: <a href=\"http://populationpyramid.net/germany/2015/\">1950 ~ 2100 年世界人口金字塔</a>"))
            .xAxisArray([
                AAXAxis()
                        .categories(["0-4", "5-9", "10-14", "15-19",
                                     "20-24", "25-29", "30-34", "35-39", "40-44",
                                     "45-49", "50-54", "55-59", "60-64", "65-69",
                                     "70-74", "75-79", "80-84", "85-89", "90-94",
                                     "95-99", "100 + "])
                        .reversed(false)
                        .labels(AALabels()
                                .step(1)),
                AAXAxis()
                        .opposite(true)
                        .reversed(false)
                        .categories(["0-4", "5-9", "10-14", "15-19",
                                     "20-24", "25-29", "30-34", "35-39", "40-44",
                                     "45-49", "50-54", "55-59", "60-64", "65-69",
                                     "70-74", "75-79", "80-84", "85-89", "90-94",
                                     "95-99", "100 + "])
                        .linkedTo(0)
                        .labels(AALabels()
                                .step(1)),
            ])
            .yAxis(AAYAxis()
                    .title(AATitle()
                            .text(nil))
//                    .labels(AALabels()
//                            .formatter("function () {
//                                return (Math.abs(this.value) / 1000000) + 'M';
//                            }"))
                    .min(-4000000)
                    .max(4000000))
            .plotOptions(AAPlotOptions()
                    .series(AASeries()
                            .stacking(.normal)))
//            .tooltip(AATooltip()
//                    .formatter("function () {
//                        return '<b>' + this.series.name + ', age ' + this.point.category + '</b><br/>' +
//                            '人口: ' + Highcharts.numberFormat(Math.abs(this.point.y), 0);
//                    }"""
//                     ))
            .series([
                AASeriesElement()
                        .name("男")
                        .data([-1746181, -1884428, -2089758, -2222362, -2537431, -2507081, -2443179,
                               -2664537, -3556505, -3680231, -3143062, -2721122, -2229181, -2227768,
                               -2176300, -1329968, -836804, -354784, -90569, -28367, -3878]),
                AASeriesElement()
                        .name("女")
                        .data([1656154, 1787564, 1981671, 2108575, 2403438, 2366003, 2301402, 2519874,
                               3360596, 3493473, 3050775, 2759560, 2304444, 2426504, 2568938, 1785638,
                               1447162, 1005011, 330870, 130632, 21208]),
            ])
}

//var chart = Highcharts.chart('container',{

//    chart: {
//        type: 'column'
//    },
//    title: {
//        text: '月平均降雨量'
//    },
//    subtitle: {
//        text: '数据来源: WorldClimate.com'
//    },
//    xAxis: {
//        categories: [
//            '一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'
//        ],
//        crosshair: true
//    },
//    yAxis: {
//        min: 0,
//        title: {
//            text: '降雨量 (mm)'
//        }
//    },
//    tooltip: {
//        // head + 每个 point + footer 拼接成完整的 table
//        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
//        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
//        '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
//        footerFormat: '</table>',
//        shared: true,
//        useHTML: true
//    },
//    plotOptions: {
//        column: {
//            borderWidth: 0
//        }
//    },
//    series: [{
//        name: '东京',
//        data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
//    }, {
//        name: '纽约',
//        data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]
//    }, {
//        name: '伦敦',
//        data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]
//    }, {
//        name: '柏林',
//        data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]
//    }]
//});

static func basicColumnChart() -> AAOptions {
    AAOptions()
            .chart(AAChart()
                    .type(.column))
            .title(AATitle()
                    .text("月平均降雨量"))
            .subtitle(AASubtitle()
                    .text("数据来源: WorldClimate.com"))
            .xAxis(AAXAxis()
                    .categories(["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]))
            .yAxis(AAYAxis()
                    .min(0)
                    .title(AATitle()
                            .text("降雨量 (mm)")))
            .tooltip(AATooltip()
                .headerFormat("<span style=\"font-size:10px\">{point.key}</span><table>".aa_toPureJSString())
                    .pointFormat(("<tr><td style=\"color:{series.color};padding:0\">{series.name}: </td>" +
                                  "<td style=\"padding:0\"><b>{point.y:.1f} mm</b></td></tr>").aa_toPureJSString())
                        .footerFormat("</table>".aa_toPureJSString())
                    .shared(true)
                    .useHTML(true))
            .plotOptions(AAPlotOptions()
                    .column(AAColumn()
                            .borderWidth(0)))
            .series([
                AASeriesElement()
                        .name("东京")
                        .data([49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]),
                AASeriesElement()
                        .name("纽约")
                        .data([83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]),
                AASeriesElement()
                        .name("伦敦")
                        .data([48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]),
                AASeriesElement()
                        .name("柏林")
                        .data([42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]),
            ])
}

//var chart = Highcharts.chart('container',{

//    chart: {
//        type: 'column'
//    },
//    title: {
//        text: '包含负值的柱形图'
//    },
//    xAxis: {
//        categories: ['苹果', '橘子', '梨', '葡萄', '香蕉']
//    },
//    series: [{
//        name: '小张',
//        data: [5, 3, 4, 7, 2]
//    }, {
//        name: '小彭',
//        data: [2, -2, -3, 2, 1]
//    }, {
//        name: '小潘',
//        data: [3, 4, 4, -2, 5]
//    }]
//});

static func basicColumnChartWithNegativeValue() -> AAOptions {
    AAOptions()
            .chart(AAChart()
                    .type(.column))
            .title(AATitle()
                    .text("包含负值的柱形图"))
            .xAxis(AAXAxis()
                    .categories(["苹果", "橘子", "梨", "葡萄", "香蕉"]))
            .series([
                AASeriesElement()
                        .name("小张")
                        .data([5, 3, 4, 7, 2]),
                AASeriesElement()
                        .name("小彭")
                        .data([2, -2, -3, 2, 1]),
                AASeriesElement()
                        .name("小潘")
                        .data([3, 4, 4, -2, 5]),
            ])
}

//var chart = Highcharts.chart('container', {

//    chart: {
//        type: 'column'
//    },
//    title: {
//        text: '堆叠柱形图'
//    },
//    xAxis: {
//        categories: ['苹果', '橘子', '梨', '葡萄', '香蕉']
//    },
//    yAxis: {
//        min: 0,
//        title: {
//            text: '水果消费总量'
//        },
//        stackLabels: {  // 堆叠数据标签
//            enabled: true,
//            style: {
//                fontWeight: 'bold',
//                color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
//            }
//        }
//    },
//    legend: {
//        align: 'right',
//        x: -30,
//        verticalAlign: 'top',
//        y: 25,
//        floating: true,
//        backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
//        borderColor: '#CCC',
//        borderWidth: 1,
//        shadow: false
//    },
//    tooltip: {
//        formatter: function () {
//            return '<b>' + this.x + '</b><br/>' +
//                this.series.name + ': ' + this.y + '<br/>' +
//                '总量: ' + this.point.stackTotal;
//        }
//    },
//    plotOptions: {
//        column: {
//            stacking: 'normal',
//            dataLabels: {
//                enabled: true,
//                color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
//                style: {
//                    // 如果不需要数据标签阴影，可以将 textOutline 设置为 'none'
//                    textOutline: '1px 1px black'
//                }
//            }
//        }
//    },
//    series: [{
//        name: '小张',
//        data: [5, 3, 4, 7, 2]
//    }, {
//        name: '小彭',
//        data: [2, 2, 3, 2, 1]
//    }, {
//        name: '小潘',
//        data: [3, 4, 4, 2, 5]
//    }]
//});

static func basicColumnChartWithStackedDataLabels() -> AAOptions {
    AAOptions()
            .chart(AAChart()
                    .type(.column))
            .title(AATitle()
                    .text("堆叠柱形图"))
            .xAxis(AAXAxis()
                    .categories(["苹果", "橘子", "梨", "葡萄", "香蕉"]))
//            .yAxis(AAYAxis()
//                    .min(0)
//                    .title(AATitle()
//                            .text("水果消费总量"))
//                    .stackLabels(AALabels()
//                            .enabled(true)
//                            .style(AAStyle()
//                                    .fontWeight(.bold)
//                                    .color("#000000"))))
//            .legend(AALegend()
//                    .align(.right)
//                    .x(-30)
//                    .verticalAlign(.top)
//                    .y(25)
//                    .floating(true)
//                    .backgroundColor(AAColor.white)
//                    .borderColor("#CCC")
//                    .borderWidth(1)
//                    .shadow(false))
//            .tooltip(AATooltip()
//                    .formatter(#"""
//                    function () {
//                        return '<b>' + this.x + '</b><br/>' +
//                            this.series.name + ': ' + this.y + '<br/>' +
//                            '总量: ' + this.point.stackTotal;
//                    }
//                    """#))
            .plotOptions(AAPlotOptions()
                    .column(AAColumn()
                            .stacking(.normal)
                            .dataLabels(AADataLabels()
                                    .enabled(true)
                                    .color(AAColor.white)
                                    .style(AAStyle()
                                            .textOutline("1px 1px black")))))
            .series([
                AASeriesElement()
                        .name("小张")
                        .data([5, 3, 4, 7, 2]),
                AASeriesElement()
                        .name("小彭")
                        .data([2, 2, 3, 2, 1]),
                AASeriesElement()
                        .name("小潘")
                        .data([3, 4, 4, 2, 5]),
            ])
}

//var chart = Highcharts.chart('container', {

//    chart: {
//        type: 'column'
//    },
//    title: {
//        text: '按性别划分的水果消费总量'
//    },
//    xAxis: {
//        categories: ['苹果', '橘子', '梨', '葡萄', '香蕉']
//    },
//    yAxis: {
//        allowDecimals: false,
//        min: 0,
//        title: {
//            text: '水果数量'
//        }
//    },
//    tooltip: {
//        formatter: function () {
//            return '<b>' + this.x + '</b><br/>' +
//                this.series.name + ': ' + this.y + '<br/>' +
//                '总量: ' + this.point.stackTotal;
//        }
//    },
//    plotOptions: {
//        column: {
//            stacking: 'normal'
//        }
//    },
//    series: [{
//        name: '小张',
//        data: [5, 3, 4, 7, 2],
//        stack: 'male' // stack 值相同的为同一组
//    }, {
//        name: '小潘',
//        data: [3, 4, 4, 2, 5],
//        stack: 'male'
//    }, {
//        name: '小彭',
//        data: [2, 5, 6, 2, 1],
//        stack: 'female'
//    }, {
//        name: '小王',
//        data: [3, 0, 4, 4, 3],
//        stack: 'female'
//    }]
//});

static func basicColumnChartWithStackedDataLabels2() -> AAOptions {
    AAOptions()
            .chart(AAChart()
                    .type(.column))
            .title(AATitle()
                    .text("按性别划分的水果消费总量"))
            .xAxis(AAXAxis()
                    .categories(["苹果", "橘子", "梨", "葡萄", "香蕉"]))
//            .yAxis(AAYAxis()
//                    .allowDecimals(false)
//                    .min(0)
//                    .title(AATitle()
//                            .text("水果数量")))
//            .tooltip(AATooltip()
//                    .formatter(#"""
//                    function () {
//                        return '<b>' + this.x + '</b><br/>' +
//                            this.series.name + ': ' + this.y + '<br/>' +
//                            '总量: ' + this.point.stackTotal;
//                    }
//                    """#))
            .plotOptions(AAPlotOptions()
                    .column(AAColumn()
                            .stacking(.normal)))
            .series([
                AASeriesElement()
                        .name("小张")
                        .data([5, 3, 4, 7, 2])
                        .stack("male"),
                AASeriesElement()
                        .name("小潘")
                        .data([3, 4, 4, 2, 5])
                        .stack("male"),
                AASeriesElement()
                        .name("小彭")
                        .data([2, 5, 6, 2, 1])
                        .stack("female"),
                AASeriesElement()
                        .name("小王")
                        .data([3, 0, 4, 4, 3])
                        .stack("female")
            ])
}

//var chart = Highcharts.chart('container', {

//    chart: {
//        type: 'column'
//    },
//    title: {
//        text: '百分比堆叠柱形图'
//    },
//    xAxis: {
//        categories: ['苹果', '橘子', '梨', '葡萄', '香蕉']
//    },
//    yAxis: {
//        min: 0,
//        title: {
//            text: '水果消费总量'
//        }
//    },
//    tooltip: {
//        pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b>' +
//        		'({point.percentage:.0f}%)<br/>',
//        		//:.0f 表示保留 0 位小数，详见教程：https://www.hcharts.cn/docs/basic-labels-string-formatting
//        shared: true
//    },
//    plotOptions: {
//        column: {
//            stacking: 'percent'
//        }
//    },
//    series: [{
//        name: '小张',
//        data: [5, 3, 4, 7, 2]
//    }, {
//        name: '小彭',
//        data: [2, 2, 3, 2, 1]
//    }, {
//        name: '小潘',
//        data: [3, 4, 4, 2, 5]
//    }]
//});

static func percentStackedColumnChart() -> AAOptions {
    AAOptions()
            .chart(AAChart()
                    .type(.column))
            .title(AATitle()
                    .text("百分比堆叠柱形图"))
            .xAxis(AAXAxis()
                    .categories(["苹果", "橘子", "梨", "葡萄", "香蕉"]))
            .yAxis(AAYAxis()
                    .min(0)
                    .title(AATitle()
                            .text("水果消费总量")))
            .tooltip(AATooltip()
                    .pointFormat(#"""
                    <span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b>
                    ({point.percentage:.0f}%)
                    <br/>
                    """#)
                    .shared(true))
            .plotOptions(AAPlotOptions()
                    .column(AAColumn()
                            .stacking(.percent)))
            .series([
                AASeriesElement()
                        .name("小张")
                        .data([5, 3, 4, 7, 2]),
                AASeriesElement()
                        .name("小彭")
                        .data([2, 2, 3, 2, 1]),
                AASeriesElement()
                        .name("小潘")
                        .data([3, 4, 4, 2, 5]),
            ])
}

//var chart = Highcharts.chart('container', {

//    chart: {
//        type: 'column'
//    },
//    title: {
//        text: '全球各大城市人口排行'
//    },
//    subtitle: {
//        text: '数据截止 2017-03，来源: <a href="https://en.wikipedia.org/wiki/List_of_cities_proper_by_population">Wikipedia</a>'
//    },
//    xAxis: {
//        type: 'category',
//        labels: {
//            rotation: -45  // 设置轴标签旋转角度
//        }
//    },
//    yAxis: {
//        min: 0,
//        title: {
//            text: '人口 (百万)'
//        }
//    },
//    legend: {
//        enabled: false
//    },
//    tooltip: {
//        pointFormat: '人口总量: <b>{point.y:.1f} 百万</b>'
//    },
//    series: [{
//        name: '总人口',
//        data: [
//            ['上海', 24.25],
//            ['卡拉奇', 23.50],
//            ['北京', 21.51],
//            ['德里', 16.78],
//            ['拉各斯', 16.06],
//            ['天津', 15.20],
//            ['伊斯坦布尔', 14.16],
//            ['东京', 13.51],
//            ['广州', 13.08],
//            ['孟买', 12.44],
//            ['莫斯科', 12.19],
//            ['圣保罗', 12.03],
//            ['深圳', 10.46],
//            ['雅加达', 10.07],
//            ['拉合尔', 10.05],
//            ['首尔', 9.99],
//            ['武汉', 9.78],
//            ['金沙萨', 9.73],
//            ['开罗', 9.27],
//            ['墨西哥', 8.87]
//        ],
//        dataLabels: {
//            enabled: true,
//            rotation: -90,
//            color: '#FFFFFF',
//            align: 'right',
//            format: '{point.y:.1f}', // :.1f 为保留 1 位小数
//            y: 10
//        }
//    }]
//});

static func columnChartWithRotatedLabels() -> AAOptions {
    AAOptions()
            .chart(AAChart()
                    .type(.column))
            .title(AATitle()
                    .text("全球各大城市人口排行"))
            .subtitle(AASubtitle()
                    .text("数据截止 2017-03，来源: Wikipedia"))
            .xAxis(AAXAxis()
                    .type(.category)
                    .labels(AALabels()
                            .rotation(-45)))
            .yAxis(AAYAxis()
                    .min(0)
                    .title(AATitle()
                            .text("人口 (百万)")))
            .legend(AALegend()
                    .enabled(false))
            .tooltip(AATooltip()
                    .pointFormat("人口总量: <b>{point.y:.1f} 百万</b>"))
            .series([
                AASeriesElement()
                        .name("总人口")
                        .data([
                            ["上海", 24.25],
                            ["卡拉奇", 23.50],
                            ["北京", 21.51],
                            ["德里", 16.78],
                            ["拉各斯", 16.06],
                            ["天津", 15.20],
                            ["伊斯坦布尔", 14.16],
                            ["东京", 13.51],
                            ["广州", 13.08],
                            ["孟买", 12.44],
                            ["莫斯科", 12.19],
                            ["圣保罗", 12.03],
                            ["深圳", 10.46],
                            ["雅加达", 10.07],
                            ["拉合尔", 10.05],
                            ["首尔", 9.99],
                            ["武汉", 9.78],
                            ["金沙萨", 9.73],
                            ["开罗", 9.27],
                            ["墨西哥", 8.87],
                        ])
                        .dataLabels(AADataLabels()
                                .enabled(true)
                                .rotation(-90)
                                .color("#FFFFFF")
                                .align(.right)
                                .format("{point.y:.1f}")
                                .y(10)),
            ])
}

//var chart = Highcharts.chart('container', {

//    chart: {
//        type: 'column'
//    },
//    title: {
//        text: '分公司效率优化嵌套图'
//    },
//    xAxis: {
//        categories: [
//            '杭州总部',
//            '上海分部',
//            '北京分部'
//        ]
//    },
//    yAxis: [{
//        min: 0,
//        title: {
//            text: '雇员'
//        }
//    }, {
//        title: {
//            text: '利润 (millions)'
//        },
//        opposite: true
//    }],
//    legend: {
//        shadow: false
//    },
//    tooltip: {
//        shared: true
//    },
//    plotOptions: {
//        column: {
//            grouping: false,
//            shadow: false,
//            borderWidth: 0
//        }
//    },
//    series: [{
//        name: '雇员',
//        color: 'rgba(165,170,217,1)',
//        data: [150, 73, 20],
//        pointPadding: 0.3, // 通过 pointPadding 和 pointPlacement 控制柱子位置
//        pointPlacement: -0.2
//    }, {
//        name: '优化的员工',
//        color: 'rgba(126,86,134,.9)',
//        data: [140, 90, 40],
//        pointPadding: 0.4,
//        pointPlacement: -0.2
//    }, {
//        name: '利润',
//        color: 'rgba(248,161,63,1)',
//        data: [183.6, 178.8, 198.5],
//        tooltip: {  // 为当前数据列指定特定的 tooltip 选项
//            valuePrefix: '$',
//            valueSuffix: ' M'
//        },
//        pointPadding: 0.3,
//        pointPlacement: 0.2,
//        yAxis: 1  // 指定数据列所在的 yAxis
//    }, {
//        name: '优化的利润',
//        color: 'rgba(186,60,61,.9)',
//        data: [203.6, 198.8, 208.5],
//        tooltip: {
//            valuePrefix: '$',
//            valueSuffix: ' M'
//        },
//        pointPadding: 0.4,
//        pointPlacement: 0.2,
//        yAxis: 1
//    }]
//});

static func columnChartWithNestedColumn() -> AAOptions {
    AAOptions()
            .chart(AAChart()
                    .type(.column))
            .title(AATitle()
                    .text("分公司效率优化嵌套图"))
            .xAxis(AAXAxis()
                    .categories([
                        "杭州总部",
                        "上海分部",
                        "北京分部",
                    ]))
            .yAxisArray([
                AAYAxis()
                        .min(0)
                        .title(AATitle()
                                .text("雇员")),
                AAYAxis()
                        .title(AATitle()
                                .text("利润 (millions)"))
                        .opposite(true),
            ])
            .legend(AALegend()
                    .shadow(false))
            .tooltip(AATooltip()
                    .shared(true))
            .plotOptions(AAPlotOptions()
                    .column(AAColumn()
                            .grouping(false)
//                            .shadow(false)
                            .borderWidth(0)))
//            .series([
//                AASeriesElement()
//                        .name("雇员")
//                        .color(AAGradientColor.deepSea)
//                        .data([150, 73, 20])
//                        .pointPadding(0.3)
//                        .pointPlacement(-0.2),
//                AASeriesElement()
//                        .name("优化的员工")
//                        .color(AAGradientColor.sanguine)
//                        .data([140, 90, 40])
//                        .pointPadding(0.4)
//                        .pointPlacement(-0.2),
//                AASeriesElement()
//                        .name("利润")
//                        .color(AAGradientColor.sweetDream)
//                        .data([183.6, 178.8, 198.5])
//                        .tooltip(AATooltip()
////                                .valuePrefix("$")
//                                .valueSuffix(" M"))
//                        .pointPadding(0.3)
//                        .pointPlacement(0.2)
//                        .yAxis(1),
//                AASeriesElement()
//                        .name("优化的利润")
//                        .color(AAGradientColor.lusciousLime)
//                        .data([203.6, 198.8, 208.5])
//                        .tooltip(AATooltip()
////                                .valuePrefix("$")
//                                .valueSuffix(" M"))
//                        .pointPadding(0.4)
//                        .pointPlacement(0.2)
//                        .yAxis(1),
//            ])
}

//var chart = Highcharts.chart('container', {

//    chart: {
//        type: 'columnrange', // columnrange 依赖 highcharts-more.js
//        inverted: true
//    },
//    title: {
//        text: '每月温度变化范围'
//    },
//    subtitle: {
//        text: '2009 挪威某地'
//    },
//    xAxis: {
//        categories: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月']
//    },
//    yAxis: {
//        title: {
//            text: '温度 ( °C )'
//        }
//    },
//    tooltip: {
//        valueSuffix: '°C'
//    },
//    plotOptions: {
//        columnrange: {
//            dataLabels: {
//                enabled: true,
//                formatter: function () {
//                    return this.y + '°C';
//                }
//            }
//        }
//    },
//    legend: {
//        enabled: false
//    },
//    series: [{
//        name: '温度',
//        data: [
//            [-9.7, 9.4],
//            [-8.7, 6.5],
//            [-3.5, 9.4],
//            [-1.4, 19.9],
//            [0.0, 22.6],
//            [2.9, 29.5],
//            [9.2, 30.7],
//            [7.3, 26.5],
//            [4.4, 18.0],
//            [-3.1, 11.4],
//            [-5.2, 10.4],
//            [-13.5, 9.8]
//        ]
//    }]
//});

    static func columnRangeChart() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.columnrange))
            .title(AATitle()
                .text("每月温度变化范围"))
            .subtitle(AASubtitle()
                .text("2009 挪威某地"))
            .xAxis(AAXAxis()
                .categories(["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]))
            .yAxis(AAYAxis()
                .title(AATitle()
                    .text("温度 ( °C )")))
            .tooltip(AATooltip()
                .valueSuffix("°C"))
            .plotOptions(AAPlotOptions()
                .columnrange(AAColumnrange()
                    .dataLabels(AADataLabels()
                        .enabled(true)
                        .formatter(#"""
function () {
    return this.y + '°C';
}
"""#))))
            .legend(AALegend()
                .enabled(false))
            .series([
                AASeriesElement()
                    .name("温度")
                    .data([
                        [-9.7, 9.4],
                        [-8.7, 6.5],
                        [-3.5, 9.4],
                        [-1.4, 19.9],
                        [0.0, 22.6],
                        [2.9, 29.5],
                        [9.2, 30.7],
                        [7.3, 26.5],
                        [4.4, 18.0],
                        [-3.1, 11.4],
                        [-5.2, 10.4],
                        [-13.5, 9.8],
                    ]),
            ])
    }




}




