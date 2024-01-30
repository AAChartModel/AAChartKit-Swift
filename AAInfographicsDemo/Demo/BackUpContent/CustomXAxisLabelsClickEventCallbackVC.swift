//
//  CustomAnyEventCallback.swift
//  AAInfographicsDemo
//
//  Created by Admin on 2022/5/31.
//  Copyright © 2022 An An. All rights reserved.
//

import AAInfographics
import WebKit

//https://github.com/AAChartModel/AAChartKit/issues/1531
//https://stackoverflow.com/questions/42062016/in-high-chart-how-to-add-event-for-label-click
class CustomXAxisLabelsClickEventCallbackVC: UIViewController {
    let kUserContentMessageNameXAxisLabelsClick = "XAxisLabelsClick"
    
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
        aaChartView!.configuration.userContentController.add(AALeakAvoider.init(delegate: self), name: kUserContentMessageNameXAxisLabelsClick)
    }
    
    private func configureChartOptions() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.areaspline)
                .events(AAChartEvents()
                    .load("""
            function() {
                const childNodes = this.xAxis[0].labelGroup.element.childNodes;
                childNodes
                .forEach(function(label, index) {
                    label.style.cursor = "pointer";
                    label.onclick = function() {
                        const message = {
                            category: this.textContent,
                            index: index,
                        };
                        window.webkit.messageHandlers.\(kUserContentMessageNameXAxisLabelsClick).postMessage(message);
                    }
                });
            }
""")))
            .xAxis(AAXAxis()
                .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]))
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


extension CustomXAxisLabelsClickEventCallbackVC: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == kUserContentMessageNameXAxisLabelsClick {
            let messageBody = message.body as! [String: Any]
            let category = messageBody["category"] as? String
            let index = messageBody["index"] as? Int
            
            print(
                    """
                    
                     👇🏻👇🏻👇🏻------------------------------------------------------------------------------------------
                     clicked X axis label category: \(category ?? "")
                     message = {
                            category: \(category ?? ""),
                            index: \(index ?? 0),
                        };
                     👆👆👆------------------------------------------------------------------------------------------
                    
                    """
            )
        }
    }
}


extension CustomXAxisLabelsClickEventCallbackVC: AAChartViewDelegate {
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



