//
//  AdvancedUpdatingFeatureVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2020/8/11.
//  Copyright © 2020 An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 * 🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

import UIKit
import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class AdvancedUpdatingFeatureVC: BasicChartVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func segmentDidSelected(segmentedControl: UISegmentedControl) {
        var options: AAObject? = nil
        let selectedSegmentIndex = segmentedControl.selectedSegmentIndex
        
        switch segmentedControl.tag {
        case 0:
            let stackingArr = [
                AAChartStackingType.none,
                .normal,
                .percent
            ]
            let stackingType = stackingArr[selectedSegmentIndex]
            let aaPlotOptions = AAPlotOptions()
                .series(AASeries()
                    .stacking(stackingType))
            options = aaPlotOptions
            
        case 1:
            if chartType == .column || chartType == .bar {
                let borderRadiusArr: [Float] = [0, 10, 100]
                let borderRadius = borderRadiusArr[selectedSegmentIndex]
                var aaPlotOptions: AAPlotOptions? = nil
                if self.chartType == .column {
                    aaPlotOptions = AAPlotOptions()
                        .column(AAColumn()
                            .borderRadius(borderRadius))
                } else {
                    aaPlotOptions = AAPlotOptions()
                        .bar(AABar()
                            .borderRadius(borderRadius))
                }
                options = aaPlotOptions
                
            } else {
                let symbolArr = [
                    AAChartSymbolType.circle,
                    .square,
                    .diamond,
                    .triangle,
                    .triangleDown
                ]
                let markerSymbol = symbolArr[selectedSegmentIndex]
                let aaPlotOptions = AAPlotOptions()
                    .series(AASeries()
                        .marker(AAMarker()
                            .symbol(markerSymbol.rawValue)))
                options = aaPlotOptions
            }
            
        default: break
        }
        aaChartView.aa_updateChart(options: options!, redraw: true)
    }
    
    
    override func switchDidChange(switchView: UISwitch) {
        var options: AAObject? = nil
        let isOn = switchView.isOn
        
        switch switchView.tag {
        case 0:
            let aaXAxis = AAXAxis()
                .reversed(isOn)
            options = aaXAxis
            
        case 1:
            let aaYAxis = AAYAxis()
                .reversed(isOn)
            options = aaYAxis
            
        case 2: if self.aaChartModel.chartType == AAChartType.bar {
            print("⚠️⚠️⚠️inverted is useless for Bar Chart")
        }
            let aaChart = AAChart()
                .inverted(isOn)
                .polar(self.aaChartModel.polar)
            options = aaChart
            
        case 3:
            self.aaChartModel.polar = isOn
            let aaChart = AAChart()
                .polar(isOn)
                .inverted(self.aaChartModel.inverted)
            options = aaChart
            
            if self.aaChartModel.chartType == AAChartType.column {
                if self.aaChartModel.polar == true {
                    options = AAOptions()
                        .chart(aaChart)
                        .plotOptions(AAPlotOptions()
                            .column(AAColumn()
                                .pointPadding(0)
                                .groupPadding(0.005)))
                } else {
                    options = AAOptions()
                        .chart(aaChart)
                        .plotOptions(AAPlotOptions()
                            .column(AAColumn()
                                .pointPadding(0.1)
                                .groupPadding(0.2)))
                }
            } else if self.aaChartModel.chartType == AAChartType.bar {
                if self.aaChartModel.polar == true {
                    options = AAOptions()
                        .chart(aaChart)
                        .plotOptions(AAPlotOptions()
                            .bar(AABar()
                                .pointPadding(0)
                                .groupPadding(0.005)))
                } else {
                    options = AAOptions()
                        .chart(aaChart)
                        .plotOptions(AAPlotOptions()
                            .bar(AABar()
                                .pointPadding(0.1)
                                .groupPadding(0.2)))
                }
            }
            
        case 4:
            let aaPlotOptions = AAPlotOptions()
                .series(AASeries()
                    .dataLabels(AADataLabels()
                        .enabled(isOn)))
            options = aaPlotOptions
            
        case 5:
            let aaMarker = isOn ?
            AAMarker()
                .enabled(false)
            :
            AAMarker()
                .enabled(true)
                .radius(5)
            
            let aaPlotOptions = AAPlotOptions()
                .series(AASeries()
                    .marker(aaMarker))
            options = aaPlotOptions
            
        default:
            break
        }
        
        aaChartView.aa_updateChart(options: options!, redraw: true)
    }
    
}
