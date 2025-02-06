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
    
    public lazy var aaChartModel: AAChartModel = {
        let model = AAChartModel()
        return model
    }()

    public lazy var aaChartView: AAChartView = {
        let chartView = AAChartView()
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.isScrollEnabled = false//Disable chart content scrolling
        chartView.isClearBackgroundColor = true
        chartView.delegate = self as AAChartViewDelegate
        return chartView
    }()

    // New UIStackView containers
    private lazy var segmentedStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "SegmentedStackView"
        return stackView
    }()

    private lazy var switchStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "SwitchStackView"
        return stackView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = kRGBColorFromHex(rgbValue: 0x22324c)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.barTintColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = kRGBColorFromHex(rgbValue: 0x22324c)
        title = chartType.map { $0.rawValue }
        
        setUpTheStackedSegmentControls()
        setUpTheStackedSwitches()
        setUpAAChartView()
    }
    
    private func setUpAAChartView() {
        view.addSubview(aaChartView)
        // Chart view constraints
        NSLayoutConstraint.activate([
            aaChartView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            aaChartView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            aaChartView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            aaChartView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -220)
        ])
        
        aaChartModel = BasicChartComposer.configureBasicChartModel(chartType: chartType)
        aaChartModel = configureTheStyleForDifferentTypeChart(chartType: chartType)
        aaChartView.aa_drawChartWithChartModel(aaChartModel)
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
    
    // Replacing manual frames with vertical UIStackView for segmented controls and their labels.
    private func setUpTheStackedSegmentControls() {
        let segmentedNamesArr: [[String]]
        let typeLabelNamesArr: [String]
        
        if chartType == .column || chartType == .bar {
            segmentedNamesArr = [
                ["No stacking", "Normal stacking", "Percent stacking"],
                ["Square corners", "Soft corners", "Rounded corners"]
            ]
            typeLabelNamesArr = [
                "Stacking Type Selection",
                "Corners Style Type Selection"
            ]
        } else {
            segmentedNamesArr = [
                ["No stacking", "Normal stacking", "Percent stacking"],
                ["◉ ◉ ◉", "■ ■ ■", "◆ ◆ ◆", "▲ ▲ ▲", "▼ ▼ ▼"]
            ]
            typeLabelNamesArr = [
                "Stacking Type Selection",
                "Marker Symbols Type Selection"
            ]
        }
        
        view.addSubview(segmentedStackView)
        
        for i in 0..<segmentedNamesArr.count {
            // Create a label for the control type.
            let subLabel = UILabel()
            subLabel.font = UIFont(name: "EuphemiaUCAS", size: 12.0)
            subLabel.text = typeLabelNamesArr[i]
            subLabel.textColor = .lightGray
            
            // Create UISegmentedControl for the given items.
            let segment = UISegmentedControl(items: segmentedNamesArr[i])
            segment.tintColor = .red
            segment.selectedSegmentIndex = 0
            segment.tag = i
            segment.addTarget(self, action: #selector(segmentDidSelected(segmentedControl:)), for: .valueChanged)
            
            // Create a vertical stack for label and segment.
            let singleStack = UIStackView(arrangedSubviews: [subLabel, segment])
            singleStack.axis = .vertical
            singleStack.spacing = 4
            segmentedStackView.addArrangedSubview(singleStack)
        }
        
        // Constrain the segmentedStackView at the bottom of the view above the switch controls.
        NSLayoutConstraint.activate([
            segmentedStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            segmentedStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -110)
        ])
    }
    
    // Replacing manual frames with horizontal UIStackView for switches and their labels.
    private func setUpTheStackedSwitches() {
        var nameArr = [
            "xReversed",
            "yReversed",
            "xInverted",
            "Polarization",
            "DataShow"
        ]
        if chartType != .column && chartType != .bar {
            nameArr.append("HideMarker")
        }
        
        view.addSubview(switchStackView)
        
        for i in 0..<nameArr.count {
            // Create a switch.
            let uiSwitch = UISwitch()
            uiSwitch.isOn = false
            uiSwitch.tag = i
            uiSwitch.onTintColor = .red
            uiSwitch.addTarget(self,
                               action: #selector(switchDidChange(switchView:)),
                               for: .valueChanged)
            
            // Create label.
            let subLabel = UILabel()
            subLabel.font = UIFont(name: "EuphemiaUCAS", size: nameArr.count == 5 ? 10.0 : 9.0)
            subLabel.text = nameArr[i]
            subLabel.textColor = .lightGray
            subLabel.textAlignment = .left
            
            // Create a vertical stack for switch and label.
            let controlStack = UIStackView(arrangedSubviews: [uiSwitch, subLabel])
            controlStack.axis = .vertical
            controlStack.spacing = 4
            switchStackView.addArrangedSubview(controlStack)
        }
        
        // Constrain switchStackView at the bottom of the view.
        NSLayoutConstraint.activate([
            switchStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            switchStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            switchStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            switchStackView.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    @objc func segmentDidSelected(segmentedControl: UISegmentedControl) {
        let selectedSegmentIndex = segmentedControl.selectedSegmentIndex
        
        switch segmentedControl.tag {
        case 0:
            let stackingArr = [
                AAChartStackingType.none,
                .normal,
                .percent
            ]
            aaChartModel.stacking(stackingArr[selectedSegmentIndex])
            
        case 1:
            if chartType == .column || chartType == .bar {
                let borderRadiusArr = [1, 10, "50%"] as [Any]
                let borderRadius = borderRadiusArr[selectedSegmentIndex]
                if borderRadius is Int {
                    if let borderRadius = borderRadius as? Int {
                        aaChartModel.borderRadius(Float(borderRadius))
                    }
                } else {
                    aaChartModel.borderRadius(borderRadius as! String)
                }
            } else {
                let symbolArr = [
                    AAChartSymbolType.circle,
                    .square,
                    .diamond,
                    .triangle,
                    .triangleDown
                ]
                aaChartModel.markerSymbol(symbolArr[selectedSegmentIndex])
            }
            
        default: break
        }
        aaChartView.aa_refreshChartWholeContentWithChartModel(aaChartModel)
    }
    
    @objc func switchDidChange(switchView: UISwitch) {
        let isOn = switchView.isOn
        
        switch switchView.tag {
        case 0: aaChartModel.xAxisReversed(isOn)
        case 1: aaChartModel.yAxisReversed(isOn)
        case 2: aaChartModel.inverted(isOn)
        case 3: aaChartModel.polar(isOn)
        case 4: aaChartModel.dataLabelsEnabled(isOn)
        case 5: aaChartModel.markerRadius(isOn ? 0 : 5)
        default: break
        }
        
        aaChartView.aa_refreshChartWholeContentWithChartModel(aaChartModel)
    }
    
    private func kRGBColorFromHex(rgbValue: Int) -> UIColor {
       UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
               green: CGFloat((rgbValue & 0xFF00) >> 8) / 255.0,
               blue: CGFloat(rgbValue & 0xFF) / 255.0,
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

