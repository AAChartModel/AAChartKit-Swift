//
//  ScrollingUpdateDataVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/11/9.
//  Copyright © 2019 An An. All rights reserved.
//

import UIKit

class ScrollingUpdateDataVC: UIViewController {
    public var chartType: AAChartType?
    public var step: Bool?
    private var aaChartModel: AAChartModel?
    private var aaChartView: AAChartView?
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
        
        view.backgroundColor = .white
        title = "ONLY REFRESH CHART DATA"
        
        setUpTheAAChartView()
        setUpRefreshingChartTimer()
    }

    private func setUpTheAAChartView() {
        let chartViewWidth  = view.frame.size.width
        let chartViewHeight = view.frame.size.height - 60
        
        aaChartView = AAChartView()
        aaChartView?.frame = CGRect(x: 0,
                                    y: 60,
                                    width: chartViewWidth,
                                    height: chartViewHeight)
        aaChartView?.scrollEnabled = false
        ///AAChartViewd的内容高度(内容高度默认和 AAChartView 等高)
        aaChartView?.contentHeight = chartViewHeight - 20
        view.addSubview(aaChartView!)
        
        
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
        
        aaChartModel = AAChartModel()
            .chartType(chartType!)//图形类型
            .title("")//图形标题
            .dataLabelsEnabled(false)//是否显示数字
            .colorsTheme([
                gradientColorDic1,
                gradientColorDic2,
            ])
            .legendEnabled(true)
            .yAxisVisible(false)
            .xAxisVisible(false)
            .series(self.configureSeriesDataArray())



        if aaChartModel?.chartType == .column
            || aaChartModel?.chartType == .bar {
            if aaChartModel?.chartType == .column {
                aaChartModel?
                    .borderRadius(10)
            } else {
                aaChartModel?
                    .borderRadius(50)
            }
            
            aaChartModel?.stacking(.normal)
        }  else if chartType == .scatter {
            aaChartModel?
                .markerRadius(13)
                .markerSymbol(.circle)
                .markerSymbolStyle(.innerBlank)
        } else {
            aaChartModel?
                .markerRadius(7)
                .markerSymbolStyle(.borderBlank)
            
            if step == true {
                for element: AASeriesElement in (aaChartModel?.series as! [AASeriesElement]) {
                    element.step(true)
                }
            }
        }

        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel!)
        
        if aaChartModel?.chartType == .column {
            aaOptions.plotOptions?.column?
                .groupPadding(0.0)
//                .pointPadding(0.0)
        } else if aaChartModel?.chartType == .bar {
            aaOptions.plotOptions?.bar?
                .groupPadding(0.0)
                .pointPadding(0.0)
            
        }
        aaOptions.tooltip?.shared(false)
        
        aaChartView?.aa_drawChartWithChartOptions(aaOptions)
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
        
        if self.chartType != .bar && self.chartType != .column {
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
