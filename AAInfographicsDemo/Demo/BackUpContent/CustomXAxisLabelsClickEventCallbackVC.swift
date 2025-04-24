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
        aaChartView.configuration.userContentController.add(AALeakAvoider.init(delegate: self), name: kUserContentMessageNameXAxisLabelsClick)
    }
    
    /*
    //给 x 轴标签的文字添加点击事件
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
    */
    
    
    //给 x 轴标签添加图片, 并且给图片添加点击事件
    private func configureChartOptions() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.areaspline)
                .events(AAChartEvents()
                    .load("""
            function() {
                const chart = this;
                setTimeout(function() {
                    try {
                        const imgElements = document.querySelectorAll('.highcharts-xaxis-labels img');
                        console.log('找到图片元素数量:', imgElements.length);
                        
                        imgElements.forEach(function(img, index) {
                            img.style.cursor = 'pointer';
                            img.addEventListener('click', function(e) {
                                e.stopPropagation(); 
                                const category = chart.xAxis[0].categories[index];
                                console.log('图片被点击:', category, index);
                                const message = {
                                    category: category,
                                    index: index,
                                };
                                window.webkit.messageHandlers.\(kUserContentMessageNameXAxisLabelsClick).postMessage(message);
                            });
                        });
                    } catch(e) {
                        console.error('事件绑定错误:', e);
                    }
                }, 500); 
            }
""")))
            .xAxis(AAXAxis()
                .categories(["苹果", "香蕉", "橙子"])
                .labels(AALabels()
                    .useHTML(true)
                    .formatter("""
                        function() {
                            const imgMap = {
                                '苹果': 'https://cdn-icons-png.flaticon.com/512/415/415733.png',
                                '香蕉': 'https://cdn-icons-png.flaticon.com/512/3144/3144456.png',
                                '橙子': 'https://cdn-icons-png.flaticon.com/512/3081/3081840.png'
                            };
                            return `<img src="${imgMap[this.value]}" width="30" height="30" alt="${this.value}" title="${this.value}" class="chart-xaxis-img">`;
                        }
                    """)))
            .series([
                AASeriesElement()
                    .data([7.0, 6.9, 2.5])
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



