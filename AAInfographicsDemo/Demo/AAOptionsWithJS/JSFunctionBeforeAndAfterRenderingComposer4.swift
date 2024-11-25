//
//  JSFunctionBeforeAndAfterRenderingComposer4.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/11/25.
//  Copyright © 2024 An An. All rights reserved.
//

import AAInfographics

class JSFunctionBeforeAndAfterRenderingComposer4: NSObject {

    /**
     /**
      * Create a constructor for sparklines that takes some sensible defaults
      * and merges in the individual chart options. This function is also available
      * from the jQuery plugin as $(element).highcharts('SparkLine').
      */
     Highcharts.SparkLine = function (a, b, c) {
         const hasRenderToArg = typeof a === 'string' || a.nodeName;
         let options = arguments[hasRenderToArg ? 1 : 0];
         const defaultOptions = {
             chart: {
                 renderTo: (
                     (options.chart && options.chart.renderTo) ||
                     (hasRenderToArg && a)
                 ),
                 backgroundColor: null,
                 borderWidth: 0,
                 type: 'area',
                 margin: [2, 0, 2, 0],
                 width: 120,
                 height: 20,
                 style: {
                     overflow: 'visible'
                 },
                 // small optimalization, saves 1-2 ms each sparkline
                 skipClone: true
             },
             title: {
                 text: ''
             },
             credits: {
                 enabled: false
             },
             xAxis: {
                 labels: {
                     enabled: false
                 },
                 title: {
                     text: null
                 },
                 startOnTick: false,
                 endOnTick: false,
                 tickPositions: []
             },
             yAxis: {
                 endOnTick: false,
                 startOnTick: false,
                 labels: {
                     enabled: false
                 },
                 title: {
                     text: null
                 },
                 tickPositions: [0]
             },
             legend: {
                 enabled: false
             },
             tooltip: {
                 hideDelay: 0,
                 outside: true,
                 shared: true
             },
             plotOptions: {
                 series: {
                     animation: false,
                     lineWidth: 1,
                     shadow: false,
                     states: {
                         hover: {
                             lineWidth: 1
                         }
                     },
                     marker: {
                         radius: 1,
                         states: {
                             hover: {
                                 radius: 2
                             }
                         }
                     },
                     fillOpacity: 0.25
                 },
                 column: {
                     negativeColor: '#910000',
                     borderColor: 'silver'
                 }
             }
         };

         options = Highcharts.merge(defaultOptions, options);

         return hasRenderToArg ?
             new Highcharts.Chart(a, options, c) :
             new Highcharts.Chart(options, b);
     };

     const start = +new Date(),
         tds = Array.from(document.querySelectorAll('td[data-sparkline]')),
         fullLen = tds.length;

     let n = 0;

     // Creating 153 sparkline charts is quite fast in modern browsers, but mobile
     // can take some seconds, so we split the input into chunks and
     // apply them in timeouts in order avoid locking up the browser process
     // and allow interaction.
     function doChunk() {
         const time = +new Date(),
             len = tds.length;

         for (let i = 0; i < len; i += 1) {
             const td = tds[i];
             const stringdata = td.dataset.sparkline;
             const arr = stringdata.split('; ');
             const data = arr[0].split(', ').map(parseFloat);
             const chart = {};

             if (arr[1]) {
                 chart.type = arr[1];
             }

             Highcharts.SparkLine(td, {
                 series: [{
                     data: data,
                     pointStart: 1
                 }],
                 tooltip: {
                     headerFormat: '<span style="font-size: 10px">' +
                         td.parentElement.querySelector('th').innerText +
                         ', Q{point.x}:</span><br/>',
                     pointFormat: '<b>{point.y}.000</b> USD'
                 },
                 chart: chart
             });

             n += 1;

             // If the process takes too much time, run a timeout
             // to allow interaction with the browser
             if (new Date() - time > 500) {
                 tds.splice(0, i + 1);
                 setTimeout(doChunk, 0);
                 break;
             }

             // Print a feedback on the performance
             if (n === fullLen) {
                 document.getElementById('result').innerHTML =
                     'Generated ' +
                     fullLen +
                     ' sparklines in ' +
                     (new Date() - start) + ' ms';
             }
         }
     }
     doChunk();

     */
    
