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
}