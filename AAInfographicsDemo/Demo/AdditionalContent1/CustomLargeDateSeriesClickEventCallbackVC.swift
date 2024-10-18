//
//  CustomLargeDateSeriesClickEventCallbackVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/10/18.
//  Copyright © 2024 An An. All rights reserved.
//

import AAInfographics
import WebKit

class CustomLargeDateSeriesClickEventCallbackVC: UIViewController {
    let kUserContentMessageNamePointMoveOver = "pointMoveOver"
    
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
        aaChartView!.configuration.userContentController.add(AALeakAvoider.init(delegate: self), name: kUserContentMessageNamePointMoveOver)
    }
    
    private func configureChartOptions() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.areaspline))
            .title(AATitle()
                .text("Custom Large Date Series Click Event Callback"))
            .plotOptions(AAPlotOptions()
                .series(AASeries()
                    .keys(["x", "y", "customData1", "customData2"]) // 指定数据的键名
                    .point(AAPoint()
                        .events(AAPointEvents()
                            .mouseOver("""
                         function() {
                                   let message = {
                                       name: this.series.name,
                                       x: this[0],
                                       y: this[1],
                                       category: this.category,
                                       offset: {
                                           plotX: this.plotX,
                                           plotY: this.plotY
                                       },
                                       index: this.index,
                                       customData1: this.customData1,
                                       customData2: this.customData2
                                   };
                                   window.webkit.messageHandlers.\(kUserContentMessageNamePointMoveOver).postMessage(message);
                               }
                        """)))
                )
            )
            .series([
                AASeriesElement()
//                    .keys(["x", "y", "customData1", "customData2"]) // 指定数据的键名
                    .data(generateLargeDataSeriesPureArray())
                    .marker(AAMarker()
                        .lineColor(AAColor.yellow)
                        .lineWidth(3)
                        .radius(10))
            ])
    }

    //        {
    //          "x" : 1711051200000,
    //          "y" : 0.44,
    //          "customData1" : "77A705DB-6501-49EA-9CAB-EEAB58EDAA2D",
    //          "customData2" : "D7CA67BD-3B69-448F-9A8D-38687AB035A4"
    //        },
    //生成如上格式的数据, 数量为 1001 (测试证明, 1000个数据点是可以正常显示的, 1001个数据点会导致图表无法正常显示, 也就是说, 这种格式的数据, 1000个数据点是极限值)
    private func generateLargeDataSeries() -> [Any] {
        var data = [[String: Any]]()
        for i in 0..<1001 {
            let dict = [
                "x": 1711051200000 + i * 86400000,
                "y": Double(arc4random() % 100) * 0.01,
                "customData1": UUID().uuidString,
                "customData2": UUID().uuidString
            ] as [String : Any]
            data.append(dict)
        }
        return data
    }

    //        {
    //          1711051200000,
    //          0.44,
    //          "77A705DB-6501-49EA-9CAB-EEAB58EDAA2D",
    //          "D7CA67BD-3B69-448F-9A8D-38687AB035A4"
    //        },
    //生成如上格式的数据, 数量为 1001 (测试证明, 1000个数据点是可以正常显示的, 1001个数据点也能正常显示, 也就是说, 这种格式的数据, 1000个数据点不是极限值)
    private func generateLargeDataSeriesPureArray() -> [Any] {
        var data = [[Any]]()
        for i in 0..<1001 {
            let arr = [
                1711051200000 + i * 86400000,
                Double(arc4random() % 100) * 0.01,
                UUID().uuidString,
                UUID().uuidString
            ] as [Any]
            data.append(arr)
        }
        return data
    }
}


extension CustomLargeDateSeriesClickEventCallbackVC: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == kUserContentMessageNamePointMoveOver {
            let messageBody = message.body
            // 处理 JavaScript 回调的信息
            print("Received message from JavaScript: \(messageBody)")
        }
    }
}


extension CustomLargeDateSeriesClickEventCallbackVC: AAChartViewDelegate {
    open func aaChartViewDidFinishLoad(_ aaChartView: AAChartView) {
       print("🚀🚀🚀, AAChartView Did Finished Load!!!")
    }

}
