//
// Created by AnAn on 2022/11/22.
// Copyright (c) 2022 An An. All rights reserved.
//

import Foundation
import AAInfographics


class AreaChartOptionsComposer {
//var chart = Highcharts.chart('container',{

//    chart: {
//        type: 'area'
//    },
//    title: {
//        text: '美苏核武器库存量'
//    },
//    subtitle: {
//        text: '数据来源: <a href="https://thebulletin.metapress.com/content/c4120650912x74k7/fulltext.pdf">' +
//        'thebulletin.metapress.com</a>'
//    },
//    xAxis: {
//        allowDecimals: false
//    },
//    yAxis: {
//        title: {
//            text: '核武库国家'
//        },
//        labels: {
//            formatter: function () {
//                return this.value / 1000 + 'k';
//            }
//        }
//    },
//    tooltip: {
//        pointFormat: '{series.name} 制造 <b>{point.y:,.0f}</b>枚弹头'
//    },
//    plotOptions: {
//        area: {
//            pointStart: 1940,
//            marker: {
//                enabled: false,
//                symbol: 'circle',
//                radius: 2,
//                states: {
//                    hover: {
//                        enabled: true
//                    }
//                }
//            }
//        }
//    },
//    series: [{
//        name: '美国',
//        data: [null, null, null, null, NSNull(), 6, 11, 32, 110, 235, 369, 640,
//               1005, 1436, 2063, 3057, 4618, 6444, 9822, 15468, 20434, 24126,
//               27387, 29459, 31056, 31982, 32040, 31233, 29224, 27342, 26662,
//               26956, 27912, 28999, 28965, 27826, 25579, 25722, 24826, 24605,
//               24304, 23464, 23708, 24099, 24357, 24237, 24401, 24344, 23586,
//               22380, 21004, 17287, 14747, 13076, 12555, 12144, 11009, 10950,
//               10871, 10824, 10577, 10527, 10475, 10421, 10358, 10295, 10104]
//    }, {
//        name: '苏联/俄罗斯',
//        data: [null, null, null, null, null, null, null, null, null, null,
//               5, 25, 50, 120, 150, 200, 426, 660, 869, 1060, 1605, 2471, 3322,
//               4238, 5221, 6129, 7089, 8339, 9399, 10538, 11643, 13092, 14478,
//               15915, 17385, 19055, 21205, 23044, 25393, 27935, 30062, 32049,
//               33952, 35804, 37431, 39197, 45000, 43000, 41000, 39000, 37000,
//               35000, 33000, 31000, 29000, 27000, 25000, 24000, 23000, 22000,
//               21000, 20000, 19000, 18000, 18000, 17000, 16000]
//    }]
//});

func basicAreaChart() -> AAOptions {
    AAOptions()
            .chart(AAChart()
                    .type(.area))
            .title(AATitle()
                    .text("美苏核武器库存量"))
            .subtitle(AASubtitle()
                    .text("数据来源: <a href=\"https://thebulletin.metapress.com/content/c4120650912x74k7/fulltext.pdf\">thebulletin.metapress.com</a>"))
            .xAxis(AAXAxis()
                    .allowDecimals(false))
            .yAxis(AAYAxis()
                    .title(AATitle()
                            .text("核武库国家"))
                    .labels(AALabels()
                            .formatter("function () { return this.value / 1000 + 'k'; }")))
            .tooltip(AATooltip()
                    .pointFormat("{series.name} 制造 <b>{point.y:,.0f}</b>枚弹头"))
            .plotOptions(AAPlotOptions()
                    .area(AAArea()
                            .pointStart(1940)
                            .marker(AAMarker()
                                    .enabled(false)
                                    .symbol(AAChartSymbolType.circle.rawValue)
                                    .radius(2)
                                    .states(AAMarkerStates()
                                            .hover(AAMarkerHover()
                                                    .enabled(true))))))
            .series([
                AASeriesElement()
                        .name("美国")
                        .data([
                            NSNull(), NSNull(), NSNull(), NSNull(), NSNull(), 6, 11, 32, 110, 235, 369, 640,
                            1005, 1436, 2063, 3057, 4618, 6444, 9822, 15468, 20434, 24126,
                            27387, 29459, 31056, 31982, 32040, 31233, 29224, 27342, 26662,
                            26956, 27912, 28999, 28965, 27826, 25579, 25722, 24826, 24605,
                            24304, 23464, 23708, 24099, 24357, 24237, 24401, 24344, 23586,
                            22380, 21004, 17287, 14747, 13076, 12555, 12144, 11009, 10950,
                            10871, 10824, 10577, 10527, 10475, 10421, 10358, 10295, 10104
                        ]),
                AASeriesElement()
                        .name("苏联/俄罗斯")
                        .data([
                            NSNull(), NSNull(), NSNull(), NSNull(), NSNull(), NSNull(), NSNull(), NSNull(), NSNull(), NSNull(),
                            5, 25, 50, 120, 150, 200, 426, 660, 869, 1060, 1605, 2471, 3322,
                            4238, 5221, 6129, 7089, 8339, 9399, 10538, 11643, 13092, 14478,
                            15915, 17385, 19055, 21205, 23044, 25393, 27935, 30062, 32049,
                            33952, 35804, 37431, 39197, 45000, 43000, 41000, 39000, 37000,
                            35000, 33000, 31000, 29000, 27000, 25000, 24000, 23000, 22000,
                            21000, 20000, 19000, 18000, 18000, 17000, 16000
                        ])
            ])
}

//var chart = Highcharts.chart('container', {

//    chart: {
//        type: 'area'
//    },
//    title: {
//        text: '包含负值的面积图'
//    },
//    xAxis: {
//        categories: ['苹果', '橘子', '梨', '葡萄', '香蕉']
//    },
//    credits: {
//        enabled: false
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

func areaWithNegativeValuesChart() -> AAOptions {
    AAOptions()
            .chart(AAChart()
                    .type(.area))
            .title(AATitle()
                    .text("包含负值的面积图"))
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
                        .data([3, 4, 4, -2, 5])
            ])
}

