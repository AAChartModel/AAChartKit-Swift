//
//  MixedChartComposer2.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/11/25.
//  Copyright © 2024 An An. All rights reserved.
//

import AAInfographics

class MixedChartComposer2: NSObject {
    
    /**
     const dataset = [
         [1.4, 0.4],
         [2.4, 5.3],
         [2.9, 4.9],
         [5, 2.3],
         [3.6, 1.9],
         [5.1, 6.1],
         [2, 4],
         [2, 5.6],
         [-0.2, 6.3],
         [1.2, 6.3]
     ];

     function getTrendLine(data) {
         const n = data.length;

         let sumX = 0,
             sumY = 0,
             sumXY = 0,
             sumX2 = 0;

         // Calculate the sums needed for linear regression
         for (let i = 0; i < n; i++) {
             const [x, y] = data[i];
             sumX += x;
             sumY += y;
             sumXY += x * y;
             sumX2 += x ** 2;
         }

         // Calculate the slope of the trend line
         const slope = (n * sumXY - sumX * sumY) / (n * sumX2 - sumX ** 2);

         // Calculate the intercept of the trend line
         const intercept = (sumY - slope * sumX) / n;

         const trendline = []; // Array to store the trend line data points

         // Find the minimum and maximum x-values from the scatter plot data
         const minX = Math.min(...data.map(([x]) => x));
         const maxX = Math.max(...data.map(([x]) => x));

         // Calculate the corresponding y-values for the trend line using the slope
         // and intercept
         trendline.push([minX, minX * slope + intercept]);
         trendline.push([maxX, maxX * slope + intercept]);

         return trendline;
     }

     Highcharts.chart('container', {
         title: {
             text: 'Scatter plot with trend line'
         },
         xAxis: {
             min: -0.5,
             max: 5.5
         },
         yAxis: {
             min: 0
         },
         series: [{
             type: 'line',
             name: 'Trend Line',
             data: getTrendLine(dataset),
             marker: {
                 enabled: false
             },
             states: {
                 hover: {
                     lineWidth: 0
                 }
             },
             enableMouseTracking: false
         }, {
             type: 'scatter',
             name: 'Observations',
             data: dataset,
             marker: {
                 radius: 4
             }
         }]
     });
     */
    
    
    
//    func scatterPlotWithTrendLine() -> AAOptions {
//        AAOptions()
//            .title(AATitle().text("Scatter plot with trend line"))
//            .xAxis(AAXAxis()
//                    .min(-0.5)
//                    .max(5.5))
//            .yAxis(AAYAxis()
//                    .min(0))
//            .series([
//                AASeriesElement()
//                    .type(.line)
//                    .name("Trend Line")
//                    .data(getTrendLine(data: dataset))
//                    .marker(AAMarker()
//                                .enabled(false))
//                    .states(AAStates()
//                                .hover(AAHover()
//                                        .lineWidth(0))
//                    )
//                    .enableMouseTracking(false),
//                AASeriesElement()
//                    .type(.scatter)
//                    .name("Observations")
//                    .data(dataset)
//                    .marker(AAMarker()
//                                .radius(4))
//            ])
//    }
    static func scatterPlotWithTrendLine() -> AAChartModel {
        let dataset = [
            [1.4, 0.4],
            [2.4, 5.3],
            [2.9, 4.9],
            [5, 2.3],
            [3.6, 1.9],
            [5.1, 6.1],
            [2, 4],
            [2, 5.6],
            [-0.2, 6.3],
            [1.2, 6.3]
        ]
        
        func getTrendLine(data: [[Double]]) -> [[Double]] {
            let n = data.count
            
            var sumX = 0.0,
                sumY = 0.0,
                sumXY = 0.0,
                sumX2 = 0.0
            
            // Calculate the sums needed for linear regression
            for i in 0..<n {
                let x = data[i][0]
                let y = data[i][1]
                sumX += x
                sumY += y
                sumXY += x * y
                sumX2 += pow(x, 2)
            }
            
            // Calculate the slope of the trend line
            let slope = (Double(n) * sumXY - sumX * sumY) / (Double(n) * sumX2 - pow(sumX, 2))
            let intercept = (sumY - slope * sumX) / Double(n)
            
            var trendline = [[Double]]() // Array to store the trend line data points
            
            // Find the minimum and maximum x-values from the scatter plot data
            let minX = data.min { $0[0] < $1[0] }![0]
            let maxX = data.max { $0[0] < $1[0] }![0]
            
            // Calculate the corresponding y-values for the trend line using the slope
            // and intercept
            trendline.append([minX, minX * slope + intercept])
            trendline.append([maxX, maxX * slope + intercept])
            
            return trendline
        }
        
        return AAChartModel()
            .title("Scatter plot with trend line")
            .yAxisMin(0)
            .series([
                AASeriesElement()
                    .type(.line)
                    .name("Trend Line")
                    .data(getTrendLine(data: dataset))
                    .marker(AAMarker()
                        .enabled(false))
                    .states(AAStates()
                        .hover(AAHover()
                            .lineWidth(0))
                    )
                    .enableMouseTracking(false),
                AASeriesElement()
                    .type(.scatter)
                    .name("Observations")
                    .data(dataset)
                    .marker(AAMarker()
                        .radius(4))
            ])
    }
    
