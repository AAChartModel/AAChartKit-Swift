//
//  JSFunctionBeforeAndAfterRenderingComposer5.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/4/2.
//  Copyright © 2025 An An. All rights reserved.
//

import AAInfographics

extension Dictionary where Key == Int, Value == Bool {
    func toStringKeyed() -> [String: Bool] {
        return Dictionary<String, Bool>(uniqueKeysWithValues: self.map { (String($0.key), $0.value) })
    }
}


class JSFunctionBeforeAndAfterRenderingComposer5 {
    
    //Columnrange single prism different color zoning effect
    static func columnrangeChartSinglePrismDifferentColorZoningEffect() -> AAOptions {
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

        // --- Chart Configuration ---
        let chartOptions = AAOptions()
            .beforeDrawChartJavaScript(customJS)
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

        return chartOptions
    }
}