//var chart = Highcharts.chart('container', {

//    chart: {
//        type: 'area'
//    },
//    title: {
//        text: '全球各大洲人口增长历史及预测'
//    },
//    subtitle: {
//        text: '数据来源: Wikipedia.org'
//    },
//    xAxis: {
//        categories: ['1750', '1800', '1850', '1900', '1950', '1999', '2050'],
//        tickmarkPlacement: 'on',
//        title: {
//            enabled: false
//        }
//    },
//    yAxis: {
//        title: {
//            text: '十亿'
//        },
//        labels: {
//            formatter: function () {
//                return this.value / 1000;
//            }
//        }
//    },
//    tooltip: {
//        split: true,
//        valueSuffix: ' 百万'
//    },
//    plotOptions: {
//        area: {
//            stacking: 'normal',
//            lineColor: '#666666',
//            lineWidth: 1,
//            marker: {
//                lineWidth: 1,
//                lineColor: '#666666'
//            }
//        }
//    },
//    series: [{
//        name: '亚洲',
//        data: [502, 635, 809, 947, 1402, 3634, 5268]
//    }, {
//        name: '非洲',
//        data: [106, 107, 111, 133, 221, 767, 1766]
//    }, {
//        name: '欧洲',
//        data: [163, 203, 276, 408, 547, 729, 628]
//    }, {
//        name: '美洲',
//        data: [18, 31, 54, 156, 339, 818, 1201]
//    }, {
//        name: '大洋洲',
//        data: [2, 2, 2, 6, 13, 30, 46]
//    }]
//});

