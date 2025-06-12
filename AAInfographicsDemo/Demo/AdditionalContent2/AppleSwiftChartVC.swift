//
//  AppleSwiftChartVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/6/12.
//  Copyright © 2025 An An. All rights reserved.
//

import UIKit
import SwiftUI // Required for UIHostingController and Color
import Charts   // Required for Swift Charts

// Helper extension for Color from hex string
// This can be placed in a separate utility file or at the top level of this file.
@available(iOS 13.0, *)
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0) // Default to black if invalid
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}


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
            setupSwiftChartView()
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
    private func setupSwiftChartView() {
        let chart = AppleSwiftChartBuilder().makeChart()
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

// MARK: - Chart Builder

@available(iOS 16.0, *)
class AppleSwiftChartBuilder {
    private let categories = ["Java", "Swift", "Python", "Ruby", "PHP", "Go",
                              "C", "C#", "C++", "Rust", "Kotlin", "TypeScript"]
    private let tokyoValues = [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
    private let newYorkValues = [0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
    private let londonValues = [0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
    private let berlinValues = [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
    private let colors: [Color] = [
        Color(hex: "#1e90ff"), // Tokyo
        Color(hex: "#ef476f"), // NewYork
        Color(hex: "#ffd066"), // London
        Color(hex: "#04d69f"), // Berlin
        Color(hex: "#25547c")  // 5th color, unused with 4 series
    ]
    
    private var seriesData: [ChartSeriesData] {
        [
            ChartSeriesData(name: "Tokyo", dataPoints: zip(categories, tokyoValues).map { ChartCategoryDataPoint(category: $0.0, value: $0.1) }),
            ChartSeriesData(name: "NewYork", dataPoints: zip(categories, newYorkValues).map { ChartCategoryDataPoint(category: $0.0, value: $0.1) }),
            ChartSeriesData(name: "London", dataPoints: zip(categories, londonValues).map { ChartCategoryDataPoint(category: $0.0, value: $0.1) }),
            ChartSeriesData(name: "Berlin", dataPoints: zip(categories, berlinValues).map { ChartCategoryDataPoint(category: $0.0, value: $0.1) })
        ]
    }
    
    func makeChart() -> some View {
        let seriesNames = seriesData.map { $0.name }
        return Chart {
            ForEach(seriesData) { series in
                self.seriesMarks(for: series)
            }
        }
        .chartForegroundStyleScale(domain: seriesNames, range: colors.prefix(seriesNames.count))
        .chartXAxis {
            AxisMarks(values: .automatic) { _ in
                AxisGridLine(stroke: StrokeStyle(dash: [2,3])).foregroundStyle(Color.gray.opacity(0.5))
                AxisTick()
                AxisValueLabel().foregroundStyle(Color.white)
            }
        }
        .chartYAxis {
            AxisMarks(values: .automatic) { axisValue in
                AxisGridLine(stroke: StrokeStyle(dash: [2,3])).foregroundStyle(Color.gray.opacity(0.5))
                AxisTick()
                AxisValueLabel {
                    if let doubleValue = axisValue.as(Double.self) {
                        Text("\(doubleValue, format: .number.precision(.fractionLength(1)))℃")
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .chartLegend(position: .bottom, alignment: .center) {
            // Legend item style
        }
    }
    
    private func seriesMarks(for series: ChartSeriesData) -> some ChartContent {
        ForEach(series.dataPoints) { dataPoint in
            AreaMark(
                x: .value("Category", dataPoint.category),
                y: .value("Value", dataPoint.value)
            )
            .foregroundStyle(by: .value("City", series.name))
        }
    }
}
