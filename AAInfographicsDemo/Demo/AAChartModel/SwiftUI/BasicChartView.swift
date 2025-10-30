//
//  BasicChartView.swift
//  AAInfographicsDemo
//
//  Created by Kiro on 2025/10/30.
//  Copyright © 2025 An An. All rights reserved.
//

import SwiftUI
import AAInfographics

/// A SwiftUI view that replicates the functionality of BasicChartVC
@available(iOS 14.0, macCatalyst 14.0, *)
struct BasicChartView: View {
    
    // MARK: - Input Parameters
    
    let chartType: AAChartType
    let step: Bool?
    
    // MARK: - State Properties
    
    @State private var chartModel: AAChartModel
    @State private var stackingTypeIndex: Int = 0
    @State private var secondControlIndex: Int = 0
    @State private var xReversed: Bool = false
    @State private var yReversed: Bool = false
    @State private var inverted: Bool = false
    @State private var polar: Bool = false
    @State private var dataLabelsEnabled: Bool = false
    @State private var markerHidden: Bool = false
    
    // MARK: - Initialization
    
    init(chartType: AAChartType, step: Bool? = nil) {
        self.chartType = chartType
        self.step = step
        
        // Initialize the chart model based on chartType and step
        _chartModel = State(initialValue: Self.createInitialChartModel(chartType: chartType, step: step))
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 0) {
            // Chart View
            AAChartModelViewRepresentable(
                chartModel: $chartModel,
                onChartLoaded: {
                    print("🚀🚀🚀, AAChartView Did Finished Load!!!")
                },
                onChartClicked: { message in
                    print(
                        """
                        clicked point series element name: \(message.name ?? "")
                        🖱🖱🖱WARNING!!!!!!!!!!!!!!!!!!!! Click Event Message !!!!!!!!!!!!!!!!!!!! WARNING🖱🖱🖱
                        ------------------------------------------------------------------------------------------
                        user finger moved over!!!,get the move over event message: {
                            category : \(message.category ?? "")
                            index : \(message.index ?? 0)
                            name : \(message.name ?? "")
                            offset : \(message.offset ?? [String: Any]())
                            x : \(message.x ?? 0.0)
                            y : \(message.y ?? 0.0)
                        }
                        ------------------------------------------------------------------------------------------
                        """
                    )
                },
                onChartMoveOver: { message in
                    print(
                        """
                        selected point series element name: \(message.name ?? "")
                        👌👌👌👌👌WARNING!!!!!!!!!!!!!!!!!! Touch Event Message !!!!!!!!!!!!!!!!! WARNING👌👌👌👌👌
                        | ------------------------------------------------------------------------------------------
                        | user finger moved over!!!,get the move over event message: {
                        |     category : \(message.category ?? "")
                        |     index : \(message.index ?? 0)
                        |     name : \(message.name ?? "")
                        |     offset : \(message.offset ?? [String: Any]())
                        |     x : \(message.x ?? 0.0)
                        |     y : \(message.y ?? 0.0)
                        | }
                        | ------------------------------------------------------------------------------------------
                        """
                    )
                }
            )
            .padding(.top, 60)
            .padding(.bottom, 220)
            
            Spacer()
            
            // Segmented Controls Area
            VStack(spacing: 8) {
                // First control: Stacking type selection
                SegmentedControlRow(
                    title: "Stacking Type Selection",
                    options: ["No stacking", "Normal stacking", "Percent stacking"],
                    selection: $stackingTypeIndex
                )
                .onChange(of: stackingTypeIndex) { newValue in
                    updateStackingType(index: newValue)
                }
                
                // Second control: Border radius or marker symbol based on chart type
                if chartType == .column || chartType == .bar {
                    SegmentedControlRow(
                        title: "Corners Style Type Selection",
                        options: ["Square corners", "Soft corners", "Rounded corners"],
                        selection: $secondControlIndex
                    )
                    .onChange(of: secondControlIndex) { newValue in
                        updateBorderRadius(index: newValue)
                    }
                } else {
                    SegmentedControlRow(
                        title: "Marker Symbols Type Selection",
                        options: ["◉ ◉ ◉", "■ ■ ■", "◆ ◆ ◆", "▲ ▲ ▲", "▼ ▼ ▼"],
                        selection: $secondControlIndex
                    )
                    .onChange(of: secondControlIndex) { newValue in
                        updateMarkerSymbol(index: newValue)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 110)
            
            // Toggle Controls Area
            HStack(spacing: 8) {
                let hasSixToggles = chartType != .column && chartType != .bar
                let toggleFontSize: CGFloat = hasSixToggles ? 9 : 10
                
                ToggleControl(title: "xReversed", isOn: $xReversed, fontSize: toggleFontSize)
                    .frame(maxWidth: .infinity)
                    .onChange(of: xReversed) { newValue in
                        chartModel.xAxisReversed(newValue)
                        chartModel = chartModel // Trigger update
                    }
                
                ToggleControl(title: "yReversed", isOn: $yReversed, fontSize: toggleFontSize)
                    .frame(maxWidth: .infinity)
                    .onChange(of: yReversed) { newValue in
                        chartModel.yAxisReversed(newValue)
                        chartModel = chartModel // Trigger update
                    }
                
                ToggleControl(title: "xInverted", isOn: $inverted, fontSize: toggleFontSize)
                    .frame(maxWidth: .infinity)
                    .onChange(of: inverted) { newValue in
                        chartModel.inverted(newValue)
                        chartModel = chartModel // Trigger update
                    }
                
                ToggleControl(title: "Polarization", isOn: $polar, fontSize: toggleFontSize)
                    .frame(maxWidth: .infinity)
                    .onChange(of: polar) { newValue in
                        chartModel.polar(newValue)
                        chartModel = chartModel // Trigger update
                    }
                
                ToggleControl(title: "DataShow", isOn: $dataLabelsEnabled, fontSize: toggleFontSize)
                    .frame(maxWidth: .infinity)
                    .onChange(of: dataLabelsEnabled) { newValue in
                        chartModel.dataLabelsEnabled(newValue)
                        chartModel = chartModel // Trigger update
                    }
                
                // Conditionally show HideMarker toggle for non-column/bar charts
                if hasSixToggles {
                    ToggleControl(title: "HideMarker", isOn: $markerHidden, fontSize: toggleFontSize)
                        .frame(maxWidth: .infinity)
                        .onChange(of: markerHidden) { newValue in
                            chartModel.markerRadius(newValue ? 0 : 5)
                            chartModel = chartModel // Trigger update
                        }
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            .frame(height: 70)
        }
        .background(Color(red: 0x22/255, green: 0x32/255, blue: 0x4c/255))
        .navigationTitle(chartType.rawValue)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Helper Methods
    
    /// Creates the initial chart model based on chartType and step parameters
    private static func createInitialChartModel(chartType: AAChartType, step: Bool?) -> AAChartModel {
        var model: AAChartModel
        
        if (chartType == .area && step == true) || (chartType == .line && step == true) {
            model = BasicChartComposer.configureStepAreaChartAndStepLineChart()
        } else if chartType == .column || chartType == .bar {
            model = BasicChartComposer.configureColumnChartAndBarChart()
        } else if chartType == .area || chartType == .areaspline {
            model = BasicChartComposer.configureAreaChartAndAreasplineChartStyle(chartType)
        } else if chartType == .line || chartType == .spline {
            model = BasicChartComposer.configureLineChartAndSplineChartStyle(chartType)
        } else {
            model = AAChartModel()
        }
        
        model.chartType = chartType
        return model
    }
    
    /// Updates the stacking type based on segmented control selection
    private func updateStackingType(index: Int) {
        let stackingTypes: [AAChartStackingType] = [.none, .normal, .percent]
        chartModel.stacking(stackingTypes[index])
        // Trigger view update by creating a new reference
        chartModel = chartModel
    }
    
    /// Updates the border radius for column/bar charts
    private func updateBorderRadius(index: Int) {
        let borderRadiusValues: [Any] = [1, 10, "50%"]
        let borderRadius = borderRadiusValues[index]
        
        if let intValue = borderRadius as? Int {
            chartModel.borderRadius(Float(intValue))
        } else if let stringValue = borderRadius as? String {
            chartModel.borderRadius(stringValue)
        }
        // Trigger view update by creating a new reference
        chartModel = chartModel
    }
    
    /// Updates the marker symbol for non-column/bar charts
    private func updateMarkerSymbol(index: Int) {
        let symbols: [AAChartSymbolType] = [.circle, .square, .diamond, .triangle, .triangleDown]
        chartModel.markerSymbol(symbols[index])
        // Trigger view update by creating a new reference
        chartModel = chartModel
    }
}

// MARK: - Preview
#if DEBUG
@available(iOS 14.0, *)
struct BasicChartView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // Area Chart Preview
            NavigationView {
                BasicChartView(chartType: .area)
            }
            .previewDisplayName("Area Chart")
            
            // Column Chart Preview
            NavigationView {
                BasicChartView(chartType: .column)
            }
            .previewDisplayName("Column Chart")
            
            // Line Chart Preview
            NavigationView {
                BasicChartView(chartType: .line)
            }
            .previewDisplayName("Line Chart")
            
            // Bar Chart Preview
            NavigationView {
                BasicChartView(chartType: .bar)
            }
            .previewDisplayName("Bar Chart")
            
            // Spline Chart Preview
            NavigationView {
                BasicChartView(chartType: .spline)
            }
            .previewDisplayName("Spline Chart")
            
            // Step Line Chart Preview
            NavigationView {
                BasicChartView(chartType: .line, step: true)
            }
            .previewDisplayName("Step Line Chart")
            
            // Area Chart on iPhone SE (Small Screen)
            NavigationView {
                BasicChartView(chartType: .area)
            }
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("Area - iPhone SE")
            
            // Column Chart on iPhone 15 Pro Max (Large Screen)
            NavigationView {
                BasicChartView(chartType: .column)
            }
            .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro Max"))
            .previewDisplayName("Column - iPhone 15 Pro Max")
            
            // Line Chart on iPad (Tablet)
            NavigationView {
                BasicChartView(chartType: .line)
            }
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (6th generation)"))
            .previewDisplayName("Line - iPad Pro")
        }
    }
}
#endif
