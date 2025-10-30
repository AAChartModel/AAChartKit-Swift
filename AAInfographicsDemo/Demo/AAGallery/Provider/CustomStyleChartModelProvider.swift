//
//  CustomStyleChartProvider.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/10/28.
//  Copyright © 2025 An An. All rights reserved.
//

import AAInfographics

class CustomStyleChartModelProvider: NSObject {
    
    static func aaChartModelItems() -> [AAOptions] {
        var originalItems = [AAChartModel]()
        
        // SpecialChartComposer
        originalItems += specialChartItems()
        
        // MixedChartComposer
        originalItems += mixedChartItems()
        
        // MixedChartComposer2
        originalItems += mixedChart2Items()
        
        // CustomStyleForColumnChartComposer
        originalItems += customStyleForColumnChartItems()
        
        // CustomStyleForLineChartComposer
        originalItems += customStyleForLineChartItems()
        
        // CustomStyleForAreasplineChartComposer
        originalItems += customStyleForAreasplineChartItems()
        
        // CustomStyleForPieChartComposer
        originalItems += customStyleForPieChartItems()
        
        // CustomStyleForLineChartComposer2
        originalItems += customStyleForLineChartItems2()
        
        //遍历 originalItems 数组,将其中的每个 AAChartModel 实例转化为 AAOptions 实例
        let finalItems = originalItems.map { (aaChartModel) -> AAOptions in
            let aaOptions = aaChartModel.aa_toAAOptions()
//            aaOptions.chart?.polar(true)
            return aaOptions
        }
        
        return finalItems
    }
    
    // MARK: - SpecialChartComposer
    
    static func specialChartItems() -> [AAChartModel] {
        return [
            SpecialChartComposer.polarColumnChart(),
            SpecialChartComposer.polarBarChart(),
            SpecialChartComposer.polarLineChart(),
            SpecialChartComposer.polarAreaChart(),
            SpecialChartComposer.stepLineChart(),
            SpecialChartComposer.stepAreaChart(),
            SpecialChartComposer.pieChart(),
            SpecialChartComposer.bubbleChart(),
            SpecialChartComposer.packedbubbleChart(),
            SpecialChartComposer.scatterChart(),
            SpecialChartComposer.arearangeChart(),
            SpecialChartComposer.areasplinerangeChart(),
            SpecialChartComposer.columnrangeChart(),
            SpecialChartComposer.boxplotChart(),
            SpecialChartComposer.waterfallChart(),
            SpecialChartComposer.pyramidChart(),
            SpecialChartComposer.funnelChart(),
            SpecialChartComposer.errorbarChart(),
            SpecialChartComposer.gaugeChart(),
            SpecialChartComposer.polygonChart(),
            SpecialChartComposer.columnpyramidChart(),
        ]
    }
    
    // MARK: - MixedChartComposer
    
    static func mixedChartItems() -> [AAChartModel] {
        return [
            MixedChartComposer.arearangeMixedLineChart(),
            MixedChartComposer.columnrangeMixedLineChart(),
            MixedChartComposer.stackingColumnMixedLineChart(),
            MixedChartComposer.scatterMixedLineChart(),
            MixedChartComposer.polygonMixedScatterChart(),
            MixedChartComposer.polarChartMixedChart(),
            MixedChartComposer.columnMixedScatterChart(),
            MixedChartComposer.areasplinerangeMixedColumnrangeMixedLineChart(),
            MixedChartComposer.boxplotMixedScatterChartWithJitter(),
            MixedChartComposer.multiLevelStopsArrGradientColorAreasplineMixedLineChart(),
            MixedChartComposer.arearangeMixedLineChart(),
        ]
    }
    
    // MARK: - MixedChartComposer2
    
