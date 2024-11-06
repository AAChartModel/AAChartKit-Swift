//
//  ViewController.swift
//  AAChartKit-Swift
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

@available(iOS 10.0, macCatalyst 13.1, *)
class BasicChartVC: UIViewController {
    public var chartType: AAChartType!
    public var step: Bool?
    public var aaChartModel: AAChartModel!
    public var aaChartView: AAChartView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.barTintColor = kRGBColorFromHex(rgbValue: 0x22324c)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.navigationBar.barTintColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = kRGBColorFromHex(rgbValue: 0x22324c)
        title = chartType.map { $0.rawValue }
        
        setUpTheSwitches()
        setUpTheSegmentControls()
        
        setUpAAChartView()
    }
    
    private func setUpAAChartView() {
        aaChartView = AAChartView()
        let chartViewWidth = view.frame.size.width
        let chartViewHeight = view.frame.size.height - 220
        aaChartView!.frame = CGRect(x: 0,
                                    y: 60,
                                    width: chartViewWidth,
                                    height: chartViewHeight)
        view.addSubview(aaChartView!)
        aaChartView!.isScrollEnabled = false//Disable chart content scrolling
        aaChartView!.isClearBackgroundColor = true
        aaChartView!.delegate = self as AAChartViewDelegate
        
        aaChartModel = BasicChartComposer.configureBasicChartModel(chartType: chartType)
    
        aaChartModel = configureTheStyleForDifferentTypeChart(chartType: chartType)
        
        aaChartView!.aa_drawChartWithChartModel(aaChartModel!)
    }
    
    private func configureTheStyleForDifferentTypeChart(chartType: AAChartType) -> AAChartModel {
        if (chartType == .area && step == true)
            || (chartType == .line && step == true) {
            return BasicChartComposer.configureStepAreaChartAndStepLineChartStyle(aaChartModel)
        } else if chartType == .column
            || chartType == .bar {
            return BasicChartComposer.configureColumnChartAndBarChartStyle(aaChartModel)
        } else if chartType == .area
            || chartType == .areaspline {
            return BasicChartComposer.configureAreaChartAndAreasplineChartStyle(aaChartModel)
        } else if chartType == .line
            || chartType == .spline {
            return BasicChartComposer.configureLineChartAndSplineChartStyle(aaChartModel)
        }
       return AAChartModel()
    }
    
   private func setUpTheSegmentControls() {
        let segmentedNamesArr:[[String]]
        let typeLabelNamesArr:[String]
        
        if chartType == .column
            || chartType == .bar {
            segmentedNamesArr = [
                ["No stacking",
                 "Normal stacking",
                 "Percent stacking"],
                ["Square corners",
                 "Soft corners",
                 "Rounded corners",
                ]
            ]
            typeLabelNamesArr = [
                "Stacking Type Selection",
                "Corners Style Type Selection"
            ]
        } else {
            segmentedNamesArr = [
                ["No stacking",
                 "Normal stacking",
                 "Percent stacking"],
                ["◉ ◉ ◉",
                 "■ ■ ■",
                 "◆ ◆ ◆",
                 "▲ ▲ ▲",
                 "▼ ▼ ▼"]
            ]
            typeLabelNamesArr = [
                "Stacking Type Selection",
                "marker Symbols Type Selection"
            ]
        }
        
        for  i in 0 ..< segmentedNamesArr.count {
            let segment = UISegmentedControl.init(items: segmentedNamesArr[i] as [Any])
            segment.frame = CGRect(x: 20,
                                   y: 40.0 * CGFloat(i) + (view.frame.size.height - 145),
                                   width: view.frame.size.width - 40,
                                   height: 20)
            segment.tag = i
            segment.tintColor = .red
            segment.selectedSegmentIndex = 0
            segment.addTarget(self,
                              action: #selector(segmentDidSelected(segmentedControl:)),
                              for:.valueChanged)
            view.addSubview(segment)
            
            let subLabel = UILabel()
            subLabel.font = UIFont(name: "EuphemiaUCAS", size: 12.0)
            subLabel.frame = CGRect(x: 20,
                                    y: 40 * CGFloat(i) + (view.frame.size.height - 165),
                                    width: view.frame.size.width - 40,
                                    height: 20)
            subLabel.text = typeLabelNamesArr[i] as String
            subLabel.backgroundColor = .clear
            subLabel.textColor = .lightGray
            view.addSubview(subLabel)
        }
    }
    
    @objc func segmentDidSelected(segmentedControl:UISegmentedControl) {
        let selectedSegmentIndex = segmentedControl.selectedSegmentIndex
        
        switch segmentedControl.tag {
        case 0:
            let stackingArr = [
                AAChartStackingType.none,
                .normal,
                .percent
            ]
            aaChartModel!.stacking(stackingArr[selectedSegmentIndex])
            
        case 1:
            if chartType == .column || chartType == .bar {
                let borderRadiusArr = [1, 10, "50%"] as [Any]
                let borderRadius = borderRadiusArr[selectedSegmentIndex]
                if borderRadius is Int {
                    aaChartModel!.borderRadius(borderRadius as! Float)
                } else {
                    aaChartModel!.borderRadius(borderRadius as! String)
                }
            } else {
                let symbolArr = [
                    AAChartSymbolType.circle,
                    .square,
                    .diamond,
                    .triangle,
                    .triangleDown
                ]
                aaChartModel!.markerSymbol(symbolArr[selectedSegmentIndex])
            }
            
        default: break
        }
        aaChartView!.aa_refreshChartWholeContentWithChartModel(aaChartModel!)
    }
    
    private func setUpTheSwitches() {
        var nameArr = [
            "xReversed",
            "yReversed",
            "xInverted",
            "Polarization",
            "DataShow"
        ]
        let switchWidth: CGFloat
        
        if chartType == .column || chartType == .bar {
            switchWidth = (view.frame.size.width - 40) / 5
        } else {
            nameArr.append("HideMarker")
            switchWidth = (view.frame.size.width - 40) / 6
        }
        
        for  i in 0 ..< nameArr.count {
            let uiSwitch = UISwitch()
            uiSwitch.frame = CGRect(x: switchWidth * CGFloat(i) + 20,
                                    y: view.frame.size.height - 70,
                                    width: switchWidth,
                                    height: 20)
            uiSwitch.isOn = false
            uiSwitch.tag = i
            uiSwitch.onTintColor = .red
            uiSwitch.addTarget(self,
                               action: #selector(switchDidChange(switchView:)),
                               for: .valueChanged)
            view.addSubview(uiSwitch)
            
            let subLabel = UILabel()
            subLabel.font = UIFont(name: "EuphemiaUCAS", size: nameArr.count == 5 ? 10.0 : 9.0)
            subLabel.frame = CGRect(x: switchWidth * CGFloat(i) + 20,
                                    y: view.frame.size.height - 45,
                                    width: switchWidth,
                                    height: 35)
            subLabel.text = nameArr[i] as String
            subLabel.backgroundColor = .clear
            subLabel.textColor = .lightGray
            view.addSubview(subLabel)
        }
    }
    
    @objc func switchDidChange(switchView:UISwitch) {
        let isOn = switchView.isOn
        
        switch switchView.tag {
        case 0: aaChartModel!.xAxisReversed(isOn)
        case 1: aaChartModel!.yAxisReversed(isOn)
        case 2: aaChartModel!.inverted(isOn)
        case 3: aaChartModel!.polar(isOn)
        case 4: aaChartModel!.dataLabelsEnabled(isOn)
        case 5: aaChartModel!.markerRadius(isOn ? 0 : 5)//Polyline connection point radius length.A value of 0 is equivalent to no polyline connection point.
        default:
            break
        }
        
        aaChartView!.aa_refreshChartWholeContentWithChartModel(aaChartModel!)
    }
    
   private func kRGBColorFromHex(rgbValue: Int) -> UIColor {
       UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,
               green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,
               blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,
               alpha: 1.0)
    }
}