func stackedAreaChart() -> AAOptions {
    AAOptions()
            .chart(AAChart()
                    .type(.area))
            .title(AATitle()
                    .text("全球各大洲人口增长历史及预测"))
            .subtitle(AASubtitle()
                    .text("数据来源: Wikipedia.org"))
//            .xAxis(AAXAxis()
//                    .categories(["1750", "1800", "1850", "1900", "1950", "1999", "2050"])
//                    .tickmarkPlacement("on")
//                    .title(AATitle()
//                            .enabled(false)))
            .yAxis(AAYAxis()
                    .title(AATitle()
                            .text("十亿"))
                    .labels(AALabels()
                            .formatter("function () { return this.value / 1000; }")))
            .tooltip(AATooltip()
////                    .split(true)
                    .valueSuffix(" 百万"))
            .plotOptions(AAPlotOptions()
                    .area(AAArea()
                            .stacking(.normal)
                            .lineColor("#666666")
                            .lineWidth(1)
                            .marker(AAMarker()
                                    .lineWidth(1)
                                    .lineColor("#666666"))))
            .series([
                AASeriesElement()
                        .name("亚洲")
                        .data([502, 635, 809, 947, 1402, 3634, 5268]),
                AASeriesElement()
                        .name("非洲")
                        .data([106, 107, 111, 133, 221, 767, 1766]),
                AASeriesElement()
                        .name("欧洲")
                        .data([163, 203, 276, 408, 547, 729, 628]),
                AASeriesElement()
                        .name("美洲")
                        .data([18, 31, 54, 156, 339, 818, 1201]),
                AASeriesElement()
                        .name("大洋洲")
                        .data([2, 2, 2, 6, 13, 30, 46])
            ])
}

//var chart = Highcharts.chart('container', {

//    chart: {
//        type: 'area'
//    },
//    title: {
//        text: '全球各大洲人口占比'
//    },
//    subtitle: {
//        text: '数据来源: Wikipedia.org'
//    },
//    xAxis: {
//        categories: ['1750', '1800', '1850', '1900', '1950', '1999', '2050'],
//        tickmarkPlacement: 'on',
//        title: {
//            enabled: false
//        }
//    },
//    yAxis: {
//        title: {
//            text: '百分比'
//        }
//    },
//    tooltip: {
//        pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.percentage:.1f}%</b> ({point.y:,.0f} 百万)<br/>',
//        shared: true
//    },
//    plotOptions: {
//        area: {
//            stacking: 'percent',
//            lineColor: '#ffffff',
//            lineWidth: 1,
//            marker: {
//                lineWidth: 1,
//                lineColor: '#ffffff'
//            }
//        }
//    },
//    series: [{
//        name: '亚洲',
//        data: [502, 635, 809, 947, 1402, 3634, 5268]
//    }, {
//        name: '非洲',
//        data: [106, 107, 111, 133, 221, 767, 1766]
//    }, {
//        name: '欧洲',
//        data: [163, 203, 276, 408, 547, 729, 628]
//    }, {
//        name: '美洲',
//        data: [18, 31, 54, 156, 339, 818, 1201]
//    }, {
//        name: '大洋洲',
//        data: [2, 2, 2, 6, 13, 30, 46]
//    }]
//});

