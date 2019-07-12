//
//  ChartSeriesHideOrShowVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2018/6/17.
//  Copyright © 2018年 An An. All rights reserved.
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

class ChartSeriesHideOrShowVC: UIViewController {
    public var chartType: AAChartType?
    public var step: Bool?
    private var aaChartView: AAChartView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SeriesHideOrShow"
        view.backgroundColor = .white
        
        setUpSegmentedControls()
        setUpTheHideChartSeriesSwitch()
        
        setUpTheAAChartView()
    }
    
   private func setUpTheAAChartView() {
        let chartViewWidth  = view.frame.size.width
        let chartViewHeight = view.frame.size.height - 220

        aaChartView = AAChartView()
        aaChartView?.frame = CGRect(x: 0,
                                    y: 60,
                                    width: chartViewWidth,
                                    height: chartViewHeight)
        ///AAChartViewd的内容高度(内容高度默认和 AAChartView 等高)
        aaChartView?.contentHeight = chartViewHeight - 20
        aaChartView?.scrollEnabled = false
        view.addSubview(aaChartView!)
        
        var  aaChartModel = AAChartModel()
            .chartType(chartType!)//图形类型
            .animationType(.bounce)//图形渲染动画类型为"bounce"
            .title("CHART SERIES HIDE OR SHOW")//图形标题
            .subtitle("2020/08/08")//图形副标题
            .dataLabelEnabled(false)//是否显示数字
            .stacking(.normal)
            .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])
        
        if chartType == .column || chartType == .bar {
            aaChartModel = aaChartModel.series([
                AASeriesElement()
                    .name("Tokyo")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
                    .toDic()!,
                AASeriesElement()
                    .name("New York")
                    .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5])
                    .toDic()!,
                AASeriesElement()
                    .name("Berlin")
                    .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0])
                    .toDic()!,
                AASeriesElement()
                    .name("London")
                    .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8])
                    .toDic()!,])
        } else {
            aaChartModel = aaChartModel
                .markerRadius(0)//折线连接点半径长度,为0时相当于没有折线连接点
                .series([
                AASeriesElement()
                    .name("Tokyo Hot")
                    .data([0.45, 0.43, 0.50, 0.55, 0.58, 0.62, 0.83, 0.39, 0.56, 0.67, 0.50, 0.34, 0.50, 0.67, 0.58, 0.29, 0.46, 0.23, 0.47, 0.46, 0.38, 0.56, 0.48, 0.36])
                    .step(step!)
                    .toDic()!,
                AASeriesElement()
                    .name("Berlin Hot")
                    .data([0.38, 0.31, 0.32, 0.32, 0.64, 0.66, 0.86, 0.47, 0.52, 0.75, 0.52, 0.56, 0.54, 0.60, 0.46, 0.63, 0.54, 0.51, 0.58, 0.64, 0.60, 0.45, 0.36, 0.67])
                    .step(step!)
                    .toDic()!,
                AASeriesElement()
                    .name("New York Hot")
                    .data([0.46, 0.32, 0.53, 0.58, 0.86, 0.68, 0.85, 0.73, 0.69, 0.71, 0.91, 0.74, 0.60, 0.50, 0.39, 0.67, 0.55, 0.49, 0.65, 0.45, 0.64, 0.47, 0.63, 0.64])
                    .step(step!)
                    .toDic()!,
                AASeriesElement()
                    .name("London Hot")
                    .data([0.60, 0.51, 0.52, 0.53, 0.64, 0.84, 0.65, 0.68, 0.63, 0.47, 0.72, 0.60, 0.65, 0.74, 0.66, 0.65, 0.71, 0.59, 0.65, 0.77, 0.52, 0.53, 0.58, 0.53])
                    .step(step!)
                    .toDic()!,
                ])
        }
        
        aaChartView?.aa_drawChartWithChartModel(aaChartModel)
    }
    
   private func setUpSegmentedControls() {
        let segmentedNamesArray = [
            ["hide One",
             "hide Two",
             "hide Three",
             "hide Four",
             ],
            ["show One",
             "show Two",
             "show Three",
             "show Four",
             ]
        ];
        let typeLabelNameArr = ["HIDE CHART SERIES",
                                "SHOW CHART SERIES"];
        
        for  i in 0..<segmentedNamesArray.count {
            let segment = UISegmentedControl.init(items: segmentedNamesArray[i])
            segment.frame = CGRect(x: 20,
                                   y: 40.0 * CGFloat(i) + (view.frame.size.height - 145),
                                   width: view.frame.size.width-40,
                                   height: 20)
            segment.tag = i;
            segment.tintColor = .red
            segment.selectedSegmentIndex = 0
            segment.addTarget(self,
                              action: #selector(segmentDidSelected(segmentedControl:)),
                              for: .valueChanged)
            view.addSubview(segment)
            
            let subLabel = UILabel()
            subLabel.font = UIFont(name: "EuphemiaUCAS", size: 12.0)
            subLabel.frame = CGRect(x: 20,
                                    y: 40 * CGFloat(i) + (view.frame.size.height - 165),
                                    width: view.frame.size.width-40,
                                    height: 20)
            subLabel.text = typeLabelNameArr[i]
            subLabel.backgroundColor = .clear
            subLabel.textColor = .lightGray
            view.addSubview(subLabel)
        }
    }
    
    @objc func segmentDidSelected(segmentedControl:UISegmentedControl) {
        if segmentedControl.tag == 0 {
            aaChartView?.aa_hideTheSeriesElementContentWithSeriesElementIndex(segmentedControl.selectedSegmentIndex)
        } else {
            aaChartView?.aa_showTheSeriesElementContentWithSeriesElementIndex(segmentedControl.selectedSegmentIndex)
        }
    }
    
   private func setUpTheHideChartSeriesSwitch() {
        let i = 0
        let uiSwitch = UISwitch()
        uiSwitch.frame = CGRect(x: 100 * CGFloat(i) + 20,
                                y: view.frame.size.height - 70,
                                width: 100,
                                height: 20)
        uiSwitch.isOn = false
        uiSwitch.addTarget(self,
                           action: #selector(switchDidChange(switchView:)),
                           for:.valueChanged)
        view.addSubview(uiSwitch)
        
        let subLabel = UILabel()
        subLabel.font = UIFont(name: "EuphemiaUCAS", size: 10)
        subLabel.frame = CGRect(x: 100 * CGFloat(i) + 20,
                                y:view.frame.size.height - 45,
                                width: 200,
                                height: 35)
        subLabel.text = "Hide Chart Whole Series Content"
        subLabel.backgroundColor = .clear
        subLabel.textColor = .lightGray
        view .addSubview(subLabel)
    }

    @objc func switchDidChange(switchView:UISwitch) {
        aaChartView?.isSeriesHidden = switchView.isOn
    }

}
