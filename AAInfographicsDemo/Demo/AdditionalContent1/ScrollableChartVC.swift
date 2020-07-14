//
//  ScrollableChartVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2020/4/24.
//  Copyright © 2020 An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 *********************************************************************************
 *
 *  🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit-Swift/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 *********************************************************************************
 */

import UIKit

class ScrollableChartVC: AABaseChartVC {
    public var step: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    override func chartConfigurationWithSelectedChartType(_ selectedChartType: AAChartType) -> Any? {
        let gradientColorDic1 = AAGradientColor.linearGradient(
            direction: .toBottom,
            startColor: "#00BFFF",
            endColor: "#00FA9A"//颜色字符串设置支持十六进制类型和 rgba 类型
        )
        
        let gradientColorDic2 = AAGradientColor.linearGradient(
            direction: .toBottom,
            startColor: "rgba(138,43,226,1)",
            endColor: "rgba(30,144,255,1)"//颜色字符串设置支持十六进制类型和 rgba 类型
        )
        
        let aaChartModel = AAChartModel()
            .chartType(selectedChartType)
            .title("")
            .stacking(.normal)
            .dataLabelsEnabled(false)
            .colorsTheme([gradientColorDic1,gradientColorDic2])
            .scrollablePlotArea(AAScrollablePlotArea()
                .minWidth(3000)
                .scrollPositionX(1))
            .series(configureSeriesDataArray())
        
        if selectedChartType == .bar {
            aaChartModel.scrollablePlotArea(
                AAScrollablePlotArea()
                    .minHeight(6000)
                    .scrollPositionY(1))
        }
        return aaChartModel
    }
    
    private func configureSeriesDataArray() -> [AASeriesElement] {
        var randomNumArrA = [Any]()
        var randomNumArrB = [Any]()
        var y1 = 0.0
        var y2 = 0.0
        
        let Q = Int(arc4random() % 38)
        
        for  x in 0 ..< 100 {
            y1 = sin(Double(Q) * (Double(x) * Double.pi / 180)) + Double(x) * 2.0 * 0.01 - 1
            y2 = cos(Double(Q) * (Double(x) * Double.pi / 180)) + Double(x) * 3.0 * 0.01 - 1
            randomNumArrA.append(y1)
            randomNumArrB.append(y2)
        }
        
        let chartSeriesArr = [
            AASeriesElement()
                .name("2019")
                .lineWidth(5)
                .step(self.step ?? false)
                .data(randomNumArrA),
            AASeriesElement()
                .name("2018")
                .lineWidth(5)
                .step(self.step ?? false)
                .data(randomNumArrB)
        ]
        return chartSeriesArr
    }
}