    static func mixedChart2Items() -> [AAChartModel] {
        return [
            MixedChartComposer2.scatterPlotWithTrendLine(),
            MixedChartComposer2.scatterPlotWithTrendLine2(),
            MixedChartComposer2.pieMixedLineMixedColumnChart(),
            MixedChartComposer2.pieMixedLineMixedColumnChart2(),
            MixedChartComposer2.scatterWithMultipleLinearRegressionChart(),
            MixedChartComposer2.rangeSplineAreaSplineAndMarkerChart(),
        ]
    }
    
    // MARK: - CustomStyleForColumnChartComposer
    
    static func customStyleForColumnChartItems() -> [AAChartModel] {
        return [
            CustomStyleForColumnChartComposer.colorfulColumnChart(),
            CustomStyleForColumnChartComposer.colorfulGradientColorColumnChart(),
            CustomStyleForColumnChartComposer.discontinuousDataColumnChart(),
            CustomStyleForColumnChartComposer.randomColorfulColumnChart(),
            
            CustomStyleForColumnChartComposer.noneStackingPolarColumnChart(),
            CustomStyleForColumnChartComposer.normalStackingPolarColumnChart(),
            CustomStyleForColumnChartComposer.percentStackingPolarColumnChart(),
            
            CustomStyleForColumnChartComposer.specialStyleForTheSingleDataElementOfColumnChart(),
            CustomStyleForColumnChartComposer.noMoreGroupingAndOverlapEachOtherColumnChart(),
            CustomStyleForColumnChartComposer.noMoreGroupingAndNestedColumnChart(),
            CustomStyleForColumnChartComposer.topRoundedCornersStackingColumnChart(),
            CustomStyleForColumnChartComposer.freeStyleRoundedCornersStackingColumnChart(),
            
            CustomStyleForColumnChartComposer.customBorderStyleAndStatesHoverColorColumnChart(),
            CustomStyleForColumnChartComposer.negativeDataMixedPositiveDataColumnChart(),
        ]
    }
    
    // MARK: - CustomStyleForLineChartComposer
    
    static func customStyleForLineChartItems() -> [AAChartModel] {
        return [
            CustomStyleForLineChartComposer.mixedLineChart(),
            CustomStyleForLineChartComposer.stepLineChart(),
            CustomStyleForLineChartComposer.stepAreaChart(),
            CustomStyleForLineChartComposer.customSingleDataLabelForLineChart(),
            CustomStyleForLineChartComposer.shadowStyleLineChart(),
            CustomStyleForLineChartComposer.colorfulGradientLineChart(),
            CustomStyleForLineChartComposer.customMarkerSymbolContentLineChart(),
            CustomStyleForLineChartComposer.drawPointsWithCoordinatesForLineChart(),
            CustomStyleForLineChartComposer.customHoverAndSelectHaloStyleForLineChart(),
            CustomStyleForLineChartComposer.disableSomeOfLinesMouseTrackingEffectForLineChart(),
            CustomStyleForLineChartComposer.colorfulShadowLineChart(),
            CustomStyleForLineChartComposer.colorfulDataLabelsStepLineChart(),
            CustomStyleForLineChartComposer.disableMarkerHoverEffectForLineChart(),
            CustomStyleForLineChartComposer.maxAndMinDataLabelsForLineChart(),
            CustomStyleForLineChartComposer.dashStyleTypesMixedLineChart(),
            CustomStyleForLineChartComposer.allLineDashStyleTypesMixedLineChart(),
            CustomStyleForLineChartComposer.shadowLineChart(),
            CustomStyleForLineChartComposer.colorfulMarkersAndLinesLineChart(),
            CustomStyleForLineChartComposer.colorfulMarkersAndLinesLineChart2(),
            CustomStyleForLineChartComposer.connectNullsForSingleAASeriesElementLineChart(),
            CustomStyleForLineChartComposer.largeDifferencesInTheNumberOfDataInDifferentSeriesElementLineChart(),
            CustomStyleForLineChartComposer.customDifferentDataLabelsShapeForLineChart(),
            CustomStyleForLineChartComposer.clipForAASeriesElementLineChart(),
        ]
    }
    
