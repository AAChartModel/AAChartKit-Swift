//
//  CustomChartZoomEventEventCallbackVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/3/20.
//  Copyright © 2025 An An. All rights reserved.
//

import AAInfographics
import WebKit

//https://github.com/AAChartModel/AAChartKit-Swift/issues/525
//https://api.highcharts.com/highcharts/xAxis.events.setExtremes
class CustomChartZoomEventEventCallbackVC: UIViewController {
    let kUserContentMessageNameChartZoom = "chartZoom" // New message name for zoom events

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
        aaChartView.configuration.userContentController.add(AALeakAvoider.init(delegate: self), name: kUserContentMessageNameChartZoom)
    }
    
    private func configureChartOptions() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.areaspline)
                .zooming(AAZooming()
                    .singleTouch(true)
                    .type(.xy)
                    .pinchType(.xy)
                    .resetButton(AAResetButton()
                        .theme(AAButtonTheme()
                            .fill(AAColor.yellow)
                            .stroke(AAColor.green)
                            .strokeWidth(3)
                            .r(3)
                            .states(AAButtonThemeStates()
                                .hover(AAButtonThemeStatesHover()
                                    .fill(AAColor.red)
                                    .style(AAStyle()
                                        .color(AAColor.white))))))))
            .xAxis(AAXAxis()
                .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"])
                .events(AAAxisEvents()
                    .setExtremes("""
                    function (event) {
                        const message = {
                            min: event.min,
                            max: event.max,
                        };
                        window.webkit.messageHandlers.\(kUserContentMessageNameChartZoom).postMessage(message);
                    }
                    """
                    ))) // Set the zoom event for the X-axis
            .series([
                AASeriesElement()
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
                    .marker(AAMarker()
                        .lineColor(AAColor.red)
                        .lineWidth(3)
                        .radius(10))
            ])
    }
}


extension CustomChartZoomEventEventCallbackVC: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == kUserContentMessageNameChartZoom {
            let messageBody = message.body as! [String: Any]
            let min = messageBody["min"] as? Double
            let max = messageBody["max"] as? Double
            
            print(
                    """
                    
                     🔍🔍🔍-------------------------------------------------------------------------------------------
                     Chart zoom detected!
                     message = {
                            min: \(min ?? 0),
                            max: \(max ?? 0),
                        };
                     🔍🔍🔍-------------------------------------------------------------------------------------------
                    
                    """
            )
        }
    }
}


extension CustomChartZoomEventEventCallbackVC: AAChartViewDelegate {
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

