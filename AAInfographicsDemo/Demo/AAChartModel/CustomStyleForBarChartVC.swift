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

// private func colorfulBarChart() -> AAChartModel {
//        CustomStyleForColumnChartComposer.colorfulColumnChart()
//    }
//
//    private func colorfulGradientColorBarChart() -> AAChartModel {
//        CustomStyleForColumnChartComposer.colorfulGradientColorColumnChart()
//    }
//
//    private func discontinuousDataBarChart() -> AAChartModel {
//        CustomStyleForColumnChartComposer.discontinuousDataColumnChart()
//    }
//
//    private func randomColorfulBarChart() -> AAChartModel {
//          CustomStyleForColumnChartComposer.randomColorfulColumnChart()
//    }
//
//    private func stackingPolarBarChart() -> AAChartModel {
//        CustomStyleForColumnChartComposer.stackingPolarColumnChart()
//    }


//    private func specialStyleForTheSingleDataElementOfColumnChart() -> AAChartModel {
//        CustomStyleForColumnChartComposer.specialStyleForTheSingleDataElementOfColumnChart()
//    }
//
//    private func noMoreGroupingAndOverlapEachOtherBarChart() -> AAChartModel {
//        CustomStyleForColumnChartComposer.noMoreGroupingAndOverlapEachOtherColumnChart()
//    }
//
//    private func noMoreGroupingAndNestedBarChart() -> AAChartModel {
//        CustomStyleForColumnChartComposer.noMoreGroupingAndNestedColumnChart()
//    }
//
//    private func topRoundedCornersStackingBarChart() -> AAChartModel {
//        CustomStyleForColumnChartComposer.topRoundedCornersStackingColumnChart()
//    }
//
//    private func freeStyleRoundedCornersStackingBarChart() -> AAChartModel {
//        CustomStyleForColumnChartComposer.freeStyleRoundedCornersStackingColumnChart()
//    }
//
//
//
//
//    private func customBorderStyleAndStatesHoverColorBarChart() -> AAChartModel {
//        CustomStyleForColumnChartComposer.customBorderStyleAndStatesHoverColorColumnChart()
//    }
//
//    private func negativeDataMixedPositiveDataBarChart() -> AAChartModel {
//        CustomStyleForColumnChartComposer.negativeDataMixedPositiveDataColumnChart()
//    }
    override func chartConfigurationWithSelectedChartTypeString(_ selectedChartTypeStr: String) -> Any? {
        switch selectedChartTypeStr {
        case "colorfulBarChart":return CustomStyleForBarChartComposer.colorfulBarChart()
        case "colorfulGradientColorBarChart":return CustomStyleForBarChartComposer.colorfulGradientColorBarChart()
        case "discontinuousDataBarChart":return CustomStyleForBarChartComposer.discontinuousDataBarChart()
        case "randomColorfulBarChart":return CustomStyleForBarChartComposer.randomColorfulBarChart()
        case "stackingPolarBarChart":return CustomStyleForBarChartComposer.stackingPolarBarChart()

        case "specialStyleForTheSingleDataElementOfColumnChart":return CustomStyleForBarChartComposer.specialStyleForTheSingleDataElementOfColumnChart()
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
