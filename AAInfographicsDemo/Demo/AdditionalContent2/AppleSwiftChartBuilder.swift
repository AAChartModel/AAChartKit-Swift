//
//  AppleSwiftChartBuilder.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/6/12.
//  Copyright © 2025 An An. All rights reserved.
//
import SwiftUI // Required for UIHostingController and Color
import Charts   // Required for Swift Charts
import AAInfographics

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
// MARK: - Chart Builder

@available(iOS 16.0, *)
class AppleSwiftChartBuilder {

    
    private let chartType: AAChartType
    private let isPercentStacked: Bool
    
    init(chartType: AAChartType = .area, isPercentStacked: Bool = false) {
        self.chartType = chartType
        self.isPercentStacked = isPercentStacked
    }
    
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
        if isPercentStacked {
            // 计算每个类别下的总和
            let allValues = [tokyoValues, newYorkValues, londonValues, berlinValues]
            var percentSeries: [[Double]] = Array(repeating: [], count: allValues.count)
            for i in 0..<categories.count {
                let sum = allValues.reduce(0) { $0 + $1[i] }
                for (j, values) in allValues.enumerated() {
                    let percent = sum > 0 ? values[i] / sum * 100.0 : 0
                    percentSeries[j].append(percent)
                }
            }
            return [
                ChartSeriesData(name: "Tokyo", dataPoints: zip(categories, percentSeries[0]).map { ChartCategoryDataPoint(category: $0.0, value: $0.1) }),
                ChartSeriesData(name: "NewYork", dataPoints: zip(categories, percentSeries[1]).map { ChartCategoryDataPoint(category: $0.0, value: $0.1) }),
                ChartSeriesData(name: "London", dataPoints: zip(categories, percentSeries[2]).map { ChartCategoryDataPoint(category: $0.0, value: $0.1) }),
                ChartSeriesData(name: "Berlin", dataPoints: zip(categories, percentSeries[3]).map { ChartCategoryDataPoint(category: $0.0, value: $0.1) })
            ]
        } else {
            return [
                ChartSeriesData(name: "Tokyo", dataPoints: zip(categories, tokyoValues).map { ChartCategoryDataPoint(category: $0.0, value: $0.1) }),
                ChartSeriesData(name: "NewYork", dataPoints: zip(categories, newYorkValues).map { ChartCategoryDataPoint(category: $0.0, value: $0.1) }),
                ChartSeriesData(name: "London", dataPoints: zip(categories, londonValues).map { ChartCategoryDataPoint(category: $0.0, value: $0.1) }),
                ChartSeriesData(name: "Berlin", dataPoints: zip(categories, berlinValues).map { ChartCategoryDataPoint(category: $0.0, value: $0.1) })
            ]
        }
    }
    
    @State private var selectedCategory: String? = nil
    @State private var currentLocation: CGPoint? = nil

    func makeChart() -> some View {
        let seriesNames = seriesData.map { $0.name }
        return ChartWithTooltip(
            seriesData: seriesData,
            colors: colors,
            chartType: chartType,
            seriesNames: seriesNames,
            categories: categories,
            isPercentStacked: isPercentStacked
        )
    }

    @ChartContentBuilder
    private func seriesMarks(for series: ChartSeriesData) -> some ChartContent {
        switch chartType {
        case .area:
            ForEach(series.dataPoints) { dataPoint in
                AreaMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", dataPoint.value)
                )
                .foregroundStyle(by: .value("City", series.name))
                .position(by: .value("Stack", self.isPercentStacked ? "percent" : "normal"))
            }
        case .areaspline:
            ForEach(series.dataPoints) { dataPoint in
                AreaMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", dataPoint.value)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(by: .value("City", series.name))
                .position(by: .value("Stack", self.isPercentStacked ? "percent" : "normal"))
            }
        case .line:
            ForEach(series.dataPoints) { dataPoint in
                LineMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", dataPoint.value)
                )
                .foregroundStyle(by: .value("City", series.name))
                .symbol(by: .value("City", series.name))
                .position(by: .value("Stack", self.isPercentStacked ? "percent" : "normal"))
            }
        case .spline:
            ForEach(series.dataPoints) { dataPoint in
                LineMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", dataPoint.value)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(by: .value("City", series.name))
                .symbol(by: .value("City", series.name))
                .position(by: .value("Stack", self.isPercentStacked ? "percent" : "normal"))
            }
        case .bar:
            ForEach(series.dataPoints) { dataPoint in
                BarMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", dataPoint.value)
                )
                .foregroundStyle(by: .value("City", series.name))
                .position(by: .value("Stack", self.isPercentStacked ? "percent" : "normal"))
            }
        case .column:
            ForEach(series.dataPoints) { dataPoint in
                BarMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", dataPoint.value)
                )
                .foregroundStyle(by: .value("City", series.name))
                .position(by: .value("Stack", self.isPercentStacked ? "percent" : "normal"))
