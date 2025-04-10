//
//  TripleChartsLinkedWorkVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/11/22.
//  Copyright © 2024 An An. All rights reserved.
//

// ...existing code...
import UIKit
import AAInfographics

class TripleChartsLinkedWorkVC: UIViewController {
    private lazy var aaChartView0: AAChartView = {
        let chartView = AAChartView()
        chartView.isScrollEnabled = false
        chartView.delegate = self
        let aaOptions1 = JSFunctionBeforeAndAfterRenderingComposer3.synchronizedChart()
            .beforeDrawChartJavaScript(nil)
            .afterDrawChartJavaScript(nil)
        chartView.aa_drawChartWithChartOptions(aaOptions1)
        return chartView
    }()

    private lazy var aaChartView1: AAChartView = {
        let chartView = AAChartView()
        chartView.isScrollEnabled = false
        chartView.delegate = self
        let aaOptions1 = AAOptions()
            .chart(AAChart().type(.area))
            .title(AATitle().text("Speed").align(.left))
            .tooltip(AATooltip().shared(true))
            .xAxis(AAXAxis()
                .crosshair(AACrosshair()
                    .color(AAColor.green)
                    .width(2)
                    .dashStyle(.longDashDot)
                    .zIndex(5)))
            .yAxis(AAYAxis().title(nil))
            .series([JSFunctionBeforeAndAfterRenderingComposer3.configureSeriesArray()[0]])
        chartView.aa_drawChartWithChartOptions(aaOptions1)
        return chartView
    }()

    private lazy var aaChartView2: AAChartView = {
        let chartView = AAChartView()
        chartView.isScrollEnabled = false
        chartView.delegate = self
        let aaOptions2 = AAOptions()
            .chart(AAChart().type(.area))
            .title(AATitle().text("Elevation").align(.left))
            .tooltip(AATooltip().shared(true))
            .xAxis(AAXAxis()
                .crosshair(AACrosshair()
                    .color(AAColor.red)
                    .width(2)
                    .dashStyle(.longDashDot)
                    .zIndex(5)))
            .yAxis(AAYAxis().title(nil))
            .series([JSFunctionBeforeAndAfterRenderingComposer3.configureSeriesArray()[1]])
        chartView.aa_drawChartWithChartOptions(aaOptions2)
        return chartView
    }()

    private lazy var aaChartView3: AAChartView = {
        let chartView = AAChartView()
        chartView.isScrollEnabled = false
        chartView.delegate = self
        let aaOptions3 = AAOptions()
            .chart(AAChart().type(.area))
            .title(AATitle().text("Heart Rate").align(.left))
            .tooltip(AATooltip().shared(true))
            .xAxis(AAXAxis()
                .crosshair(AACrosshair()
                    .color(AAColor.blue)
                    .width(2)
                    .dashStyle(.longDashDot)
                    .zIndex(5)))
            .yAxis(AAYAxis().title(nil))
            .series([JSFunctionBeforeAndAfterRenderingComposer3.configureSeriesArray()[2]])
        chartView.aa_drawChartWithChartOptions(aaOptions3)
        return chartView
    }()

    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Triple Charts Linked Work---3表联动"
        self.view.backgroundColor = .white
        setupUIStackView()
    }

    private func setupUIStackView() {
        view.addSubview(containerStackView)
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        containerStackView.addArrangedSubview(aaChartView0)
        containerStackView.addArrangedSubview(aaChartView1)
        containerStackView.addArrangedSubview(aaChartView2)
        containerStackView.addArrangedSubview(aaChartView3)
    }
// ...existing code...
    
    
    func configureSyncRefreshTooltipJSString(message: AAMoveOverEventMessageModel) -> String {
        let defaultSelectedIndex = (message.index ?? 0) as Int
        let jsFunc = """
                     function syncRefreshTooltip() {
                            const points = [];
                            const chart = aaGlobalChart;
                            const series = chart.series;
                            const length = series.length;
                                       
                            for (let i = 0; i < length; i++) {
                                const pointElement = series[i].data[\(defaultSelectedIndex)];
                                points.push(pointElement);
                            }
                            chart.xAxis[0].drawCrosshair(null, points[0]);
                            chart.tooltip.refresh(points);
                     }
                     syncRefreshTooltip();
        """
        return jsFunc
    }
}


extension TripleChartsLinkedWorkVC: AAChartViewDelegate {
    func aaChartViewDidFinishLoad(_ aaChartView: AAChartView) {
        print("🚀🚀🚀 AAChartView content did finish load!!!")
    }
    
    func aaChartView(_ aaChartView: AAChartView, moveOverEventMessage: AAMoveOverEventMessageModel) {
        let message = moveOverEventMessage
        print("📊📊📊move over event message: \(message.name ?? "")")
        let jsFuncStr = configureSyncRefreshTooltipJSString(message: message)
        
        if aaChartView == aaChartView0 {
            aaChartView1.evaluateJavaScript(jsFuncStr)
            aaChartView2.evaluateJavaScript(jsFuncStr)
            aaChartView3.evaluateJavaScript(jsFuncStr)
        } else if aaChartView == aaChartView1 {
            aaChartView0.evaluateJavaScript(jsFuncStr)
            aaChartView2.evaluateJavaScript(jsFuncStr)
            aaChartView3.evaluateJavaScript(jsFuncStr)
        } else if aaChartView == aaChartView2 {
            aaChartView0.evaluateJavaScript(jsFuncStr)
            aaChartView1.evaluateJavaScript(jsFuncStr)
            aaChartView3.evaluateJavaScript(jsFuncStr)
        } else if aaChartView == aaChartView3 {
            aaChartView0.evaluateJavaScript(jsFuncStr)
            aaChartView1.evaluateJavaScript(jsFuncStr)
            aaChartView2.evaluateJavaScript(jsFuncStr)
        }
            
    }
}
