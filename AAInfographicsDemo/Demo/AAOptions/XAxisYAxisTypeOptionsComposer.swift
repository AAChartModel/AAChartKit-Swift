//
//  XAxisYAxisTypeOptionsComposer.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/11/25.
//  Copyright © 2024 An An. All rights reserved.
//

import AAInfographics

class XAxisYAxisTypeOptionsComposer: NSObject {
    /**
     
     Highcharts.chart('container', {
         title: {
             text: 'Global temperature changes from 1880 to 2021',
             align: 'left'
         },
         accessibility: {
             description: `
                 A chart of global temperature change from 1880 to 2021.
                 It employs two series, one column and one line,
                 to convey the same data at different resolutions.
                 There is only one column per thirty years,
                 but the line series have a datapoint per year.
             `
         },
         series: [{
             type: 'column',
             name: 'Mean per thirty years',
             data: JSON.parse(document.getElementById('columnData').textContent),
             pointRange: 30 * 365 * 24 * 36e5,
             groupPadding: 0,
             pointPadding: 0,
             pointPlacement: -0.5,
             tooltip: {
                 // Subtract 30 years from the year to get the start of the period
                 headerFormat: (
                     '<span style="font-size: 0.8em;">' +
                     '{subtract (point.x:%Y) 30} - {point.x:%Y}</span><br>'
                 )
             }
         }, {
             name: 'Annual mean',
             data: JSON.parse(document.getElementById('lineData').textContent),
             accessibility: {
                 description: `
                     A data series illustrating the same data as the first,
                     but at different time intervals
                 `
             }
         }],
         tooltip: {
             valueSuffix: '°C',
             valueDecimals: 2
         },
         yAxis: {
             accessibility: {
                 description: 'temperature'
             },
             minPadding: 0,
             maxPadding: 0,
             labels: {
                 format: '{value:.1f}°C'
             },
             name: 'Temperature change',
             title: {
                 text: 'Temp anomaly (compared to 1951-1980 avg.)'
             }
         },
         xAxis: {
             endOnTick: true,
             type: 'datetime'
         }
     });
     */
    static func datatimeTypeLineAndColumnMixedChart() -> AAOptions {
        AAOptions()
            .title(AATitle()
                .text("Global temperature changes from 1880 to 2021")
                .align(.left))
//            .accessibility(AAAccessibility()
//                .description("""
//                    A chart of global temperature change from 1880 to 2021.
//                    It employs two series, one column and one line,
//                    to convey the same data at different resolutions.
//                    There is only one column per thirty years,
//                    but the line series have a datapoint per year.
//                """))
            .plotOptions(AAPlotOptions()
                .column(AAColumn()
                    .pointRange(30 * 365 * 24 * 36e5)
                    .groupPadding(0)
                ))
            .series([
                AASeriesElement()
                    .type(.column)
                    .name("Mean per thirty years")
                    .data([
                        [ -1262304000000, -0.16 ],
                        [ -315619200000,  -0.02 ],
                        [ 631152000000,    0.45 ],
                        [ 1577836800000,    1.02]
                    ])
//                    .pointRange(30 * 365 * 24 * 36e5)
//                    .groupPadding(0)
                    .pointPadding(0)
                    .pointPlacement(-0.5)
                    .tooltip(AATooltip()
                        .headerFormat(
                            ("<span style=\"font-size: 0.8em;\">" +
                             "{subtract (point.x:%Y) 30} - {point.x:%Y}</span><br>").aa_toPureHTMLString()
                        )),
                AASeriesElement()
                    .name("Annual mean")
                    .data([
                        [ -2840140800000, -0.17 ],
                        [ -2808518400000, -0.09 ],
                        [ -2776982400000, -0.11 ],
                        [ -2745446400000, -0.17 ],
                        [ -2713910400000, -0.28 ],
                        [ -2682288000000, -0.34 ],
                        [ -2650752000000, -0.32 ],
                        [ -2619216000000, -0.37 ],
                        [ -2587680000000, -0.17 ],
                        [ -2556057600000, -0.11 ],
                        [ -2524521600000, -0.35 ],
                        [ -2492985600000, -0.22 ],
                        [ -2461449600000, -0.28 ],
                        [ -2429827200000, -0.31 ],
                        [ -2398291200000, -0.31 ],
                        [ -2366755200000, -0.23 ],
                        [ -2335219200000, -0.11 ],
                        [ -2303596800000, -0.11 ],
                        [ -2272060800000, -0.27 ],
                        [ -2240524800000, -0.18 ],
                        [ -2208988800000, -0.08 ],
                        [ -2177452800000, -0.16 ],
                        [ -2145916800000, -0.28 ],
                        [ -2114380800000, -0.37 ],
                        [ -2082844800000, -0.47 ],
                        [ -2051222400000, -0.26 ],
                        [ -2019686400000, -0.22 ],
                        [ -1988150400000, -0.39 ],
                        [ -1956614400000, -0.43 ],
                        [ -1924992000000, -0.48 ],
                        [ -1893456000000, -0.44 ],
                        [ -1861920000000, -0.45 ],
                        [ -1830384000000, -0.37 ],
                        [ -1798761600000, -0.35 ],
                        [ -1767225600000, -0.15 ],
                        [ -1735689600000, -0.14 ],
                        [ -1704153600000, -0.36 ],
                        [ -1672531200000, -0.46 ],
                        [ -1640995200000, -0.29 ],
                        [ -1609459200000, -0.28 ],
                        [ -1577923200000, -0.27 ],
                        [ -1546300800000, -0.19 ],
                        [ -1514764800000, -0.28 ],
                        [ -1483228800000, -0.26 ],
                        [ -1451692800000, -0.27 ],
                        [ -1420070400000, -0.22 ],
                        [ -1388534400000,  -0.1 ],
                        [ -1356998400000, -0.22 ],
                        [ -1325462400000,  -0.2 ],
                        [ -1293840000000, -0.36 ],
                        [ -1262304000000, -0.16 ],
                        [ -1230768000000, -0.09 ],
                        [ -1199232000000, -0.16 ],
                        [ -1167609600000, -0.28 ],
                        [ -1136073600000, -0.12 ],
                        [ -1104537600000,  -0.2 ],
                        [ -1073001600000, -0.14 ],
                        [ -1041379200000, -0.02 ],
                        [ -1009843200000,     0 ],
                        [ -978307200000,  -0.02 ],
                        [ -946771200000,   0.13 ],
                        [ -915148800000,   0.19 ],
                        [ -883612800000,   0.07 ],
                        [ -852076800000,   0.09 ],
                        [ -820540800000,   0.21 ],
                        [ -788918400000,   0.09 ],
                        [ -757382400000,  -0.07 ],
                        [ -725846400000,  -0.02 ],
                        [ -694310400000,   -0.1 ],
                        [ -662688000000,  -0.11 ],
                        [ -631152000000,  -0.17 ],
                        [ -599616000000,  -0.07 ],
                        [ -568080000000,   0.01 ],
                        [ -536457600000,   0.08 ],
                        [ -504921600000,  -0.13 ],
                        [ -473385600000,  -0.14 ],
                        [ -441849600000,  -0.19 ],
                        [ -410227200000,   0.05 ],
                        [ -378691200000,   0.06 ],
                        [ -347155200000,   0.03 ],
                        [ -315619200000,  -0.02 ],
                        [ -283996800000,   0.06 ],
                        [ -252460800000,   0.03 ],
                        [ -220924800000,   0.06 ],
                        [ -189388800000,   -0.2 ],
                        [ -157766400000,  -0.11 ],
                        [ -126230400000,  -0.06 ],
                        [ -94694400000,   -0.02 ],
                        [ -63158400000,   -0.08 ],
                        [ -31536000000,    0.05 ],
                        [ 0,               0.03 ],
                        [ 31536000000,    -0.08 ],
                        [ 63072000000,     0.01 ],
                        [ 94694400000,     0.16 ],
                        [ 126230400000,   -0.07 ],
                        [ 157766400000,   -0.01 ],
                        [ 189302400000,    -0.1 ],
                        [ 220924800000,    0.18 ],
                        [ 252460800000,    0.07 ],
                        [ 283996800000,    0.17 ],
                        [ 315532800000,    0.26 ],
                        [ 347155200000,    0.32 ],
                        [ 378691200000,    0.14 ],
                        [ 410227200000,    0.31 ],
                        [ 441763200000,    0.16 ],
                        [ 473385600000,    0.12 ],
                        [ 504921600000,    0.18 ],
                        [ 536457600000,    0.32 ],
                        [ 567993600000,    0.39 ],
                        [ 599616000000,    0.27 ],
                        [ 631152000000,    0.45 ],
                        [ 662688000000,    0.41 ],
                        [ 694224000000,    0.22 ],
                        [ 725846400000,    0.23 ],
                        [ 757382400000,    0.31 ],
                        [ 788918400000,    0.45 ],
                        [ 820454400000,    0.33 ],
                        [ 852076800000,    0.47 ],
                        [ 883612800000,    0.61 ],
                        [ 915148800000,    0.38 ],
                        [ 946684800000,    0.39 ],
                        [ 978307200000,    0.54 ],
                        [ 1009843200000,   0.63 ],
                        [ 1041379200000,   0.62 ],
                        [ 1072915200000,   0.54 ],
                        [ 1104537600000,   0.68 ],
                        [ 1136073600000,   0.64 ],
                        [ 1167609600000,   0.66 ],
                        [ 1199145600000,   0.54 ],
                        [ 1230768000000,   0.66 ],
                        [ 1262304000000,   0.73 ],
                        [ 1293840000000,   0.61 ],
                        [ 1325376000000,   0.65 ],
                        [ 1356998400000,   0.68 ],
                        [ 1388534400000,   0.75 ],
                        [ 1420070400000,    0.9 ],
                        [ 1451606400000,   1.02 ],
                        [ 1483228800000,   0.93 ],
                        [ 1514764800000,   0.85 ],
                        [ 1546300800000,   0.98 ],
                        [ 1577836800000,   1.02 ],
                        [ 1609459200000,   0.85 ]
                    ])
//                    .accessibility(AAAccessibility()
//                        .description("""
//                            A data series illustrating the same data as the first,
//                            but at different time intervals
//                        """))
            ])
            .tooltip(AATooltip()
                .valueSuffix("°C")
                .valueDecimals(2))
            .yAxis(AAYAxis()
//                .accessibility(AAAccessibility()
//                    .description("temperature"))
                .minPadding(0)
                .maxPadding(0)
                .labels(AALabels()
                    .format("{value:.1f}°C"))
//                .name("Temperature change")
                .title(AATitle()
                    .text("Temp anomaly (compared to 1951-1980 avg.)"))
            )
            .xAxis(AAXAxis()
                .endOnTick(true)
                .type(.datetime))
                
    }

}
