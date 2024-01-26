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

let kUserContentMessageNamePointMoveOut = "pointMoveOut"
let kUserContentMessageNameSeriesMoveOut = "seriesMoveOut"

class CustomMouseOutEventCallback: UIViewController, WKScriptMessageHandler {
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
        aaChartView!.isClearBackgroundColor = true
        aaChartView!.delegate = self as AAChartViewDelegate
    }
    
    private func configureChartViewCustomEventMessageHandler() {
        aaChartView!.configuration.userContentController.add(AALeakAvoider.init(delegate: self), name: kUserContentMessageNamePointMoveOut)
        aaChartView!.configuration.userContentController.add(AALeakAvoider.init(delegate: self), name: kUserContentMessageNameSeriesMoveOut)
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
        
        aaOptions.chart?.zoomType(.xy)
        
        aaOptions.plotOptions?.series?.events(AASeriesEvents()
            .mouseOut(#"""
function() {
    window.webkit.messageHandlers.seriesMoveOut.postMessage("手指移出图表区域了");
}
"""#))
        
        let aaPoint = AAPoint()
            .events(AAPointEvents()
                .mouseOut(#"""
            function() {
                    let message = {
                    name: this.series.name,
                    y: this.y,
                    x: this.x,
                    category:this.category,
                    offset: {
                        plotX: this.plotX,
                        plotY: this.plotY
                    },
                    index: this.index,
                    };
                window.webkit.messageHandlers.pointMoveOut.postMessage(message);
            }
"""#))

        aaOptions.plotOptions?.series?.point = aaPoint
        

        
        return aaOptions
    }
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == kUserContentMessageNamePointMoveOut {
            let messageBody = message.body as! [String: Any]
            print(messageBody)
        } else if message.name == kUserContentMessageNameSeriesMoveOut {
            let messageBody = message.body
            print(messageBody)
        }
    }
    
}

extension CustomMouseOutEventCallback: AAChartViewDelegate {
    open func aaChartViewDidFinishLoad(_ aaChartView: AAChartView) {
       print("🚀🚀🚀, AAChartView Did Finished Load!!!")
    }
    
    open func aaChartView(_ aaChartView: AAChartView, clickEventMessage: AAClickEventMessageModel) {
        print(
            """

            clicked point series element name: \(clickEventMessage.name ?? "")
            🖱🖱🖱WARNING!!!!!!!!!!!!!!!!!!!! Click Event Message !!!!!!!!!!!!!!!!!!!! WARNING🖱🖱🖱
            ==========================================================================================
            ------------------------------------------------------------------------------------------
            user finger moved over!!!,get the move over event message: {
            category = \(String(describing: clickEventMessage.category))
            index = \(String(describing: clickEventMessage.index))
            name = \(String(describing: clickEventMessage.name))
            offset = \(String(describing: clickEventMessage.offset))
            x = \(String(describing: clickEventMessage.x))
            y = \(String(describing: clickEventMessage.y))
            }
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            
            
            """
        )
    }

}