    // MARK: - CustomStyleForAreasplineChartComposer
    
    static func customStyleForAreasplineChartItems() -> [AAChartModel] {
        return [
            CustomStyleForAreasplineChartComposer.withMinusNumberAreasplineChart(),
            CustomStyleForAreasplineChartComposer.colorfulGradientAreasplineChart(),
            CustomStyleForAreasplineChartComposer.gradientColorAreasplineChart(),
            CustomStyleForAreasplineChartComposer.thresholdForAreasplineChart(),
            CustomStyleForAreasplineChartComposer.customSpecialStyleDataLabelOfSingleDataElementForAreasplineChart(),
            CustomStyleForAreasplineChartComposer.customMarkerStatesHoverStyleForAreasplineChart(),
            CustomStyleForAreasplineChartComposer.colorfulGradientColorAndColorfulDataLabelsStepAreasplineChart(),
            CustomStyleForAreasplineChartComposer.negativeColorMixedAreasplineChart(),
            CustomStyleForAreasplineChartComposer.customColorfulGradientColorZonesForAreasplineChart(),
        ]
    }
    
    // MARK: - CustomStyleForPieChartComposer
    
    static func customStyleForPieChartItems() -> [AAChartModel] {
        return [
            CustomStyleForPieChartComposer.pieChart(),
            CustomStyleForPieChartComposer.doubleLayerPieChart(),
            CustomStyleForPieChartComposer.doubleLayerDoubleColorsPieChart(),
            
            CustomStyleForPieChartComposer.pieChartWithSoftCorners(),
            CustomStyleForPieChartComposer.doubleLayerPieChartWithSoftCorners(),
            CustomStyleForPieChartComposer.doubleLayerDoubleColorsPieChartWithSoftCorners(),
            
            CustomStyleForPieChartComposer.pieChartWithRoundedCorners(),
            CustomStyleForPieChartComposer.doubleLayerPieChartWithRoundedCorners(),
            CustomStyleForPieChartComposer.doubleLayerDoubleColorsPieChartWithRoundedCorners(),
        ]
    }
    
    // MARK: - CustomStyleForBarChartComposer
    
    static func customStyleForBarChartItems() -> [AAChartModel] {
        return [
            CustomStyleForBarChartComposer.colorfulBarChart(),
            CustomStyleForBarChartComposer.colorfulGradientColorBarChart(),
            CustomStyleForBarChartComposer.discontinuousDataBarChart(),
            CustomStyleForBarChartComposer.randomColorfulBarChart(),
            
            CustomStyleForBarChartComposer.noneStackingPolarBarChart(),
            CustomStyleForBarChartComposer.normalStackingPolarBarChart(),
            CustomStyleForBarChartComposer.percentStackingPolarBarChart(),
            
            CustomStyleForBarChartComposer.specialStyleForTheSingleDataElementOfBarChart(),
            CustomStyleForBarChartComposer.noMoreGroupingAndOverlapEachOtherBarChart(),
            CustomStyleForBarChartComposer.noMoreGroupingAndNestedBarChart(),
            CustomStyleForBarChartComposer.topRoundedCornersStackingBarChart(),
            CustomStyleForBarChartComposer.freeStyleRoundedCornersStackingBarChart(),
            
            CustomStyleForBarChartComposer.customBorderStyleAndStatesHoverColorBarChart(),
            CustomStyleForBarChartComposer.negativeDataMixedPositiveDataBarChart(),
        ]
    }
    
    // MARK: - CustomStyleForSplineChartComposer
    
