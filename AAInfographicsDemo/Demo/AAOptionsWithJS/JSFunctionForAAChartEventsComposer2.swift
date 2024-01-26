//
// Created by AnAn on 2024/1/23.
// Copyright (c) 2024 An An. All rights reserved.
//

import AAInfographics

class JSFunctionForAAChartEventsComposer2 {

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
    static func defaultSelectedAPointForLineChart() -> AAOptions {
        let defaultPointData = AADataElement()
            .y(29.9)
            .selected(true)
            .toDic()!
        
        let dataArr = [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, defaultPointData] as [Any]
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
}
