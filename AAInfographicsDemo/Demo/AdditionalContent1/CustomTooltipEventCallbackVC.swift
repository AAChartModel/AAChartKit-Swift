//
//  CustomTooltipEventCallbackVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/10/15.
//  Copyright © 2024 An An. All rights reserved.
//

import AAInfographics
import WebKit

class CustomTooltipEventCallbackVC: UIViewController {
    let kUserContentMessageNameTooltipIsHidden = "tooltipIsHidden"
    
    private var aaChartView: AAChartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configureChartView()
        configureChartViewCustomEventMessageHandler()
        
        let aaOptions = configureChartOptions()
        aaChartView.aa_drawChartWithChartOptions(aaOptions)
    }
    
    private func configureChartView() {
        aaChartView = AAChartView()
        let chartViewWidth = view.frame.size.width
        let chartViewHeight = view.frame.size.height - 220
        aaChartView!.frame = CGRect(x: 0, y: 60, width: chartViewWidth, height: chartViewHeight)
        aaChartView!.isScrollEnabled = false//Disable chart content scrolling
        aaChartView!.isClearBackgroundColor = true
        aaChartView!.delegate = self as AAChartViewDelegate
        view.addSubview(aaChartView!)
    }
    
    private func configureChartViewCustomEventMessageHandler() {
        aaChartView!.configuration.userContentController.add(AALeakAvoider.init(delegate: self), name: kUserContentMessageNameTooltipIsHidden)
    }
    
    private func configureChartOptions() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.areaspline)
                .events(AAChartEvents()
                    .load("""
            function() {
                    var chart = this;
                    
                    setInterval(function() {
                        window.webkit.messageHandlers.\(kUserContentMessageNameTooltipIsHidden).postMessage("Tooltip is hidden: " + chart.tooltip.isHidden);
                    }, 1000);
            }
            """)))
            .xAxis(AAXAxis()
                .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]))
            .series([
                AASeriesElement()
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
                    .marker(AAMarker()
                        .lineColor(AAColor.green)
                        .lineWidth(3)
                        .radius(10))
            ])
    }
}


extension CustomTooltipEventCallbackVC: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == kUserContentMessageNameTooltipIsHidden {
            if let messageBody = message.body as? String {
                // 处理 JavaScript 回调的信息
                print("Received message from JavaScript: \(messageBody)")
            }
        }
    }
}


extension CustomTooltipEventCallbackVC: AAChartViewDelegate {
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
                category = \(String(describing: clickEventMessage.category))
                index = \(String(describing: clickEventMessage.index))
                name = \(String(describing: clickEventMessage.name))
                offset = \(String(describing: clickEventMessage.offset))
                x = \(String(describing: clickEventMessage.x))
                y = \(String(describing: clickEventMessage.y))
            }
            ------------------------------------------------------------------------------------------

            
            """
        )
    }

}