    static func chartOptions() -> AAOptions {
        let sparklinesHtml = getHtmlStringWithFileName(fileName: "sparklines").aa_toPureJSStringqq()
        let defaultOptionsJson = defaultOptionsJson()
        
        return AAOptions()
            .beforeDrawChartJavaScript("""
//将已有的 container div 元素高度设为 0
document.getElementById('container').style.height = '0px';

//注入 sparklinesHtml 到 HTML 中
document.body.insertAdjacentHTML('beforeend', '\(sparklinesHtml)');
console.log('🔥🔥🔥 Inject sparklinesHtml to HTML successfully! 🔥🔥🔥');
""")
            .afterDrawChartJavaScript("""
     /**
      * Create a constructor for sparklines that takes some sensible defaults
      * and merges in the individual chart options. This function is also available
      * from the jQuery plugin as $(element).highcharts('SparkLine').
      */
     Highcharts.SparkLine = function (a, b, c) {
         const hasRenderToArg = typeof a === 'string' || a.nodeName;
         let options = arguments[hasRenderToArg ? 1 : 0];
         const defaultOptions = \(defaultOptionsJson);

         options = Highcharts.merge(defaultOptions, options);

         return hasRenderToArg ?
             new Highcharts.Chart(a, options, c) :
             new Highcharts.Chart(options, b);
     };

     const start = +new Date(),
         tds = Array.from(document.querySelectorAll('td[data-sparkline]')),
         fullLen = tds.length;

     let n = 0;

     // Creating 153 sparkline charts is quite fast in modern browsers, but mobile
     // can take some seconds, so we split the input into chunks and
     // apply them in timeouts in order avoid locking up the browser process
     // and allow interaction.
     function doChunk() {
         const time = +new Date(),
             len = tds.length;

         for (let i = 0; i < len; i += 1) {
             const td = tds[i];
             const stringdata = td.dataset.sparkline;
             const arr = stringdata.split('; ');
             const data = arr[0].split(', ').map(parseFloat);
             const chart = {};

             if (arr[1]) {
                 chart.type = arr[1];
             }

             Highcharts.SparkLine(td, {
                 series: [{
                     data: data,
                     pointStart: 1
                 }],
                 tooltip: {
                     headerFormat: '<span style="font-size: 10px">' +
                         td.parentElement.querySelector('th').innerText +
                         ', Q{point.x}:</span><br/>',
                     pointFormat: '<b>{point.y}.000</b> USD'
                 },
                 chart: chart
             });

             n += 1;

             // If the process takes too much time, run a timeout
             // to allow interaction with the browser
             if (new Date() - time > 500) {
                 tds.splice(0, i + 1);
                 setTimeout(doChunk, 0);
                 break;
             }

             // Print a feedback on the performance
             if (n === fullLen) {
                 document.getElementById('result').innerHTML =
                     'Generated ' +
                     fullLen +
                     ' sparklines in ' +
                     (new Date() - start) + ' ms';
             }
         }
     }
     doChunk();

console.log('🔥🔥🔥 The sparklines have been created successfully! 🔥🔥🔥');
""")
    }
    
    //获取指定文件名的 html 文件内容
    static func getHtmlStringWithFileName(fileName: String) -> String {
        let path = Bundle.main.path(forResource: fileName, ofType: "html")
        var htmlString = ""
        do {
            htmlString = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        } catch {
            print("读取 html 文件失败")
        }
        return htmlString
    }
    
    
    static func defaultOptionsJson() -> String {
        var optionsDic = defaultOptions().toDic()
        var chartDic = optionsDic["chart"] as! [String: Any]
        chartDic["renderTo"] = "container"
        optionsDic["chart"] = chartDic
        let chartOptionsJson = toJSON(dic: optionsDic)
        return chartOptionsJson
    }
    
    static func toJSON(dic: Dictionary<String, Any>) -> String {
        do {
            let data = try JSONSerialization.data(withJSONObject: dic as Any, options: [])
            guard let jsonStr = String(data: data, encoding: String.Encoding.utf8) else { return "" }
            return jsonStr
        } catch {
            return ""
        }
    }
    
    static func defaultOptions() -> AAOptions {
        AAOptions()
            .chart(AAChart()
//                .renderTo("container")
                .backgroundColor("null")
//                .borderWidth(0)
                .type(.area)
                .margin([2, 0, 2, 0])
//                .width(120)
//                .height(20)
//                .style(AAStyle()
//                    .overflow("visible")
//                )
//                .skipClone(true)
            )
            .title(AATitle()
                .text("")
            )
            .credits(AACredits()
                .enabled(false)
            )
            .xAxis(AAXAxis()
                .labels(AALabels()
                    .enabled(false)
                )
                .title(AATitle()
                    .text("")
                )
                .startOnTick(false)
                .endOnTick(false)
                .tickPositions([])
            )
            .yAxis(AAYAxis()
                .endOnTick(false)
                .startOnTick(false)
                .labels(AALabels()
                    .enabled(false)
                )
                .title(AATitle()
                    .text("")
                )
                .tickPositions([0])
            )
            .legend(AALegend()
                .enabled(false)
            )
            .tooltip(AATooltip()
                .hideDelay(0)
//                .outside(true)
                .shared(true)
            )
            .plotOptions(AAPlotOptions()
                .series(AASeries()
                    .animation(false)
                    .lineWidth(1)
//                    .shadow(false)
                    .states(AAStates()
                        .hover(AAHover()
                            .lineWidth(1)
                        )
                    )
                    .marker(AAMarker()
                        .radius(1)
                        .states(AAMarkerStates()
                            .hover(AAMarkerHover()
                                .radius(2)
                            )
                        )
                    )
//                    .fillOpacity(0.25)
                )
                .column(AAColumn()
//                    .negativeColor("#910000")
                    .borderColor("silver")
                )
            )
    }
}
