//
// Created by AnAn on 2024/1/18.
// Copyright (c) 2024 An An. All rights reserved.
//

import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class CustomStyleForBarChartVC: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    override func chartConfigurationWithSelectedChartTypeString(_ selectedChartTypeStr: String) -> Any? {
        switch selectedChartTypeStr {
        case "colorfulBarChart":return CustomStyleForBarChartComposer.colorfulBarChart()
        case "colorfulGradientColorBarChart":return CustomStyleForBarChartComposer.colorfulGradientColorBarChart()
        case "discontinuousDataBarChart":return CustomStyleForBarChartComposer.discontinuousDataBarChart()
        case "randomColorfulBarChart":return CustomStyleForBarChartComposer.randomColorfulBarChart()

        case "noneStackingPolarBarChart":return CustomStyleForBarChartComposer.noneStackingPolarBarChart()
        case "normalStackingPolarBarChart":return CustomStyleForBarChartComposer.normalStackingPolarBarChart()
        case "percentStackingPolarBarChart":return CustomStyleForBarChartComposer.percentStackingPolarBarChart()

        case "specialStyleForTheSingleDataElementOfBarChart":return CustomStyleForBarChartComposer.specialStyleForTheSingleDataElementOfBarChart()
        case "noMoreGroupingAndOverlapEachOtherBarChart":return CustomStyleForBarChartComposer.noMoreGroupingAndOverlapEachOtherBarChart()
        case "noMoreGroupingAndNestedBarChart":return CustomStyleForBarChartComposer.noMoreGroupingAndNestedBarChart()
        case "topRoundedCornersStackingBarChart":return CustomStyleForBarChartComposer.topRoundedCornersStackingBarChart()
        case "freeStyleRoundedCornersStackingBarChart":return CustomStyleForBarChartComposer.freeStyleRoundedCornersStackingBarChart()

        case "customBorderStyleAndStatesHoverColorBarChart":return CustomStyleForBarChartComposer.customBorderStyleAndStatesHoverColorBarChart()
        case "negativeDataMixedPositiveDataBarChart":return CustomStyleForBarChartComposer.negativeDataMixedPositiveDataBarChart()

        default: return nil
        }
    }

}
