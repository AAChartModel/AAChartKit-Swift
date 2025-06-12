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
        self.title = "Swift Charts Grid Examples"
        // Set a background color to make white axis labels visible
        if #available(iOS 13.0, *) {
            self.view.backgroundColor = .systemGray3
        } else {
            self.view.backgroundColor = .darkGray
        }

        if #available(iOS 16.0, *) {
            // 显示网格视图而不是单一图表
            setupChartGridView()
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
    private func setupChartGridView() {
        // 创建图表模型数组
        let chartModels = createChartModels()
        let gridView = ChartGridView(chartModels: chartModels)
        
        let hostingController = UIHostingController(rootView: gridView)
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
    
    @available(iOS 16.0, *)
    private func createChartModels() -> [AAChartModel] {
//        return ChartSampleProvider.randomValueDataItemsChartModel()
        return [
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.area),
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.areaspline),
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.column),
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.bar),
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.line),
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.spline),
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.scatter),
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.bubble),

            
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.area).stacking(.normal),
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.areaspline).stacking(.normal),
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.column).stacking(.normal),
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.bar).stacking(.normal),
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.line).stacking(.normal),
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.spline).stacking(.normal),
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.scatter).stacking(.normal),
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.bubble).stacking(.normal),


            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.area).stacking(.percent),
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.areaspline).stacking(.percent),
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.column).stacking(.percent),
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.bar).stacking(.percent),
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.line).stacking(.percent),
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.spline).stacking(.percent),
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.scatter).stacking(.normal),
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart().chartType(.bubble).stacking(.normal),



        ]
    }
}

// 简化网格视图 SwiftUI 组件
@available(iOS 16.0, *)
struct ChartGridView: View {
    let chartModels: [AAChartModel]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 10),
                GridItem(.flexible(), spacing: 10)
            ], spacing: 20) {
                ForEach(Array(chartModels.enumerated()), id: \.offset) { index, chartModel in
                    VStack {
                        Text(getChartTitle(for: chartModel))
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding(.bottom, 5)
                        
                        AppleSwiftChartBuilder(chartModel: chartModel)
                            .makeChart()
                            .frame(height: 200)
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 2)
                    }
                }
            }
            .padding()
        }
    }
    
    private func getChartTitle(for chartModel: AAChartModel) -> String {
        switch chartModel.chartType {
        case .area, .areaspline:
            return "Area Chart"
        case .column:
            return "Column Chart"
        case .line, .spline:
            return "Line Chart"
        case .bar:
            return "Bar Chart"
        case .pie:
            return "Pie Chart"
        default:
            return "Chart"
        }
    }
}


