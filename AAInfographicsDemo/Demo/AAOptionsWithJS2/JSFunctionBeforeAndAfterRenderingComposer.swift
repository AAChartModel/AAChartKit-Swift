//
//  JSFunctionBeforeAndAfterRenderingComposer.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/10/28.
//  Copyright © 2024 An An. All rights reserved.
//

import AAInfographics

class JSFunctionBeforeAndAfterRenderingComposer {
    static func clockChart() -> AAOptions {
        let chart = AAChart()
            .type(.gauge)
            .events(AAChartEvents()
                .load("""
                                  function (chart) {
                                       Math.easeOutBounce = function (pos) {
                                           if ((pos) < (1 / 2.75)) {
                                               return (7.5625 * pos * pos);
                                           }
                                           if (pos < (2 / 2.75)) {
                                               return (7.5625 * (pos -= (1.5 / 2.75)) * pos + 0.75);
                                           }
                                           if (pos < (2.5 / 2.75)) {
                                               return (7.5625 * (pos -= (2.25 / 2.75)) * pos + 0.9375);
                                           }
                                           return (7.5625 * (pos -= (2.625 / 2.75)) * pos + 0.984375);
                                       };
                                      
                                      function getNow() {
                                          var now = new Date();
                                          var timeInfo = {};

                                          timeInfo.date = now;
                                          timeInfo.hours = now.getHours() + now.getMinutes() / 60;
                                          timeInfo.minutes = (now.getMinutes() * 12 / 60) + (now.getSeconds() * 12 / 3600);
                                          timeInfo.seconds = now.getSeconds() * 12 / 60;

                                          return timeInfo;
                                      }
                                      
                                      console.log("✈️-------------------");
                                      
                                      setInterval(function () {

                                          now = getNow();

                                              const hour = chart.get('hour'),
                                                  minute = chart.get('minute'),
                                                  second = chart.get('second');

                                              chart.tooltipText = Highcharts.dateFormat('%H:%M:%S', now.date);

                                              hour.update(now.hours, true, false);
                                              minute.update(now.minutes, true, false);

                                              if (now.seconds === 0) {
                                                  second.update(-0.2, true, false);
                                              }

                                              second.update(now.seconds, true, {
                                                  easing: 'easeOutBounce'
                                              });
                                              console.log("🕙时钟时间刷新正常-------------------");

                                          
                                          
                                          console.log("⏰定时器工作正常-------------------");


                                      }, 1000);

                                  }
"""))
        
        let credits = AACredits()
            .enabled(false)
        
        let title = AATitle()
            .text("The Highcharts clock")
        
        let backgroundGradient = AAGradientColor()
            .radialGradient(AARadialGradient()
                .cx(0.5)
                .cy(-0.4)
                .r(1.9))
            .stops([
                [0.5, "rgba(255, 255, 255, 0.2)"],
                [0.5, "rgba(200, 200, 200, 0.2)"]
            ])
        
        let pane = AAPane()
            .background([
                AABackgroundElement(),
                AABackgroundElement()
                    .backgroundColor(backgroundGradient)
            ])
        
        let yAxis = AAYAxis()
            .labels(AALabels()
                .distance(-23)
                .style(AAStyle()
                    .fontSize(18)
                )
            )
            .min(0)
            .max(12)
            .lineWidth(0)
            .minorTickInterval("auto")
            .minorTickWidth(3)
            .minorTickLength(5)
            .minorTickPosition("inside")
            .minorGridLineWidth(0)
            .minorTickColor("#666")
            .tickInterval(1)
            .tickWidth(4)
            .tickPosition("inside")
            .tickLength(10)
            .tickColor("#666")
            .title(AATitle()
                .text("Powered by<br/>Highcharts")
                .style(AAStyle()
                    .color("#BBB")
                    .fontWeight(.regular)
                    .fontSize(10)
                )
                .y(10)
            )
        
        let tooltip = AATooltip()
            .format("{series.chart.tooltipText}")
                
        let hourSeries = AASeriesElement()
            .data({
                let now = Date()
                let calendar = Calendar(identifier: .gregorian)
                let components = calendar.dateComponents([.hour, .minute, .second], from: now)
                
                let hours = Double(components.hour!) + Double(components.minute!) / 60.0
                let minutes = Double(components.minute!) * 12.0 / 60.0 + Double(components.second!) * 12.0 / 3600.0
                let seconds = Double(components.second!) * 12.0 / 60.0
                
                let dataArr: [[String: Any]] = [
                    ["id": "hour", "y": hours, "dial": ["radius": "60%", "baseWidth": 4, "baseLength": "95%", "rearLength": 0]],
                    ["id": "minute", "y": minutes, "dial": ["baseLength": "95%", "rearLength": 0]],
                    ["id": "second", "y": seconds, "dial": ["radius": "100%", "baseWidth": 1, "rearLength": "20%"]]
                ]
                
                print("Series: \(dataArr)")
                return dataArr
            }())
            .dataLabels(AADataLabels()
                .enabled(false)
            )
        
        let aaOptions = AAOptions()
            .chart(chart)
            .credits(credits)
            .title(title)
            .pane(pane)
            .yAxis(yAxis)
            .tooltip(tooltip)
            .series([hourSeries])
        
        return aaOptions
    }
}
