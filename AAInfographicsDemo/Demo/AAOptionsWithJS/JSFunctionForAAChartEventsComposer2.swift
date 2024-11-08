//
// Created by AnAn on 2024/1/23.
// Copyright (c) 2024 An An. All rights reserved.
//

import AAInfographics

class JSFunctionForAAChartEventsComposer2 {
    
    //https://github.com/AAChartModel/AAChartCore/issues/203
    static func disableHoverEventTooltipEffect() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.line)
                .events(AAChartEvents()
                    .load(#"""
                        function() {
                            const chart = this;
                            Highcharts.addEvent(chart.container, 'touchmove', function (e) {
                                e.preventDefault();
                                chart.tooltip.hide(0);
                            });
                        }
                    """#)
                )
            )
            .title(AATitle()
                .text("Disable Hover Event Tooltip Effect")
            )
            .plotOptions(AAPlotOptions()
                .series(AASeries()
                    .states(AAStates()
                        .hover(AAHover()
                            .enabled(false) // 禁用默认 hover 状态
                        )
                    )
                    .point(AAPoint()
                        .events(AAPointEvents()
                            .click(#"""
                                function() {
                                    const chart = this.series.chart;
                                    chart.tooltip.refresh(this);
                                }
                            """#)
                        )
                    )
                    .marker(AAMarker()
                        .enabled(true)
                        .radius(10)
                    )
                )
            )
            .tooltip(AATooltip()
                .enabled(true)
                .hideDelay(0) // 设置 tooltip 立刻隐藏
                .shared(false)
            )
            .series([
                AASeriesElement()
                    .data([1, 3, 2, 4, 5])
            ])
    }
    
    

    /*
Highcharts.chart('container', {
  chart: {
    type: 'column',
    events: {
      load: function() {
        var axis = this.xAxis[0]
        var ticks = axis.ticks
        var points = this.series[0].points
        var tooltip = this.tooltip

        points.forEach(function(point, i) {
          if (ticks[i]) {
            var label = ticks[i].label.element

            label.onclick = function() {
              tooltip.getPosition(null, null, point)
              tooltip.refresh(point)
            }
          }

        })
      }
    }
  },
  xAxis: {
    categories: ['Africa', 'America', 'Asia', 'Europe', 'Oceania']
  },
  yAxis: {
    min: 0,
  },
  tooltip: {
    valueSuffix: ' millions'
  },
  plotOptions: {
    bar: {
      dataLabels: {
        enabled: true
      }
    }
  },
  series: [{
    name: 'Year 1800',
    data: [107, 31, 635, 203, 2]
  }]
});
     */
    //How to add click event to X-axis label and access data ?
    //https://www.highcharts.com/forum/viewtopic.php?t=40590
    //https://codepen.io/anon/pen/LmObxY?editors=1010
    //https://github.com/AAChartModel/AAChartKit/issues/1531
    static func addClickEventToXAxisLabelAndAccessData() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.column)
                .events(AAChartEvents()
                    .load("""
                      function() {
                          var axis = this.xAxis[0];
                          var ticks = axis.ticks;
                          var points = this.series[0].points;
                          var tooltip = this.tooltip;
                      
                          points.forEach(function(point, i) {
                              if (ticks[i]) {
                                  var label = ticks[i].label.element;
                      
                                  label.onclick = function() {
                                      tooltip.getPosition(null, null, point);
                                      tooltip.refresh(point);
                                  };
                              }
                          });
                      }
                      """)))
            .xAxis(AAXAxis()
                .categories(["Africa", "America", "Asia", "Europe", "Oceania"]))
            .yAxis(AAYAxis()
                .min(0))
            .tooltip(AATooltip()
                .valueSuffix(" millions"))
            .plotOptions(AAPlotOptions()
                .series(AASeries()
                    .dataLabels(AADataLabels()
                        .enabled(true))))
            .series([
                AASeriesElement()
                    .name("Year 1800")
                    .data([107, 31, 635, 203, 2])
            ])
    }


/*
 Highcharts.chart('container', {
     xAxis: {
         categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
     },
     
     plotOptions: {
         series: {
             events: {
                 mouseOver: function () {
                     if(this.hasRun) return;
                     
                     var series = this;
                     var defaultPointIndex = 3;
                     
                     if (series.data.length > defaultPointIndex) {
                         defaultPoint = series.data[defaultPointIndex];
                         // 模拟点击事件来选中默认点
                         defaultPoint.select(false);
                     }
                     console.log("11111111111");
                     this.hasRun = true;
                 }
             },
             allowPointSelect: true,
             // 可以设置选中时的样式，比如边框颜色
             marker: {
                 states: {
                     select: {
                         fillColor: 'red',
                         lineWidth: 10,
                         lineColor: "yellow",
                         radius:20,
                     }
                 }
             },
         }
     },
     series: [{
         data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4, {
             y: 29.9,
             selected: true
         }]
     }]
 });
 */
    //https://api.highcharts.com/highcharts/plotOptions.series.marker.states.hover
    //https://api.highcharts.com/highcharts/plotOptions.series.events.mouseOver
    //https://api.highcharts.com/class-reference/Highcharts.Point#select
    //https://github.com/AAChartModel/AAChartKit/issues/1532
    static func defaultSelectedAPointForLineChart() -> AAOptions {
        let defaultPointData = AADataElement()
            .y(29.9)
            .selected(true)
            .toDic()

        let dataArr = [
            29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, defaultPointData
        ] as [Any]

        let defaultPointIndex = dataArr.count - 1

        return AAOptions()
            .xAxis(AAXAxis()
                .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]))
            .plotOptions(AAPlotOptions()
                .series(AASeries()
                    .events(AASeriesEvents()
                        .mouseOver("""
                                   function () {
                                       if(this.hasRun) return;
                                       
                                       var series = this;
                                       var defaultPointIndex = \(defaultPointIndex);
                                       if (series.data.length > defaultPointIndex) {
                                           defaultPoint = series.data[defaultPointIndex];
                                           defaultPoint.select(false);
                                       }

                                       this.hasRun = true;
                                   }
                                   """))
                    .allowPointSelect(true)
                    .marker(AAMarker()
                        .states(AAMarkerStates()
                            .select(AAMarkerSelect()
                                .fillColor("red")
                                .lineWidth(10)
                                .lineColor("yellow")
                                .radius(20))))))
            .series([
                AASeriesElement()
                    .data(dataArr)
            ])
    }
    
    //https://github.com/AAChartModel/AAChartKit/issues/1531
    //https://stackoverflow.com/questions/42062016/in-high-chart-how-to-add-event-for-label-click
    static func configureBlinkMarkerChart() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.areaspline)
                .events(AAChartEvents()
                    .load("""
                    function() {
                        const childNodes = this.xAxis[0].labelGroup.element.childNodes;
                        childNodes
                        .forEach(function(label, index) {
                            label.style.cursor = "pointer";
                            label.onclick = function() {
                                alert('You clicked on ' + this.textContent + ', index: ' + index);
                            }
                        });
                    }
""")))
            .xAxis(AAXAxis()
                .categories(["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]))
            .series([
                AASeriesElement()
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
                    .marker(AAMarker()
                        .lineColor(AAColor.red)
                        .lineWidth(3)
                        .radius(10))
            ])
    }
    
    //https://github.com/AAChartModel/AAChartKit/issues/1557
    //https://github.com/AAChartModel/AAChartCore/issues/199
    //https://developer.mozilla.org/zh-CN/docs/Web/API/Touch_events/Using_Touch_Events
    //https://developer.mozilla.org/zh-CN/docs/Web/API/MouseEvent
    /*
    在 JavaScript 中，与触摸事件对应的鼠标事件分别是：

    - `touchstart` 对应 `mousedown`
    - `touchend` 对应 `mouseup`

    因此，将你的代码中的触摸事件改为鼠标事件后，代码可以改写为：

     
     1.
    ```javascript
    // 监听 mousedown 事件
    container.addEventListener('mousedown', function() {
      hideDataLabels(chart);
    });

    // 监听 mouseup 事件
    container.addEventListener('mouseup', function() {
      showDataLabels(chart);
    });
    ```

    或者也可以改成为:
     
     2.
     ```javascript
     // 监听 mouseenter 事件
     container.addEventListener('mouseenter', function() {
       hideDataLabels(chart);
     });

     // 监听 mouseleave 事件
     container.addEventListener('mouseleave', function() {
       showDataLabels(chart);
     });
     ```
    */
    static func toggleDataLabelsOnTouch() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.areaspline)
                .events(AAChartEvents()
                    .load("""
                    function() {
                        const chart = this;
                        const container = document.getElementById('container');

                        container.addEventListener('touchstart', function() {
                            hideDataLabels(chart);
                        });

                        container.addEventListener('touchend', function() {
                            showDataLabels(chart);
                        });

                        function hideDataLabels(chart) {
                            chart.series.forEach(function(series) {
                                series.data.forEach(function(point) {
                                    point.update({ dataLabels: { enabled: false } });
                                });
                            });
                        }

                        function showDataLabels(chart) {
                            chart.series.forEach(function(series) {
                                series.data.forEach(function(point) {
                                    point.update({ dataLabels: { enabled: true } });
                                });
                            });
                        }
                    }
                    """)))
            .xAxis(AAXAxis()
                .categories(["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]))
            .series([
                AASeriesElement()
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
                    .dataLabels(AADataLabels()
                        .enabled(true))
                    .marker(AAMarker()
                        .lineColor(AAColor.red)
                        .lineWidth(3)
                        .radius(10))
            ])
    }
    
    //https://github.com/AAChartModel/AAChartKit/issues/1559
    /*
     🖱鼠标事件
     function () {
         const chart = this;
         let currentIndex = 0;
         let intervalId;
         let isHovered = false;

         function moveTooltip() {
             const pointsToShow = [];
             for (let i = 0; i < chart.series.length; i++) {
                 const point = chart.series[i].points[currentIndex];
                 if (point) {
                     pointsToShow.push(point);
                 }
             }

             if (pointsToShow.length > 0) {
                 chart.tooltip.refresh(pointsToShow);
                 chart.xAxis[0].drawCrosshair(null, pointsToShow[0]);

                 currentIndex = (currentIndex + 1) % chart.series[0].points.length;
             }
         }

         function startInterval() {
             if (intervalId) {
                 clearInterval(intervalId);
             }
             intervalId = setInterval(moveTooltip, 2000); // 每2秒切换一次
         }

         // 立即显示第一个点的 tooltip 和十字线
         moveTooltip();

         // 初始启动 interval
         startInterval();

         // 鼠标进入图表
         chart.container.onmouseenter = function() {
             isHovered = true;
             if (intervalId) {
                 clearInterval(intervalId);
                 intervalId = null;
             }
         };

         // 鼠标在图表上移动
         chart.container.onmousemove = function(e) {
             if (isHovered) {
                 const event = chart.pointer.normalize(e);
                 const point = chart.series[0].searchPoint(event, true); // 可以考虑使用更通用的方法选择点
                 if (point) {
                     currentIndex = chart.series[0].points.indexOf(point);
                     const pointsToShow = [];
                     for (let i = 0; i < chart.series.length; i++) {
                         const pointInSeries = chart.series[i].points[currentIndex];
                         if (pointInSeries) {
                             pointsToShow.push(pointInSeries);
                         }
                     }
                     chart.tooltip.refresh(pointsToShow);
                     chart.xAxis[0].drawCrosshair(event, point);
                 }
             }
         };

         // 鼠标离开图表
         chart.container.onmouseleave = function() {
             isHovered = false;
             if (!intervalId) {
                 // 立即移动到下一个点，然后开始 interval
                 moveTooltip();
                 startInterval();
             }
         };

         // 在图表销毁时清除 interval
         this.callbacks.push(function() {
             if (intervalId) {
                 clearInterval(intervalId);
             }
         });
     }
     */

    /*
     👋手势事件
     function() {
         const chart = this;
         let currentIndex = 0;
         let intervalId;
         let isTouched = false;

         function moveTooltip() {
             const pointsToShow = [];
             for (let i = 0; i < chart.series.length; i++) {
                 const point = chart.series[i].points[currentIndex];
                 if (point) {
                     pointsToShow.push(point);
                 }
             }

             if (pointsToShow.length > 0) {
                 chart.tooltip.refresh(pointsToShow);
                 chart.xAxis[0].drawCrosshair(null, pointsToShow[0]);

                 currentIndex = (currentIndex + 1) % chart.series[0].points.length;
             }
         }

         function startInterval() {
             if (intervalId) {
                 clearInterval(intervalId);
             }
             intervalId = setInterval(moveTooltip, 2000); // 每2秒切换一次
         }

         // 立即显示第一个点的 tooltip 和十字线
         moveTooltip();

         // 初始启动 interval
         startInterval();

         // 触摸开始
         chart.container.ontouchstart = function(e) {
             isTouched = true;
             if (intervalId) {
                 clearInterval(intervalId);
                 intervalId = null;
             }
             handleTouch(e);
         };

         // 触摸移动
         chart.container.ontouchmove = function(e) {
             if (isTouched) {
                 handleTouch(e);
             }
         };

         function handleTouch(e) {
             e.preventDefault(); // 阻止默认的滚动行为
             const touch = e.touches[0];
             const event = chart.pointer.normalize(touch);
             const point = chart.series[0].searchPoint(event, true);
             if (point) {
                 currentIndex = chart.series[0].points.indexOf(point);
                 const pointsToShow = [];
                 for (let i = 0; i < chart.series.length; i++) {
                     const pointInSeries = chart.series[i].points[currentIndex];
                     if (pointInSeries) {
                         pointsToShow.push(pointInSeries);
                     }
                 }
                 chart.tooltip.refresh(pointsToShow);
                 chart.xAxis[0].drawCrosshair(event, point);
             }
         }

         // 触摸结束
         chart.container.ontouchend = function() {
             isTouched = false;
             if (!intervalId) {
                 // 立即移动到下一个点，然后开始 interval
                 moveTooltip();
                 startInterval();
             }
         };

         // 在图表销毁时清除 interval
         this.callbacks.push(function() {
             if (intervalId) {
                 clearInterval(intervalId);
             }
         });
     }
     */
    static func autoCrosshairAndTooltip() -> AAOptions {
        AAOptions()
            .title(AATitle()
                .text("Auto Crosshair And Tooltip"))
            .chart(AAChart()
                .type(.areaspline)
                .events(AAChartEvents()
                    .load("""
                function() {
                    const chart = this;
                    let currentIndex = 0;
                    let intervalId;
                    let isTouched = false;

                    function moveTooltip() {
                        const pointsToShow = [];
                        for (let i = 0; i < chart.series.length; i++) {
                            const point = chart.series[i].points[currentIndex];
                            if (point) {
                                pointsToShow.push(point);
                            }
                        }

                        if (pointsToShow.length > 0) {
                            chart.tooltip.refresh(pointsToShow);
                            chart.xAxis[0].drawCrosshair(null, pointsToShow[0]);

                            currentIndex = (currentIndex + 1) % chart.series[0].points.length;
                        }
                    }

                    function startInterval() {
                        if (intervalId) {
                            clearInterval(intervalId);
                        }
                        intervalId = setInterval(moveTooltip, 2000);
                    }

                    moveTooltip();

                    startInterval();

                    chart.container.ontouchstart = function(e) {
                        isTouched = true;
                        if (intervalId) {
                            clearInterval(intervalId);
                            intervalId = null;
                        }
                        handleTouch(e);
                    };

                    chart.container.ontouchmove = function(e) {
                        if (isTouched) {
                            handleTouch(e);
                        }
                    };

                    function handleTouch(e) {
                        e.preventDefault();
                        const touch = e.touches[0];
                        const event = chart.pointer.normalize(touch);
                        const point = chart.series[0].searchPoint(event, true);
                        if (point) {
                            currentIndex = chart.series[0].points.indexOf(point);
                            const pointsToShow = [];
                            for (let i = 0; i < chart.series.length; i++) {
                                const pointInSeries = chart.series[i].points[currentIndex];
                                if (pointInSeries) {
                                    pointsToShow.push(pointInSeries);
                                }
                            }
                            chart.tooltip.refresh(pointsToShow);
                            chart.xAxis[0].drawCrosshair(event, point);
                        }
                    }

                    chart.container.ontouchend = function() {
                        isTouched = false;
                        if (!intervalId) {
                            moveTooltip();
                            startInterval();
                        }
                    };

                    this.callbacks.push(function() {
                        if (intervalId) {
                            clearInterval(intervalId);
                        }
                    });
                }
            """)))
            .colors(["#04d69f", "#1e90ff", "#ef476f", "#ffd066"])
            .plotOptions(AAPlotOptions()
                .series(AASeries()
                    .stacking(.normal)
                    .marker(AAMarker()
                        .radius(0))))
            .tooltip(AATooltip()
                .style(AAStyle()
                    .color(AAColor.white))
                .backgroundColor("#050505")
                .borderColor("#050505"))
            .xAxis(AAXAxis()
                .crosshair(AACrosshair()
                    .color(AAColor.darkGray)
                    .dashStyle(.longDashDotDot)
                    .width(2)))
            .yAxis(AAYAxis()
                .visible(false))
            .series([
                AASeriesElement()
                    .name("Tokyo Hot")
                    .lineWidth(5.0)
                    .fillOpacity(0.4)
                    .data([0.45, 0.43, 0.50, 0.55, 0.58, 0.62, 0.83, 0.39, 0.56, 0.67, 0.50, 0.34, 0.50, 0.67, 0.58, 0.29, 0.46, 0.23, 0.47, 0.46, 0.38, 0.56, 0.48, 0.36]),
                AASeriesElement()
                    .name("Berlin Hot")
                    .lineWidth(5.0)
                    .fillOpacity(0.4)
                    .data([0.38, 0.31, 0.32, 0.32, 0.64, 0.66, 0.86, 0.47, 0.52, 0.75, 0.52, 0.56, 0.54, 0.60, 0.46, 0.63, 0.54, 0.51, 0.58, 0.64, 0.60, 0.45, 0.36, 0.67]),
                AASeriesElement()
                    .name("London Hot")
                    .lineWidth(5.0)
                    .fillOpacity(0.4)
                    .data([0.46, 0.32, 0.53, 0.58, 0.86, 0.68, 0.85, 0.73, 0.69, 0.71, 0.91, 0.74, 0.60, 0.50, 0.39, 0.67, 0.55, 0.49, 0.65, 0.45, 0.64, 0.47, 0.63, 0.64]),
                AASeriesElement()
                    .name("NewYork Hot")
                    .lineWidth(5.0)
                    .fillOpacity(0.4)
                    .data([0.60, 0.51, 0.52, 0.53, 0.64, 0.84, 0.65, 0.68, 0.63, 0.47, 0.72, 0.60, 0.65, 0.74, 0.66, 0.65, 0.71, 0.59, 0.65, 0.77, 0.52, 0.53, 0.58, 0.53]),
            ])
    }
    
    /**
     // HTML结构
     const chartContainer = document.getElementById('container');

     // 初始化图表
     const chart = Highcharts.chart('container', {
         chart: {
             type: 'line',
             zoomType: 'xy',
             panning: true,
         },
       
         tooltip: {
             followTouchMove: false
         },
         
         series: [{
             data: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
         }]
     });
     */
    static func simpleZoomingChart() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.line)
                .zoomType(.x)
                .panning(AAPanning()
                    .enabled(true)))
            .tooltip(AATooltip()
                .followTouchMove(false))
            .series([
                AASeriesElement()
                    .data([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
            ])
    }
    
    static func simpleZoomingChart2() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.area)
                .zooming(AAZooming()
                    .singleTouch(true)
                    .type(.xy)
                    .pinchType(.xy)
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
                                        .color(AAColor.white))))))))
            .colors(["#04d69f", "#1e90ff", "#ef476f", "#ffd066"])
            .plotOptions(AAPlotOptions()
                .series(AASeries()
                    .stacking(.normal)
                    .marker(AAMarker()
                        .radius(0))))
            .tooltip(AATooltip()
                .followTouchMove(false))
            .series([
                AASeriesElement()
                    .name("Tokyo Hot")
                    .lineWidth(5.0)
                    .fillOpacity(0.4)
                    .data([0.45, 0.43, 0.50, 0.55, 0.58, 0.62, 0.83, 0.39, 0.56, 0.67, 0.50, 0.34, 0.50, 0.67, 0.58, 0.29, 0.46, 0.23, 0.47, 0.46, 0.38, 0.56, 0.48, 0.36]),
                AASeriesElement()
                    .name("Berlin Hot")
                    .lineWidth(5.0)
                    .fillOpacity(0.4)
                    .data([0.38, 0.31, 0.32, 0.32, 0.64, 0.66, 0.86, 0.47, 0.52, 0.75, 0.52, 0.56, 0.54, 0.60, 0.46, 0.63, 0.54, 0.51, 0.58, 0.64, 0.60, 0.45, 0.36, 0.67]),
                AASeriesElement()
                    .name("London Hot")
                    .lineWidth(5.0)
                    .fillOpacity(0.4)
                    .data([0.46, 0.32, 0.53, 0.58, 0.86, 0.68, 0.85, 0.73, 0.69, 0.71, 0.91, 0.74, 0.60, 0.50, 0.39, 0.67, 0.55, 0.49, 0.65, 0.45, 0.64, 0.47, 0.63, 0.64]),
                AASeriesElement()
                    .name("NewYork Hot")
                    .lineWidth(5.0)
                    .fillOpacity(0.4)
                    .data([0.60, 0.51, 0.52, 0.53, 0.64, 0.84, 0.65, 0.68, 0.63, 0.47, 0.72, 0.60, 0.65, 0.74, 0.66, 0.65, 0.71, 0.59, 0.65, 0.77, 0.52, 0.53, 0.58, 0.53]),
            ])
    }
    

}
