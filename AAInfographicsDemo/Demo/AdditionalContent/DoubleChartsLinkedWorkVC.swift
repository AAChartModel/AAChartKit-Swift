//
//  DoubleChartsLinkedWorkVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/6/29.
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
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 *********************************************************************************
 
 */

import UIKit

class DoubleChartsLinkedWorkVC: UIViewController, AAChartViewDelegate {
    
    private var aaChartView1 = AAChartView()
    private var aaChartView2 = AAChartView()
    private var aaChartModel2 = AAChartModel()
    private var colorsArr: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUpTheAAChartViewOne()
        setUpTheAAChartViewTwo()
    }
    
   private func setUpTheAAChartViewOne() {
        let chartViewWidth  = view.frame.size.width
        let screenHeight = view.frame.size.height - 60
        
        aaChartView1.frame = CGRect(x: 0,
                                   y: 60,
                                   width: chartViewWidth,
                                   height: screenHeight / 2)
        aaChartView1.scrollEnabled = false
        aaChartView1.delegate = self
        aaChartView1.contentHeight = (screenHeight / 2) - 20
        view.addSubview(aaChartView1)
        
        colorsArr = ["#fe117c","#ffc069","#06caf4","#7dffc0","#1e90ff","#ef476f","#ffd066","#04d69f","#25547c",]
        
        let  aaChartModel1 = AAChartModel()
            .chartType(.column)//图形类型
            .animationType(.bounce)//图形渲染动画类型为"bounce"
            .title("")//图形标题
            .subtitle("")//图形副标题
            .dataLabelsEnabled(false)//是否显示数字
            .legendEnabled(false)
            .colorsTheme(colorsArr!)
            .touchEventEnabled(true)
            .tooltipEnabled(false)
            .borderRadius(3)
            .yAxisReversed(true)
            .categories(colorsArr!)
            .series([
                AASeriesElement()
                    .colorByPoint(true)
                    .data(getRandomNumbersArr(numbers: 9))
                    ,
                ])
        
        let aaOptions = AAOptionsConstructor.configureAAOptions(aaChartModel: aaChartModel1)
        let aaXAxis = aaOptions["xAxis"] as! NSMutableDictionary
        let aaCrosshair = [
            "width":1,
            "color":AAColor.black,
            "dashStyle":AALineDashStyleType.longDashDot.rawValue,
            ] as [String: Any]
        aaXAxis["crosshair"] = aaCrosshair
        
        aaChartView1.aa_drawChartWithChartOptions(aaOptions)
    }
    
   private func setUpTheAAChartViewTwo() {
        let chartViewWidth  = view.frame.size.width
        let screenHeight = view.frame.size.height - 60
        
        aaChartView2.frame = CGRect(x:0,
                                    y:screenHeight / 2 + 60,
                                    width:chartViewWidth,
                                    height:screenHeight / 2)
        aaChartView2.scrollEnabled = false
        view.addSubview(aaChartView2)
        
        aaChartModel2
            .chartType(.area)//图形类型
            .animationType(.easeOutQuart)//图形渲染动画类型为"bounce"
            .title("")//图形标题
            .subtitle("")//图形副标题
            .dataLabelsEnabled(false)//是否显示数字
            .markerRadius(4)//折线连接点半径长度,为0时相当于没有折线连接点
            .symbolStyle(.innerBlank)
            .legendEnabled(false)
            .tooltipEnabled(false)
            .categories([
                "孤<br>岛<br>危<br>机",
                "使<br>命<br>召<br>唤",
                "荣<br>誉<br>勋<br>章",
                "狙<br>击<br>精<br>英",
                "神<br>秘<br>海<br>域",
                "最<br>后<br>生<br>还<br>者",
                "巫<br>师<br>3<br>狂<br>猎",
                "对<br>马<br>之<br>魂",
                "蝙<br>蝠<br>侠<br>阿<br>甘<br>骑<br>士<br> .",
                "地<br>狱<br>边<br>境",
                "闪<br>客",
                "忍<br>者<br>之<br>印"
                ])
            .series([
                AASeriesElement()
                    .color("#fe117c")
                    .data(getRandomNumbersArr(numbers: 12))
                    ,
                ])
        
        aaChartView2.aa_drawChartWithChartModel(aaChartModel2)
        
    }
    
    func aaChartView(_ aaChartView: AAChartView, moveOverEventMessage: AAMoveOverEventMessageModel) {
        let selectedColor: String = colorsArr?[moveOverEventMessage.index ?? 0] ?? "#ff000"
        let data = getRandomNumbersArr(numbers: 12)
        aaChartModel2.series([
            AASeriesElement()
                .name("Tokyo")
                .lineWidth(3.5)
                .color(selectedColor)
                .data(data)
                ,
            ])
        aaChartView2.aa_refreshChartWholeContentWithChartModel(aaChartModel2)
    }
    
   private func getRandomNumbersArr(numbers: Int) -> [Float] {
        let randomNumArr = NSMutableArray()
        for _ in 0..<numbers {
            print(Float(arc4random() % 100))
            randomNumArr.add(Float(arc4random() % 1000 + 500))
        }
        return randomNumArr as! [Float]
    }


}
