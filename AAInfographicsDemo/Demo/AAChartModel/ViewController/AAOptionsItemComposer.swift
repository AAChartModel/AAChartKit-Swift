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
            SpecialChartComposer.polarColumnChart(),
            SpecialChartComposer.polarBarChart(),
            SpecialChartComposer.polarLineChart(),
            SpecialChartComposer.polarAreaChart(),
            SpecialChartComposer.stepLineChart(),
            SpecialChartComposer.stepAreaChart(),
            SpecialChartComposer.pieChart(),
            SpecialChartComposer.bubbleChart(),
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
            
            MixedChartComposer.arearangeMixedLineChart(),
            MixedChartComposer.columnrangeMixedLineChart(),
            MixedChartComposer.stackingColumnMixedLineChart(),
            MixedChartComposer.scatterMixedLineChart(),
            MixedChartComposer.polygonMixedScatterChart(),
            MixedChartComposer.polarChartMixedChart(),
            MixedChartComposer.columnMixedScatterChart(),
            MixedChartComposer.pieMixedLineMixedColumnChart(),
            MixedChartComposer.areasplinerangeMixedColumnrangeMixedLineChart(),
            MixedChartComposer.boxplotMixedScatterChartWithJitter(),
            MixedChartComposer.multiLevelStopsArrGradientColorAreasplineMixedLineChart(),
            MixedChartComposer.arearangeMixedLineChart(),
            
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
            
            
            CustomStyleForAreasplineChartComposer.withMinusNumberAreasplineChart(),
            CustomStyleForAreasplineChartComposer.colorfulGradientAreasplineChart(),
            CustomStyleForAreasplineChartComposer.gradientColorAreasplineChart(),
            CustomStyleForAreasplineChartComposer.thresholdForAreasplineChart(),
            CustomStyleForAreasplineChartComposer.customSpecialStyleDataLabelOfSingleDataElementForAreasplineChart(),
            CustomStyleForAreasplineChartComposer.customMarkerStatesHoverStyleForAreasplineChart(),
            CustomStyleForAreasplineChartComposer.colorfulGradientColorAndColorfulDataLabelsStepAreasplineChart(),
            CustomStyleForAreasplineChartComposer.negativeColorMixedAreasplineChart(),
            CustomStyleForAreasplineChartComposer.customColorfulGradientColorZonesForAreasplineChart(),
            
            
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
        
        //遍历 originalItems 数组,将其中的每个 AAChartModel 实例转化为 AAOptions 实例
        let finalItems = originalItems.map { (aaChartModel) -> AAOptions in
            let aaOptions = aaChartModel.aa_toAAOptions()
            return aaOptions
        }
        
        return finalItems
    }

}
