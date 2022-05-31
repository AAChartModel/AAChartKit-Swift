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

let kUserContentMessageNameChartTouchEnd = "touchEnd"

class CustomTouchEndEventCallback: UIViewController, WKScriptMessageHandler {
    private var aaChartView: AAChartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

       configureChartView()
       configureChartViewCustomEventMessageHandler()
        
        let aaOptions = topRoundedCornersStackingColumnChart()
        aaChartView.aa_drawChartWithChartOptions(aaOptions)
    }
    
    private func configureChartView() {
        aaChartView = AAChartView()
        let chartViewWidth = view.frame.size.width
        let chartViewHeight = view.frame.size.height - 220
        aaChartView!.frame = CGRect(x: 0,
                                    y: 60,
                                    width: chartViewWidth,
                                    height: chartViewHeight)
        view.addSubview(aaChartView!)
        aaChartView!.isScrollEnabled = false//Disable chart content scrolling
        aaChartView!.delegate = self as AAChartViewDelegate
    }
    
    private func configureChartViewCustomEventMessageHandler() {
        aaChartView!.configuration.userContentController.add(AALeakAvoider.init(delegate: self), name: kUserContentMessageNameChartTouchEnd)
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
            ])
        
        let aaOptions = aaChartModel.aa_toAAOptions()
            
        return aaOptions
    }
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == kUserContentMessageNameChartTouchEnd {
            let messageBody = message.body
            print(messageBody)
        }
    }
    
}

extension CustomTouchEndEventCallback: AAChartViewDelegate {
    open func aaChartViewDidFinishLoad(_ aaChartView: AAChartView) {
       print("🚀🚀🚀, AAChartView Did Finished Load!!!")
        
        let jsStr = #"""
function handleTouchEndEvent() {
                window.webkit.messageHandlers.touchEnd.postMessage("成功了, 真的成功了");

}
        let container = document.getElementById('container');
        container.addEventListener("touchend", handleTouchEndEvent, false);
"""#
        
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
        print(
            """

            moved over point series element name: \(moveOverEventMessage.name ?? "")
            ✋🏻✋🏻✋🏻✋🏻✋🏻WARNING!!!!!!!!!!!!!! Move Over Event Message !!!!!!!!!!!!!! WARNING✋🏻✋🏻✋🏻✋🏻✋🏻
            ==========================================================================================
            ------------------------------------------------------------------------------------------
            user finger moved over!!!,get the move over event message: {
            category = \(String(describing: moveOverEventMessage.category))
            index = \(String(describing: moveOverEventMessage.index))
            name = \(String(describing: moveOverEventMessage.name))
            offset = \(String(describing: moveOverEventMessage.offset))
            x = \(String(describing: moveOverEventMessage.x))
            y = \(String(describing: moveOverEventMessage.y))
            }
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            
            
            """
        )
    }

}