//                .rotationEffect(.degrees(90))
            }
        case .bubble:
            ForEach(series.dataPoints) { dataPoint in
                PointMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", dataPoint.value)
//                    size: .value("BubbleSize", abs(dataPoint.value))
                )
                .foregroundStyle(by: .value("City", series.name))
            }
        case .scatter:
            ForEach(series.dataPoints) { dataPoint in
                PointMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", dataPoint.value)
                )
                .foregroundStyle(by: .value("City", series.name))
            }

        default:
            // ChartContentBuilder 不允许 break/continue/return 等控制流语句
            // 直接写 ForEach 即可，不要加 break
            ForEach(series.dataPoints) { dataPoint in
                AreaMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", dataPoint.value)
                )
                .foregroundStyle(by: .value("City", series.name))
                .position(by: .value("Stack", self.isPercentStacked ? "percent" : "normal"))
            }
        }
    }
}

// MARK: - Tooltip Chart Wrapper

@available(iOS 16.0, *)
struct ChartWithTooltip: View {
    let seriesData: [ChartSeriesData]
    let colors: [Color]
    let chartType: AAChartType
    let seriesNames: [String]
    let categories: [String]
    let isPercentStacked: Bool

    @State private var selectedCategory: String? = nil
    @State private var currentLocation: CGPoint? = nil

