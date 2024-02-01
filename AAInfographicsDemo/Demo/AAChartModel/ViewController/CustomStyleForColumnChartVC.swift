//
// Created by AnAn on 2024/1/18.
// Copyright (c) 2024 An An. All rights reserved.
//

import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class CustomStyleForColumnChartVC: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    override func chartConfigurationWithSelectedChartTypeString(_ selectedChartTypeStr: String) -> Any? {
        switch selectedChartTypeStr {
        case "colorfulColumnChart":return CustomStyleForColumnChartComposer.colorfulColumnChart()
        case "colorfulGradientColorColumnChart":return CustomStyleForColumnChartComposer.colorfulGradientColorColumnChart()
        case "discontinuousDataColumnChart":return CustomStyleForColumnChartComposer.discontinuousDataColumnChart()
        case "randomColorfulColumnChart":return CustomStyleForColumnChartComposer.randomColorfulColumnChart()

        case "noneStackingPolarColumnChart":return CustomStyleForColumnChartComposer.noneStackingPolarColumnChart()
        case "normalStackingPolarColumnChart":return CustomStyleForColumnChartComposer.normalStackingPolarColumnChart()
        case "percentStackingPolarColumnChart":return CustomStyleForColumnChartComposer.percentStackingPolarColumnChart()

        case "specialStyleForTheSingleDataElementOfColumnChart":return CustomStyleForColumnChartComposer.specialStyleForTheSingleDataElementOfColumnChart()
        case "noMoreGroupingAndOverlapEachOtherColumnChart":return CustomStyleForColumnChartComposer.noMoreGroupingAndOverlapEachOtherColumnChart()
        case "noMoreGroupingAndNestedColumnChart":return CustomStyleForColumnChartComposer.noMoreGroupingAndNestedColumnChart()
        case "topRoundedCornersStackingColumnChart":return CustomStyleForColumnChartComposer.topRoundedCornersStackingColumnChart()
        case "freeStyleRoundedCornersStackingColumnChart":return CustomStyleForColumnChartComposer.freeStyleRoundedCornersStackingColumnChart()

        case "customBorderStyleAndStatesHoverColorColumnChart":return CustomStyleForColumnChartComposer.customBorderStyleAndStatesHoverColorColumnChart()
        case "negativeDataMixedPositiveDataColumnChart":return CustomStyleForColumnChartComposer.negativeDataMixedPositiveDataColumnChart()

        default: return nil
        }
    }

}