func percentStackedAreaChart() -> AAOptions {
    AAOptions()
            .chart(AAChart()
                    .type(.area))
            .title(AATitle()
                    .text("全球各大洲人口占比"))
            .subtitle(AASubtitle()
                    .text("数据来源: Wikipedia.org"))
//            .xAxis(AAXAxis()
//                    .categories(["1750", "1800", "1850", "1900", "1950", "1999", "2050"])
//                    .tickmarkPlacement("on")
//                    .title(AATitle()
//                            .enabled(false)))
            .yAxis(AAYAxis()
                    .title(AATitle()
                            .text("百分比")))
            .tooltip(AATooltip()
                    .pointFormat("<span style=\"color:{series.color}\">{series.name}</span>: <b>{point.percentage:.1f}%</b> ({point.y:,.0f} 百万)<br/>")
                    .shared(true))
            .plotOptions(AAPlotOptions()
                    .area(AAArea()
                            .stacking(.percent)
                            .lineColor("#ffffff")
                            .lineWidth(1)
                            .marker(AAMarker()
                                    .lineWidth(1)
                                    .lineColor("#ffffff"))))
            .series([
                AASeriesElement()
                        .name("亚洲")
                        .data([502, 635, 809, 947, 1402, 3634, 5268]),
                AASeriesElement()
                        .name("非洲")
                        .data([106, 107, 111, 133, 221, 767, 1766]),
                AASeriesElement()
                        .name("欧洲")
                        .data([163, 203, 276, 408, 547, 729, 628]),
                AASeriesElement()
                        .name("美洲")
                        .data([18, 31, 54, 156, 339, 818, 1201]),
                AASeriesElement()
                        .name("大洋洲")
                        .data([2, 2, 2, 6, 13, 30, 46])
            ])
}

//var chart = Highcharts.chart('container', {

//    chart: {
//        type: 'area',
//        spacingBottom: 30
//    },
//    title: {
//        text: '小张和小潘家水果的消费情况 *'
//    },
//    subtitle: {
//        text: '* 小潘家的香蕉消费未知',
//        floating: true,
//        align: 'right',
//        verticalAlign: 'bottom',
//        y: 15
//    },
//    legend: {
//        layout: 'vertical',
//        align: 'left',
//        verticalAlign: 'top',
//        x: 150,
//        y: 100,
//        floating: true,
//        borderWidth: 1,
//        backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
//    },
//    xAxis: {
//        categories: ['苹果', '梨', '橘子', '香蕉', '葡萄', '李子', '草莓', '树莓']
//    },
//    yAxis: {
//        title: {
//            text: 'Y-Axis'
//        },
//        labels: {
//            formatter: function () {
//                return this.value;
//            }
//        }
//    },
//    tooltip: {
//        formatter: function () {
//            return '<b>' + this.series.name + '</b><br/>' +
//                this.x + ': ' + this.y;
//        }
//    },
//    plotOptions: {
//        area: {
//            fillOpacity: 0.5
//        }
//    },
//    credits: {
//        enabled: false
//    },
//    series: [{
//        name: '小张',
//        data: [0, 1, 4, 4, 5, 2, 3, 7]
//    }, {
//        name: '小潘',
//        data: [1, 0, 3, null, 3, 1, 2, 1]
//    }]
//});

func areaWithMissingPointsChart() -> AAOptions {
    AAOptions()
            .chart(AAChart()
                    .type(.area)
                    .spacingBottom(30))
            .title(AATitle()
                    .text("小张和小潘家水果的消费情况 *"))
            .subtitle(AASubtitle()
                    .text("* 小潘家的香蕉消费未知")
//                    .floating(true)
                    .align(.right)
                    .verticalAlign(.bottom)
                    .y(15))
            .legend(AALegend()
                    .layout(.vertical)
                    .align(.left)
                    .verticalAlign(.top)
                    .x(150)
                    .y(100)
                    .floating(true)
                    .borderWidth(1)
//                    .backgroundColor(AAColor.white)
            )
            .xAxis(AAXAxis()
                    .categories(["苹果", "梨", "橘子", "香蕉", "葡萄", "李子", "草莓", "树莓"]))
            .yAxis(AAYAxis()
                    .title(AATitle()
                            .text("Y-Axis"))
                    .labels(AALabels()
                            .formatter("function () {return this.value;}")))
            .tooltip(AATooltip()
                    .formatter("function () {return '<b>' + this.series.name + '</b><br/>' + this.x + ': ' + this.y;}"))
            .plotOptions(AAPlotOptions()
                    .area(AAArea()
                            .fillOpacity(0.5)))
            .credits(AACredits()
                    .enabled(false))
            .series([
                AASeriesElement()
                        .name("小张")
                        .data([0, 1, 4, 4, 5, 2, 3, 7]),
                AASeriesElement()
                        .name("小潘")
                        .data([1, 0, 3, NSNull(), 3, 1, 2, 1])
            ])
}

