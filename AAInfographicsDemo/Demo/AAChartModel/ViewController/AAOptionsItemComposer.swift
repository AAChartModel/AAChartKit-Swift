//
//  AAOptionsItemComposer.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/2/6.
//  Copyright © 2025 An An. All rights reserved.
//

import AAInfographics

class AAOptionsItemComposer: NSObject {
    
    static func aaChartModelItems() -> [AAOptions] {
        let originalItems = [
            SpecialChartComposer.polarColumnChart().aa_toAAOptions(),
            SpecialChartComposer.polarBarChart().aa_toAAOptions(),
            SpecialChartComposer.polarLineChart().aa_toAAOptions(),
            SpecialChartComposer.polarAreaChart().aa_toAAOptions(),
            SpecialChartComposer.stepLineChart().aa_toAAOptions(),
            SpecialChartComposer.stepAreaChart().aa_toAAOptions(),
            SpecialChartComposer.pieChart().aa_toAAOptions(),
            SpecialChartComposer.bubbleChart().aa_toAAOptions(),
            SpecialChartComposer.scatterChart().aa_toAAOptions(),
            SpecialChartComposer.arearangeChart().aa_toAAOptions(),
            SpecialChartComposer.areasplinerangeChart().aa_toAAOptions(),
            SpecialChartComposer.columnrangeChart().aa_toAAOptions(),
            SpecialChartComposer.boxplotChart().aa_toAAOptions(),
            SpecialChartComposer.waterfallChart().aa_toAAOptions(),
            SpecialChartComposer.pyramidChart().aa_toAAOptions(),
            SpecialChartComposer.funnelChart().aa_toAAOptions(),
            SpecialChartComposer.errorbarChart().aa_toAAOptions(),
            SpecialChartComposer.gaugeChart().aa_toAAOptions(),
            SpecialChartComposer.polygonChart().aa_toAAOptions(),
            
            MixedChartComposer.arearangeMixedLineChart().aa_toAAOptions(),
            MixedChartComposer.columnrangeMixedLineChart().aa_toAAOptions(),
            MixedChartComposer.stackingColumnMixedLineChart().aa_toAAOptions(),
            MixedChartComposer.scatterMixedLineChart().aa_toAAOptions(),
            MixedChartComposer.polygonMixedScatterChart().aa_toAAOptions(),
            MixedChartComposer.polarChartMixedChart().aa_toAAOptions(),
            MixedChartComposer.columnMixedScatterChart().aa_toAAOptions(),
            MixedChartComposer.pieMixedLineMixedColumnChart().aa_toAAOptions(),
            MixedChartComposer.areasplinerangeMixedColumnrangeMixedLineChart().aa_toAAOptions(),
            MixedChartComposer.boxplotMixedScatterChartWithJitter().aa_toAAOptions(),
            MixedChartComposer.multiLevelStopsArrGradientColorAreasplineMixedLineChart().aa_toAAOptions(),
            MixedChartComposer.arearangeMixedLineChart().aa_toAAOptions(),
            
            CustomStyleForColumnChartComposer.colorfulColumnChart().aa_toAAOptions(),
            CustomStyleForColumnChartComposer.colorfulGradientColorColumnChart().aa_toAAOptions(),
            CustomStyleForColumnChartComposer.discontinuousDataColumnChart().aa_toAAOptions(),
            CustomStyleForColumnChartComposer.randomColorfulColumnChart().aa_toAAOptions(),
            
            CustomStyleForColumnChartComposer.noneStackingPolarColumnChart().aa_toAAOptions(),
            CustomStyleForColumnChartComposer.normalStackingPolarColumnChart().aa_toAAOptions(),
            CustomStyleForColumnChartComposer.percentStackingPolarColumnChart().aa_toAAOptions(),
            
            CustomStyleForColumnChartComposer.specialStyleForTheSingleDataElementOfColumnChart().aa_toAAOptions(),
            CustomStyleForColumnChartComposer.noMoreGroupingAndOverlapEachOtherColumnChart().aa_toAAOptions(),
            CustomStyleForColumnChartComposer.noMoreGroupingAndNestedColumnChart().aa_toAAOptions(),
            CustomStyleForColumnChartComposer.topRoundedCornersStackingColumnChart().aa_toAAOptions(),
            CustomStyleForColumnChartComposer.freeStyleRoundedCornersStackingColumnChart().aa_toAAOptions(),
            
            CustomStyleForColumnChartComposer.customBorderStyleAndStatesHoverColorColumnChart().aa_toAAOptions(),
            CustomStyleForColumnChartComposer.negativeDataMixedPositiveDataColumnChart().aa_toAAOptions(),
            
            
            CustomStyleForLineChartComposer.mixedLineChart().aa_toAAOptions(),
            CustomStyleForLineChartComposer.stepLineChart().aa_toAAOptions(),
            CustomStyleForLineChartComposer.stepAreaChart().aa_toAAOptions(),
            CustomStyleForLineChartComposer.customSingleDataLabelForLineChart().aa_toAAOptions(),
            CustomStyleForLineChartComposer.shadowStyleLineChart().aa_toAAOptions(),
            CustomStyleForLineChartComposer.colorfulGradientLineChart().aa_toAAOptions(),
            CustomStyleForLineChartComposer.customMarkerSymbolContentLineChart().aa_toAAOptions(),
            CustomStyleForLineChartComposer.drawPointsWithCoordinatesForLineChart().aa_toAAOptions(),
            CustomStyleForLineChartComposer.customHoverAndSelectHaloStyleForLineChart().aa_toAAOptions(),
            CustomStyleForLineChartComposer.disableSomeOfLinesMouseTrackingEffectForLineChart().aa_toAAOptions(),
            CustomStyleForLineChartComposer.colorfulShadowLineChart().aa_toAAOptions(),
            CustomStyleForLineChartComposer.colorfulDataLabelsStepLineChart().aa_toAAOptions(),
            CustomStyleForLineChartComposer.disableMarkerHoverEffectForLineChart().aa_toAAOptions(),
            CustomStyleForLineChartComposer.maxAndMinDataLabelsForLineChart().aa_toAAOptions(),
            CustomStyleForLineChartComposer.dashStyleTypesMixedLineChart().aa_toAAOptions(),
            CustomStyleForLineChartComposer.allLineDashStyleTypesMixedLineChart().aa_toAAOptions(),
            CustomStyleForLineChartComposer.shadowLineChart().aa_toAAOptions(),
            CustomStyleForLineChartComposer.colorfulMarkersAndLinesLineChart().aa_toAAOptions(),
            CustomStyleForLineChartComposer.colorfulMarkersAndLinesLineChart2().aa_toAAOptions(),
            CustomStyleForLineChartComposer.connectNullsForSingleAASeriesElementLineChart().aa_toAAOptions(),
            CustomStyleForLineChartComposer.largeDifferencesInTheNumberOfDataInDifferentSeriesElementLineChart().aa_toAAOptions(),
            CustomStyleForLineChartComposer.customDifferentDataLabelsShapeForLineChart().aa_toAAOptions(),
            CustomStyleForLineChartComposer.clipForAASeriesElementLineChart().aa_toAAOptions(),
            
            
            CustomStyleForAreasplineChartComposer.withMinusNumberAreasplineChart().aa_toAAOptions(),
            CustomStyleForAreasplineChartComposer.colorfulGradientAreasplineChart().aa_toAAOptions(),
            CustomStyleForAreasplineChartComposer.gradientColorAreasplineChart().aa_toAAOptions(),
            CustomStyleForAreasplineChartComposer.thresholdForAreasplineChart().aa_toAAOptions(),
            CustomStyleForAreasplineChartComposer.customSpecialStyleDataLabelOfSingleDataElementForAreasplineChart().aa_toAAOptions(),
            CustomStyleForAreasplineChartComposer.customMarkerStatesHoverStyleForAreasplineChart().aa_toAAOptions(),
            CustomStyleForAreasplineChartComposer.colorfulGradientColorAndColorfulDataLabelsStepAreasplineChart().aa_toAAOptions(),
            CustomStyleForAreasplineChartComposer.negativeColorMixedAreasplineChart().aa_toAAOptions(),
            CustomStyleForAreasplineChartComposer.customColorfulGradientColorZonesForAreasplineChart().aa_toAAOptions(),
            
            
            CustomStyleForPieChartComposer.pieChart().aa_toAAOptions(),
            CustomStyleForPieChartComposer.doubleLayerPieChart().aa_toAAOptions(),
            CustomStyleForPieChartComposer.doubleLayerDoubleColorsPieChart().aa_toAAOptions(),
            
            CustomStyleForPieChartComposer.pieChartWithSoftCorners().aa_toAAOptions(),
            CustomStyleForPieChartComposer.doubleLayerPieChartWithSoftCorners().aa_toAAOptions(),
            CustomStyleForPieChartComposer.doubleLayerDoubleColorsPieChartWithSoftCorners().aa_toAAOptions(),
            
            CustomStyleForPieChartComposer.pieChartWithRoundedCorners().aa_toAAOptions(),
            CustomStyleForPieChartComposer.doubleLayerPieChartWithRoundedCorners().aa_toAAOptions(),
            CustomStyleForPieChartComposer.doubleLayerDoubleColorsPieChartWithRoundedCorners().aa_toAAOptions(),
        ]
        
        return originalItems
        
    }

}
