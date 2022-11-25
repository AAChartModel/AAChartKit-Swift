//
// Created by AnAn on 2022/11/22.
// Copyright (c) 2022 An An. All rights reserved.
//

import Foundation
import AAInfographics

class PieChartOptionsComposer {
//Highcharts.chart('container', {
//		chart: {
//				plotBackgroundColor: null,
//				plotBorderWidth: null,
//				plotShadow: false,
//				type: 'pie'
//		},
//		title: {
//				text: '2018年1月浏览器市场份额'
//		},
//		tooltip: {
//				pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
//		},
//		plotOptions: {
//				pie: {
//						allowPointSelect: true,
//						cursor: 'pointer',
//						dataLabels: {
//								enabled: true,
//								format: '<b>{point.name}</b>: {point.percentage:.1f} %',
//								style: {
//										color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
//								}
//						}
//				}
//		},
//		series: [{
//				name: 'Brands',
//				colorByPoint: true,
//				data: [{
//						name: 'Chrome',
//						y: 61.41,
//						sliced: true,
//						selected: true
//				}, {
//						name: 'Internet Explorer',
//						y: 11.84
//				}, {
//						name: 'Firefox',
//						y: 10.85
//				}, {
//						name: 'Edge',
//						y: 4.67
//				}, {
//						name: 'Safari',
//						y: 4.18
//				}, {
//						name: 'Sogou Explorer',
//						y: 1.64
//				}, {
//						name: 'Opera',
//						y: 1.6
//				}, {
//						name: 'QQ',
//						y: 1.2
//				}, {
//						name: 'Other',
//						y: 2.61
//				}]
//		}]
//});

static func basicPieChart() -> AAOptions {
    AAOptions()
        .chart(AAChart()
            .type(.pie))
        .title(AATitle()
            .text("2018年1月浏览器市场份额"))
        .tooltip(AATooltip()
            .pointFormat("{series.name}: <b>{point.percentage:.1f}%</b>"))
        .plotOptions(AAPlotOptions()
            .pie(AAPie()
                .allowPointSelect(true)
                .cursor("pointer")
                .dataLabels(AADataLabels()
                    .enabled(true)
                    .format("<b>{point.name}</b>: {point.percentage:.1f} %")
                    .style(AAStyle()
                        .color(AAColor.black)))))
        .series([
            AASeriesElement()
                .name("Brands")
                .colorByPoint(true)
                .data([
                    ["Chrome", 61.41],
                    ["Internet Explorer", 11.84],
                    ["Firefox", 10.85],
                    ["Edge", 4.67],
                    ["Safari", 4.18],
                    ["Sogou Explorer", 1.64],
                    ["Opera", 1.6],
                    ["QQ", 1.2],
                    ["Other", 2.61]
                ])
        ])
}

    //// Build the chart
    //Highcharts.chart('container', {
    //		chart: {
    //				plotBackgroundColor: null,
    //				plotBorderWidth: null,
    //				plotShadow: false,
    //				type: 'pie'
    //		},
    //		title: {
    //				text: '2018 年浏览器市场份额'
    //		},
    //		tooltip: {
    //				pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    //		},
    //		plotOptions: {
    //				pie: {
    //						allowPointSelect: true,
    //						cursor: 'pointer',
    //						dataLabels: {
    //								enabled: false
    //						},
    //						showInLegend: true
    //				}
    //		},
    //		series: [{
    //				name: 'Brands',
    //				colorByPoint: true,
    //				data: [{
    //						name: 'Chrome',
    //						y: 61.41,
    //						sliced: true,
    //						selected: true
    //				}, {
    //						name: 'Internet Explorer',
    //						y: 11.84
    //				}, {
    //						name: 'Firefox',
    //						y: 10.85
    //				}, {
    //						name: 'Edge',
    //						y: 4.67
    //				}, {
    //						name: 'Safari',
    //						y: 4.18
    //				}, {
    //						name: 'Other',
    //						y: 7.05
    //				}]
    //		}]
    //});