//var chart = Highcharts.chart('container',{

//    chart: {
//        type: 'area',
//        inverted: true // x y轴对调
//    },
//    title: {
//        text: '不同家庭一周水果平均消费面积图'
//    },
//    legend: {
//        layout: 'vertical',
//        align: 'right',
//        verticalAlign: 'top',
//        x: -150,
//        y: 100,
//        floating: true,
//        borderWidth: 1,
//        backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
//    },
//    xAxis: {
//        categories: [
//            '周一','周二','周三','周四','周五','周六','周日'
//        ]
//    },
//    yAxis: {
//        title: {
//            text: '单位数量'
//        },
//        min: 0
//    },
//    plotOptions: {
//        area: {
//            fillOpacity: 0.5
//        }
//    },
//    series: [{
//        name: '小张',
//        data: [3, 4, 3, 5, 4, 10, 12]
//    }, {
//        name: '小潘',
//        data: [1, 3, 4, 3, 3, 5, 4]
//    }]
//});

func invertedAreaChart() -> AAOptions {
    AAOptions()
            .chart(AAChart()
                    .type(.area)
                    .inverted(true))
            .title(AATitle()
                    .text("不同家庭一周水果平均消费面积图"))
            .legend(AALegend()
                    .layout(.vertical)
                    .align(.right)
                    .verticalAlign(.top)
                    .x(-150)
                    .y(100)
                    .floating(true)
                    .borderWidth(1)
//                    .backgroundColor(AAColor.white)
            )
            .xAxis(AAXAxis()
                    .categories(["周一", "周二", "周三", "周四", "周五", "周六", "周日"]))
            .yAxis(AAYAxis()
                    .title(AATitle()
                            .text("单位数量"))
                    .min(0))
            .plotOptions(AAPlotOptions()
                    .area(AAArea()
                            .fillOpacity(0.5)))
            .series([
                AASeriesElement()
                        .name("小张")
                        .data([3, 4, 3, 5, 4, 10, 12]),
                AASeriesElement()
                        .name("小潘")
                        .data([1, 3, 4, 3, 3, 5, 4])
            ])
}

//var chart = Highcharts.chart('container', {

//    chart: {
//        type: 'areaspline'
//    },
//    title: {
//        text: '不同家庭一周水果消费情况'
//    },
//    legend: {
//        layout: 'vertical',
//        align: 'left',
//        verticalAlign: 'top',
//        x: 150,
//        y: 100,
//        floating: true,
//        borderWidth: 1,
//        backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
//    },
//    xAxis: {
//        categories: [
//            '周一','周二','周三','周四','周五','周六','周日'
//        ],
//        plotBands: [{ // 标识出周末
//            from: 4.5,
//            to: 6.5,
//            color: 'rgba(68, 170, 213, .2)'
//        }]
//    },
//    yAxis: {
//        title: {
//            text: '水果 单位'
//        }
//    },
//    tooltip: {
//        shared: true,
//        valueSuffix: ' 单位'
//    },
//    plotOptions: {
//        areaspline: {
//            fillOpacity: 0.5
//        }
//    },
//    series: [{
//        name: '小张',
//        data: [3, 4, 3, 5, 4, 10, 12]
//    }, {
//        name: '小潘',
//        data: [1, 3, 4, 3, 3, 5, 4]
//    }]
//});

