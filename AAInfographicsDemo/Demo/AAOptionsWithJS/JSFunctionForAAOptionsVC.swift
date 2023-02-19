//
//  JSFunctionForAAOptionsVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2022/9/30.
//  Copyright © 2022 An An. All rights reserved.
//

import UIKit
import AAInfographics

class JSFunctionForAAOptionsVC: AABaseChartVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func chartConfigurationWithSelectedIndex(_ selectedIndex: Int) -> Any? {
        switch (selectedIndex) {
        case 0: return customDoubleXAxesChart()
        case 1: return disableColumnChartUnselectEventEffectBySeriesPointEventClickFunction()
        case 2: return customizeEveryDataLabelSinglelyByDataLabelsFormatter()
        case 3: return configureColorfulDataLabelsForPieChart()
        case 4: return configureCustomStyleCrosshairs()


        default: return nil
        }
    }
    
    //https://github.com/AAChartModel/AAChartKit/issues/780
      private func customDoubleXAxesChart() -> AAOptions {
          let gradientColorDic1 = AAGradientColor.linearGradient(
              direction: .toTop,
              startColor: "#7052f4",
              endColor: "#00b0ff"//颜色字符串设置支持十六进制类型和 rgba 类型
          )
          
          let gradientColorDic2 = AAGradientColor.linearGradient(
              direction: .toTop,
              startColor: "#EF71FF",
              endColor: "#4740C8"//颜色字符串设置支持十六进制类型和 rgba 类型
          )
          
          let aaChart = AAChart()
              .type(.bar)
          
          let aaTitle = AATitle()
              .text("2015 年德国人口金字塔")
              .style(AAStyle()
                  .color(AAColor.black)
                  .fontSize(12.0))
          
          let aaCategories = [
              "0-4", "5-9", "10-14", "15-19",
              "20-24", "25-29", "30-34", "35-39", "40-44",
              "45-49", "50-54", "55-59", "60-64", "65-69",
              "70-74", "75-79", "80-84", "85-89", "90-94",
              "95-99", "100 + "
          ]
          
          let aaXAxis1 = AAXAxis()
              .reversed(true)
              .categories(aaCategories)
              .labels(AALabels()
                  .step(1))
          
          let aaXAxis2 = AAXAxis()
              .reversed(true)
              .opposite(true)
              .categories(aaCategories)
              .linkedTo(0)
              .labels(AALabels()
                  .step(1))
          
          let aaYAxis = AAYAxis()
              .gridLineWidth(0)// Y 轴网格线宽度
              .title(AATitle()
                  .text(""))//Y 轴标题
              .labels(AALabels()
                  .formatter("""
  function () {
      return (Math.abs(this.value) / 1000000) + 'M';
  }
  """))
              .min( -4000000)
              .max( 4000000)
          
          let aaPlotOptions = AAPlotOptions()
              .series(AASeries()
                  .animation(AAAnimation()
                      .duration(800)
                      .easing(.bounce))
                  .stacking(.normal))
          
          let aaTooltip = AATooltip()
              .enabled(true)
              .shared(false)
              .formatter("""
  function () {
      return '<b>' + this.series.name + ', age ' + this.point.category + '</b><br/>' +
          '人口: ' + Highcharts.numberFormat(Math.abs(this.point.y), 0);
  }
  """)
          
          let aaSeriesElement1 = AASeriesElement()
              .name("Men")
              .color(gradientColorDic1)
              .data([
                  -1746181, -1884428, -2089758, -2222362, -2537431, -2507081, -2443179,
                  -2664537, -3556505, -3680231, -3143062, -2721122, -2229181, -2227768,
                  -2176300, -1329968, -836804, -354784, -90569, -28367, -3878
              ])
          
          let aaSeriesElement2 = AASeriesElement()
              .name("Women")
              .color(gradientColorDic2)
              .data([
                  1656154, 1787564, 1981671, 2108575, 2403438, 2366003, 2301402, 2519874,
                  3360596, 3493473, 3050775, 2759560, 2304444, 2426504, 2568938, 1785638,
                  1447162, 1005011, 330870, 130632, 21208
              ])
          
          let aaOptions = AAOptions()
              .chart(aaChart)
              .title(aaTitle)
              .xAxisArray([aaXAxis1,aaXAxis2])
              .yAxis(aaYAxis)
              .plotOptions(aaPlotOptions)
              .tooltip(aaTooltip)
              .series([aaSeriesElement1,aaSeriesElement2])
          
          return aaOptions
      }
      
    
    //https://github.com/AAChartModel/AAChartKit/issues/967
    private func disableColumnChartUnselectEventEffectBySeriesPointEventClickFunction() -> AAOptions  {
        let aaChartModel = AAChartModel()
            .chartType(.bar)
            .title("Custom Bar Chart select color")
            .yAxisTitle("")
            .yAxisReversed(true)
            .xAxisReversed(true)
            .series([
                AASeriesElement()
                    .name("ElementOne")
                    .data([211,183,157,133,111,91,73,57,43,31,21,13,7,3])
                    .allowPointSelect(true)
                    .states(AAStates()
                        .hover(AAHover()
                            .color(AAColor.yellow))
                        .select(AASelect()
                            .color(AAColor.red)))
            ])
        
        let aaOptions = aaChartModel.aa_toAAOptions()
        
        aaOptions.plotOptions?.series?
            .point(AAPoint()
                .events(AAPointEvents()
                    .click("""
                    function () {
                        if (this.selected == true) {
                            this.selected = false;
                        }
                        return;
                    }
                    """))
        )
        return aaOptions
    }
    
    // Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/589
    private func customizeEveryDataLabelSinglelyByDataLabelsFormatter() -> AAOptions  {
        let aaChartModel = AAChartModel()
            .chartType(.areaspline)//图表类型
            .dataLabelsEnabled(true)
            .tooltipEnabled(false)
            .colorsTheme([AAGradientColor.fizzyPeach])
            .markerRadius(0)
            .legendEnabled(false)
            .categories(["美国🇺🇸","欧洲🇪🇺","中国🇨🇳","日本🇯🇵","韩国🇰🇷","越南🇻🇳","中国香港🇭🇰",])
            .series([
                AASeriesElement()
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2])
            ])
        
        let aaOptions = aaChartModel.aa_toAAOptions()
        aaOptions.yAxis?.gridLineDashStyle = AAChartLineDashStyleType.longDash.rawValue//设置Y轴的网格线样式为 AAChartLineDashStyleTypeLongDash
        
        aaOptions.tooltip?.shared = true
        
        
        let unitArr = ["美元", "欧元", "人民币", "日元", "韩元", "越南盾", "港币", ]
        let unitJSArrStr = unitArr.aa_toJSArray()
        //单组 series 图表, 获取选中的点的索引是 this.point.index ,多组并且共享提示框,则是this.points[0].index
        let dataLabelsFormatter = """
                                  function () {
                                  return this.y + \(unitJSArrStr)[this.point.index];
                                  }
                                  """
        
        let aaDataLabels = AADataLabels()
            .style(AAStyle(color: AAColor.red, fontSize: 10, weight: .bold))
            .formatter(dataLabelsFormatter)
            .backgroundColor(AAColor.white)// white color
            .borderColor(AAColor.red)// red color
            .borderRadius(1.5)
            .borderWidth(1.3)
            .x(3).y(-20)
            .verticalAlign(.middle)
        
        aaOptions.plotOptions?.series?.dataLabels = aaDataLabels
        
        return aaOptions
    }

    //https://github.com/AAChartModel/AAChartKit-Swift/issues/404
    private func configureColorfulDataLabelsForPieChart() -> AAOptions {
        AAOptions()
            .title(AATitle()
                .text("Colorful DataLabels For Pie Chart"))
            .colors(["#0c9674", "#7dffc0", "#ff3333", "#facd32", "#ffffa0",
                     "#EA007B", "#fe117c", "#ffc069", "#06caf4", "#7dffc0"])
            .series([
                AASeriesElement()
                    .type(.pie)
                    .name("语言热度值")
                    .innerSize("20%")//内部圆环半径大小占比
                    .borderWidth(0)//描边的宽度
                    .allowPointSelect(true)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
                    .states(AAStates()
                        .hover(AAHover()
                            .enabled(false)//禁用点击区块之后出现的半透明遮罩层
                        ))
                    .dataLabels(AADataLabels()
                        .allowOverlap(true)//允许字符重叠
                        .useHTML(true)
                        .formatter(#"""
                                   function () {
                                       const point = this.point;
                                       return '<span style=\"color: ' + point.color + '\">' +
                                              point.name + ': ' + point.y + '%</span>';
                                   }
                                   """#))
                    .data([
                        ["Firefox",   3336.2],
                        ["IE",          26.8],
                        ["Chrome",      666.8],
                        ["Safari",      88.5],
                        ["Opera",       46.0],
                        ["Others",     223.0],
                        ["Firefox",   3336.2],
                        ["IE",          26.8],
                        ["Chrome",      666.8],
                        ["Safari",      88.5],
                        ["Opera",       46.0],
                        ["Others",     223.0],
                    ])
            ])
    }

    //- (AAOptions *)customizeCrosshairsStyle {

    //    return AAOptions.new
    //        .plotOptionsSet(AAPlotOptions.new
    //                        .seriesSet(AASeries.new
    //                                   .pointSet(AAPoint.new
    //                                             .eventsSet(AAPointEvents.new
    //                                                        .mouseOverSet(@AAJSFunc(function() {
    //                                                            const chart = this.series.chart;
    //                                                            const pointBox = this.graphic.getBBox();
    //                                                            const left = pointBox.x + (pointBox.width / 2) + chart.plotLeft;
    //                                                            const top = pointBox.y + chart.plotTop;
    //                                                            const height = chart.plotHeight + chart.plotTop;
    //
    //                                                            if (this.series.options.enabledCrosshairs) {
    //                                                                chart.crosshair = chart.renderer.path(['M', left, top, 'L', left, height])
    //                                                                    .attr({
    //                                                                        'stroke-width': 8,
    //                                                                    stroke: 'red'
    //                                                                    })
    //                                                                    .add();
    //                                                            }
    //                                                        }
    //                                                                                ))
    //                                                        .mouseOutSet(@AAJSFunc(function() {
    //                                                            const chart = this.series.chart;
    //                                                            if (chart.crosshair) chart.crosshair.destroy();
    //                                                        }))
    //
    //                                                        ))))//设置点击事件
    //        .seriesSet(@[
    //            AASeriesElement.new
    //                .enableMouseTrackingSet(@true)
    //                .dataSet(@[@2, @5, @2, @3, @6, @5]),
    //        ]);
    //}

    private func configureCustomStyleCrosshairs() -> AAOptions {
        AAOptions()
            .plotOptions(AAPlotOptions()
                .series(AASeries()
                    .point(AAPoint()
                        .events(AAPointEvents()
                            .mouseOver(#"""
                                        function() {
                                                    const chart = this.series.chart,
                                                      pointBox = this.graphic.getBBox(),
                                                      left = pointBox.x + (pointBox.width / 2) + chart.plotLeft,
                                                      top = pointBox.y + chart.plotTop,
                                                      height = chart.plotHeight + chart.plotTop;

                                                    if (this.series.options.enabledCrosshairs) {
                                                      chart.crosshair = chart.renderer.path(['M', left, top, 'L', left, height])
                                                        .attr({
                                                          'stroke-width': 8,
                                                          stroke: 'red'
                                                        })
                                                        .add();
                                                    }
                                                  }
                                        """#)
                            .mouseOut(#"""
                                       function() {
                                                   const chart = this.series.chart;
                                                   if (chart.crosshair) chart.crosshair.destroy();
                                                 }
                                       """#)
                        )
                    )
                )
            )
            .series([
                AASeriesElement()
                    .enabledCrosshairs(true)
                    .data([2, 5, 2, 3, 6, 5]),
            ])
    }

}
