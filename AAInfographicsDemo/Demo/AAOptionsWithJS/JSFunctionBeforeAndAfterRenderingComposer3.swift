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
        let colorsArr = ["#1e90ff", "#ef476f", "#ffd066", "#04d69f", "#25547c"]
        
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
        let jsonStr1 = singleChartOptions(chartRank: 1).toJSON()
        let jsonStr2 = singleChartOptions(chartRank: 2).toJSON()
        let jsonStr3 = singleChartOptions(chartRank: 3).toJSON()
        
        let aaOptions = AAOptions()
      .beforeDrawChartJavaScript(#"""
        (function() {
            ['mousemove', 'touchmove', 'touchstart'].forEach(function (eventType) {
                document.getElementById('container').addEventListener(
                    eventType,
                    function (e) {
                        let chart,
                            point,
                            i,
                            event;

                        for (i = 0; i < Highcharts.charts.length; i = i + 1) {
                            chart = Highcharts.charts[i];
                            event = chart.pointer.normalize(e);
                            point = chart.series[0].searchPoint(event, true);
    //alert("输出查看找到了几个 chart" + Highcharts.charts.length);
    console.log("输出查看找到了几个 chart", Highcharts.charts.length);
                            if (point) {
                                point.highlight(e);
                            }
                        }
                    }
                );
            });

            Highcharts.Pointer.prototype.reset = function () {
                return undefined;
            };

            Highcharts.Point.prototype.highlight = function (event) {
                event = this.series.chart.pointer.normalize(event);
                this.onMouseOver();
                this.series.chart.tooltip.refresh(this);
                this.series.chart.xAxis[0].drawCrosshair(event, this);
            };

            return "JavaScript execution completed successfully";
        })()
"""#)
                
            .chart(AAChart()
                    .type(.area))
            .series([
                AASeriesElement()
                    .name("Beijing Hot")
                    .data([1.16, 1.67, 2.64, 2.86, 3.00, 3.21, 4.14, 4.07, 3.68, 3.11, 3.41, 3.25, 3.32, 3.07, 3.92, 3.05, 2.18, 3.24]),
            ])
//            .series(configureSeriesArray())
            .afterDrawChartJavaScript("""
(function() {
// 动态追加3个div容器
        for (let i = 2; i <= 4; i++) {
//            const div = document.createElement('div');
//            div.id = `container${i}`;
//            div.className = 'chart-container';
//            document.body.appendChild(div);
       const chartDiv = document.createElement('div');
        chartDiv.className = 'chart';
        document.getElementById('container').appendChild(chartDiv);


        let chartOptionsJsonObj;
if (i == 2) {
    chartOptionsJsonObj = \(jsonStr1);
} else if (i == 3) {
    chartOptionsJsonObj = \(jsonStr2);
} else {
    chartOptionsJsonObj = \(jsonStr3);
}

let sender = JSON.stringify(chartOptionsJsonObj);

            let aaOptions = JSON.parse(sender, function (key, value) {
                if (typeof (value) == 'string'
                    && value.indexOf('function') !== -1) {
                    return eval(value)
                }
                return value;
            });

        Highcharts.chart(chartDiv, aaOptions);
        }

console.log("代码执行成功🎉");

        return "JavaScript execution completed successfully";
    })();
""")

        
        return aaOptions
    }
    
    /**
     + (AAOptions *)singleChartOptions {
         return AAOptions.new
         .chartSet(AAChart.new
                   .marginLeftSet(@40)
                   .spacingTopSet(@20)
                   .spacingBottomSet(@20)
     //              .zoomTypeSet(AAZoomTypeX)
                   .eventsSet(AAChartEvents.new
     //                         .selectionSet(@AAJSFunc(/**
     //                                                  * Resets chart zoom on selection event.
     //                                                  */
     //                                                 function resetZoom(e) {
     //                                                     // Prevent feedback loop
     //                                                     if (e.resetSelection) {
     //                                                         return;
     //                                                     }
     //
     //                                                     // Zoom out all other charts on selection
     //                                                     Highcharts.charts.forEach(chart => {
     //                                                         if (chart !== e.target) {
     //                                                             chart.zoomOut();
     //                                                         }
     //                                                     });
     //                                                 }))
                              )
                   )
         .titleSet(AATitle.new
                   .textSet(@"dataset.name")
                   .alignSet(AAChartAlignTypeLeft)
     //              .marginSet(@0)
                   .xSet(@30)
                   )
         .creditsSet(AACredits.new
                     .enabledSet(false))
         .legendSet(AALegend.new
                     .enabledSet(false))
         .xAxisSet(AAXAxis.new
                     .crosshairSet(AACrosshair.new
                                   .colorSet(AAColor.redColor))
     //                .eventsSet(AAEvents.new
     //                             .setExtremesSet(@"syncExtremes")
     //                             )
                     .labelsSet(AALabels.new
                                  .formatSet(@"{value} km")
                                  )
     //                .accessibilitySet(AAAccessibility.new
     //                                    .descriptionSet(@"Kilometers")
     //                                    .rangeDescriptionSet(@"0km to 6.5km")
     //                                    )
                     )
         .yAxisSet(AAYAxis.new
                     .titleSet(AAAxisTitle.new
                                 .textSet(nil)
                                 )
                     )
         .tooltipSet(AATooltip.new
     //                .positionerSet(@"function () {\
     //                                return {\
     //                                // right aligned\
     //                                x: this.chart.chartWidth - this.label.width,\
     //                                y: 10 // align to title\
     //                                };\
     //                                }")
                     .borderWidthSet(@0)
                     .backgroundColorSet(@"none")
                     .pointFormatSet(@"{point.y}")
                     .headerFormatSet(@"")
                     .shadowSet(false)
                     .styleSet(AAStyle.new
                               .fontSizeSet(@"18px")
                               )
                     .valueDecimalsSet(@2)
                     )
         .seriesSet(@[
             AASeriesElement.new
                 .nameSet(@"Tokyo")
                 .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6])
                 .colorByPointSet(@true)
         ])
         ;
     }
     */
    static func singleChartOptions(chartRank: Int) -> AAOptions {
       let aaOptions = AAOptions()
            .chart(AAChart()
                .type(.area)
                .marginLeft(40)
                .spacingTop(20)
                .spacingBottom(20)
                .events(AAChartEvents()
                    .selection(#"""
                    function resetZoom(e) {
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
                .text("dataset.name")
                .align(.left)
                .x(30)
            )
            .credits(AACredits()
                .enabled(false))
            .legend(AALegend()
                .enabled(false))
            .xAxis(AAXAxis()
                .crosshair(AACrosshair()
                    .color(AAColor.red))
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
                .backgroundColor("none")
                .pointFormat("{point.y}")
                .headerFormat("")
                .shadow(false)
                .style(AAStyle()
                    .fontSize(18))
                .valueDecimals(2)
            )
//            .series([
//                configureSeriesArray()[0]
//            ])
        
        if chartRank == 1 {
            aaOptions.series([
                configureSeriesArray()[0]
            ])
        } else if chartRank == 2 {
            aaOptions.series([
                configureSeriesArray()[1]
            ])
        } else if chartRank == 3 {
            aaOptions.series([
                configureSeriesArray()[2]
            ])
        }
        return aaOptions
    }
}
