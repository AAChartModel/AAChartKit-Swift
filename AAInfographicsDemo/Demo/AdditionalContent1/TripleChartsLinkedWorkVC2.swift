//
//  TripleChartsLinkedWorkVC2.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/11/22.
//  Copyright © 2024 An An. All rights reserved.
//

import UIKit
import AAInfographics


class TripleChartsLinkedWorkVC2: UIViewController, AAChartViewDelegate {
    
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
        
//        let aaOptions = JSFunctionBeforeAndAfterRenderingComposer3.configureChartOptions()
        let aaOptions = JSFunctionBeforeAndAfterRenderingComposer5.columnrangeChartSinglePrismDifferentColorZoningEffect()
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

}




//    func chartConfigurationWithSelectedChartTypeString(_ selectedChartTypeStr: String) -> Any? {
//        return JSFunctionBeforeAndAfterRenderingComposer3.synchronizedChart()
//    }
//
//}
