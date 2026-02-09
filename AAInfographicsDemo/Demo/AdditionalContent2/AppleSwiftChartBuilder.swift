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
    private let stackingType: AAChartStackingType
    private let chartModel: AAChartModel

    init(chartModel: AAChartModel) {
        self.chartType = chartModel.chartType ?? .area
        self.stackingType = chartModel.stacking ?? .none
        self.chartModel = chartModel
    }

    func makeChart() -> some View {
        let preparedSeriesData = seriesData
        let preparedColors = resolvedColors
        let preparedCategories = resolvedCategories
        let seriesNames = preparedSeriesData.map(\.name)

        return ChartWithTooltip(
            seriesData: preparedSeriesData,
            colors: preparedColors,
            chartType: chartType,
            seriesNames: seriesNames,
            categories: preparedCategories,
            stackingType: stackingType,
            animationEnabled: true
        )
    }

    private var sourceSeries: [AASeriesElement] {
        guard let rawSeries = chartModel.series else {
            return Self.defaultSeriesElements
        }

        if let series = rawSeries as? [AASeriesElement], !series.isEmpty {
            return series
        }

        if let series = (rawSeries as? [Any])?.compactMap({ $0 as? AASeriesElement }),
           !series.isEmpty {
            return series
        }

        return Self.defaultSeriesElements
    }

    private var normalizedSeries: [NormalizedSeries] {
        sourceSeries.enumerated().map { index, seriesElement in
            let name = seriesElement.name ?? "Series \(index + 1)"
            let values = normalizedValues(from: seriesElement.data)
            return NormalizedSeries(name: name, values: values)
        }
    }

    private var resolvedCategories: [String] {
        let maxValueCount = normalizedSeries.map(\.values.count).max() ?? 0
        let customCategories = chartModel.categories ?? []
        let targetCount = max(maxValueCount, customCategories.count)

        guard targetCount > 0 else {
            return Self.defaultCategories
        }

        if !customCategories.isEmpty {
            if customCategories.count >= targetCount {
                return Array(customCategories.prefix(targetCount))
            }

            var merged = customCategories
            merged.append(contentsOf: autoCategories(count: targetCount).dropFirst(customCategories.count))
            return merged
        }

        return autoCategories(count: targetCount)
    }

    private var resolvedColors: [Color] {
        if let colorsTheme = chartModel.colorsTheme {
            let themeColors = colorsTheme.compactMap { item -> Color? in
                guard let colorString = item as? String else {
                    return nil
                }
                return Color(hex: colorString)
            }
            if !themeColors.isEmpty {
                return themeColors
            }
        }

        return Self.defaultColors
    }

    private var seriesData: [ChartSeriesData] {
        let categories = resolvedCategories
        let series = normalizedSeries
        guard !series.isEmpty else {
            return []
        }

        if stackingType == .percent {
            return percentSeriesData(from: series, categories: categories)
        }

        return series.map { item in
            ChartSeriesData(
                name: item.name,
                dataPoints: makeDataPoints(categories: categories, values: item.values)
            )
        }
    }

    private func percentSeriesData(
        from series: [NormalizedSeries],
        categories: [String]
    ) -> [ChartSeriesData] {
        let valueCount = categories.count
        var percentValuesBySeries = Array(repeating: Array(repeating: 0.0, count: valueCount), count: series.count)

        for index in 0..<valueCount {
            let total = series.reduce(0.0) { partial, item in
                partial + (index < item.values.count ? item.values[index] : 0.0)
            }

            for (seriesIndex, item) in series.enumerated() {
                let value = index < item.values.count ? item.values[index] : 0.0
                percentValuesBySeries[seriesIndex][index] = total > 0 ? value / total * 100.0 : 0.0
            }
        }

        return series.enumerated().map { index, item in
            ChartSeriesData(
                name: item.name,
                dataPoints: makeDataPoints(categories: categories, values: percentValuesBySeries[index])
            )
        }
    }

    private func makeDataPoints(categories: [String], values: [Double]) -> [ChartCategoryDataPoint] {
        categories.enumerated().map { index, category in
            ChartCategoryDataPoint(
                category: category,
                value: index < values.count ? values[index] : 0.0
            )
        }
    }

    private func normalizedValues(from rawData: Any?) -> [Double] {
        if let values = rawData as? [Double] {
            return values
        }

        if let values = rawData as? [NSNumber] {
            return values.map(\.doubleValue)
        }

        if let values = rawData as? [Any] {
            return values.map { asDouble($0) ?? 0.0 }
        }

        return []
    }

    private func asDouble(_ value: Any) -> Double? {
        if let doubleValue = value as? Double { return doubleValue }
        if let intValue = value as? Int { return Double(intValue) }
        if let floatValue = value as? Float { return Double(floatValue) }
        if let numberValue = value as? NSNumber { return numberValue.doubleValue }
        if let stringValue = value as? String { return Double(stringValue) }
        return nil
    }

    private func autoCategories(count: Int) -> [String] {
        (0..<count).map { "Category \($0 + 1)" }
    }

    private struct NormalizedSeries {
        let name: String
        let values: [Double]
    }

    private static let defaultSeriesElements: [AASeriesElement] = [
        AASeriesElement().name("Tokyo").data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]),
        AASeriesElement().name("NewYork").data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]),
        AASeriesElement().name("London").data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]),
        AASeriesElement().name("Berlin").data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8])
    ]

    private static let defaultCategories: [String] = [
        "Java", "Swift", "Python", "Ruby", "PHP", "Go",
        "C", "C#", "C++", "Rust", "Kotlin", "TypeScript"
    ]

    private static let defaultColors: [Color] = [
        Color(hex: "#1e90ff"),
        Color(hex: "#ef476f"),
        Color(hex: "#ffd066"),
        Color(hex: "#04d69f"),
        Color(hex: "#25547c")
    ]
}

