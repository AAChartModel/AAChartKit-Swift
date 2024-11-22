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
        let jsonStr = disableGroupingColumnChart().toJSON()
        
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
            const div = document.createElement('div');
            div.id = `container${i}`;
            div.className = 'chart-container';
            document.body.appendChild(div);
        let chartOptionsJsonStr = \(jsonStr);

        Highcharts.chart(div, chartOptionsJsonStr);
        }

console.log("代码执行成功🎉");
alert("代码执行成功🎉");

        return "JavaScript execution completed successfully";
    })();
""")

        
        return aaOptions
    }
    
    static func disableGroupingColumnChart() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                    .type(.column))
            .title(AATitle()
                    .text("Monthly Average Rainfall"))
            .subtitle(AASubtitle()
                        .text("Source: WorldClimate.com"))
            .xAxis(AAXAxis()
                    .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                                 "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]))
            .yAxis(AAYAxis()
                    .min(0)
                    .title(AATitle()
                            .text("Rainfall (mm)")))
            .legend(AALegend()
                    .layout(.vertical)
                    .backgroundColor("#FFFFFF")
                    .align(.left)
                    .verticalAlign(.top)
                    .x(100)
                    .y(70)
                    .floating(true)
                    .shadow(true))
            .tooltip(AATooltip()
                        .shared(true)
                        .valueSuffix(" mm"))
            .plotOptions(AAPlotOptions()
                            .column(AAColumn()
                                    .grouping(false)
//                                    .shadow(false)
                            ))
            .series([
                AASeriesElement()
                    .name("Tokyo")
                    .data([49.9, 71.5, 106.4, 129.2, 144.0, 176.0,
                           135.6, 148.5, 216.4, 194.1, 95.6, 54.4])
                    .pointPadding(0),
                AASeriesElement()
                    .name("New York")
                    .data([83.6, 78.8, 98.5, 93.4, 106.0, 84.5,
                           105.0, 104.3, 91.2, 83.5, 106.6, 92.3])
                    .pointPadding(0.1),
                AASeriesElement()
                    .name("London")
                    .data([48.9, 38.8, 39.3, 41.4, 47.0, 48.3,
                           59.0, 59.6, 52.4, 65.2, 59.3, 51.2])
                    .pointPadding(0.2),
                AASeriesElement()
                    .name("Berlin")
                    .data([42.4, 33.2, 34.5, 39.7, 52.6, 75.5,
                           57.4, 60.4, 47.6, 39.1, 46.8, 51.1])
                    .pointPadding(0.3)
            ])
        
    }
}
