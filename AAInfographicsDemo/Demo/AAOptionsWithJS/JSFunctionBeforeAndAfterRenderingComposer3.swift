//
//  JSFunctionBeforeAndAfterRenderingComposer3.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/11/22.
//  Copyright © 2024 An An. All rights reserved.
//


import AAInfographics

class JSFunctionBeforeAndAfterRenderingComposer3 {
    
    static func getJsonData(jsonFileName: String) -> Any? {
        guard let path = Bundle.main.path(forResource: jsonFileName, ofType: "json"),
              let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            print("失败❌❌❌ 📃JSON文件\(jsonFileName)解码失败")
            return nil
        }
        
        do {
            let jsonObj = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
            print("成功🔥🔥🔥 📃JSON文件\(jsonFileName)解码成功")
            return jsonObj
        } catch {
            print("失败❌❌❌ 📃JSON文件\(jsonFileName)解码失败")
            return nil
        }
    }

    static func configureSeriesArray() -> [AASeriesElement] {
        let activityDic = getJsonData(jsonFileName: "synchronizedChartActivityData") as! [String: Any]
        let datasets = activityDic["datasets"] as! [[String: Any]]
        
        var finalDatasets = [AASeriesElement]()
        let colorsArr = [AAGradientColor.freshPapaya, AAGradientColor.oceanBlue, AAGradientColor.lemonDrizzle, "#04d69f", "#25547c"] as [Any]
        
        datasets.enumerated().forEach { (idx, obj) in
            let dataset = obj
            let data = dataset["data"] as! [Any]
            var newData = [[Any]]()
            for i in 0..<data.count {
                let val = data[i]
                let xData = activityDic["xData"] as! [Any]
                newData.append([xData[i], val])
            }
            
            let seriesElement = AASeriesElement()
                .data(newData)
                .name(dataset["name"] as? String ?? "")
//                .type(.area)
                .color(colorsArr[idx])
            
            finalDatasets.append(seriesElement)
        }
        
        return finalDatasets
    }
    
    static func configureSeriesDataArray() -> [Any] {
        let randomNumArrA = NSMutableArray()
        var y1 = 0.0
        let Q = arc4random() % 38
        let length = configureSeriesArray()[0].data!.count
        for  x in 0 ..< length {
            y1 = sin(Double(Q) * (Double(x) * Double.pi / 180)) + Double(x) * 2.0 * 0.01 - 1
            randomNumArrA.add(
                AADataElement()
                    .y(Float(y1)))
        }
        return randomNumArrA as! [Any]
    }
    
    /**
     + (AAOptions *)synchronizedChart {
         NSString *jsonStr = [AAJsonConverter pureOptionsJsonStringWithOptionsInstance:[self singleChartOptions]];
         
         return AAOptions.new
     //    .beforeDrawChartJavaScriptSet(@AAJSFunc((/**
     //                                             The purpose of this demo is to demonstrate how multiple charts on the same page
     //                                             can be linked through DOM and Highcharts events and API methods. It takes a
     //                                             standard Highcharts config with a small variation for each data set, and a
     //                                             mouse/touch event handler to bind the charts together.
     //                                             */
     //
     //
     //                                             /**
     //                                              * In order to synchronize tooltips and crosshairs, override the
     //                                              * built-in events with handlers defined on the parent element.
     //                                              */
     //                                             ['mousemove', 'touchmove', 'touchstart'].forEach(function (eventType) {
     //                                                 document.getElementById('container').addEventListener(
     //                                                     eventType,
     //                                                     function (e) {
     //                                                         let chart,
     //                                                             point,
     //                                                             i,
     //                                                             event;
     //
     //                                                         for (i = 0; i < Highcharts.charts.length; i = i + 1) {
     //                                                             chart = Highcharts.charts[i];
     //                                                             // Find coordinates within the chart
     //                                                             event = chart.pointer.normalize(e);
     //                                                             // Get the hovered point
     //                                                             point = chart.series[0].searchPoint(event, true);
     //
     //                                                             if (point) {
     //                                                                 point.highlight(e);
     //                                                             }
     //                                                         }
     //                                                     }
     //                                                 );
     //                                             });
     //
     //                                             /**
     //                                              * Override the reset function, we don't need to hide the tooltips and
     //                                              * crosshairs.
     //                                              */
     //                                             Highcharts.Pointer.prototype.reset = function () {
     //                                                 return undefined;
     //                                             };
     //
     //                                             /**
     //                                              * Highlight a point by showing tooltip, setting hover state and draw crosshair
     //                                              */
     //                                             Highcharts.Point.prototype.highlight = function (event) {
     //                                                 event = this.series.chart.pointer.normalize(event);
     //                                                 this.onMouseOver(); // Show the hover marker
     //                                                 this.series.chart.tooltip.refresh(this); // Show the tooltip
     //                                                 this.series.chart.xAxis[0].drawCrosshair(event, this); // Show the crosshair
     //                                             };
     //                                             )))

         .seriesSet([self configureSeriesArray])
         .plotOptionsSet(AAPlotOptions.new
                   .seriesSet(AASeries.new
                              .stackingSet(AAChartStackingTypePercent)))
     //    .afterDrawChartJavaScriptSet([NSString stringWithFormat:@AAJSFunc(
     //        for (var i = 0; i < 3; i++) {
     //            var chartDiv = document.createElement('div');
     //            chartDiv.className = 'chart';
     //            document.getElementById('container').appendChild(chartDiv);
     //
     //            Highcharts.chart(chartDiv, %@);
     //        }
     //    ), jsonStr])
         ;
     }
     */
    static func synchronizedChart() -> AAOptions {
        let aaOptions1JsonStr = singleChartOptions(chartRank: 1).toJSON()
        let aaOptions2JsonStr = singleChartOptions(chartRank: 2).toJSON()
        let aaOptions3JsonStr = singleChartOptions(chartRank: 3).toJSON()
        
        let aaOptions1 = AAOptions()
            .beforeDrawChartJavaScript(#"""
                (function() {
                    /**
                     The purpose of this demo is to demonstrate how multiple charts on the same page
                     can be linked through DOM and Highcharts events and API methods. It takes a
                     standard Highcharts config with a small variation for each data set, and a
                     mouse/touch event handler to bind the charts together.
                     */

                    // 获取父容器
                    const parentContainer = document.getElementById('container').parentElement;

                    /**
                     * In order to synchronize tooltips and crosshairs, override the
                     * built-in events with handlers defined on the parent element.
                     */
                    ['mousemove', 'touchmove', 'touchstart'].forEach(function (eventType) {
                        parentContainer.addEventListener(
                            eventType,
                            function (e) {
                                let chart,
                                    point,
                                    i,
                                    event;

                                for (i = 0; i < Highcharts.charts.length; i = i + 1) {
                                    chart = Highcharts.charts[i];
                                    // Find coordinates within the chart
                                    event = chart.pointer.normalize(e);
                                    // Get the hovered point
                                    point = chart.series[0].searchPoint(event, true);

                                    if (point) {
                                        point.highlight(e);
                                    }
                                }
                            }
                        );
                    });

                    /**
                     * Override the reset function, we don't need to hide the tooltips and
                     * crosshairs.
                     */
                    Highcharts.Pointer.prototype.reset = function () {
                        return undefined;
                    };

                    /**
                     * Highlight a point by showing tooltip, setting hover state and draw crosshair
                     */
                    Highcharts.Point.prototype.highlight = function (event) {
                        event = this.series.chart.pointer.normalize(event);
                        this.onMouseOver(); // Show the hover marker
                        this.series.chart.tooltip.refresh(this); // Show the tooltip
                        this.series.chart.xAxis[0].drawCrosshair(event, this); // Show the crosshair
                    };

                    return "JavaScript execution completed successfully";
                })()
            """#)
        
        //            .series(configureSeriesArray())
            .title(AATitle()
                .text("Rainfall")
                .align(.left)
                .style(AAStyle()
                    .color(AAColor.green)
                    .fontWeight(.bold)
                    .fontSize(30))
                .x(30)
            )
            .xAxis(AAXAxis()
                .crosshair(AACrosshair()
                    .color(AAColor.green)
                    .width(2)
                    .dashStyle(.longDashDot)
                    .zIndex(5))
                .labels(AALabels()
                    .format("{value} km"))
            )
            .legend(AALegend()
                .enabled(false))
            .series([
                AASeriesElement()
                    .type(.area)
                    .name("Berlin Hot")
                    .color(AAGradientColor.lusciousLime)
                    .borderRadius("50%")
                    .data(configureSeriesDataArray()),
            ])
            .afterDrawChartJavaScript("""
                (function() {
                    // 获取原始 div 容器
                    const container = document.getElementById('container');
                    const parentContainer = container.parentElement; // 获取 container 的父元素（即 body）
                    
                    // 动态移除 container 的 position: absolute
                    container.style.position = 'static'; // 改为 static 或 relative
                    
                    // 设置 container 的高度为整个页面的四分之一
                    function setContainerHeight() {
                        const parentHeight = parentContainer.clientHeight; // 获取父容器的高度
                        container.style.height = (parentHeight / 4) + 'px'; // 设置 container 的高度为四分之一
                    }
                    
                    // 初始设置 container 的高度
                    setContainerHeight();
                    
                    // 监听窗口大小变化，动态调整 container 的高度
                    window.addEventListener('resize', setContainerHeight);
                    
                    // 动态追加3个 div 容器到原始 div 的下方
                    for (let i = 0; i < 3; i++) {
                        const chartDiv = document.createElement('div');
                        chartDiv.className = 'chart';
                        
                        // 设置新 div 的样式
                        chartDiv.style.display = 'block'; // 确保是块级元素
                        chartDiv.style.width = '100%'; // 宽度占满父容器
                        chartDiv.style.height = (parentContainer.clientHeight / 4) + 'px'; // 高度为四分之一
                        chartDiv.style.marginBottom = '0'; // 移除默认的 margin
                        chartDiv.style.position = 'static'; // 确保是静态定位
                        
                        // 将新的 div 添加到 container 的父元素中
                        parentContainer.appendChild(chartDiv);
                        
                        // 计算并设置新 div 的高度
                        function setChartHeight() {
                            const parentHeight = parentContainer.clientHeight; // 获取父容器的高度
                            const chartHeight = parentHeight / 4; // 每个 div 的高度为四分之一
                            chartDiv.style.height = chartHeight + 'px'; // 设置新 div 的高度
                        }
                        
                        // 初始设置新 div 的高度
                        setChartHeight();
                        
                        // 监听窗口大小变化，动态调整新 div 的高度
                        window.addEventListener('resize', setChartHeight);
                        
                        // 根据索引设置不同的图表配置
                        let chartOptionsJsonObj;
                        if (i == 0) {
                            chartOptionsJsonObj = \(aaOptions1JsonStr);
                        } else if (i == 1) {
                            chartOptionsJsonObj = \(aaOptions2JsonStr);
                        } else {
                            chartOptionsJsonObj = \(aaOptions3JsonStr);
                        }
                        
                        // 将 JSON 字符串转换为对象
                        let sender = JSON.stringify(chartOptionsJsonObj);
                        let aaOptions = JSON.parse(sender, function (key, value) {
                            if (typeof (value) == 'string' && value.indexOf('function') !== -1) {
                                return eval(value);
                            }
                            return value;
                        });
                        
                        // 在新增的 div 中渲染图表
                        Highcharts.chart(chartDiv, aaOptions);
                    }
                    
                    console.log("代码执行成功🎉");
                    return "JavaScript execution completed successfully";
                })();
            """)
        
        
        return aaOptions1
    }
    
    /**
     Highcharts.chart(chartDiv, {
                 chart: {
                     marginLeft: 40, // Keep all charts left aligned
                     spacingTop: 20,
                     spacingBottom: 20,
                     zooming: {
                         type: 'x'
                     },
                     events: {
                         selection: resetZoom
                     }
                 },
                 title: {
                     text: dataset.name,
                     align: 'left',
                     margin: 0,
                     x: 30
                 },
                 credits: {
                     enabled: false
                 },
                 legend: {
                     enabled: false
                 },
                 xAxis: {
                     crosshair: true,
                     events: {
                         setExtremes: syncExtremes
                     },
                     labels: {
                         format: '{value} km'
                     },
                     accessibility: {
                         description: 'Kilometers',
                         rangeDescription: '0km to 6.5km'
                     }
                 },
                 yAxis: {
                     title: {
                         text: null
                     }
                 },
                 tooltip: {
                     positioner: function () {
                         return {
                             // right aligned
                             x: this.chart.chartWidth - this.label.width,
                             y: 10 // align to title
                         };
                     },
                     borderWidth: 0,
                     backgroundColor: 'none',
                     pointFormat: '{point.y}',
                     headerFormat: '',
                     shadow: false,
                     style: {
                         fontSize: '18px'
                     },
                     valueDecimals: dataset.valueDecimals
                 },
                 series: [{
                     data: dataset.data,
                     name: dataset.name,
                     type: dataset.type,
                     color: Highcharts.getOptions().colors[i],
                     fillOpacity: 0.3,
                     tooltip: {
                         valueSuffix: ' ' + dataset.unit
                     }
                 }]
             });
         });
     */

    static func singleChartOptions(chartRank: Int) -> AAOptions {
        var aaSeriesElement = AASeriesElement()
        if chartRank == 1 {
            aaSeriesElement = configureSeriesArray()[0]
        } else if chartRank == 2 {
            aaSeriesElement = configureSeriesArray()[1]
        } else if chartRank == 3 {
            aaSeriesElement = configureSeriesArray()[2]
        }

        let aaOptions = AAOptions()
            .chart(AAChart()
                .type(.area)
                .marginLeft(40)
                .spacingTop(20)
                .spacingBottom(20)
                .zooming(AAZooming()
                    .type(.x))
                .events(AAChartEvents()
                    .selection(#"""
                               function (e) {
                                   if (e.resetSelection) {
                                       return;
                                   }

                                   Highcharts.charts.forEach(chart => {
                                       if (chart !== e.target) {
                                           chart.zoomOut();
                                       }
                                   });
                               }
                               """#))
            )
            .title(AATitle()
                .text(aaSeriesElement.name)
                .align(.left)
                .style(AAStyle()
                    .color(aaSeriesElement.color as? String)
                    .fontWeight(.bold)
                    .fontSize(30))
                .x(30)
            )
            .credits(AACredits()
                .enabled(false))
            .legend(AALegend()
                .enabled(false))
            .xAxis(AAXAxis()
                .crosshair(AACrosshair()
                    .color(AAColor.green)
                    .width(2)
                    .dashStyle(.longDashDot)
                    .zIndex(5))
                .events(AAAxisEvents()
                        .setExtremes(#"""
                                        function (e) {
                                            const thisChart = this.chart;

                                            if (e.trigger !== 'syncExtremes') {
                                                Highcharts.charts.forEach(chart => {
                                                    if (chart !== thisChart) {
                                                        if (chart.xAxis[0].setExtremes) {
                                                            chart.xAxis[0].setExtremes(
                                                                e.min,
                                                                e.max,
                                                                undefined,
                                                                false,
                                                                { trigger: 'syncExtremes' }
                                                            );
                                                        }
                                                    }
                                                });
                                            }
                                        }
                        """#))
                .labels(AALabels()
                    .format("{value} km"))
            )
            .yAxis(AAYAxis()
                .title(AATitle()
                    .text(""))
            )
            .tooltip(AATooltip()
                .positioner(#"""
                            function () {
                                return {
                                    x: this.chart.chartWidth - this.label.width,
                                    y: 10
                                };
                            }
                            """#)
                .borderWidth(0)
                .backgroundColor(AAColor.black)
                .borderColor(AAColor.black)
                .pointFormat("{point.y}")
                .headerFormat("")
//                .shadow(false)
                .style(AAStyle()
                    .fontSize(18)
                    .color(AAColor.red))
                .valueDecimals(8)
            )
            .legend(AALegend()
                .enabled(false))
            .series([
                aaSeriesElement
            ])
        
        aaOptions.chart?.zooming?
            .resetButton(AAResetButton()
                .theme(AAButtonTheme()
                    .fill(AAColor.yellow)
                    .stroke(AAColor.green)
                    .strokeWidth(3)
                    .r(3)
                    .states(AAButtonThemeStates()
                        .hover(AAButtonThemeStatesHover()
                            .fill(AAColor.red)
                            .style(AAStyle()
                                .color(AAColor.white))))))
//            .singleTouch(true)
            .type(.x)
            .pinchType(.x)

        return aaOptions
    }
    
    
}
