//
//  AppleSwiftChartVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/6/12.
//  Copyright © 2025 An An. All rights reserved.
//

import UIKit
import SwiftUI
import AAInfographics



// Data structures for the chart
struct ChartCategoryDataPoint: Identifiable {
    let id = UUID()
    let category: String // e.g., "Java", "Swift"
    let value: Double
}

struct ChartSeriesData: Identifiable {
    let id = UUID()
    let name: String // e.g., "Tokyo", "NewYork"
    let dataPoints: [ChartCategoryDataPoint]
}

class AppleSwiftChartVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Swift Charts Example"
        // Set a background color to make white axis labels visible
        if #available(iOS 13.0, *) {
            self.view.backgroundColor = .systemGray3
        } else {
            self.view.backgroundColor = .darkGray
        }

        if #available(iOS 16.0, *) {
            // 传入不同类型即可切换图表类型
            setupSwiftChartView(chartType: .area)
        } else {
            // Fallback for earlier iOS versions
            let label = UILabel()
            label.text = "Swift Charts requires iOS 16.0+"
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(label)
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        }
    }
    
    @available(iOS 16.0, *)
    private func setupSwiftChartView(chartType: AAChartType) {
        let chart = AppleSwiftChartBuilder(chartType: chartType, stackingType: .none).makeChart()
        let hostingController = UIHostingController(rootView: chart)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            hostingController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            hostingController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            hostingController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
        hostingController.didMove(toParent: self)
    }
}


