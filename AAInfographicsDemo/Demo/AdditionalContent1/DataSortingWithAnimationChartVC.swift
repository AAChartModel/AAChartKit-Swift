//
//  DataSortingWithAnimationChartVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2020/6/27.
//  Copyright © 2020 An An. All rights reserved.
//

import UIKit

class DataSortingWithAnimationChartVC: UIViewController {
    public var chartType: AAChartType?
      public var step: Bool?
    open var aaChartModel: AAChartModel!
    open var aaChartView: AAChartView!
    private var timer: Timer?
    private var globalInt: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setUpAAChartView()
        setUpRefreshingChartTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        timer?.invalidate()
        timer = nil
    }
    
    private func setUpAAChartView() {
        aaChartView = AAChartView()
        let chartWidth = view.frame.size.width
        let chartHeight = view.frame.size.height
        aaChartView!.frame = CGRect(x: 0,
                                    y: 60,
                                    width: chartWidth,
                                    height: chartHeight)
        aaChartView!.contentHeight = view.frame.size.height - 80
        view.addSubview(aaChartView!)
        aaChartView!.scrollEnabled = false
        
        let aaOptions = configuraDataSortingChartOptions()
        aaChartView.aa_drawChartWithChartOptions(aaOptions)
    }
    

    private func configuraDataSortingChartOptions() -> AAOptions {
        let colorArr = [
            AAGradientColor.oceanBlue,
            AAGradientColor.sanguine,
            AAGradientColor.lusciousLime,
            AAGradientColor.purpleLake,
            AAGradientColor.freshPapaya,
            AAGradientColor.ultramarine,
            AAGradientColor.pinkSugar,
            AAGradientColor.lemonDrizzle,
            AAGradientColor.victoriaPurple,
            AAGradientColor.springGreens,
            AAGradientColor.mysticMauve,
            AAGradientColor.reflexSilver,
            AAGradientColor.newLeaf,
            AAGradientColor.cottonCandy,
            AAGradientColor.pixieDust,
            AAGradientColor.fizzyPeach,
            AAGradientColor.sweetDream,
            AAGradientColor.firebrick,
            AAGradientColor.wroughtIron,
            AAGradientColor.deepSea,
            AAGradientColor.coastalBreeze,
            AAGradientColor.eveningDelight,
        ];
        
        let aaOptions = AAOptions()
            .colors(colorArr)
            .chart(AAChart()
                .type(self.chartType)
        )
            .title(AATitle()
                .text("Popular Gradient Colors In Different Years"))
            .xAxis(AAXAxis()
                .visible(true)
                .reversed(true)
                .type("category")
        )
            .yAxis(AAYAxis()
                .visible(true)
                .gridLineWidth(0)
                .title((AATitle()
                    .text("Gradient Colors Hot")))
        )
            .legend(AALegend()
                .enabled(true)
                .align(.center)
                .layout(.vertical)
                .verticalAlign(.top)
                .y(10)
        )
            .tooltip(AATooltip()
                .enabled(true)
        )
            .plotOptions(AAPlotOptions()
                .series(AASeries()
                    .dataLabels(AADataLabels()
                        .enabled(true)
                        .inside(true)//DataLabels是否在条形图的长条内部
                        .style(AAStyle()
                            .color(AAColor.white)
                            .fontWeight(.bold)
                            .fontSize(11)
                            .textOutline("none")//文字轮廓描边
                    ))
            ))
            .series([
                AASeriesElement()
                    .name("2020 Year")
                    .colorByPoint(true)
                    .dataSorting(AADataSorting()
                        .enabled(true)
                        .matchByName(true))
                    .data(randomDataArray())
            ]);
        
        if (aaOptions.chart?.type == AAChartType.column.rawValue) {
            aaOptions.plotOptions?
                .column(AAColumn()
                    .pointPadding(0)
                    .groupPadding(0.005))
                .series?
                .dataLabels?.verticalAlign(.bottom)
        } else if (aaOptions.chart?.type == AAChartType.bar.rawValue) {
            aaOptions.plotOptions?
                .bar(AABar()
                    .pointPadding(0)
                    .groupPadding(0.005))
                .series?
                .dataLabels?
                .align(.left)//DataLabels水平对齐位置
        } else if (aaOptions.chart?.type == AAChartType.scatter.rawValue) {
            aaOptions.plotOptions?.series?
                .marker(AAMarker()
                    .radius(15))
                .dataLabels?.verticalAlign(.middle);
        }
        
        return aaOptions;
    }
    
    private func randomDataArray() -> [Any] {
        let gradientColorNamesArr = [
             "oceanBlue",
             "sanguine",
             "lusciousLime",
             "purpleLake",
             "freshPapaya",
             "ultramarine",
             "pinkSugar",
             "lemonDrizzle",
             "victoriaPurple",
             "springGreens",
             "mysticMauve",
             "reflexSilver",
             "newLeaf",
             "cottonCandy",
             "pixieDust",
             "fizzyPeach",
             "sweetDream",
             "firebrick",
             "wroughtIron",
             "deepSea",
             "coastalBreeze",
             "eveningDelight",
         ]
        
        let dataArr = NSMutableArray()
        for  element: String in gradientColorNamesArr {
            let dataElementDic = NSMutableDictionary()
            dataElementDic["name"] = element
            dataElementDic["y"] = (arc4random() % 250 + 20)
            dataArr.add(dataElementDic)
        }
        
        return dataArr as! [Any]
    }
    

    private func setUpRefreshingChartTimer() {
         //延时3秒执行
         let time: TimeInterval = 2.0
         DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
             print("⌚️⌚️⌚️⌚️⌚️ \(time) 秒后输出")
             self.timer = Timer.scheduledTimer(timeInterval: time,
                                               target: self,
                                               selector: #selector(self.timerRepeatWork),
                                               userInfo: nil,
                                               repeats: true)
             self.timer?.fire()
         }
     }
     
     @objc func timerRepeatWork() {
        print("⌚️⌚️⌚️⌚️⌚️ 定时器第 \(self.globalInt) 次输出")

        self.globalInt += 1

        let year = "\(2020 + self.globalInt) Year"
        let aaOptions = AAOptions()
        .series([
        AASeriesElement()
            .name(year)
            .data(self.randomDataArray())
        ])
        
        self.aaChartView.aa_updateChart(options: aaOptions, redraw: true)
     }
    
}
