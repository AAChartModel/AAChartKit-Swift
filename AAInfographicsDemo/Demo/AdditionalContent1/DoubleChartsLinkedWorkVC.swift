//
//  DoubleChartsLinkedWorkVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/6/29.
//  Copyright © 2019 An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 *********************************************************************************
 *
 *  🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit-Swift/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 *********************************************************************************
 
 */

import UIKit
import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class DoubleChartsLinkedWorkVC: UIViewController, AAChartViewDelegate {
    
    private var aaChartView1 = AAChartView()
    private var aaChartView2 = AAChartView()
    private var aaChartModel2 = AAChartModel()
    private var colorsArr: [AAGradientColor]?
    private var selectedColor: AAGradientColor?
    private var selectedCategoryIndex: Int?
    public var isRefreshAnimation = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpViews()
    }

    private func setUpViews() {
        setUpStackView()
        setUpTheAAChartViewOne()
        setUpTheAAChartViewTwo()
    }

    private func setUpStackView() {
        let stackView = UIStackView(arrangedSubviews: [aaChartView1, aaChartView2])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setUpTheAAChartViewOne() {
        aaChartView1.isScrollEnabled = false
        aaChartView1.delegate = self
        
        let aaChartModel1 = CustomStyleForColumnChartComposer.colorfulGradientColorColumnChart()
            .backgroundColor(AAColor.white)
        colorsArr = aaChartModel1.colorsTheme as? [AAGradientColor]
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel1)
        
        aaOptions.xAxis?
            .crosshair(AACrosshair()
                .dashStyle(AAChartLineDashStyleType.longDashDot)
                .color(AAColor.black)
                .width(1))
        
        aaOptions.plotOptions?.column?.groupPadding(0)
        
        aaChartView1.aa_drawChartWithChartOptions(aaOptions)
    }
    
    private func setUpTheAAChartViewTwo() {
        aaChartView2.isScrollEnabled = false
        
        aaChartModel2
            .chartType(.column)//图形类型
            .animationType(.easeOutQuart)//图形渲染动画类型为"bounce"
            .dataLabelsEnabled(false)//是否显示数字
            .markerRadius(4)//折线连接点半径长度,为0时相当于没有折线连接点
            .markerSymbolStyle(.innerBlank)
            .legendEnabled(false)
            .tooltipEnabled(true)
            .series([
                AASeriesElement()
                    .color("#fe117c")
                    .data(getRandomNumbersArr(numbers: 12))
                ,
            ])
        
        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel2)
        aaOptions.plotOptions?.column?.groupPadding(0)
        
        aaChartView2.aa_drawChartWithChartOptions(aaOptions)
    }
    
    func aaChartView(_ aaChartView: AAChartView, moveOverEventMessage: AAMoveOverEventMessageModel) {
        selectedColor = colorsArr?[moveOverEventMessage.index ?? 0] ?? AAGradientColor.deepSea
        selectedCategoryIndex = moveOverEventMessage.index ?? 0
        
        updateChart2Data()
        synchronizeTooltip(at: moveOverEventMessage.index ?? 0)
    }

    private func updateChart2Data() {
        aaChartView2.aa_updateXAxisCategories(configureXAxisCategoresDataArray(), redraw: false)
        aaChartView2.aa_onlyRefreshTheChartDataWithChartModelSeries([
            AASeriesElement()
                .data(configureSeriesDataArray())
        ], animation: isRefreshAnimation)
    }

    private func synchronizeTooltip(at index: Int) {
        let jsFunc = """
        function syncRefreshTooltip() {
            const chart = aaGlobalChart;
            if (!chart) {
                return;
            }
            const points = [];
            const series = chart.series;
            const length = series.length;
            
            for (let i = 0; i < length; i++) {
                const pointElement = series[i].data[\(index)];
                if (pointElement) {
                    pointElement.onMouseOver();
                    points.push(pointElement);
                }
            }
            
            if (points.length > 0) {
                chart.xAxis[0].drawCrosshair(null, points[0]);
                chart.tooltip.refresh(points);
            }
        }
        syncRefreshTooltip();
        """
        
        aaChartView2.evaluateJavaScript(jsFunc)
    }
    
    
    private func getRandomNumbersArr(numbers: Int) -> [Float] {
        (0..<numbers).map { _ in Float(arc4random() % 1000 + 500) }
    }
    
    private func configureSeriesDataArray() -> [Any] {
        let Q = arc4random() % 38
        return (0..<40).map { x in
            let y1 = sin(Double(Q) * (Double(x) * Double.pi / 180)) + Double(x) * 2.0 * 0.01 - 1
            return AADataElement()
                .color(selectedColor as Any)
                .y(Float(y1))
        }
    }
    
    private func configureXAxisCategoresDataArray() -> [String] {
        (0..<40).map { "第\(selectedCategoryIndex ?? 0)组\($0)" }
    }
    
    
}
