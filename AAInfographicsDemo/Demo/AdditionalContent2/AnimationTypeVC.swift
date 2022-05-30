//
//  ViewController.swift
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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 *********************************************************************************
 
 */

import UIKit
import AAInfographics

@available(iOS 11.0, macCatalyst 13.1, *)
class AnimationTypeVC: UIViewController {
    public var chartType: AAChartType?
    public var step: Bool?
    private var chartAnimationTypeStringArr = [String]()
    private var chartAnimationTypeArr = [AAChartAnimationType]()
    private var aaChartModel: AAChartModel?
    private var aaChartView: AAChartView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        chartAnimationTypeStringArr = [
            "linear",
            "easeInQuad",
            "easeOutQuad",
            "easeInOutQuad",
            "easeInCubic",
            "easeOutCubic",
            "easeInOutCubic",
            "easeInQuart",
            "easeOutQuart",
            "easeInOutQuart",
            "easeInQuint",
            "easeOutQuint",
            "easeInOutQuint",
            "easeInSine",
            "easeOutSine",
            "easeInOutSine",
            "easeInExpo",
            "easeOutExpo",
            "easeInOutExpo",
            "easeInCirc",
            "easeOutCirc",
            "easeInOutCirc",
            "easeOutBounce",
            "easeInBack",
            "easeOutBack",
            "easeInOutBack",
            "elastic",
            "swingFromTo",
            "swingFrom",
            "swingTo",
            "bounce",
            "bouncePast",
            "easeFromTo",
            "easeFrom",
            "easeTo",
        ]
        
        chartAnimationTypeArr = [
            .linear,
            .easeInQuad,
            .easeOutQuad,
            .easeInOutQuad,
            .easeInCubic,
            .easeOutCubic,
            .easeInOutCubic,
            .easeInQuart,
            .easeOutQuart,
            .easeInOutQuart,
            .easeInQuint,
            .easeOutQuint,
            .easeInOutQuint,
            .easeInSine,
            .easeOutSine,
            .easeInOutSine,
            .easeInExpo,
            .easeOutExpo,
            .easeInOutExpo,
            .easeInCirc,
            .easeOutCirc,
            .easeInOutCirc,
            .easeOutBounce,
            .easeInBack,
            .easeOutBack,
            .easeInOutBack,
            .elastic,
            .swingFromTo,
            .swingFrom,
            .swingTo,
            .bounce,
            .bouncePast,
            .easeFromTo,
            .easeFrom,
            .easeTo,
        ]
        
        setUpTheAnimationTypeTableView()
        setUpTheAAChartView()
    }
    
   private func setUpTheAnimationTypeTableView() {
        let animationTypeTableView = UITableView()
        animationTypeTableView.frame = CGRect(x: view.frame.size.width - 115,
                                              y: 0,
                                              width: 115,
                                              height: view.frame.size.height - 60)
        animationTypeTableView.delegate = self
        animationTypeTableView.dataSource = self
        animationTypeTableView.backgroundColor = .white
        view.addSubview(animationTypeTableView)
    }
    
   private func setUpTheAAChartView() {
        let chartViewWidth  = view.frame.size.width - 115
        let chartViewHeight = view.frame.size.height - 60
        
        aaChartView = AAChartView()
        aaChartView?.frame = CGRect(x: 0,
                                    y: 60,
                                    width: chartViewWidth,
                                    height: chartViewHeight)
        aaChartView?.isScrollEnabled = false
        ///AAChartViewd的内容高度(内容高度默认和 AAChartView 等高)
        aaChartView?.contentHeight = chartViewHeight - 20
        view.addSubview(aaChartView!)

        aaChartModel = AAChartModel()
            .chartType(chartType!)//图形类型
            .title("都市天气")//图形标题
            .subtitle("2020年08月08日")//图形副标题
            .dataLabelsEnabled(false)//是否显示数字
            .markerRadius(5)//折线连接点半径长度,为0时相当于没有折线连接点
            .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])
            .animationDuration(3000)

        
        if chartType == .area || chartType == .areaspline {
          aaChartModel?
            .markerRadius(0)
            .series([
                AASeriesElement()
                    .name("Tokyo")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
                    .step(step!)
                    ,
                ])
        } else {
            let gradientColorDic = AAGradientColor.linearGradient(
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
                    ])
        }
        
        aaChartView?.aa_drawChartWithChartModel(aaChartModel!)
    }
}

extension AnimationTypeVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chartAnimationTypeStringArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cell"
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell =  UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        let cellTitle = chartAnimationTypeStringArr[indexPath.row]
        cell.textLabel?.text = cellTitle
        cell.textLabel?.font = .systemFont(ofSize: 11)
        cell.textLabel?.textColor = .darkGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        aaChartModel?.animationType(chartAnimationTypeArr[indexPath.row])
        aaChartView?.aa_refreshChartWholeContentWithChartModel(aaChartModel!)
    }
}


