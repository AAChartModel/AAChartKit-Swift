//
//  ScrollingUpdateDataVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/11/9.
//  Copyright © 2019 An An. All rights reserved.
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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 *********************************************************************************
 */

import UIKit
import AAInfographics

@available(iOS 11.0, macCatalyst 13.1, *)
class ScrollingUpdateDataVC: AABaseChartVC {
    public var step: Bool?
    
    private var aaChartModel: AAChartModel?
    private var timer: Timer?
    private var updateTimes: Int = 0
    
    private var globalX:Int = 0
    private var globalQ:Int = 0

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        timer?.invalidate()
        timer = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpRefreshingChartTimer()
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
            .chartType(selectedChartType)//图形类型
            .dataLabelsEnabled(false)//是否显示数字
            .colorsTheme([
                gradientColorDic1,
                gradientColorDic2,
            ])
            .legendEnabled(true)
            .yAxisVisible(false)
            .xAxisVisible(false)
            .series(configureSeriesDataArray())
        
        self.aaChartModel = aaChartModel
        
        if aaChartModel.chartType == .column
            || aaChartModel.chartType == .bar {
            if aaChartModel.chartType == .column {
                aaChartModel
                    .borderRadius(10)
            } else {
                aaChartModel
                    .borderRadius(50)
            }
            
            aaChartModel.stacking(.normal)
        }  else if selectedChartType == .scatter {
            aaChartModel
                .markerRadius(13)
                .markerSymbol(.circle)
                .markerSymbolStyle(.innerBlank)
        } else {
            aaChartModel
                .markerRadius(7)
                .markerSymbolStyle(.borderBlank)
            
            if step == true {
                for element: AASeriesElement in (aaChartModel.series as! [AASeriesElement]) {
                    element.step(true)
                }
            }
        }
        
        
        let aaOptions = aaChartModel.aa_toAAOptions()
        
        if aaChartModel.chartType == .column {
            aaOptions.plotOptions?.column?
                .groupPadding(0.0)
              //.pointPadding(0.0)
        } else if aaChartModel.chartType == .bar {
            aaOptions.plotOptions?.bar?
                .groupPadding(0.0)
                .pointPadding(0.0)
            
        }
        aaOptions.tooltip?.shared(false)
        return aaOptions
    }
    
   private func setUpRefreshingChartTimer() {
        //延时3秒执行
        let time: TimeInterval = 2.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
            print("1 秒后输出")
            self.timer = Timer.scheduledTimer(timeInterval: 0.5,
                                              target: self,
                                              selector: #selector(self.onlyRefreshTheChartData),
                                              userInfo: nil,
                                              repeats: true)
            self.timer?.fire()
        }
    }
    
    @objc func onlyRefreshTheChartData() {
        updateTimes += 1
        print("⏲定时器正在刷新, 刷新次数为: \(updateTimes) ")

        aaChartView?.aa_addPointsToChartSeriesArray(optionsArr: configurePointsOptionsArray())
    }
    
    private func configureSeriesDataArray() -> [AASeriesElement] {
        var randomNumArrA = [Any]()
        var randomNumArrB = [Any]()
        var y1 = 0.0
        var y2 = 0.0
        globalQ = Int(arc4random() % 38)
        globalX = 29
        for  x in 0 ..< globalX {
            y1 = sin(Double(globalQ) * (Double(x) * Double.pi / 180)) + Double(x) * 2.0 * 0.01 - 1
            y2 = cos(Double(globalQ) * (Double(x) * Double.pi / 180)) + Double(x) * 3.0 * 0.01 - 1
            randomNumArrA.append(y1)
            randomNumArrB.append(y2)
        }
        
        
        let chartSeriesArr = [
            AASeriesElement()
                .name("2019")
                .lineWidth(5)
                .data(randomNumArrA),
            AASeriesElement()
                .name("2018")
                .lineWidth(5)
                .data(randomNumArrB)
        ]
        return chartSeriesArr
    }
    
    private func configurePointsOptionsArray() -> [Any] {
        
        let y0 = sin(Double(globalQ) * (Double(globalX) * Double.pi / 180)) + Double(globalX) * 2.0 * 0.01 - 1
        let y1 = cos(Double(globalQ) * (Double(globalX) * Double.pi / 180)) + Double(globalX) * 3.0 * 0.01 - 1
        
        var options0: Any = 0
        var options1: Any = 0
        
        if aaChartModel?.chartType != .bar && aaChartModel?.chartType != .column {
            options0 = AADataElement()
                .y(Float(y0))
                .dataLabels(AADataLabels()
                    .enabled(true)
                    .color("deepskyblue")
                    .format("{y:.2f} 英镑"))
                .marker(AAMarker()
                    .radius(8)//曲线连接点半径
                    .symbol(AAChartSymbolType.circle.rawValue)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                    .fillColor(AAColor.white)//点的填充色(用来设置折线连接点的填充色)
                    .lineWidth(5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                    //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
                    .lineColor("deepskyblue")
            )
            
            options1 = AADataElement()
                .y(Float(y1))
                .dataLabels(AADataLabels()
                    .enabled(true)
                    .color("red")
                    .format("{y:.2f} 美元"))
                .marker(AAMarker()
                    .radius(8)
                    .symbol((AAChartSymbolType.diamond.rawValue))
                    .fillColor(AAColor.white)
                    .lineWidth(5)
                    .lineColor("red")
            )
        } else {
            options0 = y0
            options1 = y1
        }
        
        globalX = globalX + 1
        
        return [options0, options1]
    }
    
}
