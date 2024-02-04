//
// Created by AnAn on 2024/1/31.
// Copyright (c) 2024 An An. All rights reserved.
//

import AAInfographics

class CustomStyleForScatterChartComposer {

    //refer to online sample https://jshare.com.cn/github/highcharts/highcharts/tree/master/samples/highcharts/plotoptions/series-marker-symbol/
    //https://github.com/AAChartModel/AAChartKit/issues/703
    static func customScatterChartMarkerSymbolContent() -> AAChartModel {
        let element1 = AASeriesElement()
            .name("Predefined symbol")
            .data([0.45, 0.43, 0.50, 0.55, 0.58, 0.62, 0.83, 0.39, 0.56, 0.67, 0.50, 0.34, 0.50, 0.67, 0.58, 0.29, 0.46, 0.23, 0.47, 0.46, 0.38, 0.56, 0.48, 0.36])
            .marker(AAMarker()
                .symbol(predefinedSymbol1))

        let element2 = AASeriesElement()
            .name("Image symbol")
            .data([0.38, 0.31, 0.32, 0.32, 0.64, 0.66, 0.86, 0.47, 0.52, 0.75, 0.52, 0.56, 0.54, 0.60, 0.46, 0.63, 0.54, 0.51, 0.58, 0.64, 0.60, 0.45, 0.36, 0.67])
            .marker(AAMarker()
                .symbol(imageSymbol))

        let element3 = AASeriesElement()
            .name("Base64 symbol (*)")
            .data([0.46, 0.32, 0.53, 0.58, 0.86, 0.68, 0.85, 0.73, 0.69, 0.71, 0.91, 0.74, 0.60, 0.50, 0.39, 0.67, 0.55, 0.49, 0.65, 0.45, 0.64, 0.47, 0.63, 0.64])
            .marker(AAMarker()
                .symbol(base64Symbol))

        let element4 = AASeriesElement()
            .name("Custom symbol")
            .data([0.60, 0.51, 0.52, 0.53, 0.64, 0.84, 0.65, 0.68, 0.63, 0.47, 0.72, 0.60, 0.65, 0.74, 0.66, 0.65, 0.71, 0.59, 0.65, 0.77, 0.52, 0.53, 0.58, 0.53])
            .marker(AAMarker()
                .symbol(predefinedSymbol2))

        return AAChartModel()
            .chartType(.scatter)
            .yAxisGridLineWidth(0)
            .stacking(.normal)
            .markerRadius(8)
            .dataLabelsEnabled(false)
            .series([element1, element2, element3, element4])
    }

    //https://github.com/AAChartModel/AAChartKit/issues/1294
    static func drawLineMixedScatterChartWithPointsCoordinates2() -> AAChartModel {
        let dataArr = [
            [0, 200],
            [0, 300],
            [0, 400],
            [1, 100],
            [2, 120],
            [3, 130]
        ]

        return AAChartModel()
            .chartType(.scatter)
            .title("Draw Line Chart With Points Coordinates")
            .markerSymbol(.circle)
            .markerSymbolStyle(.borderBlank)
            .markerRadius(8)
            .colorsTheme([AAColor.red])
            .series([
                AASeriesElement()
                    .type(.line)
                    .enableMouseTracking(false)
                    .marker(AAMarker()
                        .enabled(false))
                    .states(AAStates()
                        .inactive(AAInactive()
                            .enabled(false)))
                    .data(dataArr),
                AASeriesElement()
                    .name("Red Dot")
                    .type(.scatter)
                    .data(dataArr),
            ])
    }
}
