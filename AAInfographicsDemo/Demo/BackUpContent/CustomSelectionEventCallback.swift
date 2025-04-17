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

let kUserContentMessageNameChartSelection = "selection"

class CustomSelectionEventCallback: UIViewController, WKScriptMessageHandler {
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
        aaChartView!.configuration.userContentController.add(AALeakAvoider.init(delegate: self), name: kUserContentMessageNameChartSelection)
    }
    
    private func topRoundedCornersStackingColumnChart() -> AAOptions {
        let aaChartModel = AAChartModel()
            .chartType(.column)
            .stacking(.normal)
            .title("Top Rounded Corners Stacking Column Chart")
            .colorsTheme(["#06caf4",])
            .series([
                AARoundedCornersSeriesElement()
                    .name("Tokyo Hot")
                    .borderRadiusTopLeft("50%")
                    .borderRadiusTopRight("50%")
                    .data([2.10, 2.54, 2.78, 3.62, 4.41, 4.09, 3.83, 4.47, 4.20, 3.94, 3.80, 3.58, 3.19, 4.30, 3.69, 3.52, 3.02, 3.30]),
            ])
        
        let aaOptions = aaChartModel.aa_toAAOptions()
        
        aaOptions.chart?.zoomType(.xy)
        
        aaOptions.chart?.events(AAChartEvents()
            .selection(#"""
function (event) {
                var text,
                    label;
                if (event.xAxis) {
                    text = 'min: ' + Highcharts.numberFormat(event.xAxis[0].min, 2) + ', max: ' + Highcharts.numberFormat(event.xAxis[0].max, 2);
                } else {
                    text = 'Selection reset';
                }
                label = this.renderer.label(text, 100, 120)
                    .attr({
                    fill: Highcharts.getOptions().colors[0],
                    padding: 10,
                    r: 5,
                    zIndex: 8
                })
                    .css({
                    color: '#FFFFFF'
                })
                    .add();
                setTimeout(function () {
                    label.fadeOut();
                }, 1000);
            }
"""#))

       
        

        
        return aaOptions
    }
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == kUserContentMessageNameChartSelection {
            let messageBody = message.body as! [String: Any]
            print(messageBody)
        }
    }
    
}

extension CustomSelectionEventCallback: AAChartViewDelegate {
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