    var body: some View {
        ZStack {
            Chart {
                ForEach(seriesData) { series in
                    chartMarks(for: series)
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
                            if isPercentStacked {
                                Text("\(doubleValue, specifier: "%.0f")%")
                                    .foregroundColor(.white)
                            } else {
                                Text("\(doubleValue, format: .number.precision(.fractionLength(1)))℃")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
            }
            .chartLegend(position: .bottom, alignment: .center) {
                // Legend item style
            }
            .chartOverlay { proxy in
                GeometryReader { geo in
                    Rectangle().fill(Color.clear).contentShape(Rectangle())
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { value in
                                    let location = value.location
                                    currentLocation = location
                                    if let (category, _) = findNearestCategory(location: location, proxy: proxy, geometry: geo) {
                                        selectedCategory = category
                                    }
                                }
                                .onEnded { _ in
                                    // 保持 tooltip 显示，若需消失可设为 nil
                                }
                        )
                        .onTapGesture {
                            selectedCategory = nil
                            currentLocation = nil
                        }
                        .overlay(
                            Group {
                                if let selectedCategory,
                                   let xPos = proxy.position(forX: selectedCategory) {
                                    // Crosshair
                                    Path { path in
                                        path.move(to: CGPoint(x: xPos, y: geo[proxy.plotAreaFrame].minY))
                                        path.addLine(to: CGPoint(x: xPos, y: geo[proxy.plotAreaFrame].maxY))
                                    }
                                    .stroke(Color.white.opacity(0.7), style: StrokeStyle(lineWidth: 1, dash: [4, 2]))
                                    .zIndex(1)

                                    // Tooltip
                                    tooltipView(category: selectedCategory, proxy: proxy, geometry: geo)
                                        .position(x: min(max(xPos, 60), geo.size.width - 60), y: geo[proxy.plotAreaFrame].minY + 40)
                                        .zIndex(2)
                                }
                            }
                        )
                }
            }
        }
    }

    @ChartContentBuilder
    private func chartMarks(for series: ChartSeriesData) -> some ChartContent {
        switch chartType {
        case .area:
            ForEach(series.dataPoints) { dataPoint in
                AreaMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", dataPoint.value)
                )
                .foregroundStyle(by: .value("City", series.name))
                .position(by: .value("Stack", isPercentStacked ? "percent" : "normal"))
            }
        case .line:
            ForEach(series.dataPoints) { dataPoint in
                LineMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", dataPoint.value)
                )
                .foregroundStyle(by: .value("City", series.name))
                .symbol(by: .value("City", series.name))
                .position(by: .value("Stack", isPercentStacked ? "percent" : "normal"))
            }
        case .bar:
            ForEach(series.dataPoints) { dataPoint in
                BarMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", dataPoint.value)
                )
                .foregroundStyle(by: .value("City", series.name))
                .position(by: .value("Stack", isPercentStacked ? "percent" : "normal"))
            }
        case .column:
            ForEach(series.dataPoints) { dataPoint in
                BarMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", dataPoint.value)
                )
                .foregroundStyle(by: .value("City", series.name))
                .position(by: .value("Stack", isPercentStacked ? "percent" : "normal"))
                //                .rotationEffect(.degrees(90))
            }
        case .spline:
            ForEach(series.dataPoints) { dataPoint in
                LineMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", dataPoint.value)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(by: .value("City", series.name))
                .symbol(by: .value("City", series.name))
                .position(by: .value("Stack", isPercentStacked ? "percent" : "normal"))
            }
        case .areaspline:
            ForEach(series.dataPoints) { dataPoint in
                AreaMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", dataPoint.value)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(by: .value("City", series.name))
                .position(by: .value("Stack", isPercentStacked ? "percent" : "normal"))
            }
        case .bubble:
            ForEach(series.dataPoints) { dataPoint in
                PointMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", dataPoint.value)
                    //                    size: .value("BubbleSize", abs(dataPoint.value))
                )
                .foregroundStyle(by: .value("City", series.name))
            }
        case .scatter:
            ForEach(series.dataPoints) { dataPoint in
                PointMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", dataPoint.value)
                )
                .foregroundStyle(by: .value("City", series.name))
            }
      
        default:
            ForEach(series.dataPoints) { dataPoint in
                PointMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", dataPoint.value)
                )
                .foregroundStyle(by: .value("City", series.name))
            }
        }
    }

    private func findNearestCategory(location: CGPoint, proxy: ChartProxy, geometry: GeometryProxy) -> (String, CGFloat)? {
        // 计算距离最近的 category
        let plotFrame = geometry[proxy.plotAreaFrame]
        let x = location.x - plotFrame.origin.x
        var minDistance: CGFloat = .infinity
        var nearestCategory: String?
        var nearestX: CGFloat = 0
        for cat in categories {
            if let catX = proxy.position(forX: cat) {
                let distance = abs(catX - x)
                if distance < minDistance {
                    minDistance = distance
                    nearestCategory = cat
                    nearestX = catX
                }
            }
        }
        if let nearestCategory {
            return (nearestCategory, nearestX + plotFrame.origin.x)
        }
        return nil
    }

    @ViewBuilder
    private func tooltipView(category: String, proxy: ChartProxy, geometry: GeometryProxy) -> some View {
        let values: [(String, Double, Color)] = seriesData.enumerated().compactMap { idx, series in
            if let dp = series.dataPoints.first(where: { $0.category == category }) {
                return (series.name, dp.value, colors[idx])
            }
            return nil
        }
        VStack(alignment: .leading, spacing: 4) {
            Text(category)
                .font(.headline)
                .foregroundColor(.white)
            ForEach(values, id: \.0) { (name, value, color) in
                HStack(spacing: 8) {
                    Circle().fill(color).frame(width: 8, height: 8)
                    Text("\(name): \(value, specifier: "%.1f")℃")
                        .foregroundColor(.white)
                        .font(.caption)
                }
            }
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.black.opacity(0.85))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.white.opacity(0.2), lineWidth: 1)
        )
        .shadow(radius: 4)
    }
}