func areasplineChart() -> AAOptions {
    AAOptions()
            .chart(AAChart()
                    .type(.areaspline))
            .title(AATitle()
                    .text("不同家庭一周水果消费情况"))
            .legend(AALegend()
                    .layout(.vertical)
                    .align(.left)
                    .verticalAlign(.top)
                    .x(150)
                    .y(100)
                    .floating(true)
                    .borderWidth(1)
//                    .backgroundColor(AAColor.white)
            )
            .xAxis(AAXAxis()
                    .categories(["周一", "周二", "周三", "周四", "周五", "周六", "周日"])
                    .plotBands([
                        AAPlotBandsElement()
                                .from(4.5)
                                .to(6.5)
                                .color(AAColor.rgbaColor(68, 170, 213, 0.2))
                    ]))
            .yAxis(AAYAxis()
                    .title(AATitle()
                            .text("水果 单位")))
            .tooltip(AATooltip()
                    .shared(true)
                    .valueSuffix(" 单位"))
//            .plotOptions(AAPlotOptions()
//                    .areaspline(AAAreaspline()
//                            .fillOpacity(0.5)))
            .series([
                AASeriesElement()
                        .name("小张")
                        .data([3, 4, 3, 5, 4, 10, 12]),
                AASeriesElement()
                        .name("小潘")
                        .data([1, 3, 4, 3, 3, 5, 4])
            ])
}

//var chart = null;

//$.getJSON('https://data.jianshukeji.com/jsonp?filename=json/range.json&callback=?', function (data) {
//    chart = Highcharts.chart('container', {
//        chart: {
//            type: 'arearange',
//            zoomType: 'x' // 水平缩放
//        },
//        title: {
//            text: '某地白天温度变化'
//        },
//        xAxis: {
//            type: 'datetime',
//            crosshair: true // 启用 x 轴准星线
//        },
//        yAxis: {
//            title: {
//                text: null
//            }
//        },
//        tooltip: {
//            shared: true,
//            valueSuffix: '°C'
//        },
//        legend: {
//            enabled: false // 关闭图例
//        },
//        series: [{
//            name: '气温',
//            data: data
//        }]
//    });
//});

func arearangeChart() -> AAOptions {
    AAOptions()
            .chart(AAChart()
                    .type(.arearange)
                    .zoomType(.x))
            .title(AATitle()
                    .text("某地白天温度变化"))
            .xAxis(AAXAxis()
                    .type(.datetime)
                    .crosshair(AACrosshair()
                            .width(1)
                            .color(AAColor.red)
                            .dashStyle(.longDashDotDot)))
            .yAxis(AAYAxis()
                    .title(AATitle()
                            .text("")))
            .tooltip(AATooltip()
                    .shared(true)
                    .valueSuffix("°C"))
            .legend(AALegend()
                    .enabled(false))
//            .series([
//                AASeriesElement()
//                        .name("气温")
//                        .data([
//                            [1246406400000, 14.3, 27.7],
//                            [1246492800000, 14.5, 27.8],
//                            [1246579200000, 15.5, 29.6],
//                            [1246665600000, 16.7, 30.7],
//                            [1246752000000, 16.5, 25.0],
//                            [1246838400000, 17.8, 25.7],
//                            [1246924800000, 13.5, 24.8],
//                            [1247011200000, 10.5, 21.4],
//                            [1247097600000, 9.2, 23.8],
//                            [1247184000000, 11.6, 21.8],
//                            [1247270400000, 10.7, 23.7],
//                            [1247356800000, 11.0, 23.3],
//                            [1247443200000, 11.6, 23.7],
//                            [1247529600000, 11.8, 20.7],
//                            [1247616000000, 12.6, 22.4],
//                            [1247702400000, 13.6, 19.6],
//                            [1247788800000, 11.4, 22.6],
//                            [1247875200000, 13.
}

//    // 气温范围，数据格式：[时间戳, 范围起始值, 范围结束值]

