//
//  OnlyRefreshChartDataVC.swift
//  AAInfographicsDemo
//
//  Created by An An  on 17/4/18.
//  Copyright © 2017年 An An . All rights reserved.
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

class OnlyRefreshChartDataVC: UIViewController {
    public var chartType: AAChartType?
    public var step: Bool?
    private var aaChartModel: AAChartModel?
    private var aaChartView: AAChartView?
    private var timer: Timer?
    
    private var myBasicValue:Int?
    
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
        
        aaChartModel = AAChartModel()
            .chartType(chartType!)//图形类型
            .title("CYBERPUNK")//图形标题
            .subtitle("2077/08/08")//图形副标题
            .dataLabelEnabled(false)//是否显示数字
            .markerRadius(5)//折线连接点半径长度,为0时相当于没有折线连接点
            .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])
            .stacking(.normal)
        
        if chartType == .area
            || chartType == .areaspline {
            let gradientColorDic = AAGradientColor.gradientColorDictionary(
                direction: .toBottom,
                startColor: "#00BFFF",
                endColor: "#00FA9A"//颜色字符串设置支持十六进制类型和 rgba 类型
            )
            
            aaChartModel?
                .markerRadius(0)
                .series([
                    AASeriesElement()
                        .name("Tokyo")
                        .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
                        .color(gradientColorDic)
                        .step(step!)
                        ,
                    AASeriesElement()
                        .name("New York")
                        .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5])
                        .step(step!)
                        ,
                    ])
            aaChartModel?.symbolStyle(.innerBlank)
        } else {
            let gradientColorDic = AAGradientColor.gradientColorDictionary(
                direction: .toBottom,
                startColor: "rgba(138,43,226,1)",
                endColor: "rgba(30,144,255,1)"//颜色字符串设置支持十六进制类型和 rgba 类型
            )
            
            aaChartModel?
                .series([
                    AASeriesElement()
                        .name("Tokyo")
                        .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8])
                        .color(gradientColorDic)
                        .step(step!)
                        ,
                    AASeriesElement()
                        .name("Berlin")
                        .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0])
                        .step(step!)
                        ,
                    ])
            if step! != true {
                aaChartModel?.symbolStyle(.borderBlank)
                .markerRadius(7)
            }
        }
        
        aaChartView?.aa_drawChartWithChartModel(aaChartModel!)
    }
    
   private func setUpRefreshingChartTimer() {
        //延时3秒执行
        let time: TimeInterval = 2.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
            print("1 秒后输出")
            self.timer = Timer.scheduledTimer(timeInterval: 1,
                                              target: self,
                                              selector: #selector(self.onlyRefreshTheChartData),
                                              userInfo: nil,
                                              repeats: true)
            self.timer?.fire()
        }
    }
    
    @objc func onlyRefreshTheChartData() {
        let randomNumArrA = NSMutableArray()
        let randomNumArrB = NSMutableArray()
        for  _ in 0..<12 {
            let randomA = arc4random()%20
            randomNumArrA.add(randomA)
            let randomB = arc4random()%15
            randomNumArrB.add(randomB)
        }
        
        let chartSeriesArr = [
            AASeriesElement()
                .name("2017")
                .data(randomNumArrA as! [Any])
                .toDic()!,
            AASeriesElement()
                .name("2018")
                .data(randomNumArrB as! [Any])
                .toDic()!
        ]
        
        aaChartView?.aa_onlyRefreshTheChartDataWithChartModelSeries(chartSeriesArr)
    }
    
}
    

 
 