    static func basicPieChartWithLegend() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.pie))
            .title(AATitle()
                .text("2018年1月浏览器市场份额"))
            .tooltip(AATooltip()
                .pointFormat("{series.name}: <b>{point.percentage:.1f}%</b>"))
            .plotOptions(AAPlotOptions()
                .pie(AAPie()
                    .allowPointSelect(true)
                    .cursor("pointer")
                    .dataLabels(AADataLabels()
                        .enabled(false))
                    .showInLegend(true)))
            .series([
                AASeriesElement()
                    .name("Brands")
                    .colorByPoint(true)
                    .data([
                        ["Chrome", 61.41],
                        ["Internet Explorer", 11.84],
                        ["Firefox", 10.85],
                        ["Edge", 4.67],
                        ["Safari", 4.18],
                        ["Other", 7.05]
                    ])
            ])
    }

    //var chart = Highcharts.chart('container', {

    //    title: {
    //        text: '浏览器<br>占比',
    //        align: 'center',
    //        verticalAlign: 'middle',
    //        y: 50
    //    },
    //    tooltip: {
    //        headerFormat: '{series.name}<br>',
    //        pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
    //    },
    //    plotOptions: {
    //        pie: {
    //            dataLabels: {
    //                enabled: true,
    //                distance: -50,
    //                style: {
    //                    fontWeight: 'bold',
    //                    color: 'white',
    //                    textShadow: '0px 1px 2px black'
    //                }
    //            },
    //            startAngle: -90, // 圆环的开始角度
    //            endAngle: 90,    // 圆环的结束角度
    //            center: ['50%', '75%']
    //        }
    //    },
    //    series: [{
    //        type: 'pie',
    //        name: '浏览器占比',
    //        innerSize: '50%',
    //        data: [
    //            ['Firefox',   45.0],
    //            ['IE',       26.8],
    //            ['Chrome', 12.8],
    //            ['Safari',    8.5],
    //            ['Opera',     6.2],
    //            {
    //                name: '其他',
    //                y: 0.7,
    //                dataLabels: {
    //                    // 数据比较少，没有空间显示数据标签，所以将其关闭
    //                    enabled: false
    //                }
    //            }
    //        ]
    //    }]
    //});

    static func basicPieChartWithGradientColor() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.pie))
            .title(AATitle()
                .text("浏览器<br>占比"))
            .tooltip(AATooltip()
                .headerFormat("{series.name}<br>")
                .pointFormat("{point.name}: <b>{point.percentage:.1f}%</b>"))
            .plotOptions(AAPlotOptions()
                .pie(AAPie()
                    .dataLabels(AADataLabels()
                        .enabled(true)
                        .distance(-50)
                        .style(AAStyle()
                            .fontWeight(.bold)
                            .color(AAColor.white)
//                            .textShadow("0px 1px 2px black")
                        ))
                    .startAngle(-90)
                    .endAngle(90)
                    .center(["50%", "75%"])
                ))
            .series([
                AASeriesElement()
                    .name("浏览器占比")
                    .innerSize("50%")
                    .data([
                        ["Firefox", 45.0],
                        ["IE", 26.8],
                        ["Chrome", 12.8],
                        ["Safari", 8.5],
                        ["Opera", 6.2],
                        [
                            "name": "其他",
                            "y": 0.7,
                            "dataLabels": AADataLabels()
                                .enabled(false)
                                .toDic()!// 数据比较少，没有空间显示数据标签，所以将其关闭
                        ]
                    ])
            ])
    }

    //// 创建渐变色
    //Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {
    //    return {
    //        radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
    //        stops: [
    //            [0, color],
    //            [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
    //        ]
    //    };
    //});
    //// 构建图表
    //var chart = Highcharts.chart('container',{
    //    title: {
    //        text: '2014年某网站各浏览器的访问量占比'
    //    },
    //    tooltip: {
    //        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    //    },
    //    plotOptions: {
    //        pie: {
    //            allowPointSelect: true,
    //            cursor: 'pointer',
    //            dataLabels: {
    //                enabled: true,
    //                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
    //                style: {
    //                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
    //                },
    //                connectorColor: 'silver'
    //            }
    //        }
    //    },
    //    series: [{
    //        type: 'pie',
    //        name: '浏览器占比',
    //        data: [
    //            ['Firefox',   45.0],
    //            ['IE',       26.8],
    //            {
    //                name: 'Chrome',
    //                y: 12.8,
    //                sliced: true,
    //                selected: true
    //            },
    //            ['Safari',    8.5],
    //            ['Opera',     6.2],
    //            ['其他',   0.7]
    //        ]
    //    }]
    //});

    static func basicPieChartWithGradientColor2() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.pie))
            .title(AATitle()
                .text("2014年某网站各浏览器的访问量占比"))
            .tooltip(AATooltip()
                .pointFormat("{series.name}: <b>{point.percentage:.1f}%</b>"))
            .plotOptions(AAPlotOptions()
                .pie(AAPie()
                    .allowPointSelect(true)
                    .cursor("pointer")
                    .dataLabels(AADataLabels()
                        .enabled(true)
                        .format("<b>{point.name}</b>: {point.percentage:.1f} %")
                        .style(AAStyle()
                            .color(AAColor.white))
                        .connectorColor("silver"))))
            .series([
                AASeriesElement()
                    .name("浏览器占比")
                    .data([
                        ["Firefox", 45.0],
                        ["IE", 26.8],
                        [
                           "name": "Chrome",
                            "y": 12.8,
                            "sliced": true,
                            "selected": true
                        ],
                        ["Safari", 8.5],
                        ["Opera", 6.2],
                        ["其他", 0.7]
                    ])
            ])
    }

    //// Make monochrome colors and set them as default for all pies
    //Highcharts.getOptions().plotOptions.pie.colors = (function () {
    //    var colors = [],
    //        base = Highcharts.getOptions().colors[0],
    //        i;
    //    for (i = 0; i < 10; i += 1) {
    //        // Start out with a darkened base color (negative brighten), and end
    //        // up with a much brighter color
    //        colors.push(Highcharts.Color(base).brighten((i - 3) / 7).get());
    //    }
    //    return colors;
    //}());
    //// 初始化图表
    //var chart = Highcharts.chart('container', {
    //    title: {
    //        text: '2014 年某网站各浏览器访问量占比'
    //    },
    //    tooltip: {
    //        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    //    },
    //    plotOptions: {
    //        pie: {
    //            allowPointSelect: true,
    //            cursor: 'pointer',
    //            dataLabels: {
    //                enabled: true,
    //                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
    //                style: {
    //                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
    //                }
    //            }
    //        }
    //    },
    //    series: [{
    //        type: 'pie',
    //        name: '浏览器占比',
    //        data: [
    //            ['Firefox',   45.0],
    //            ['IE',       26.8],
    //            {
    //                name: 'Chrome',
    //                y: 12.8,
    //                sliced: true,
    //                selected: true
    //            },
    //            ['Safari',    8.5],
    //            ['Opera',     6.2],
    //            ['其他',   0.7]
    //        ]
    //    }]
    //});

    static func basicPieChartWithMonochromeColor() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.pie))
            .title(AATitle()
                .text("2014年某网站各浏览器的访问量占比"))
            .tooltip(AATooltip()
                .pointFormat("{series.name}: <b>{point.percentage:.1f}%</b>"))
            .plotOptions(AAPlotOptions()
                .pie(AAPie()
                    .allowPointSelect(true)
                    .cursor("pointer")
                    .dataLabels(AADataLabels()
                        .enabled(true)
                        .format("<b>{point.name}</b>: {point.percentage:.1f} %")
                        .style(AAStyle()
                            .color(AAColor.white)))))
            .series([
                AASeriesElement()
                    .name("浏览器占比")
                    .data([
                        ["Firefox", 45.0],
                        ["IE", 26.8],
                        [
                            "name": "Chrome",
                            "y": 12.8,
                            "sliced": true,
                            "selected": true
                        ],
                        ["Safari", 8.5],
                        ["Opera", 6.2],
                        ["其他", 0.7]
                    ])
            ])
    }

    //var chart = Highcharts.chart('container', {

    //    chart: {
    //        spacing : [40, 0 , 40, 0]
    //    },
    //    title: {
    //        floating:true,
    //        text: '圆心显示的标题'
    //    },
    //    tooltip: {
    //        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    //    },
    //    plotOptions: {
    //        pie: {
    //            allowPointSelect: true,
    //            cursor: 'pointer',
    //            dataLabels: {
    //                enabled: true,
    //                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
    //                style: {
    //                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
    //                }
    //            },
    //            point: {
    //                events: {
    //                    mouseOver: function(e) {  // 鼠标滑过时动态更新标题
    //                        // 标题更新函数，API 地址：https://api.hcharts.cn/highcharts#Chart.setTitle
    //                        chart.setTitle({
    //                            text: e.target.name+ '\t'+ e.target.y + ' %'
    //                        });
    //                    }
    //                    //,
    //                    // click: function(e) { // 同样的可以在点击事件里处理
    //                    //     chart.setTitle({
    //                    //         text: e.point.name+ '\t'+ e.point.y + ' %'
    //                    //     });
    //                    // }
    //                }
    //            },
    //        }
    //    },
    //    series: [{
    //        type: 'pie',
    //        innerSize: '80%',
    //        name: '市场份额',
    //        data: [
    //            {name:'Firefox',   y: 45.0, url : 'http://bbs.hcharts.cn'},
    //            ['IE',       26.8],
    //            {
    //                name: 'Chrome',
    //                y: 12.8,
    //                sliced: true,
    //                selected: true,
    //                url: 'http://www.hcharts.cn'
    //            },
    //            ['Safari',    8.5],
    //            ['Opera',     6.2],
    //            ['其他',   0.7]
    //        ]
    //    }]
    //}, function(c) { // 图表初始化完毕后的会掉函数
    //    // 环形图圆心
    //    var centerY = c.series[0].center[1],
    //        titleHeight = parseInt(c.title.styles.fontSize);
    //    // 动态设置标题位置
    //    c.setTitle({
    //        y:centerY + titleHeight/2
    //    });
    //});

    static func customPieChartTitlePosition() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .spacing(top: 40, right: 0, bottom: 40, left: 0))
            .title(AATitle()
                .floating(true)
                .text("圆心显示的标题"))
            .tooltip(AATooltip()
                .pointFormat("{series.name}: <b>{point.percentage:.1f}%</b>"))
            .plotOptions(AAPlotOptions()
                .pie(AAPie()
                    .allowPointSelect(true)
                    .cursor("pointer")
                    .dataLabels(AADataLabels()
                        .enabled(true)
                        .format("<b>{point.name}</b>: {point.percentage:.1f} %")
                        .style(AAStyle()
                            .color(AAColor.white)))
                    .point(AAPoint()
                        .events(AAPointEvents()
                            .mouseOver("""
                                       function(e) { 
                                           chart.setTitle({
                                               text: e.target.name+ '\\t'+ e.target.y + ' %'
                                           });
                                       }
                                       """) // 鼠标滑过时动态更新标题, 标题更新函数，API 地址：https://api.hcharts.cn/highcharts#Chart.setTitle
                        ))))
            .series([
                AASeriesElement()
                    .type(.pie)
                    .innerSize("80%")
                    .name("市场份额")
                    .data([
                        ["Firefox", 45.0, "http://bbs.hcharts.cn"],
                        ["IE", 26.8],
                        [
                            "name": "Chrome",
                            "y": 12.8,
                            "sliced": true,
                            "selected": true,
                            "url": "http://www.hcharts.cn"
                        ],
                        ["Safari", 8.5],
                        ["Opera", 6.2],
                        ["其他", 0.7]
                    ])
            ])
    }




}