//var ranges = [
//    [1246406400000, 14.3, 27.7],
//    [1246492800000, 14.5, 27.8],
//    [1246579200000, 15.5, 29.6],
//    [1246665600000, 16.7, 30.7],
//    [1246752000000, 16.5, 25.0],
//    [1246838400000, 17.8, 25.7],
//    [1246924800000, 13.5, 24.8],
//    [1247011200000, 10.5, 21.4],
//    [1247097600000, 9.2, 23.8],
//    [1247184000000, 11.6, 21.8],
//    [1247270400000, 10.7, 23.7],
//    [1247356800000, 11.0, 23.3],
//    [1247443200000, 11.6, 23.7],
//    [1247529600000, 11.8, 20.7],
//    [1247616000000, 12.6, 22.4],
//    [1247702400000, 13.6, 19.6],
//    [1247788800000, 11.4, 22.6],
//    [1247875200000, 13.2, 25.0],
//    [1247961600000, 14.2, 21.6],
//    [1248048000000, 13.1, 17.1],
//    [1248134400000, 12.2, 15.5],
//    [1248220800000, 12.0, 20.8],
//    [1248307200000, 12.0, 17.1],
//    [1248393600000, 12.7, 18.3],
//    [1248480000000, 12.4, 19.4],
//    [1248566400000, 12.6, 19.9],
//    [1248652800000, 11.9, 20.2],
//    [1248739200000, 11.0, 19.3],
//    [1248825600000, 10.8, 17.8],
//    [1248912000000, 11.8, 18.5],
//    [1248998400000, 10.8, 16.1]
//],
//    // 平均数据，格式：[时间戳, 值]
//    averages = [
//        [1246406400000, 21.5],
//        [1246492800000, 22.1],
//        [1246579200000, 23],
//        [1246665600000, 23.8],
//        [1246752000000, 21.4],
//        [1246838400000, 21.3],
//        [1246924800000, 18.3],
//        [1247011200000, 15.4],
//        [1247097600000, 16.4],
//        [1247184000000, 17.7],
//        [1247270400000, 17.5],
//        [1247356800000, 17.6],
//        [1247443200000, 17.7],
//        [1247529600000, 16.8],
//        [1247616000000, 17.7],
//        [1247702400000, 16.3],
//        [1247788800000, 17.8],
//        [1247875200000, 18.1],
//        [1247961600000, 17.2],
//        [1248048000000, 14.4],
//        [1248134400000, 13.7],
//        [1248220800000, 15.7],
//        [1248307200000, 14.6],
//        [1248393600000, 15.3],
//        [1248480000000, 15.3],
//        [1248566400000, 15.8],
//        [1248652800000, 15.2],
//        [1248739200000, 14.8],
//        [1248825600000, 14.4],
//        [1248912000000, 15],
//        [1248998400000, 13.6]
//    ];
//
//Highcharts.chart('container', {
//    title: {
//        text: '七月气温'
//    },
//    xAxis: {
//        type: 'datetime',
//        crosshairs: true
//    },
//    yAxis: {
//        title: {
//            text: null
//        }
//    },
//    tooltip: {
//        shared: true,
//        valueSuffix: '°C'
//    },
//    series: [{
//        name: '气温',
//        data: averages,
//        zIndex: 1, // 控制显示层叠
//        marker: {
//            fillColor: 'white',
//            lineWidth: 2,
//            lineColor: Highcharts.getOptions().colors[0]
//        }
//    }, {
//        name: '范围',
//        data: ranges,
//        type: 'arearange',
//        lineWidth: 0,
//        linkedTo: ':previous', // 与上一个数据列进行关联，或者直接赋值 0
//        color: Highcharts.getOptions().colors[0],
//        fillOpacity: 0.3,
//        zIndex: 0,
//        marker: {
//            enabled: false
//        }
//    }]
//});

