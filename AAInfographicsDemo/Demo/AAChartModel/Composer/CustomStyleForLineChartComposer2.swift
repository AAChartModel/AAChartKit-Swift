//
//  CustomStyleForLineChartComposer2.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/10/28.
//  Copyright © 2025 An An. All rights reserved.
//

import AAInfographics

class CustomStyleForLineChartComposer2: NSObject {

     
    // https://github.com/AAChartModel/AAChartCore-Kotlin/issues/260
   static func colorfulMarkerWithZonesChart() -> AAChartModel {
        // 生成平滑波浪数据
        func generateWaveData(amplitude: Double, phase: Double, step: Double, count: Int, noise: Double = 0.0) -> [Any] {
            var data = [Any]()
            for i in 0..<count {
                let y = amplitude * sin((Double(i) * step) + phase) + 120
                let noisyY = y + (Double.random(in: 0...1) - 0.5) * noise
                data.append(noisyY)
            }
            return data
        }

        // 色系分区
        let zones = [
            AAZonesElement()
                .value(80.0)
                .color("#25547c"),
            AAZonesElement()
                .value(110.0)
                .color("#1e90ff"),
            AAZonesElement()
                .value(140.0)
                .color("#ffd066"),
            AAZonesElement()
                .value(170.0)
                .color("#04d69f"),
            AAZonesElement()
                .color("#ef476f")
        ]

       return AAChartModel()
            .chartType(.line)
            .title("⚡️高饱和度波浪图 — 实心与空心 Marker 对比")
            .legendEnabled(true)
            .tooltipEnabled(true)
            .series([
                AASeriesElement()
                    .name("实心数据")
                    .data(generateWaveData(amplitude: 85.0, phase: 0.0, step: 0.25, count: 60, noise: 4.0))
                    .zones(zones)
                    .zoneAxis("y")
                    .marker(AAMarker()
                        .symbol(.circle)
                        .radius(6)
                        .lineWidth(1)
                    ),
                AASeriesElement()
                    .name("空心数据")
                    .data(generateWaveData(amplitude: 85.0, phase: .pi / 2, step: 0.25, count: 60, noise: 4.0))
                    .zones(zones)
                    .zoneAxis("y")
                    .marker(AAMarker()
                        .symbol(.diamond)
                        .fillColor("transparent")
                        .lineColor(NSNull())
                        .radius(7)
                        .lineWidth(2)
                    )
                    .dashStyle(.dashDot)
            ])
    }

}