// MARK: - Tooltip Chart Wrapper

@available(iOS 16.0, *)
struct ChartWithTooltip: View {
    let seriesData: [ChartSeriesData]
    let colors: [Color]
    let chartType: AAChartType
    let seriesNames: [String]
    let categories: [String]
    let stackingType: AAChartStackingType
    let animationEnabled: Bool

    @State private var selectedCategory: String? = nil
    @State private var animateChart: Bool = false

    private var styleScaleColors: [Color] {
        guard !seriesNames.isEmpty else {
            return colors
        }

        guard !colors.isEmpty else {
            return Array(repeating: .blue, count: seriesNames.count)
        }

        return (0..<seriesNames.count).map { colors[$0 % colors.count] }
    }

    var body: some View {
        ZStack {
            Chart {
                ForEach(seriesData) { series in
                    chartMarks(for: series)
                }
            }
            .chartForegroundStyleScale(domain: seriesNames, range: styleScaleColors)
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
                            if stackingType == .percent {
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
            .opacity(animateChart ? 1.0 : 0.0)
            .scaleEffect(animateChart ? 1.0 : 0.8)
            .onAppear {
                if animationEnabled {
                    withAnimation(.easeInOut(duration: 1.2)) {
                        animateChart = true
                    }
                } else {
                    animateChart = true
                }
            }
            .chartOverlay { proxy in
                GeometryReader { geo in
                    Rectangle().fill(Color.clear).contentShape(Rectangle())
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { value in
                                    let location = value.location
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
                        }
                        .overlay(
                            Group {
                                if let selectedCategory {
                                    if chartType == .bar {
                                        // 水平条形图使用水平的十字线
                                        if let yPos = proxy.position(forY: selectedCategory) {
                                            Path { path in
                                                path.move(to: CGPoint(x: geo[proxy.plotAreaFrame].minX, y: yPos))
                                                path.addLine(to: CGPoint(x: geo[proxy.plotAreaFrame].maxX, y: yPos))
                                            }
                                            .stroke(Color.white.opacity(0.7), style: StrokeStyle(lineWidth: 1, dash: [4, 2]))
                                            .zIndex(1)

                                            tooltipView(category: selectedCategory)
                                                .position(x: geo[proxy.plotAreaFrame].maxX - 60, y: min(max(yPos, 40), geo.size.height - 40))
                                                .zIndex(2)
                                        }
                                    } else {
                                        // 其他图表类型使用垂直的十字线
                                        if let xPos = proxy.position(forX: selectedCategory) {
                                            Path { path in
                                                path.move(to: CGPoint(x: xPos, y: geo[proxy.plotAreaFrame].minY))
                                                path.addLine(to: CGPoint(x: xPos, y: geo[proxy.plotAreaFrame].maxY))
                                            }
                                            .stroke(Color.white.opacity(0.7), style: StrokeStyle(lineWidth: 1, dash: [4, 2]))
                                            .zIndex(1)

                                            tooltipView(category: selectedCategory)
                                                .position(x: min(max(xPos, 60), geo.size.width - 60), y: geo[proxy.plotAreaFrame].minY + 40)
                                                .zIndex(2)
                                        }
                                    }
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
            ForEach(series.dataPoints, id: \.category) { dataPoint in
                if stackingType == .none {
                    AreaMark(
                        x: .value("Category", dataPoint.category),
                        y: .value("Value", animateChart ? dataPoint.value : 0)
                    )
                    .foregroundStyle(by: .value("City", series.name))
                    .position(by: .value("Series", series.name))
                } else {
                    AreaMark(
                        x: .value("Category", dataPoint.category),
                        y: .value("Value", animateChart ? dataPoint.value : 0)
                    )
                    .foregroundStyle(by: .value("City", series.name))
                }
            }
        case .line:
            ForEach(series.dataPoints, id: \.category) { dataPoint in
                LineMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", animateChart ? dataPoint.value : 0)
                )
                .foregroundStyle(by: .value("City", series.name))
                .symbol(by: .value("City", series.name))
            }
        case .bar:
            ForEach(series.dataPoints, id: \.category) { dataPoint in
                if stackingType == .none {
                    BarMark(
                        x: .value("Value", animateChart ? dataPoint.value : 0),
                        y: .value("Category", dataPoint.category)
                    )
                    .foregroundStyle(by: .value("City", series.name))
                    .position(by: .value("Series", series.name))
                } else {
                    BarMark(
                        x: .value("Value", animateChart ? dataPoint.value : 0),
                        y: .value("Category", dataPoint.category)
                    )
                    .foregroundStyle(by: .value("City", series.name))
                }
            }
        case .column:
            ForEach(series.dataPoints, id: \.category) { dataPoint in
                if stackingType == .none {
                    BarMark(
                        x: .value("Category", dataPoint.category),
                        y: .value("Value", animateChart ? dataPoint.value : 0)
                    )
                    .foregroundStyle(by: .value("City", series.name))
                    .position(by: .value("Series", series.name))
                } else {
                    BarMark(
                        x: .value("Category", dataPoint.category),
                        y: .value("Value", animateChart ? dataPoint.value : 0)
                    )
                    .foregroundStyle(by: .value("City", series.name))
                }
            }
        case .spline:
            ForEach(series.dataPoints, id: \.category) { dataPoint in
                LineMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", animateChart ? dataPoint.value : 0)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(by: .value("City", series.name))
                .symbol(by: .value("City", series.name))
            }
        case .areaspline:
            ForEach(series.dataPoints, id: \.category) { dataPoint in
                if stackingType == .none {
                    AreaMark(
                        x: .value("Category", dataPoint.category),
                        y: .value("Value", animateChart ? dataPoint.value : 0)
                    )
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(by: .value("City", series.name))
                    .position(by: .value("Series", series.name))
                } else {
                    AreaMark(
                        x: .value("Category", dataPoint.category),
                        y: .value("Value", animateChart ? dataPoint.value : 0)
                    )
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(by: .value("City", series.name))
                }
            }
        case .bubble, .scatter:
            ForEach(series.dataPoints, id: \.category) { dataPoint in
                PointMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", animateChart ? dataPoint.value : 0)
                )
                .foregroundStyle(by: .value("City", series.name))
            }
        
        default:
            ForEach(series.dataPoints, id: \.category) { dataPoint in
                if stackingType == .none {
                    PointMark(
                        x: .value("Category", dataPoint.category),
                        y: .value("Value", animateChart ? dataPoint.value : 0)
                    )
                    .foregroundStyle(by: .value("City", series.name))
                } else {
                    PointMark(
                        x: .value("Category", dataPoint.category),
                        y: .value("Value", animateChart ? dataPoint.value : 0)
                    )
                    .foregroundStyle(by: .value("City", series.name))
                }
            }
        }
    }

    private func findNearestCategory(location: CGPoint, proxy: ChartProxy, geometry: GeometryProxy) -> (String, CGFloat)? {
        // 计算距离最近的 category
        let plotFrame = geometry[proxy.plotAreaFrame]
        
        // 使用实际的类别数组，而不是预设的
        let actualCategories = seriesData.first?.dataPoints.map { $0.category } ?? categories
        
        if chartType == .bar {
            // 对于水平条形图，使用 y 轴查找类别
            let y = location.y - plotFrame.origin.y
            var minDistance: CGFloat = .infinity
            var nearestCategory: String?
            var nearestY: CGFloat = 0
            for cat in actualCategories {
                if let catY = proxy.position(forY: cat) {
                    let distance = abs(catY - y)
                    if distance < minDistance {
                        minDistance = distance
                        nearestCategory = cat
                        nearestY = catY
                    }
                }
            }
            if let nearestCategory {
                return (nearestCategory, nearestY + plotFrame.origin.y)
            }
        } else {
            // 对于其他图表类型，使用 x 轴查找类别
            let x = location.x - plotFrame.origin.x
            var minDistance: CGFloat = .infinity
            var nearestCategory: String?
            var nearestX: CGFloat = 0
            for cat in actualCategories {
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
        }
        return nil
    }

    @ViewBuilder
    private func tooltipView(category: String) -> some View {
        let values: [(String, Double, Color)] = seriesData.enumerated().compactMap { idx, series in
            if let dp = series.dataPoints.first(where: { $0.category == category }) {
                return (series.name, dp.value, colorForSeries(at: idx))
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
                    let suffix = stackingType == .percent ? "%" : "℃"
                    Text("\(name): \(value, specifier: "%.1f")\(suffix)")
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

    private func colorForSeries(at index: Int) -> Color {
        guard !colors.isEmpty else {
            return .blue
        }
        return colors[index % colors.count]
    }
}