@available(macCatalyst 13.1, *)
extension BasicChartVC: AAChartViewDelegate {
    open func aaChartViewDidFinishLoad(_ aaChartView: AAChartView) {
       print("🚀🚀🚀, AAChartView Did Finished Load!!!")
    }
    
    open func aaChartView(_ aaChartView: AAChartView, clickEventMessage: AAClickEventMessageModel) {
        print(
            """

            clicked point series element name: \(clickEventMessage.name ?? "")
            🖱🖱🖱WARNING!!!!!!!!!!!!!!!!!!!! Click Event Message !!!!!!!!!!!!!!!!!!!! WARNING🖱🖱🖱
            ------------------------------------------------------------------------------------------
            user finger moved over!!!,get the move over event message: {
                category : \(clickEventMessage.category ?? "")
                index : \(clickEventMessage.index ?? 0)
                name : \(clickEventMessage.name ?? "")
                offset : \(clickEventMessage.offset ?? [String: Any]())
                x : \(clickEventMessage.x ?? 0.0)
                y : \(clickEventMessage.y ?? 0.0)
            }
            ------------------------------------------------------------------------------------------

            
            """
        )
    }

    open func aaChartView(_ aaChartView: AAChartView, moveOverEventMessage: AAMoveOverEventMessageModel) {
        print(
            """
            
            selected point series element name: \(moveOverEventMessage.name ?? "")
            👌👌👌👌👌WARNING!!!!!!!!!!!!!!!!!! Touch Event Message !!!!!!!!!!!!!!!!! WARNING👌👌👌👌👌
            | ------------------------------------------------------------------------------------------
            | user finger moved over!!!,get the move over event message: {
            |     category : \(moveOverEventMessage.category ?? "")
            |     index : \(moveOverEventMessage.index ?? 0)
            |     name : \(moveOverEventMessage.name ?? "")
            |     offset : \(moveOverEventMessage.offset ?? [String: Any]())
            |     x : \(moveOverEventMessage.x ?? 0.0)
            |     y : \(moveOverEventMessage.y ?? 0.0)
            | }
            | ------------------------------------------------------------------------------------------
            
            
            """
        )
    }
}

