//
//  JSFunctionForAAChartEvents.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2022/8/26.
//  Copyright © 2022 An An. All rights reserved.
//

import UIKit
import AAInfographics

class JSFunctionForAAChartEventsVC: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //https://github.com/AAChartModel/AAChartKit-Swift/issues/345
    private func setCrosshairAndTooltipToTheDefaultPositionAfterLoadingChart() -> AAOptions {
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
            .style(AAStyle(color: AAColor.white))
            .backgroundColor("#050505")
            .borderColor("#050505")
        
        aaOptions.xAxis?.crosshair(
            AACrosshair()
                .color(AAColor.darkGray)
                .dashStyle(.longDashDotDot)
                .width(2)
        )
        
        //默认选中的位置索引
        let defaultSelectedIndex = 5
        
        //https://api.highcharts.com/highcharts/chart.events.load
        //https://www.highcharts.com/forum/viewtopic.php?t=36508
        aaOptions.chart?.events(
            AAChartEvents()
                .load("""
        function() {
            let points = [],
                chart = this,
                series = chart.series,
                length = series.length;
                        
            for (let i = 0; i < length; i++) {
              let pointElement = series[i].data[\(defaultSelectedIndex)];
              points.push(pointElement);
            }
            chart.xAxis[0].drawCrosshair(null, points[0]);
            chart.tooltip.refresh(points);
          }
"""))
        
        return aaOptions
    }
    
    private func generalDrawingChart() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .backgroundColor(AAColor.white)
                .events(AAChartEvents()
                    .load("""
            function () {
                var ren = this.renderer,
                    colors = Highcharts.getOptions().colors,
                    rightArrow = ['M', 0, 0, 'L', 100, 0, 'L', 95, 5, 'M', 100, 0, 'L', 95, -5],
                    leftArrow = ['M', 100, 0, 'L', 0, 0, 'L', 5, 5, 'M', 0, 0, 'L', 5, -5];


                ren.path(['M', 120, 40, 'L', 120, 330])
                    .attr({
                        'stroke-width': 2,
                        stroke: 'silver',
                        dashstyle: 'dash'
                    })
                    .add();

                ren.path(['M', 420, 40, 'L', 420, 330])
                    .attr({
                        'stroke-width': 2,
                        stroke: 'silver',
                        dashstyle: 'dash'
                    })
                    .add();

                ren.label('Web client', 20, 40)
                    .css({
                        fontWeight: 'bold'
                    })
                    .add();
                ren.label('Web service / CLI', 220, 40)
                    .css({
                        fontWeight: 'bold'
                    })
                    .add();
                ren.label('Command line client', 440, 40)
                    .css({
                        fontWeight: 'bold'
                    })
                    .add();

                ren.label('SaaS client<br/>(browser or<br/>script)', 10, 82)
                    .attr({
                        fill: colors[0],
                        stroke: 'white',
                        'stroke-width': 2,
                        padding: 5,
                        r: 5
                    })
                    .css({
                        color: 'white'
                    })
                    .add()
                    .shadow(true);

                ren.path(rightArrow)
                    .attr({
                        'stroke-width': 2,
                        stroke: colors[3]
                    })
                    .translate(95, 95)
                    .add();

                ren.label('POST options in JSON', 90, 75)
                    .css({
                        fontSize: '10px',
                        color: colors[3]
                    })
                    .add();

                ren.label('PhantomJS', 210, 82)
                    .attr({
                        r: 5,
                        width: 100,
                        fill: colors[1]
                    })
                    .css({
                        color: 'white',
                        fontWeight: 'bold'
                    })
                    .add();

                ren.path(['M', 250, 110, 'L', 250, 185, 'L', 245, 180, 'M', 250, 185, 'L', 255, 180])
                    .attr({
                        'stroke-width': 2,
                        stroke: colors[3]
                    })
                    .add();

                ren.label('SVG', 255, 120)
                    .css({
                        color: colors[3],
                        fontSize: '10px'
                    })
                    .add();

                ren.label('Batik', 210, 200)
                    .attr({
                        r: 5,
                        width: 100,
                        fill: colors[1]
                    })
                    .css({
                        color: 'white',
                        fontWeight: 'bold'
                    })
                    .add();

                ren
                    .path([
                        'M', 235, 185,
                        'L', 235, 155,
                        'C', 235, 130, 235, 130, 215, 130,
                        'L', 95, 130,
                        'L', 100, 125,
                        'M', 95, 130,
                        'L', 100, 135
                    ])
                    .attr({
                        'stroke-width': 2,
                        stroke: colors[3]
                    })
                    .add();

                ren.label('Rasterized image', 100, 110)
                    .css({
                        color: colors[3],
                        fontSize: '10px'
                    })
                    .add();

                ren.label('Browser<br/>running<br/>Highcharts', 10, 180)
                    .attr({
                        fill: colors[0],
                        stroke: 'white',
                        'stroke-width': 2,
                        padding: 5,
                        r: 5
                    })
                    .css({
                        color: 'white',
                        width: '100px'
                    })
                    .add()
                    .shadow(true);


                ren.path(rightArrow)
                    .attr({
                        'stroke-width': 2,
                        stroke: colors[1]
                    })
                    .translate(95, 205)
                    .add();

                ren.label('POST SVG', 110, 185)
                    .css({
                        color: colors[1],
                        fontSize: '10px'
                    })
                    .add();

                ren.path(leftArrow)
                    .attr({
                        'stroke-width': 2,
                        stroke: colors[1]
                    })
                    .translate(95, 215)
                    .add();

                ren.label('Rasterized image', 100, 215)
                    .css({
                        color: colors[1],
                        fontSize: '10px'
                    })
                    .add();

                ren.label('Script', 450, 82)
                    .attr({
                        fill: colors[2],
                        stroke: 'white',
                        'stroke-width': 2,
                        padding: 5,
                        r: 5
                    })
                    .css({
                        color: 'white',
                        width: '100px'
                    })
                    .add()
                    .shadow(true);

                ren.path(leftArrow)
                    .attr({
                        'stroke-width': 2,
                        stroke: colors[2]
                    })
                    .translate(330, 90)
                    .add();

                ren.label('Command', 340, 70)
                    .css({
                        color: colors[2],
                        fontSize: '10px'
                    })
                    .add();

                ren.path(rightArrow)
                    .attr({
                        'stroke-width': 2,
                        stroke: colors[2]
                    })
                    .translate(330, 100)
                    .add();

                ren.label('Rasterized image', 330, 100)
                    .css({
                        color: colors[2],
                        fontSize: '10px'
                    })
                    .add();
            }
""")))
            .title(AATitle()
                .text("Highcharts export server overview")
                .style(AAStyle.init(color: AAColor.black)))
    }
    
    
    private func advancedTimeLineChart() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .events(AAChartEvents()
                    .load(#"""
function () {
                        var centerX = 140;
                        var centerY = 110;
                        var path = [];
                        var angle;
                        var radius;
                        var badgeColor = Highcharts.color(Highcharts.getOptions().colors[0]).brighten(-0.2).get();
                        var spike;
                        var empImage;
                        var big5;
                        var label;
                        var left;
                        var right;
                        var years;
                        var renderer;

                        if (this.chartWidth < 530) {
                            return;
                        }

                        for (angle = 0; angle < 2 * Math.PI; angle += Math.PI / 24) {
                            radius = spike ? 80 : 70;
                            path.push(
                                'L',
                                centerX + radius * Math.cos(angle),
                                centerY + radius * Math.sin(angle)
                            );
                            spike = !spike;
                        }
                        path[0] = 'M';
                        path.push('z');
                        this.renderer.path(path)
                            .attr({
                                fill: badgeColor,
                                zIndex: 6
                            })
                            .add();

                        empImage = this.renderer.path(path)
                            .attr({
                                zIndex: 7,
                                opacity: 0,
                                stroke: badgeColor,
                                'stroke-width': 1
                            })
                            .add();

                        big5 = this.renderer.text('5')
                            .attr({
                                zIndex: 6
                            })
                            .css({
                                color: 'white',
                                fontSize: '100px',
                                fontStyle: 'italic',
                                fontFamily: '\'Brush Script MT\', sans-serif'
                            })
                            .add();
                        big5.attr({
                            x: centerX - big5.getBBox().width / 2,
                            y: centerY + 14
                        });

                        label = this.renderer.text('Highcharts Anniversary')
                            .attr({
                                zIndex: 6
                            })
                            .css({
                                color: '#FFFFFF'
                            })
                            .add();

                        left = centerX - label.getBBox().width / 2;
                        right = centerX + label.getBBox().width / 2;

                        label.attr({
                            x: left,
                            y: centerY + 44
                        });

                        left = centerX - 90;
                        right = centerX + 90;
                        this.renderer
                            .path([
                                'M', left, centerY + 30,
                                'L', right, centerY + 30,
                                right, centerY + 50,
                                left, centerY + 50,
                                'z',
                                'M', left, centerY + 40,
                                'L', left - 20, centerY + 40,
                                left - 10, centerY + 50,
                                left - 20, centerY + 60,
                                left + 10, centerY + 60,
                                left, centerY + 50,
                                left + 10, centerY + 60,
                                left + 10, centerY + 50,
                                left, centerY + 50,
                                'z',
                                'M', right, centerY + 40,
                                'L', right + 20, centerY + 40,
                                right + 10, centerY + 50,
                                right + 20, centerY + 60,
                                right - 10, centerY + 60,
                                right, centerY + 50,
                                right - 10, centerY + 60,
                                right - 10, centerY + 50,
                                right, centerY + 50,
                                'z'
                            ])
                            .attr({
                                fill: badgeColor,
                                stroke: '#FFFFFF',
                                'stroke-width': 1,
                                zIndex: 5
                            })
                            .add();

                        years = this.renderer.text('2009-2014')
                            .attr({
                                zIndex: 6
                            })
                            .css({
                                color: '#FFFFFF',
                                fontStyle: 'italic',
                                fontSize: '10px'
                            })
                            .add();
                        years.attr({
                            x: centerX - years.getBBox().width / 2,
                            y: centerY + 62
                        });

                        renderer = this.renderer;
                        if (renderer.defs) {
                            this.get('employees').points.forEach(point => {
                                let pattern;
                                if (point.image) {
                                    pattern = renderer.createElement('pattern').attr({
                                        id: 'pattern-' + point.image,
                                        patternUnits: 'userSpaceOnUse',
                                        width: 400,
                                        height: 400
                                    }).add(renderer.defs);
                                    renderer.image(
                                        'https://www.highcharts.com/images/employees2014/' + point.image + '.jpg',
                                        centerX - 80,
                                        centerY - 80,
                                        160,
                                        213
                                    ).add(pattern);

                                    Highcharts.addEvent(point, 'mouseOver', function () {
                                        empImage
                                            .attr({
                                                fill: 'url(#pattern-' + point.image + ')'
                                            })
                                            .animate({ opacity: 1 }, { duration: 500 });
                                    });
                                    Highcharts.addEvent(point, 'mouseOut', function () {
                                        empImage.animate({ opacity: 0 }, { duration: 500 });
                                    });
                                }
                            });
                        }
                    }
"""#)))
            .xAxis(AAXAxis()
                .type(.datetime)
                .minTickInterval(31536000000)
                .labels(AALabels()
                    .align(.left))
                .plotBands([
                    AAPlotBandsElement()
                        .from(1259280000000)
                        .to(1291161600000)
                        .color("#EFFFFF")
                        .label(AALabel()
                            .text("办事处:Torstein的地下室")
                            .style(AAStyle()
                                .color("#999999"))
                            .y(180)),
                    AAPlotBandsElement()
                        .from(1291161600000)
                        .to(1380585600000)
                        .color("#FFFFEF")
                        .label(AALabel()
                            .text("办事处:Tomtebu")
                            .style(AAStyle()
                                .color("#999999"))
                            .y(30)),
                    AAPlotBandsElement()
                        .from(1380585600000)
                        .to(1417046400000)
                        .color("#FFEFFF")
                        .label(AALabel()
                            .text("办事处:VikØrsta")
                            .style(AAStyle()
                                .color("#999999"))
                            .y(30))
                    ]))
            .title(AATitle()
                .text("Highsoft 公司发展历程"))
            .tooltip(AATooltip()
                .enabled(true)
                .style(AAStyle()
                    .width(250))
            )
            .yAxisArray([
                AAYAxis()
                    .max(100)
                    .labels(AALabels()
                        .enabled(false))
                    .title(AATitle()
                        .text(""))
                    .gridLineColor("rgba(0, 0, 0, 0.07)"),
                AAYAxis()
                    .allowDecimals(false)
                    .max(15)
                    .labels(AALabels()
                        .style(AAStyle()
                            .color("#90ed7d")))
                    .title(AATitle()
                        .text("雇员")
                        .style(AAStyle()
                            .color("#90ed7d")))
                    .opposite(true)
                    .gridLineWidth(0)
                ])
            .plotOptions(AAPlotOptions()
                .series(AASeries()
                    .marker(AAMarker()
                        .enabled(false)
                        .symbol(AAChartSymbolType.circle.rawValue)
                        .radius(2))
//                    .fillOpacity(0.5)
                )
//                .flags(AAFlags()
//                    .tooltip(AATooltip()
//                        .xDateFormat("%B %e, %Y")))
            )
            .series([
                AASeriesElement()
                    .type(.line)
    //                    .id("google-trends")
                    .dashStyle(.longDashDotDot)
                    .name("Google search for highcharts")
                    .data([
                        ["x": 1258322400000, /* November 2009 */ "y": 0],
                        ["x": 1260961200000, "y":  5],
                        ["x": 1263639600000, "y":  7],
                        ["x": 1266188400000, "y":  5],
                        ["x": 1268740800000, "y":  6],
                        ["x": 1271368800000, "y":  8],
                        ["x": 1274004000000, "y": 11],
                        ["x": 1276639200000, "y":  9],
                        ["x": 1279274400000, "y": 12],
                        ["x": 1281952800000, "y": 13],
                        ["x": 1284588000000, "y": 17],
                        ["x": 1287223200000, "y": 17],
                        ["x": 1289858400000, "y": 18],
                        ["x": 1292497200000, "y": 20],
                        ["x": 1295175600000, "y": 20],
                        ["x": 1297724400000, "y": 27],
                        ["x": 1300276800000, "y": 32],
                        ["x": 1302904800000, "y": 29],
                        ["x": 1305540000000, "y": 34],
                        ["x": 1308175200000, "y": 34],
                        ["x": 1310810400000, "y": 36],
                        ["x": 1313488800000, "y": 43],
                        ["x": 1316124000000, "y": 44],
                        ["x": 1318759200000, "y": 42],
                        ["x": 1321394400000, "y": 47],
                        ["x": 1324033200000, "y": 46],
                        ["x": 1326711600000, "y": 50],
                        ["x": 1329303600000, "y": 57],
                        ["x": 1331899200000, "y": 54],
                        ["x": 1334527200000, "y": 59],
                        ["x": 1337162400000, "y": 62],
                        ["x": 1339797600000, "y": 66],
                        ["x": 1342432800000, "y": 61],
                        ["x": 1345111200000, "y": 68],
                        ["x": 1347746400000, "y": 67],
                        ["x": 1350381600000, "y": 73],
                        ["x": 1353016800000, "y": 63],
                        ["x": 1355655600000, "y": 54],
                        ["x": 1358334000000, "y": 67],
                        ["x": 1360882800000, "y": 74],
                        ["x": 1363435200000, "y": 81],
                        ["x": 1366063200000, "y": 89],
                        ["x": 1368698400000, "y": 83],
                        ["x": 1371333600000, "y": 88],
                        ["x": 1373968800000, "y": 86],
                        ["x": 1376647200000, "y": 81],
                        ["x": 1379282400000, "y": 83],
                        ["x": 1381917600000, "y": 95],
                        ["x": 1384552800000, "y": 86],
                        ["x": 1387191600000, "y": 83],
                        ["x": 1389870000000, "y": 89],
                        ["x": 1392418800000, "y": 90],
                        ["x": 1394971200000, "y": 94],
                        ["x": 1397599200000, "y":100],
                        ["x": 1400234400000, "y":100],
                        ["x": 1402869600000, "y": 99],
                        ["x": 1405504800000, "y": 99],
                        ["x": 1408183200000, "y": 93],
                        ["x": 1410818400000, "y": 97],
                        ["x": 1413453600000, "y": 98]
                    ])
                    .tooltip(AATooltip()
    //                        .xDateFormat("%B %Y")
                        .valueSuffix(" % of best month")),
                AASeriesElement()
                    .name("收入")
    //                .id("revenue")
                    .type(.area)
                    .data([
                        [1257033600000,  2],
                        [1259625600000,  3],
                        [1262304000000,  2],
                        [1264982400000,  3],
                        [1267401600000,  4],
                        [1270080000000,  4],
                        [1272672000000,  4],
                        [1275350400000,  4],
                        [1277942400000,  5],
                        [1280620800000,  7],
                        [1283299200000,  6],
                        [1285891200000,  9],
                        [1288569600000, 10],
                        [1291161600000,  8],
                        [1293840000000, 10],
                        [1296518400000, 13],
                        [1298937600000, 15],
                        [1301616000000, 14],
                        [1304208000000, 15],
                        [1306886400000, 16],
                        [1309478400000, 22],
                        [1312156800000, 19],
                        [1314835200000, 20],
                        [1317427200000, 32],
                        [1320105600000, 34],
                        [1322697600000, 36],
                        [1325376000000, 34],
                        [1328054400000, 40],
                        [1330560000000, 37],
                        [1333238400000, 35],
                        [1335830400000, 40],
                        [1338508800000, 38],
                        [1341100800000, 39],
                        [1343779200000, 43],
                        [1346457600000, 49],
                        [1349049600000, 43],
                        [1351728000000, 54],
                        [1354320000000, 44],
                        [1356998400000, 43],
                        [1359676800000, 43],
                        [1362096000000, 52],
                        [1364774400000, 52],
                        [1367366400000, 56],
                        [1370044800000, 62],
                        [1372636800000, 66],
                        [1375315200000, 62],
                        [1377993600000, 63],
                        [1380585600000, 60],
                        [1383264000000, 60],
                        [1385856000000, 58],
                        [1388534400000, 65],
                        [1391212800000, 52],
                        [1393632000000, 72],
                        [1396310400000, 57],
                        [1398902400000, 70],
                        [1401580800000, 63],
                        [1404172800000, 65],
                        [1406851200000, 65],
                        [1409529600000, 89],
                        [1412121600000,100]
                        ])
                    .tooltip(AATooltip()
    //                        .xDateFormat("%B %Y")
                        .valueSuffix(" % of best month")),
                AASeriesElement()
                    .yAxis(1)
                    .name("Highsoft 员工")
    //                .id("employees")
                    .type(.area)
                    .step("left")
                    .tooltip(AATooltip()
                        .headerFormat("{point.x:%B %e, %Y}")
                        .pointFormat("{point.name}{point.y}")
                        .valueSuffix(" employees"))
                    .data([
                        ["x": AADateUTC(2009, 10,  1), "y":  1, "name": "Torstein 一个人工作", "image": "Torstein" ],
                        ["x": AADateUTC(2010, 10, 20), "y":  2, "name": "Grethe 加入", "image": "Grethe" ],
                        ["x": AADateUTC(2011, 3,   1), "y":  3, "name": "Erik 加入", "image": NSNull() ],
                        ["x": AADateUTC(2011, 7,   1), "y":  4, "name": "Gert 加入", "image": "Gert" ],
                        ["x": AADateUTC(2011, 7,  15), "y":  5, "name": "Hilde 加入", "image": "Hilde" ],
                        ["x": AADateUTC(2012, 5,   1), "y":  6, "name": "Guro 加入", "image": "Guro" ],
                        ["x": AADateUTC(2012, 8,   1), "y":  5, "name": "Erik left", "image": NSNull() ],
                        ["x": AADateUTC(2012, 8,  15), "y":  6, "name": "Anne Jorunn 加入", "image": "AnneJorunn" ],
                        ["x": AADateUTC(2013, 0,   1), "y":  7, "name": "Hilde T. 加入", "image": NSNull() ],
                        ["x": AADateUTC(2013, 7,   1), "y":  8, "name": "Jon Arild 加入", "image": "JonArild" ],
                        ["x": AADateUTC(2013, 7,  20), "y":  9, "name": "Øystein 加入", "image": "Oystein" ],
                        ["x": AADateUTC(2013, 9,   1), "y": 10, "name": "Stephane 加入", "image": "Stephane" ],
                        ["x": AADateUTC(2014, 9,   1), "y": 11, "name": "Anita 加入", "image": "Anita" ],
                        ["x": AADateUTC(2014, 10, 27), "y": 11, "name": "", "image": NSNull() ]
                    ])
                ])
}
    
    //https://github.com/AAChartModel/AAChartKit-Swift/issues/394
    //https://www.highcharts.com/forum/viewtopic.php?t=44985
    func confgureBlinkMarkerChart() -> AAOptions {
        let dataArr = [7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6]
        let selectedIndex = dataArr.count - 1
        
        return AAOptions()
            .chart(AAChart()
                .events(AAChartEvents()
                    .load("""
function() {
        const chart = this;
        const point = chart.series[0].points[\(selectedIndex)];
        let big = true;
        setInterval(() => {
          big = !big;
          point.update({
            marker: {
              radius: big ? 5 : 15
            }
          })
        }, 500)
      }
""")))
            .series([
                AASeriesElement()
                    .data(dataArr)
                    .marker(AAMarker()
                        .lineColor(AAColor.red)
                        .lineWidth(3)
                        .radius(10))
            ])
    }
    
    //https://github.com/AAChartModel/AAChartKit-Swift/issues/394
    //https://www.highcharts.com/forum/viewtopic.php?t=44985
    private func configureSpecialStyleMarkerOfSingleDataElementChartWithBlinkEffect() -> AAOptions {
        let gradientColorDic1 = AAGradientColor.linearGradient(
            direction: .toRight,
            stops: [
                [0.00, "#febc0f"],//颜色字符串设置支持十六进制类型和 rgba 类型
                [0.25, "#FF14d4"],
                [0.50, "#0bf8f5"],
                [0.75, "#F33c52"],
                [1.00, "#1904dd"],
            ]
        )
        
        let singleSpecialData = AADataElement()
            .marker(AAMarker()
                .radius(8)//曲线连接点半径
                .symbol(AAChartSymbolType.circle.rawValue)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                .fillColor(AAColor.white)//点的填充色(用来设置折线连接点的填充色)
                .lineWidth(5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                .lineColor(AAColor.red)//外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
        )
            .y(45.3)
            .toDic()!
        
        let dataArr = [7.0, 6.9, 2.5, 14.5, 18.2, 26.5, 5.2, 26.5, 23.3, singleSpecialData, 13.9, 9.6] as [Any]
        
        let aaChartModel = AAChartModel()
            .chartType(.spline)
            .backgroundColor("#4b2b7f")
            .yAxisTitle("")//设置Y轴标题
            .dataLabelsEnabled(false)//是否显示值
            .tooltipEnabled(true)
            .markerRadius(0)
            .xAxisVisible(false)
            .yAxisVisible(false)
            .series([
                AASeriesElement()
                    .name("Virtual Data")
                    .lineWidth(6)
                    .data(dataArr)
                    .color(gradientColorDic1)
            ])
        
        let selectedIndex = dataArr.count - 3
        
        let aaOptions = aaChartModel.aa_toAAOptions()
        
        aaOptions.chart?.events(
            AAChartEvents()
                .load("""
function() {
        const chart = this;
        const point = chart.series[0].points[\(selectedIndex)];
        let big = true;
        setInterval(() => {
          big = !big;
          point.update({
            marker: {
              radius: big ? 5 : 55,
              fillColor: big ? "white": "red",
              lineWidth: big ? 5 : 15,
              lineColor: big ? "green": "yellow",
            }
          })
        }, 500)
      }
"""))
        return aaOptions
    }
    
    //https://github.com/AAChartModel/AAChartKit-Swift/issues/394
    //https://echarts.apache.org/examples/zh/editor.html?c=scatter-effect
    private func configureScatterChartWithBlinkEffect() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.scatter)
            .title("Height and weight distribution by sex")
            .titleStyle(AAStyle(color: AAColor.white))
            .xAxisLabelsStyle(AAStyle(color: AAColor.white))
            .yAxisTitle("kg")
            .yAxisGridLineWidth(0)
            .markerSymbol(.circle)
            .markerSymbolStyle(.innerBlank)
            .markerRadius(9)
            .backgroundColor("#22324c")
            .dataLabelsEnabled(false)
            .series([
                AASeriesElement()
                    .name("Blink Scatter")
                    .color(AAColor.green)
                    .data([
                        [172.7, 105.2],
                        [153.4, 42]
                    ])
                ,
                AASeriesElement()
                    .name("Female")
                    .color(AAColor.red)
                    .data([
                        [161.2, 51.6], [167.5, 59.0], [159.5, 49.2], [157.0, 63.0], [155.8, 53.6],
                        [170.0, 59.0], [159.1, 47.6], [166.0, 69.8], [176.2, 66.8], [160.2, 75.2],
                        [172.5, 55.2], [170.9, 54.2], [172.9, 62.5], [153.4, 42.0], [160.0, 50.0],
                        [147.2, 49.8], [168.2, 49.2], [175.0, 73.2], [157.0, 47.8], [167.6, 68.8],
                        [159.5, 50.6], [175.0, 82.5], [166.8, 57.2], [176.5, 87.8], [170.2, 72.8],
                        [174.0, 54.5], [173.0, 59.8], [179.9, 67.3], [170.5, 67.8], [160.0, 47.0],
                        [154.4, 46.2], [162.0, 55.0], [176.5, 83.0], [160.0, 54.4], [152.0, 45.8],
                        [162.1, 53.6], [170.0, 73.2], [160.2, 52.1], [161.3, 67.9], [166.4, 56.6],
                        [168.9, 62.3], [163.8, 58.5], [167.6, 54.5], [160.0, 50.2], [161.3, 60.3],
                        [167.6, 58.3], [165.1, 56.2], [160.0, 50.2], [170.0, 72.9], [157.5, 59.8],
                        [167.6, 61.0], [160.7, 69.1], [163.2, 55.9], [152.4, 46.5], [157.5, 54.3],
                        [168.3, 54.8], [180.3, 60.7], [165.5, 60.0], [165.0, 62.0], [164.5, 60.3],
                        [156.0, 52.7], [160.0, 74.3], [163.0, 62.0], [165.7, 73.1], [161.0, 80.0],
                        [162.0, 54.7], [166.0, 53.2], [174.0, 75.7], [172.7, 61.1], [167.6, 55.7],
                        [151.1, 48.7], [164.5, 52.3], [163.5, 50.0], [152.0, 59.3], [169.0, 62.5],
                        [164.0, 55.7], [161.2, 54.8], [155.0, 45.9], [170.0, 70.6], [176.2, 67.2],
                        [170.0, 69.4], [162.5, 58.2], [170.3, 64.8], [164.1, 71.6], [169.5, 52.8],
                        [163.2, 59.8], [154.5, 49.0], [159.8, 50.0], [173.2, 69.2], [170.0, 55.9],
                        [161.4, 63.4], [169.0, 58.2], [166.2, 58.6], [159.4, 45.7], [162.5, 52.2],
                        [159.0, 48.6], [162.8, 57.8], [159.0, 55.6], [179.8, 66.8], [162.9, 59.4],
                        [161.0, 53.6], [151.1, 73.2], [168.2, 53.4], [168.9, 69.0], [173.2, 58.4],
                        [171.8, 56.2], [178.0, 70.6], [164.3, 59.8], [163.0, 72.0], [168.5, 65.2],
                        [166.8, 56.6], [172.7, 88.8], [163.5, 51.8], [169.4, 63.4], [167.8, 59.0],
                        [159.5, 47.6], [167.6, 63.0], [161.2, 55.2], [160.0, 45.0], [163.2, 54.0],
                        [162.2, 50.2], [161.3, 60.2], [149.5, 44.8], [157.5, 58.8], [163.2, 56.4],
                        [172.7, 62.0], [155.0, 49.2], [156.5, 67.2], [164.0, 53.8], [160.9, 54.4],
                        [162.8, 58.0], [167.0, 59.8], [160.0, 54.8], [160.0, 43.2], [168.9, 60.5],
                        [158.2, 46.4], [156.0, 64.4], [160.0, 48.8], [167.1, 62.2], [158.0, 55.5],
                        [167.6, 57.8], [156.0, 54.6], [162.1, 59.2], [173.4, 52.7], [159.8, 53.2],
                        [170.5, 64.5], [159.2, 51.8], [157.5, 56.0], [161.3, 63.6], [162.6, 63.2],
                        [160.0, 59.5], [168.9, 56.8], [165.1, 64.1], [162.6, 50.0], [165.1, 72.3],
                        [166.4, 55.0], [160.0, 55.9], [152.4, 60.4], [170.2, 69.1], [162.6, 84.5],
                        [170.2, 55.9], [158.8, 55.5], [172.7, 69.5], [167.6, 76.4], [162.6, 61.4],
                        [167.6, 65.9], [156.2, 58.6], [175.2, 66.8], [172.1, 56.6], [162.6, 58.6],
                        [160.0, 55.9], [165.1, 59.1], [182.9, 81.8], [166.4, 70.7], [165.1, 56.8],
                        [177.8, 60.0], [165.1, 58.2], [175.3, 72.7], [154.9, 54.1], [158.8, 49.1],
                        [172.7, 75.9], [168.9, 55.0], [161.3, 57.3], [167.6, 55.0], [165.1, 65.5],
                        [175.3, 65.5], [157.5, 48.6], [163.8, 58.6], [167.6, 63.6], [165.1, 55.2],
                        [165.1, 62.7], [168.9, 56.6], [162.6, 53.9], [164.5, 63.2], [176.5, 73.6],
                        [168.9, 62.0], [175.3, 63.6], [159.4, 53.2], [160.0, 53.4], [170.2, 55.0],
                        [162.6, 70.5], [167.6, 54.5], [162.6, 54.5], [160.7, 55.9], [160.0, 59.0],
                        [157.5, 63.6], [162.6, 54.5], [152.4, 47.3], [170.2, 67.7], [165.1, 80.9],
                        [172.7, 70.5], [165.1, 60.9], [170.2, 63.6], [170.2, 54.5], [170.2, 59.1],
                        [161.3, 70.5], [167.6, 52.7], [167.6, 62.7], [165.1, 86.3], [162.6, 66.4],
                        [152.4, 67.3], [168.9, 63.0], [170.2, 73.6], [175.2, 62.3], [175.2, 57.7],
                        [160.0, 55.4], [165.1, 77.7], [174.0, 55.5], [170.2, 77.3], [160.0, 80.5],
                        [167.6, 64.5], [167.6, 72.3], [167.6, 61.4], [154.9, 58.2], [162.6, 81.8],
                        [175.3, 63.6], [171.4, 53.4], [157.5, 54.5], [165.1, 53.6], [160.0, 60.0],
                        [174.0, 73.6], [162.6, 61.4], [174.0, 55.5], [162.6, 63.6], [161.3, 60.9],
                        [156.2, 60.0], [149.9, 46.8], [169.5, 57.3], [160.0, 64.1], [175.3, 63.6],
                        [169.5, 67.3], [160.0, 75.5], [172.7, 68.2], [162.6, 61.4], [157.5, 76.8],
                        [176.5, 71.8], [164.4, 55.5], [160.7, 48.6], [174.0, 66.4], [163.8, 67.3],
                        [172.7, 105.2]
                    ])
                    ])
        
        let aaOptions = aaChartModel.aa_toAAOptions()
        aaOptions.chart?.events(
            AAChartEvents()
                .load("""
function() {
        const chart = this;
        const blinkScatterPointsArr = chart.series[0].points;
        const range = blinkScatterPointsArr.length;
        for (let i = 0; i < range; i++) {
               const point = blinkScatterPointsArr[i];
               let big = true;
               setInterval(() => {
                 big = !big;
                 point.update({
                   marker: {
                     radius: big ? 5 : 25,
                     fillColor: big ? "pink": "red",
                     lineWidth: big ? 5 : 15,
                     lineColor: big ? "gold": "yellow",
                  }
                 })
               }, 600)
        }
      }
"""))
        return aaOptions
        
    }


}
