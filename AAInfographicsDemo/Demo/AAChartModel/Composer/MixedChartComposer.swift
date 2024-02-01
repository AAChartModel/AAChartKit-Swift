//
// Created by AnAn on 2024/2/1.
// Copyright (c) 2024 An An. All rights reserved.
//

import AAInfographics

class MixedChartComposer {

    //https://github.com/AAChartModel/AAChartKit-Swift/issues/389
    static func configureMultiLevelStopsArrGradientColorAreasplineMixedLineChart() -> AAChartModel {
        var randomNumArrA = [Any]()
        var randomNumArrB = [Any]()
        var y1 = 0.0
        var y2 = 0.0
        let Q = Int(arc4random() % 50)
        let range = 129
        for  x in 0 ..< range {
            y1 = sin(Double(Q) * (Double(x) * Double.pi / 180)) + Double(x) * 2.0 * 0.01
            y2 = cos(Double(Q) * (Double(x) * Double.pi / 180)) + Double(x) * 3.0 * 0.01
            randomNumArrA.append(y1)
            randomNumArrB.append(y2)
        }

        let redStopsArr = [
            [0.0, AARgba(255, 0, 0, 1.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
            [0.2, AARgba(255, 0, 0, 0.2)],
            [0.4, AARgba(255, 0, 0, 0.1)],
            [0.6, AARgba(255, 0, 0, 0.05)],
            [0.8, AARgba(255, 0, 0, 0.01)],
            [1.0, AAColor.clear]
        ]


        let gradientRedColorDic = AAGradientColor.linearGradient(
                direction: .toBottom,
                stops: redStopsArr
        )

        return AAChartModel()
            .chartType(.areaspline)
            .stacking(.normal)
            .backgroundColor(AAColor.black)
            .colorsTheme(["#1e90ff","#04d69f","#ef476f","#ffd066",])
            .dataLabelsEnabled(false)
            .markerSymbol(.circle)
            .markerRadius(5)
            .markerSymbolStyle(.innerBlank)
            .yAxisGridLineWidth(0.5)
            .xAxisGridLineWidth(0.5)
            .series([
                AASeriesElement()
                    .name("2017")
                    .type(.spline)
                    .lineWidth(6)
                    .data(randomNumArrA),
                AASeriesElement()
                    .name("2018")
                    .type(.spline)
                    .lineWidth(6)
                    .data(randomNumArrB),
                AASeriesElement()
                    .name("2020")
                    .fillColor(gradientRedColorDic)
                    .lineWidth(6)
                    .threshold(-4)
                    .data(randomNumArrA),
            ])
    }

}
