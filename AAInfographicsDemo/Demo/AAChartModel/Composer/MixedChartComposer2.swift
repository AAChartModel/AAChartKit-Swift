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
}
