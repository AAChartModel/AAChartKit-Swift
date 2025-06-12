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
    private let chartModel: AAChartModel?
    
    init(chartModel: AAChartModel) {
        self.chartType = chartModel.chartType ?? .area
        self.stackingType = chartModel.stacking ?? .none
        self.chartModel = chartModel
    }
    
    private var categories: [String] {
        if let model = chartModel,
           let categories = model.categories {
            return categories
        }
        
        // 根据实际数据长度动态生成类别
        let maxDataLength = seriesArray.reduce(0) { maxLength, seriesElement in
            var dataLength = 0
            if let dataArray = seriesElement.data as? [Any] {
                dataLength = dataArray.count
            }
            return max(maxLength, dataLength)
        }
        
        if maxDataLength > 0 {
            return (0..<maxDataLength).map { "Category \($0 + 1)" }
        }
        
        return ["Java", "Swift", "Python", "Ruby", "PHP", "Go",
                "C", "C#", "C++", "Rust", "Kotlin", "TypeScript"]
    }
    
    private var seriesArray: [AASeriesElement] {
        if let model = chartModel,
           let series = model.series {
            print("📊 [DEBUG] chartModel.series 类型: \(type(of: series))")
            print("📊 [DEBUG] chartModel.series 数量: \(series.count)")
            
            // 更安全的类型转换
            if let seriesElements = series as? [AASeriesElement] {
                print("📊 [DEBUG] 成功转换为 [AASeriesElement], 数量: \(seriesElements.count)")
                for (index, element) in seriesElements.enumerated() {
                    print("📊 [DEBUG] Series[\(index)]: name=\(element.name ?? "nil"), data类型=\(type(of: element.data))")
                    if let dataArray = element.data as? [Any] {
                        print("📊 [DEBUG] Series[\(index)] data数量: \(dataArray.count), 前3个值: \(Array(dataArray.prefix(3)))")
                    }
                }
                return seriesElements
            } else {
                print("❌ [ERROR] 无法将 series 转换为 [AASeriesElement]")
                print("❌ [ERROR] series 实际类型: \(type(of: series))")
                
                // 尝试其他可能的类型转换
                if let anyArray = series as? [Any] {
                    print("📊 [DEBUG] series 是 [Any] 类型，尝试逐个转换")
                    let convertedSeries = anyArray.compactMap { $0 as? AASeriesElement }
                    print("📊 [DEBUG] 转换后的 series 数量: \(convertedSeries.count)")
                    if !convertedSeries.isEmpty {
                        return convertedSeries
                    }
                }
            }
        } else {
            print("📊 [DEBUG] 使用默认数据，chartModel 或 series 为 nil")
        }
        
        // 默认数据
        let tokyoValues = [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
        let newYorkValues = [0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
        let londonValues = [0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
        let berlinValues = [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
        
        print("📊 [DEBUG] 返回默认数据")
        return [
            AASeriesElement().name("Tokyo").data(tokyoValues),
            AASeriesElement().name("NewYork").data(newYorkValues),
            AASeriesElement().name("London").data(londonValues),
            AASeriesElement().name("Berlin").data(berlinValues)
        ]
    }
    
    private var colors: [Color] {
        if let model = chartModel,
           let colorsArray = model.colorsTheme {
            print("📊 [DEBUG] 使用 chartModel 的颜色主题，数量: \(colorsArray.count)")
            return colorsArray.compactMap { colorItem in
                if let colorString = colorItem as? String {
                    return Color(hex: colorString)
                }
                return nil
            }
        }
        print("📊 [DEBUG] 使用默认颜色主题")
        return [
            Color(hex: "#1e90ff"), // Tokyo
            Color(hex: "#ef476f"), // NewYork
            Color(hex: "#ffd066"), // London
            Color(hex: "#04d69f"), // Berlin
            Color(hex: "#25547c")  // 5th color
        ]
    }
    
    private var seriesData: [ChartSeriesData] {
        let series = seriesArray
        
        print("📊 [DEBUG] 开始处理 seriesData，series数量: \(series.count)")
        print("📊 [DEBUG] stackingType: \(stackingType)")
        
        if stackingType == .percent {
            // 计算每个类别下的总和
            var allValues: [[Double]] = []
            for seriesElement in series {
                if let dataArray = seriesElement.data as? [Double] {
                    allValues.append(dataArray)
                } else if let dataArray = seriesElement.data as? [Any] {
                    let doubleArray = dataArray.compactMap { $0 as? Double }
                    allValues.append(doubleArray)
                }
            }
            
            if !allValues.isEmpty {
                let maxCount = allValues.map { $0.count }.max() ?? 0
                let dynamicCategories = (0..<maxCount).map { "Category \($0 + 1)" }
                
                var percentSeries: [[Double]] = Array(repeating: [], count: allValues.count)
                
                for i in 0..<maxCount {
                    let sum = allValues.reduce(0) { $0 + (i < $1.count ? $1[i] : 0) }
                    for (j, values) in allValues.enumerated() {
                        let value = i < values.count ? values[i] : 0
                        let percent = sum > 0 ? value / sum * 100.0 : 0
                        percentSeries[j].append(percent)
                    }
                }
                
                return series.enumerated().map { index, seriesElement in
                    let name = seriesElement.name ?? "Series \(index + 1)"
                    let dataPoints = zip(dynamicCategories, percentSeries[index]).map {
                        ChartCategoryDataPoint(category: $0.0, value: $0.1)
                    }
                    return ChartSeriesData(name: name, dataPoints: dataPoints)
                }
            }
        }
        
        // 正常数据处理
        let result = series.enumerated().map { index, seriesElement in
            let name = seriesElement.name ?? "Series \(index + 1)"
            var dataPoints: [ChartCategoryDataPoint] = []
            
            print("📊 [DEBUG] 处理 Series[\(index)]: \(name)")
            
            if let dataArray = seriesElement.data as? [Double] {
                print("📊 [DEBUG] Series[\(index)] 数据类型: [Double], 数量: \(dataArray.count)")
                let dynamicCategories = (0..<dataArray.count).map { "Category \($0 + 1)" }
                dataPoints = zip(dynamicCategories, dataArray).map {
                    ChartCategoryDataPoint(category: $0.0, value: $0.1)
                }
            } else if let dataArray = seriesElement.data as? [Any] {
                print("📊 [DEBUG] Series[\(index)] 数据类型: [Any], 数量: \(dataArray.count)")
                let doubleArray = dataArray.compactMap { item -> Double? in
                    if let doubleValue = item as? Double {
                        return doubleValue
                    } else if let intValue = item as? Int {
                        return Double(intValue)
                    } else if let floatValue = item as? Float {
                        return Double(floatValue)
                    } else if let stringValue = item as? String, let doubleValue = Double(stringValue) {
                        return doubleValue
                    }
                    print("⚠️ [WARNING] 无法转换数据项: \(item), 类型: \(type(of: item))")
                    return nil
                }
                print("📊 [DEBUG] Series[\(index)] 转换后的 Double 数组数量: \(doubleArray.count)")
                let dynamicCategories = (0..<doubleArray.count).map { "Category \($0 + 1)" }
                dataPoints = zip(dynamicCategories, doubleArray).map {
                    ChartCategoryDataPoint(category: $0.0, value: $0.1)
                }
            } else {
                print("❌ [ERROR] Series[\(index)] 数据类型未知: \(type(of: seriesElement.data))")
            }
            
            print("📊 [DEBUG] Series[\(index)] 最终数据点数量: \(dataPoints.count)")
            return ChartSeriesData(name: name, dataPoints: dataPoints)
        }
        
        print("📊 [DEBUG] seriesData 处理完成，总数量: \(result.count)")
        return result
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
            stackingType: stackingType,
            animationEnabled: true
        )
    }

    @ChartContentBuilder
    private func seriesMarks(for series: ChartSeriesData) -> some ChartContent {
        let stackingType = self.stackingType
        switch chartType {
        case .area:
            ForEach(series.dataPoints) { dataPoint in
                if stackingType == .none {
                    AreaMark(
                        x: .value("Category", dataPoint.category),
                        y: .value("Value", dataPoint.value)
                    )
                    .foregroundStyle(by: .value("City", series.name))
                    .position(by: .value("Series", series.name))
                } else {
                    AreaMark(
                        x: .value("Category", dataPoint.category),
                        y: .value("Value", dataPoint.value)
                    )
                    .foregroundStyle(by: .value("City", series.name))
                }
            }
        case .areaspline:
            ForEach(series.dataPoints) { dataPoint in
                if stackingType == .none {
                    AreaMark(
                        x: .value("Category", dataPoint.category),
                        y: .value("Value", dataPoint.value)
                    )
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(by: .value("City", series.name))
                    .position(by: .value("Series", series.name))
                } else {
                    AreaMark(
                        x: .value("Category", dataPoint.category),
                        y: .value("Value", dataPoint.value)
                    )
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(by: .value("City", series.name))
                }
            }
        case .line:
            ForEach(series.dataPoints) { dataPoint in
                LineMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", dataPoint.value)
                )
                .foregroundStyle(by: .value("City", series.name))
                .symbol(by: .value("City", series.name))
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
            }
        case .bar:
            ForEach(series.dataPoints) { dataPoint in
                if stackingType == .none {
                    BarMark(
                        x: .value("Value", dataPoint.value),
                        y: .value("Category", dataPoint.category)
                    )
                    .foregroundStyle(by: .value("City", series.name))
                    .position(by: .value("Series", series.name))
                } else {
                    BarMark(
                        x: .value("Value", dataPoint.value),
                        y: .value("Category", dataPoint.category)
                    )
                    .foregroundStyle(by: .value("City", series.name))
                }
            }
        case .column:
            ForEach(series.dataPoints) { dataPoint in
                if stackingType == .none {
                    BarMark(
                        x: .value("Category", dataPoint.category),
                        y: .value("Value", dataPoint.value)
                    )
                    .foregroundStyle(by: .value("City", series.name))
                    .position(by: .value("Series", series.name))
                } else {
                    BarMark(
                        x: .value("Category", dataPoint.category),
                        y: .value("Value", dataPoint.value)
                    )
                    .foregroundStyle(by: .value("City", series.name))
                }
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
                if stackingType == .none {
                    AreaMark(
                        x: .value("Category", dataPoint.category),
                        y: .value("Value", dataPoint.value)
                    )
                    .foregroundStyle(by: .value("City", series.name))
                    .position(by: .value("Series", series.name))
                } else {
                    AreaMark(
                        x: .value("Category", dataPoint.category),
                        y: .value("Value", dataPoint.value)
                    )
                    .foregroundStyle(by: .value("City", series.name))
                }
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
    let stackingType: AAChartStackingType
    let animationEnabled: Bool

    @State private var selectedCategory: String? = nil
    @State private var currentLocation: CGPoint? = nil
    @State private var animateChart: Bool = false

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

                                            tooltipView(category: selectedCategory, proxy: proxy, geometry: geo)
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

                                            tooltipView(category: selectedCategory, proxy: proxy, geometry: geo)
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
            ForEach(series.dataPoints) { dataPoint in
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
            ForEach(series.dataPoints) { dataPoint in
                LineMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", animateChart ? dataPoint.value : 0)
                )
                .foregroundStyle(by: .value("City", series.name))
                .symbol(by: .value("City", series.name))
            }
        case .bar:
            ForEach(series.dataPoints) { dataPoint in
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
            ForEach(series.dataPoints) { dataPoint in
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
            ForEach(series.dataPoints) { dataPoint in
                LineMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", animateChart ? dataPoint.value : 0)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(by: .value("City", series.name))
                .symbol(by: .value("City", series.name))
            }
        case .areaspline:
            ForEach(series.dataPoints) { dataPoint in
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
            ForEach(series.dataPoints) { dataPoint in
                PointMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", animateChart ? dataPoint.value : 0)
                )
                .foregroundStyle(by: .value("City", series.name))
            }
        
        default:
            ForEach(series.dataPoints) { dataPoint in
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
}