func arearangeAndLineChart() {
    // 气温范围，数据格式：[时间戳, 范围起始值, 范围结束值]
    let ranges = [
        [1246406400000, 14.3, 27.7],
        [1246492800000, 14.5, 27.8],
        [1246579200000, 15.5, 29.6],
        [1246665600000, 16.7, 30.7],
        [1246752000000, 16.5, 25.0],
        [1246838400000, 17.8, 25.7],
        [1246924800000, 13.5, 24.8],
        [1247011200000, 10.5, 21.4],
        [1247097600000, 9.2, 23.8],
        [1247184000000, 11.6, 21.8],
        [1247270400000, 10.7, 23.7],
        [1247356800000, 11.0, 23.3],
        [1247443200000, 11.6, 23.7],
        [1247529600000, 11.8, 20.7],
        [1247616000000, 12.6, 22.4],
        [1247702400000, 13.6, 19.6],
        [1247788800000, 11.4, 22.6],
        [1247875200000, 13.2, 25.0],
        [1247961600000, 14.2, 21.6],
        [1248048000000, 13.1, 17.1],
        [1248134400000, 12.2, 15.5],
        [1248220800000, 12.0, 20.8],
        [1248307200000, 12.0, 17.1],
        [1248393600000, 12.7, 18.3],
        [1248480000000, 12.4, 19.4],
        [1248566400000, 12.6, 19.9],
        [1248652800000, 11.9, 20.2],
        [1248739200000, 11.0, 19.3],
        [1248825600000, 10.8, 17.8],
        [1248912000000, 11.8, 18.5],
        [1248998400000, 10.8, 16.1],
    ]

    // 平均数据，格式：[时间戳, 值]
    let averages = [
        [1246406400000, 21.5],
        [1246492800000, 22.1],
        [1246579200000, 23],
        [1246665600000, 23.8],
        [1246752000000, 21.4],
        [1246838400000, 21.3],
        [1246924800000, 18.3],
        [1247011200000, 15.4],
        [1247097600000, 16.4],
        [1247184000000, 17.7],
        [1247270400000, 17.5],
        [1247356800000, 17.6],
        [1247443200000, 17.7],
        [1247529600000, 16.8],
        [1247616000000, 17.7],
        [1247702400000, 16.3],
        [1247788800000, 17.8],
        [1247875200000, 18.1],
        [1247961600000, 17.2],
        [1248048000000, 14.4],
        [1248134400000, 13.7],
        [1248220800000, 15.7],
        [1248307200000, 14.6],
        [1248393600000, 15.3],
        [1248480000000, 15.3],
        [1248566400000, 15.8],
        [1248652800000, 15.2],
        [1248739200000, 14.8],
        [1248825600000, 14.4],
        [1248912000000, 15.4],
        [1248998400000, 14.1],
    ]

    // 创建图表
    AAOptions()
            .chart(AAChart()
                    .type(.spline))
            .title(AATitle()
                    .text("气温变化范围"))
            .subtitle(AASubtitle()
                    .text("数据来源: WorldClimate.com"))
            .xAxis(AAXAxis()
                    .type(.datetime)
                    .crosshair(AACrosshair()
                            .width(1)
                            .color("#1E90FF")
                            .dashStyle(.longDashDotDot)))
            .yAxis(AAYAxis()
                    .title(AATitle()
                            .text("")))
            .tooltip(AATooltip()
                    .shared(true)
                    .valueSuffix("°C"))
            .series([
                AASeriesElement()
                        .name("气温")
                        .data(averages)
                        .zIndex(1)
                        .marker(AAMarker()
                                .fillColor("#ffffff")
                                .lineWidth(2)
                                .lineColor(AAGradientColor.oceanBlue)),
                AASeriesElement()
                        .name("范围")
                        .data(ranges)
                        .type(.arearange)
                        .lineWidth(0)
//                        .linkedTo(":previous")
                        .color(AAGradientColor.oceanBlue)
                        .fillOpacity(0.3)
                        .zIndex(0)
                        .marker(AAMarker()
                                .enabled(false)),
            ])

}

}
