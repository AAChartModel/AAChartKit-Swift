//
//  CustomAnyEventCallback.swift
//  AAInfographicsDemo
//
//  Created by Admin on 2022/5/31.
//  Copyright © 2022 An An. All rights reserved.
//

import UIKit
import AAInfographics
import WebKit

//https://github.com/AAChartModel/AAChartKit-Swift/issues/356
//https://developer.mozilla.org/zh-CN/docs/Web/API/Touch_events
class CustomTouchEndEventCallbackVC: UIViewController {
    let kUserContentMessageNameChartTouchEnd = "touchEnd"

    private lazy var aaChartView: AAChartView = {
        let chartView = AAChartView()
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.isScrollEnabled = false // Disable chart content scrolling
        chartView.delegate = self as AAChartViewDelegate
        return chartView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configureChartView()
        configureChartViewCustomEventMessageHandler()
        
        let aaOptions = topRoundedCornersStackingColumnChart()
        aaChartView.aa_drawChartWithChartOptions(aaOptions)
    }
    

    private func configureChartView() {
        view.addSubview(aaChartView)
        
        NSLayoutConstraint.activate([
            aaChartView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            aaChartView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            aaChartView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            aaChartView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureChartViewCustomEventMessageHandler() {
        aaChartView.configuration.userContentController.add(AALeakAvoider.init(delegate: self), name: kUserContentMessageNameChartTouchEnd)
    }
    
    private func topRoundedCornersStackingColumnChart() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.column)
            .stacking(.normal)
            .title("Top Rounded Corners Stacking Column Chart")
            .colorsTheme(["#fe117c", "#ffc069", "#06caf4",])
            .series([
                AASeriesElement()
                    .name("Tokyo Hot")
                    .borderRadiusTopLeft("50%")
                    .borderRadiusTopRight("50%")
                    .data([2.10, 2.54, 2.78, 3.62, 4.41, 4.09, 3.83, 4.47, 4.20, 3.94, 3.80, 3.58, 3.19, 4.30, 3.69, 3.52, 3.02, 3.30]),
                
                AASeriesElement()
                    .name("Berlin Hot")
                    .data([1.56, 1.91, 2.45, 3.87, 3.24, 4.90, 4.61, 4.10, 4.17, 3.85, 4.17, 3.46, 3.46, 3.55, 3.50, 4.13, 2.58, 2.28]),
                
                AASeriesElement()
                    .name("Beijing Hot")
                    .data([1.16, 1.67, 2.64, 2.86, 3.00, 3.21, 4.14, 4.07, 3.68, 3.11, 3.41, 3.25, 3.32, 3.07, 3.92, 3.05, 2.18, 3.24]),
            ])
        
        let aaOptions = aaChartModel.aa_toAAOptions()
        
        return aaOptions
    }
}

extension CustomTouchEndEventCallbackVC: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == kUserContentMessageNameChartTouchEnd {
            let messageBody = message.body
            print("✋🏻✋🏻✋🏻✋🏻✋🏻" + (messageBody as! String))
        }
    }
}

//https://github.com/AAChartModel/AAChartKit-Swift/issues/356
extension CustomTouchEndEventCallbackVC: AAChartViewDelegate {
    open func aaChartViewDidFinishLoad(_ aaChartView: AAChartView) {
        print("🚀🚀🚀, AAChartView Did Finished Load!!!")
        
        let touchEndMessage = "手指离开了, 监听到手指离开了"
        let jsStr = """
        function handleTouchEndEvent() {
            window.webkit.messageHandlers.\(kUserContentMessageNameChartTouchEnd).postMessage("\(touchEndMessage)");
        }
        
        let container = document.getElementById('container');
        container.addEventListener("touchend", handleTouchEndEvent, false);
        """
        
        aaChartView.evaluateJavaScript(jsStr) { (item, error) in
#if DEBUG
            if error != nil {
                let objcError = error! as NSError
                let errorUserInfo = objcError.userInfo
                
                let errorInfo =
    """
    
    ☠️☠️💀☠️☠️WARNING!!!!!!!!!!!!!!!!!!!! FBI WARNING !!!!!!!!!!!!!!!!!!!!WARNING☠️☠️💀☠️☠️
    ==========================================================================================
    ------------------------------------------------------------------------------------------
    code = \(objcError.code);
    domain = \(objcError.domain);
    userInfo =     {
    NSLocalizedDescription = "A JavaScript exception occurred";
    WKJavaScriptExceptionColumnNumber = \(errorUserInfo["WKJavaScriptExceptionColumnNumber"] ?? "");
    WKJavaScriptExceptionLineNumber = \(errorUserInfo["WKJavaScriptExceptionLineNumber"]  ?? "");
    WKJavaScriptExceptionMessage = \(errorUserInfo["WKJavaScriptExceptionMessage"] ?? "");
    WKJavaScriptExceptionSourceURL = \(errorUserInfo["WKJavaScriptExceptionSourceURL"] ?? "");
    }
    ------------------------------------------------------------------------------------------
    ==========================================================================================
    ☠️☠️💀☠️☠️WARNING!!!!!!!!!!!!!!!!!!!! FBI WARNING !!!!!!!!!!!!!!!!!!!!WARNING☠️☠️💀☠️☠️
    
    """
                print(errorInfo)
            }
#endif
            
        }
        
    }
    
    open func aaChartView(_ aaChartView: AAChartView, moveOverEventMessage: AAMoveOverEventMessageModel) {
        print("👌🏻moved over point series element name: \(String(describing: moveOverEventMessage.index))")
    }
    
}



