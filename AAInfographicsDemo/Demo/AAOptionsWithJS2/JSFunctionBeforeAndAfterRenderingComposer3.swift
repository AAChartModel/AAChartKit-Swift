//
//  JSFunctionBeforeAndAfterRenderingComposer3.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/11/22.
//  Copyright © 2024 An An. All rights reserved.
//


import AAInfographics

extension Dictionary where Key == Int, Value == Bool {
    func toStringKeyed() -> [String: Bool] {
        return Dictionary<String, Bool>(uniqueKeysWithValues: self.map { (String($0.key), $0.value) })
    }
}

// Custom JavaScript for conditional rounding
let customJS = #"""
(function(H) {
    if (!H || !H.seriesTypes.columnrange) {
        console.error("Highcharts and highcharts-more.js (for columnrange) must be loaded before this plugin.");
        return;
    }

    var rel = H.relativeLength || function(value, base) {
        // Fall back implementation if relativeLength isn't available
        return /%$/.test(value) ? base * parseFloat(value) / 100 : parseFloat(value);
    };

    // Configuration
    var MIN_HEIGHT_FOR_BOTTOM_ROUNDING = 15;

    // Check if extend is available, otherwise use a simple implementation
    var extend = H.extend || function(target, source) {
        for (var prop in source) {
            if (source.hasOwnProperty(prop)) {
                target[prop] = source[prop];
            }
        }
        return target;
    };

    H.wrap(H.seriesTypes.columnrange.prototype, 'translate', function(proceed) {
        // First call original translate
        proceed.apply(this, Array.prototype.slice.call(arguments, 1));

        var series = this,
            options = series.options || {},
            chart = series.chart,
            chartOptions = chart.options || {},
            customData = chartOptions.customData || {},
            categoryHasBoth = customData.categoryHasBoth || {};

        // Check if we have border radius options
        var hasBorderRadius = !!(
            options.borderRadiusTopLeft || 
            options.borderRadiusTopRight || 
            options.borderRadiusBottomRight || 
            options.borderRadiusBottomLeft
        );

        if (!hasBorderRadius) {
            return; // Early return if no border radius is specified
        }

        var base_TL = options.borderRadiusTopLeft || 0,
            base_TR = options.borderRadiusTopRight || 0,
            base_BR = options.borderRadiusBottomRight || 0,
            base_BL = options.borderRadiusBottomLeft || 0;

        // Check if bottom rounding is configured at all
        var potentiallyNeedsBottomRounding = base_BR > 0 || base_BL > 0;

        // Process each point
        (series.points || []).forEach(function(point) {
            // Skip if point has no shape or is not visible
            if (!point || !point.shapeArgs || point.isNull || point.y === null || 
                (typeof point.visible === 'boolean' && !point.visible)) {
                return;
            }

            var shapeArgs = point.shapeArgs;
            if (!shapeArgs || typeof shapeArgs !== 'object') {
                return; // Additional safety check
            }

            var w = shapeArgs.width || 0;
            var h = shapeArgs.height || 0;
            var x = shapeArgs.x || 0;
            var y = shapeArgs.y || 0;
            
            // Skip processing if width or height is zero
            if (w <= 0 || h <= 0) {
                return;
            }

            var hasBothColors = categoryHasBoth[point.x] === true;
            var isOrangeSeries = series.name === '低于 25';

            // Determine if bottom rounding should be applied
            var applyBottomRounding = false;
            if (isOrangeSeries && potentiallyNeedsBottomRounding) {
                applyBottomRounding = true;
            } else if (!isOrangeSeries && !hasBothColors && potentiallyNeedsBottomRounding) {
                applyBottomRounding = true;
            }

            // Minimum height adjustment
            if (applyBottomRounding && h < MIN_HEIGHT_FOR_BOTTOM_ROUNDING) {
                var heightToAdd = MIN_HEIGHT_FOR_BOTTOM_ROUNDING - h;
                // Store original values
                point.originalShapeArgs = extend({}, shapeArgs);

                // Adjust visually
                shapeArgs.y = y - heightToAdd;
                shapeArgs.height = MIN_HEIGHT_FOR_BOTTOM_ROUNDING;
                
                // Update local variables for path calculation
                y = shapeArgs.y;
                h = shapeArgs.height;
            }

            // Calculate radii safely
            var R_TL = Math.max(0, rel(base_TL, w));
            var R_TR = Math.max(0, rel(base_TR, w));
            var R_BR = Math.max(0, rel(base_BR, w));
            var R_BL = Math.max(0, rel(base_BL, w));

            // Handle overlapping bars
            if (hasBothColors) {
                if (isOrangeSeries) {
                    R_TL = 0;
                    R_TR = 0;
                } else {
                    R_BL = 0;
                    R_BR = 0;
                    applyBottomRounding = false;
                }
            }

            // Prevent overly large radii
            var maxR = Math.min(w, h) / 2;
            R_TL = Math.min(R_TL, maxR);
            R_TR = Math.min(R_TR, maxR);
            
            if (applyBottomRounding) {
                R_BR = Math.min(R_BR, maxR);
                R_BL = Math.min(R_BL, maxR);
            } else {
                R_BR = 0;
                R_BL = 0;
            }

            // Apply the path only if any radius is > 0
            if (R_TL > 0 || R_TR > 0 || R_BR > 0 || R_BL > 0) {
                // Ensure dlBox exists
                if (!point.dlBox) {
                    point.dlBox = extend({}, shapeArgs);
                } else {
                    // Update existing dlBox
                    extend(point.dlBox, shapeArgs);
                }
                
                point.shapeType = 'path';
                point.shapeArgs = {
                    d: [
                        'M', x + R_TL, y,
                        'L', x + w - R_TR, y,
                        'C', x + w - R_TR / 2, y, x + w, y + R_TR / 2, x + w, y + R_TR,
                        'L', x + w, y + h - R_BR,
                        'C', x + w, y + h - R_BR / 2, x + w - R_BR / 2, y + h, x + w - R_BR, y + h,
                        'L', x + R_BL, y + h,
                        'C', x + R_BL / 2, y + h, x, y + h - R_BL / 2, x, y + h - R_BL,
                        'L', x, y + R_TL,
                        'C', x, y + R_TL / 2, x + R_TL / 2, y, x + R_TL, y,
                        'Z'
                    ]
                };
            } else if (point.shapeType === 'path') {
                // Revert to rect if no rounding is needed
                point.shapeType = 'rect';
                // Use original shape args if available
                if (point.originalShapeArgs) {
                    point.shapeArgs = extend({}, point.originalShapeArgs);
                }
                // Ensure dlBox matches final shape
                point.dlBox = extend({}, point.shapeArgs);
            }
        });
    });
}(Highcharts));
"""#

class JSFunctionBeforeAndAfterRenderingComposer3 {
    

   static func createHRVChartOptions() -> AAOptions {
       // --- Data Preparation ---
       let originalData: [[Any]] = [
           // ... (same data as before) ...
           ["02-17", 5, 15], ["02-18", 8, 18], ["02-19", 6, 16], ["02-20", 10, 22], ["02-21", 7, 19], ["02-22", 5, 12], ["02-23", 9, 24], ["02-24", 11, 23],
           ["03-02", 15, 35], ["03-03", 18, 40], ["03-04", 20, 45], ["03-05", 22, 50], ["03-06", 10, 30],
           ["03-07", 26, 55], ["03-08", 30, 60], ["03-09", 28, 58], ["03-10", 35, 70], ["03-11", 40, 80],
           ["03-12", 38, 75], ["03-13", 42, 85], ["03-14", 30, 65], ["03-15", 45, 90], ["03-16", 20, 50],
           ["03-17", 2, 8],    // <<< Changed this one to be fully below 25
           ["03-18", 30, 180]  // Fully above 25
       ]

       let threshold = 25
       var orangeData: [[String: Any]] = []
       var redData: [[String: Any]] = []
       var categories: [String] = []
       var categoryHasBoth: [Int: Bool] = [:] // <<< New lookup object

       for item in originalData {
           let x = item[0] as! String
           let low = item[1] as! Int
           let high = item[2] as! Int
           
           let currentIndex = categories.count
           categories.append(x)
           
           let hasOrangePart = high > low && low < threshold
           let hasRedPart = high > low && high >= threshold
           
           // Flag if this category index will have both colors
           if hasOrangePart && hasRedPart {
               categoryHasBoth[currentIndex] = true
           }
           
           // Orange part (below threshold)
           let orangeLow = low
           let orangeHigh = min(high, threshold)
           if orangeHigh > orangeLow {
               orangeData.append([
                   "x": currentIndex,
                   "low": orangeLow,
                   "high": orangeHigh,
                   "originalLow": low,
                   "originalHigh": high
               ])
           }
           
           // Red part (at or above threshold)
           let redLow = max(low, threshold)
           let redHigh = high
           if redHigh > redLow {
               redData.append([
                   "x": currentIndex,
                   "low": redLow,
                   "high": redHigh,
                   "originalLow": low,
                   "originalHigh": high
               ])
           }
       }
       // --- End Data Preparation ---
        
        // --- Chart Options ---
        let aaChart = AAChart()
            .type(.columnrange)
        
        let aaTitle = AATitle()
            .text("心率变异性 (条件圆角)")
        
        let aaXAxis = AAXAxis()
            .categories(categories)
            .plotLines([
                AAPlotLinesElement()
                    .color("#cccccc")
                    .dashStyle(.dash)
                    .value(7.5) // Index between 02-24 and 03-02
                    .width(1)
                    .zIndex(3)
            ])
        
        let aaYAxis = AAYAxis()
            .opposite(true)  // 将Y轴显示在右侧
            .title(AATitle()
                .text("毫秒"))
            .max(200)
        
        let aaLegend = AALegend()
            .enabled(false)
        
        let aaTooltip = AATooltip()
            .formatter("""
            function() {
                const index = this.point.x;
                let originalLow = null;
                let originalHigh = null;
                this.series.chart.series.forEach(s => {
                    s.points.forEach(p => {
                        if (p.x === index) {
                            if (p.options.originalLow !== undefined) originalLow = p.options.originalLow;
                            if (p.options.originalHigh !== undefined) originalHigh = p.options.originalHigh;
                        }
                    });
                });
                if (originalLow !== null && originalHigh !== null) {
                    return `<b>${this.x}</b><br/>范围: ${originalLow} - ${originalHigh} 毫秒`;
                } else {
                    return `<b>${this.x}</b><br/>${this.series.name}: ${this.point.low} - ${this.point.high}`;
                }
            }
            """)
            .shared(true)
        
        let aaPlotOptions = AAPlotOptions()
            .columnrange(AAColumnrange()
                .grouping(false)
                .borderWidth(0)
                .pointPadding(0.2)
                .groupPadding(0.1))
            .series(AASeries()
                .states(AAStates()
                    .inactive(AAInactive()
                        .enabled(false))))
        
        let orangeSeries = AASeriesElement()
            .name("低于 25") // Orange series
            .data(orangeData)
            .color("#FFA07A")
            .borderRadiusTopLeft(6)
            .borderRadiusTopRight(6)
            .borderRadiusBottomLeft(6)
            .borderRadiusBottomRight(6)
        
        let redSeries = AASeriesElement()
            .name("大于等于 25") // Red series
            .data(redData)
            .color("#FF6347")
            .borderRadiusTopLeft(6)
            .borderRadiusTopRight(6)
            .borderRadiusBottomLeft(6)
            .borderRadiusBottomRight(6)
        
        
        
        let aaOptions = AAOptions()
            .beforeDrawChartJavaScript(customJS)
            .chart(aaChart)
            .title(aaTitle)
            .xAxis(aaXAxis)
            .yAxis(aaYAxis)
            .legend(aaLegend)
            .tooltip(aaTooltip)
            .plotOptions(aaPlotOptions)
            .series([orangeSeries, redSeries])
        
        // Add custom data and JavaScript
//        aaOptions.customData = categoryHasBoth.toStringKeyed()
//        aaOptions.customJS = customJS
        
        return aaOptions
    }
    
    
    

  static  func configureChartOptions() -> AAOptions {
        // --- Data Preparation ---
        let originalData: [[Any]] = [
            ["02-17", 5, 15], ["02-18", 8, 18], ["02-19", 6, 16], ["02-20", 10, 22], ["02-21", 7, 19],
            ["02-22", 5, 12], ["02-23", 9, 24], ["02-24", 11, 23],
            ["03-02", 15, 35], ["03-03", 18, 40], ["03-04", 20, 45], ["03-05", 22, 50], ["03-06", 10, 30],
            ["03-07", 26, 55], ["03-08", 30, 60], ["03-09", 28, 58], ["03-10", 35, 70], ["03-11", 40, 80],
            ["03-12", 38, 75], ["03-13", 42, 85], ["03-14", 30, 65], ["03-15", 45, 90], ["03-16", 20, 50],
            ["03-17", 2, 8],    // Changed this one to be fully below 25
            ["03-18", 30, 180]  // Fully above 25
        ]

        let threshold = 25
        var orangeData: [[String: Any]] = []
        var redData: [[String: Any]] = []
        var categories: [String] = []
        var categoryHasBoth: [Int: Bool] = [:]

        originalData.enumerated().forEach { (index, element) in
            let x = element[0] as! String
            let low = element[1] as! Int
            let high = element[2] as! Int

            categories.append(x)

            let hasOrangePart = high > low && low < threshold
            let hasRedPart = high > low && high >= threshold

            if hasOrangePart && hasRedPart {
                categoryHasBoth[index] = true
            }

            // Orange part (below threshold)
            let orangeLow = low
            let orangeHigh = min(high, threshold)
            if orangeHigh > orangeLow {
                orangeData.append([
                    "x": index,
                    "low": orangeLow,
                    "high": orangeHigh,
                    "originalLow": low,
                    "originalHigh": high
                ])
            }

            // Red part (at or above threshold)
            let redLow = max(low, threshold)
            let redHigh = high
            if redHigh > redLow {
                redData.append([
                    "x": index,
                    "low": redLow,
                    "high": redHigh,
                    "originalLow": low,
                    "originalHigh": high
                ])
            }
        }

        // --- Chart Configuration ---
        let chartOptions = AAOptions()
            .chart(AAChart()
                .type(.columnrange))
            .title(AATitle()
                .text("心率变异性 (条件圆角)"))
            .xAxis(AAXAxis()
                .categories(categories)
                .plotLines([AAPlotLinesElement()
                    .color("#cccccc")
                    .dashStyle(.dash)
                    .value(7.5) // Index between 02-24 and 03-02
                    .width(1)
                    .zIndex(3)]))
            .yAxis(AAYAxis()
                .opposite(true) // Y-axis on the right
                .title(AATitle()
                    .text("毫秒"))
                .max(200))
            .legend(AALegend()
                .enabled(false))
            .tooltip(AATooltip()
                .shared(true)
                .formatter("""
                    function () {
                        const index = this.point.x;
                        let originalLow = null;
                        let originalHigh = null;
                        this.series.chart.series.forEach(s => {
                            s.points.forEach(p => {
                                if (p.x === index) {
                                    if (p.options.originalLow !== undefined) originalLow = p.options.originalLow;
                                    if (p.options.originalHigh !== undefined) originalHigh = p.options.originalHigh;
                                }
                            });
                        });
                        if (originalLow !== null && originalHigh !== null) {
                            return `<b>${this.x}</b><br/>范围: ${originalLow} - ${originalHigh} 毫秒`;
                        } else {
                            return `<b>${this.x}</b><br/>${this.series.name}: ${this.point.low} - ${this.point.high}`;
                        }
                    }
                    """))
            .plotOptions(AAPlotOptions()
                .columnrange(AAColumnrange()
                    .grouping(false)
                    .borderWidth(0)
                    .pointPadding(0.2)
                    .groupPadding(0.1))
                .series(AASeries()
                    .states(AAStates()
                        .inactive(AAInactive()
                            .enabled(false)))))
            .series([
                AASeriesElement()
                    .name("低于 25")
                    .data(orangeData)
                    .color("#FFA07A")
                    .borderRadiusTopLeft(6)
                    .borderRadiusTopRight(6)
                    .borderRadiusBottomLeft(6)
                    .borderRadiusBottomRight(6),
                AASeriesElement()
                    .name("大于等于 25")
                    .data(redData)
                    .color("#FF6347")
                    .borderRadiusTopLeft(6)
                    .borderRadiusTopRight(6)
                    .borderRadiusBottomLeft(6)
                    .borderRadiusBottomRight(6)
            ])

        // Custom data (categoryHasBoth) - AAChartKit doesn't directly support custom chart data,
        // so you might need to handle this separately in your app logic if needed
        // For now, it's omitted from AAOptions as it's not a standard Highcharts property
        chartOptions.customData = [
            "categoryHasBoth": categoryHasBoth.toStringKeyed()// Pass the lookup object
     ]
      chartOptions.beforeDrawChartJavaScript(customJS)

        return chartOptions
    }

    
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
//                .positioner(#"""
//                            function () {
//                                return {
//                                    x: this.chart.chartWidth - this.label.width,
//                                    y: 10
//                                };
//                            }
//                            """#)
                .borderWidth(0)
                .backgroundColor(AAColor.black)
                .borderColor(AAColor.black)
//                .pointFormat("{point.y}")
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
