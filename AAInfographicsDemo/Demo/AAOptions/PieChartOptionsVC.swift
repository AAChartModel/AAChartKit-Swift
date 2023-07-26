//
//  PieChartOptionsVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2023/7/26.
//  Copyright © 2023 An An. All rights reserved.
//

import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class PieChartOptionsVC: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func chartConfigurationWithSelectedIndex(_ selectedIndex: Int) -> Any? {
        switch selectedIndex {
        case 0: return pieDonutChart()
//        case 1: return boxPlotMixedScatterChartWithJitter()

            
            
        default:
            return AAOptions()
        }
    }


    //https://www.highcharts.com/demo/highcharts/pie-donut
    private func pieDonutChart() -> AAOptions {
        let colors = [
            AARgba(137, 78, 36),
            AARgba(220, 36, 30),
            AARgba(255, 206, 0),
            AARgba(1, 114, 41),
            AARgba(0, 175, 173),
            AARgba(215, 153, 175),
            AARgba(106, 114, 120),
            AARgba(114, 17, 84),
            AARgba(0, 0, 0),
            AARgba(0, 24, 168),
            AARgba(0, 160, 226),
            AARgba(106, 187, 170)
        ]
        
        let categories = [
                "Chrome",
                "Safari",
                "Edge",
                "Firefox",
                "Other"
            ]


        let data = [
            [
                "y": 61.04,
                "color": "#7cb5ec",
                "drilldown": [
                    "name": "Chrome",
                    "categories": [
                        "Chrome v97.0",
                        "Chrome v96.0",
                        "Chrome v95.0",
                        "Chrome v94.0",
                        "Chrome v93.0",
                        "Chrome v92.0",
                        "Chrome v91.0",
                        "Chrome v90.0",
                        "Chrome v89.0",
                        "Chrome v88.0",
                        "Chrome v87.0",
                        "Chrome v86.0",
                        "Chrome v85.0",
                        "Chrome v84.0",
                        "Chrome v83.0",
                        "Chrome v81.0",
                        "Chrome v89.0",
                        "Chrome v79.0",
                        "Chrome v78.0",
                        "Chrome v76.0",
                        "Chrome v75.0",
                        "Chrome v72.0",
                        "Chrome v70.0",
                        "Chrome v69.0",
                        "Chrome v56.0",
                        "Chrome v49.0"
                    ],
                    "data": [
                        36.89,
                        18.16,
                        0.54,
                        0.7,
                        0.8,
                        0.41,
                        0.31,
                        0.13,
                        0.14,
                        0.1,
                        0.35,
                        0.17,
                        0.18,
                        0.17,
                        0.21,
                        0.1,
                        0.16,
                        0.43,
                        0.11,
                        0.16,
                        0.15,
                        0.14,
                        0.11,
                        0.13,
                        0.12
                    ]
                ]
            ],
            [
                "y": 9.47,
                "color": "#434348",
                "drilldown": [
                    "name": "Safari",
                    "categories": [
                        "Safari v15.3",
                        "Safari v15.2",
                        "Safari v15.1",
                        "Safari v15.0",
                        "Safari v14.1",
                        "Safari v14.0",
                        "Safari v13.1",
                        "Safari v13.0",
                        "Safari v12.1"
                    ],
                    "data": [
                        0.1,
                        2.01,
                        2.29,
                        0.49,
                        2.48,
                        0.64,
                        1.17,
                        0.13,
                        0.16
                    ]
                ]
            ],
            [
                "y": 9.32,
                "color": "#90ed7d",
                "drilldown": [
                    "name": "Edge",
                    "categories": [
                        "Edge v97",
                        "Edge v96",
                        "Edge v95"
                    ],
                    "data": [
                        6.62,
                        2.55,
                        0.15
                    ]
                ]
            ],
            [
                "y": 8.15,
                "color": "#f7a35c",
                "drilldown": [
                    "name": "Firefox",
                    "categories": [
                        "Firefox v96.0",
                        "Firefox v95.0",
                        "Firefox v94.0",
                        "Firefox v91.0",
                        "Firefox v78.0",
                        "Firefox v52.0"
                    ],
                    "data": [
                        4.17,
                        3.33,
                        0.11,
                        0.23,
                        0.16,
                        0.15
                    ]
                ]
            ],
            [
                "y": 11.02,
                "color": "#8085e9",
                "drilldown": [
                    "name": "Other",
                    "categories": [
                        "Other"
                    ],
                    "data": [
                        11.02
                    ]
                ]
            ]
        ]

        //    browserData = [],
        //    versionsData = [],
        //    dataLen = data.length;
        //
        //let i,
        //    j,
        //    drillDataLen,
        //    brightness;
        //
        //
        //// Build the data arrays
        //for (i = 0; i < dataLen; i += 1) {
        //
        //    // add browser data
        //    browserData.push({
        //        name: categories[i],
        //        y: data[i].y,
        //        color: data[i].color
        //    });
        //
        //    // add version data
        //    drillDataLen = data[i].drilldown.data.length;
        //    for (j = 0; j < drillDataLen; j += 1) {
        //        brightness = 0.2 - (j / drillDataLen) / 5;
        //        versionsData.push({
        //            name: data[i].drilldown.categories[j],
        //            y: data[i].drilldown.data[j],
        //            color: Highcharts.color(data[i].color).brighten(brightness).get()
        //        });
        //    }
        //}

        var browserData = [Any]()
        var versionsData = [Any]()
        let dataLen = data.count

        var i = 0
        var j = 0
        var drillDataLen = 0
        var brightness = 0.0
        


        // Build the data arrays
        for i in 0 ..< dataLen {
            let color = colors[i]
            // add browser data
            browserData.append([
                "name": categories[i],
                "y": data[i]["y"],
                "color": color
            ])
            
            let drilldownArr = (data[i]["drilldown"] as! [String: Any])

            // add version data
            drillDataLen = (drilldownArr["data"]! as AnyObject).count
            for j in 0 ..< drillDataLen {
                brightness = 0.2 - (Double(j) / Double(drillDataLen)) / 5
                //输出查看 brightness的值是否正确
                print("brightness: \(brightness)")
                versionsData.append([
                    "name": drilldownArr["categories"],
                    "y": drilldownArr["data"],
                    "color": configureAARgbaBrightness(color , brightness)
                ])
            }
        }

        func configureAARgbaBrightness(_ color: String, _ brightness: Double) -> String {
            // "rgba(\(red),\(green),\(blue),\(alpha))"
            //去除 color字符串左边的 rgba( 和 右边的 )
            let color = color.replacingOccurrences(of: "rgba(", with: "").replacingOccurrences(of: ")", with: "")
            let colorArr = color.components(separatedBy: ",")
            let r = colorArr[0]
            let g = colorArr[1]
            let b = colorArr[2]
            let a = brightness
            return "rgba(\(r),\(g),\(b),\(a))"
        }
        
        


//// Create the chart
//Highcharts.chart('container', {
//    chart: {
//        type: 'pie'
//    },
//    title: {
//        text: 'Browser market share, January, 2022',
//        align: 'left'
//    },
//    subtitle: {
//        text: 'Source: <a href="http://statcounter.com" target="_blank">statcounter.com</a>',
//        align: 'left'
//    },
//    plotOptions: {
//        pie: {
//            shadow: false,
//            center: ['50%', '50%']
//        }
//    },
//    tooltip: {
//        valueSuffix: '%'
//    },
//    series: [{
//        name: 'Browsers',
//        data: browserData,
//        size: '60%',
//        dataLabels: {
//            color: '#ffffff',
//            distance: -30
//        }
//    }, {
//        name: 'Versions',
//        data: versionsData,
//        size: '80%',
//        innerSize: '60%',
//        dataLabels: {
//            format: '<b>{point.name}:</b> <span style="opacity: 0.5">{y}%</span>',
//            filter: {
//                property: 'y',
//                operator: '>',
//                value: 1
//            },
//            style: {
//                fontWeight: 'normal'
//            }
//        },
//        id: 'versions'
//    }],
//
//});

    let aaOptions = AAOptions()
            .chart(AAChart()
                .type(.pie))
            .title(AATitle()
                .text("Browser market share, January, 2022")
                .align(.left))
            .subtitle(AASubtitle()
//                .text("Source: <a href='http://statcounter.com' target='_blank'>statcounter.com</a>")
                .align(.left))
            .plotOptions(AAPlotOptions()
                .pie(AAPie()
//                    .shadow(false)
                    .center(["50%", "50%"])))
            .tooltip(AATooltip()
                .valueSuffix("%"))
            .series([
                AASeriesElement()
                    .name("Browsers")
                    .data(browserData)
                    .size("60%")
                    .dataLabels(AADataLabels()
                        .color(AAColor.white)
                        .distance(-30)),
                AASeriesElement()
                    .name("Versions")
                    .data(versionsData)
                    .size("80%")
                    .innerSize("60%")
                    .dataLabels(AADataLabels()
                        .format(#"<b>{point.name}:</b> <span style="opacity: 0.5">{point.y}%</span>"#.aa_toPureJSString())
                        .filter(AAFilter()
                            .property("y")
                            .operator(">")
                            .value(1))
                        .style(AAStyle()
                            .fontWeight(.regular)
                        ))
                    .id("versions")
                ])

        return aaOptions





    }
    }