    /**
     // Data retrieved from https://www.ssb.no/energi-og-industri/olje-og-gass/statistikk/sal-av-petroleumsprodukt/artikler/auka-sal-av-petroleumsprodukt-til-vegtrafikk
     Highcharts.chart('container', {
         title: {
             text: 'Sales of petroleum products March, Norway',
             align: 'left'
         },
         xAxis: {
             categories: [
                 'Jet fuel', 'Duty-free diesel', 'Petrol', 'Diesel', 'Gas oil'
             ]
         },
         yAxis: {
             title: {
                 text: 'Million liters'
             }
         },
         tooltip: {
             valueSuffix: ' million liters'
         },
         plotOptions: {
             series: {
                 borderRadius: '25%'
             }
         },
         series: [{
             type: 'column',
             name: '2020',
             data: [59, 83, 65, 228, 184]
         }, {
             type: 'column',
             name: '2021',
             data: [24, 79, 72, 240, 167]
         }, {
             type: 'column',
             name: '2022',
             data: [58, 88, 75, 250, 176]
         }, {
             type: 'line',
             step: 'center',
             name: 'Average',
             data: [47, 83.33, 70.66, 239.33, 175.66],
             marker: {
                 lineWidth: 2,
                 lineColor: Highcharts.getOptions().colors[3],
                 fillColor: 'white'
             }
         }, {
             type: 'pie',
             name: 'Total',
             data: [{
                 name: '2020',
                 y: 619,
                 color: Highcharts.getOptions().colors[0], // 2020 color
                 dataLabels: {
                     enabled: true,
                     distance: -50,
                     format: '{point.total} M',
                     style: {
                         fontSize: '15px'
                     }
                 }
             }, {
                 name: '2021',
                 y: 586,
                 color: Highcharts.getOptions().colors[1] // 2021 color
             }, {
                 name: '2022',
                 y: 647,
                 color: Highcharts.getOptions().colors[2] // 2022 color
             }],
             center: [75, 65],
             size: 100,
             innerSize: '70%',
             showInLegend: false,
             dataLabels: {
                 enabled: false
             }
         }]
     });
     */
    static func pieMixedLineMixedColumnChart() -> AAChartModel {
        AAChartModel()
            .title("Sales of petroleum products March, Norway")
//            .titleAlign(.left)
            .categories(["Jet fuel", "Duty-free diesel", "Petrol", "Diesel", "Gas oil"])
            .yAxisTitle("Million liters")
            .tooltipValueSuffix(" million liters")
            .series([
                AASeriesElement()
                    .type(.column)
                    .name("2020")
                    .data([59, 83, 65, 228, 184]),
                AASeriesElement()
                    .type(.column)
                    .name("2021")
                    .data([24, 79, 72, 240, 167]),
                AASeriesElement()
                    .type(.column)
                    .name("2022")
                    .data([58, 88, 75, 250, 176]),
                AASeriesElement()
                    .type(.line)
                    .step(.center)
                    .name("Average")
                    .data([47, 83.33, 70.66, 239.33, 175.66])
                    .marker(AAMarker()
                                .lineWidth(2)
                                .lineColor(AAColor.white)
                                .fillColor(AAColor.black)
                    ),
                AAPie()
                    .type(.pie)
//                    .name("Total")
                    .data([
                        ["2020", 619],
                        ["2021", 586],
                        ["2022", 647]
                    ])
                    .center([75, 65])
                    .size(100)
//                    .innerSize("70%")
                    .showInLegend(false)
                    .dataLabels(AADataLabels()
                                    .enabled(false)
                    )
            ])
    }
}
