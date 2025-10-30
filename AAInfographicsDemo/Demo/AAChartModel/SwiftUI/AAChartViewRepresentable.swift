//
//  AAChartViewRepresentable.swift
//  AAInfographicsDemo
//
//  Created by Kiro on 2025/10/30.
//  Copyright © 2025 An An. All rights reserved.
//

import SwiftUI
import AAInfographics

/// A SwiftUI wrapper for AAChartView that bridges UIKit to SwiftUI
/// This version uses AAChartModel for configuration
@available(iOS 14.0, macCatalyst 13.1, *)
struct AAChartModelViewRepresentable: UIViewRepresentable {
    
    // MARK: - Properties
    
    /// Binding to the chart model for two-way data flow
    @Binding var chartModel: AAChartModel
    
    /// Callback when chart finishes loading
    var onChartLoaded: (() -> Void)?
    
    /// Callback when chart is clicked
    var onChartClicked: ((AAClickEventMessageModel) -> Void)?
    
    /// Callback when mouse/touch moves over chart
    var onChartMoveOver: ((AAMoveOverEventMessageModel) -> Void)?
    
    // MARK: - UIViewRepresentable
    
    func makeUIView(context: Context) -> AAChartView {
        let chartView = AAChartView()
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.isScrollEnabled = false
        chartView.isClearBackgroundColor = true
        chartView.delegate = context.coordinator
        
        #if DEBUG
        chartView.shouldPrintOptionsJSON = false
        #endif
        
        return chartView
    }
    
    func updateUIView(_ uiView: AAChartView, context: Context) {
        // Check if this is the initial draw or an update
        if context.coordinator.hasDrawnChart {
            // Chart already exists, refresh it
            uiView.aa_refreshChartWholeContentWithChartModel(chartModel)
        } else {
            // Initial draw
            uiView.aa_drawChartWithChartModel(chartModel)
            context.coordinator.hasDrawnChart = true
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(
            onChartLoaded: onChartLoaded,
            onChartClicked: onChartClicked,
            onChartMoveOver: onChartMoveOver
        )
    }
    
    // MARK: - Coordinator
    
    class Coordinator: NSObject, AAChartViewDelegate {
        var onChartLoaded: (() -> Void)?
        var onChartClicked: ((AAClickEventMessageModel) -> Void)?
        var onChartMoveOver: ((AAMoveOverEventMessageModel) -> Void)?
        var hasDrawnChart: Bool = false
        
        init(
            onChartLoaded: (() -> Void)?,
            onChartClicked: ((AAClickEventMessageModel) -> Void)?,
            onChartMoveOver: ((AAMoveOverEventMessageModel) -> Void)?
        ) {
            self.onChartLoaded = onChartLoaded
            self.onChartClicked = onChartClicked
            self.onChartMoveOver = onChartMoveOver
        }
        
        // MARK: - AAChartViewDelegate
        
        func aaChartViewDidFinishLoad(_ aaChartView: AAChartView) {
            onChartLoaded?()
        }
        
        func aaChartView(_ aaChartView: AAChartView, clickEventMessage: AAClickEventMessageModel) {
            onChartClicked?(clickEventMessage)
        }
        
        func aaChartView(_ aaChartView: AAChartView, moveOverEventMessage: AAMoveOverEventMessageModel) {
            onChartMoveOver?(moveOverEventMessage)
        }
    }
}