    static func customStyleForSplineChartItems() -> [AAChartModel] {
        return [
            CustomStyleForSplineChartComposer.mixedSplineChart(),
            CustomStyleForSplineChartComposer.stepSplineChart(),
            CustomStyleForSplineChartComposer.customSingleDataLabelForSplineChart(),
            CustomStyleForSplineChartComposer.shadowStyleSplineChart(),
            CustomStyleForSplineChartComposer.colorfulGradientSplineChart(),
            CustomStyleForSplineChartComposer.customMarkerSymbolContentSplineChart(),
            CustomStyleForSplineChartComposer.drawPointsWithCoordinatesForSplineChart(),
            CustomStyleForSplineChartComposer.customHoverAndSelectHaloStyleForSplineChart(),
            CustomStyleForSplineChartComposer.disableSomeOfLinesMouseTrackingEffectForSplineChart(),
            CustomStyleForSplineChartComposer.colorfulShadowSplineChart(),
            CustomStyleForSplineChartComposer.colorfulDataLabelsStepSplineChart(),
            CustomStyleForSplineChartComposer.disableMarkerHoverEffectForSplineChart(),
            CustomStyleForSplineChartComposer.maxAndMinDataLabelsForSplineChart(),
            CustomStyleForSplineChartComposer.dashStyleTypesMixedSplineChart(),
            CustomStyleForSplineChartComposer.allLineDashStyleTypesMixedSplineChart(),
            CustomStyleForSplineChartComposer.shadowSplineChart(),
            CustomStyleForSplineChartComposer.colorfulMarkersAndLinesSplineChart(),
            CustomStyleForSplineChartComposer.colorfulMarkersAndLinesSplineChart2(),
            CustomStyleForSplineChartComposer.connectNullsForSingleAASeriesElementSplineChart(),
            CustomStyleForSplineChartComposer.largeDifferencesInTheNumberOfDataInDifferentSeriesElementSplineChart(),
            CustomStyleForSplineChartComposer.customDifferentDataLabelsShapeForSplineChart(),
        ]
    }
    
    // MARK: - CustomStyleForAreaChartComposer
    
    static func customStyleForAreaChartItems() -> [AAChartModel] {
        return [
            CustomStyleForAreaChartComposer.withMinusNumberAreaChart(),
            CustomStyleForAreaChartComposer.colorfulGradientAreaChart(),
            CustomStyleForAreaChartComposer.gradientColorAreaChart(),
            CustomStyleForAreaChartComposer.thresholdForAreaChart(),
            CustomStyleForAreaChartComposer.customSpecialStyleDataLabelOfSingleDataElementForAreaChart(),
            CustomStyleForAreaChartComposer.customMarkerStatesHoverStyleForAreaChart(),
            CustomStyleForAreaChartComposer.colorfulGradientColorAndColorfulDataLabelsStepAreaChart(),
            CustomStyleForAreaChartComposer.negativeColorMixedAreaChart(),
            CustomStyleForAreaChartComposer.customColorfulGradientColorZonesForAreaChart(),
        ]
    }
    
    // MARK: - CustomStyleForScatterChartComposer
    
    static func customStyleForScatterChartItems() -> [AAChartModel] {
        return [
            CustomStyleForScatterChartComposer.customScatterChartMarkerSymbolContent(),
            CustomStyleForScatterChartComposer.drawLineMixedScatterChartWithPointsCoordinates2(),
            CustomStyleForScatterChartComposer.ScatterChartWithScrollablePlotArea(),
        ]
    }
    
    // MARK: - CustomStyleForBubbleChartComposer
    
    static func customStyleForBubbleChartItems() -> [AAChartModel] {
        return [
            CustomStyleForBubbleChartComposer.negativeColorMixedBubbleChart(),
            CustomStyleForBubbleChartComposer.showAARadialGradientPositionAllEnumValuesWithBubbleChart(),
        ]
    }
    
    // MARK: - CustomStyleForLineChartComposer2
    
    static func customStyleForLineChartItems2() -> [AAChartModel] {
        return [
            CustomStyleForLineChartComposer2.colorfulMarkerWithZonesChart(),
        ]
    }

}
