//
//  CustomStyleForPieChartVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/1/12.
//  Copyright © 2024 An An. All rights reserved.
//

import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class CustomStyleForPieChartVC: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func chartConfigurationWithSelectedChartTypeString(_ selectedChartTypeStr: String) -> Any? {
        switch selectedChartTypeStr {
        case "pieChart":return CustomStyleForPieChartComposer.pieChart()
        case "doubleLayerPieChart":return CustomStyleForPieChartComposer.doubleLayerPieChart()
        case "doubleLayerDoubleColorsPieChart":return CustomStyleForPieChartComposer.doubleLayerDoubleColorsPieChart()

        case "pieChartWithSoftCorners":return CustomStyleForPieChartComposer.pieChartWithSoftCorners()
        case "doubleLayerPieChartWithSoftCorners":return CustomStyleForPieChartComposer.doubleLayerPieChartWithSoftCorners()
        case "doubleLayerDoubleColorsPieChartWithSoftCorners":return CustomStyleForPieChartComposer.doubleLayerDoubleColorsPieChartWithSoftCorners()

        case "pieChartWithRoundedCorners":return CustomStyleForPieChartComposer.pieChartWithRoundedCorners()
        case "doubleLayerPieChartWithRoundedCorners":return CustomStyleForPieChartComposer.doubleLayerPieChartWithRoundedCorners()
        case "doubleLayerDoubleColorsPieChartWithRoundedCorners":return CustomStyleForPieChartComposer.doubleLayerDoubleColorsPieChartWithRoundedCorners()

        default: return nil
        }
    }

}
