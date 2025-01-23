//
//  CustomTooltipEventCallbackVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/10/15.
//  Copyright © 2024 An An. All rights reserved.
//

import AAInfographics
import WebKit

//https://github.com/AAChartModel/AAChartKit-Swift/issues/496
//https://stackoverflow.com/questions/34202979/highcharts-detect-if-tooltip-is-being-shown
class CustomTooltipEventCallbackVC: UIViewController {
    let kUserContentMessageNameTooltipIsHidden = "tooltipIsHidden"
    
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
        
        let aaOptions = configureChartOptions()
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
        aaChartView.configuration.userContentController.add(AALeakAvoider.init(delegate: self), name: kUserContentMessageNameTooltipIsHidden)
    }
    
    private func configureChartOptions() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.areaspline)
                .events(AAChartEvents()
                    .load("""
            function() {
                Highcharts.wrap(Highcharts.Tooltip.prototype, 'refresh', function (proceed, point, mouseEvent) {
                    proceed.apply(this, Array.prototype.slice.call(arguments, 1));
                    window.webkit.messageHandlers.\(kUserContentMessageNameTooltipIsHidden).postMessage('Tooltip is being refreshed (shown)');
                });

                Highcharts.wrap(Highcharts.Tooltip.prototype, 'hide', function (proceed, delay) {
                    proceed.apply(this, Array.prototype.slice.call(arguments, 1));
                    window.webkit.messageHandlers.\(kUserContentMessageNameTooltipIsHidden).postMessage('Tooltip is being hidden');
                });
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
                // 根据不同的消息体内容更新界面
                if messageBody == "Tooltip is being refreshed (shown)" {
                    // 更新 tooltip 显示状态
                } else if messageBody == "Tooltip is being hidden" {
                    // 更新 tooltip 隐藏状态
                }
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
