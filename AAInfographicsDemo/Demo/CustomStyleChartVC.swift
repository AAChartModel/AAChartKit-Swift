//
//  CustomStyleChartVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/8/21.
//  Copyright © 2019 An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************
/*
 
 *********************************************************************************
 *
 *  🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit-Swift/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 *********************************************************************************
 
 */

import UIKit

class CustomStyleChartVC: UIViewController {
    open var chartType: Int!
    open var aaChartModel: AAChartModel!
    open var aaChartView: AAChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setUpAAChartView()
    }
    
    private func setUpAAChartView() {
        aaChartView = AAChartView()
        let chartWidth = view.frame.size.width
        let chartHeight = view.frame.size.height
        aaChartView!.frame = CGRect(x: 0,
                                    y: 60,
                                    width: chartWidth,
                                    height: chartHeight)
        aaChartView!.contentHeight = view.frame.size.height - 80
        view.addSubview(aaChartView!)
        aaChartView!.scrollEnabled = false
        
        aaChartModel = configureTheAAChartModel()
        aaChartView!.aa_drawChartWithChartModel(aaChartModel!)
    }
    
    private func configureTheAAChartModel() -> AAChartModel {
        switch chartType {
        case 0: return configureTriangleRadarChart()
        case 1: return configureQuadrangleRadarChart()
        case 2: return configurePentagonRadarChart()
        case 3: return configureHexagonRadarChart()
//        case 4: return yAxisOnTheRightSideChart()
//        case 5: return adjustYAxisMinValueForChart()
//        case 6: return configureTheMirrorColumnChart()
//        case 7: return adjustTheXAxisLabels()
//        case 8: return adjustGroupPaddingBetweenColumns()
//        case 9: return configureAAPlotBandsForChart()
//        case 10: return configureAAPlotLinesForChart()
        case 19: return customScatterChartMarkerSymbolContent()
        case 20: return customLineChartMarkerSymbolContent()
        case 21: return configureTriangleRadarChart()
        case 22: return configureQuadrangleRadarChart()
        case 23: return configurePentagonRadarChart()
        case 24: return configureHexagonRadarChart()
        default:
            return configureTriangleRadarChart()
        }
    }
    
    //refer to online sample https://jshare.com.cn/github/highcharts/highcharts/tree/master/samples/highcharts/plotoptions/series-marker-symbol/
    private func customScatterChartMarkerSymbolContent() -> AAChartModel {
        let predefinedSymbol1 = AAChartSymbolType.triangle.rawValue
        let predefinedSymbol2 = AAChartSymbolType.circle.rawValue
        let imageSymbol = "url(https://www.highcharts.com/samples/graphics/sun.png)"
        let base64Symbol = "url(data:image/pngbase64,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 1dT1gvWd+ 1YfqGnRs+FYmKrhTbF5cVf9go3HjlG4dvyr+Z3JS0qavEuWTPZtJm6ebeLZ5bDpaql+aXDm4N2dq0Dd9WtO319kXbL5fNKNu7g7ZDuaO/PLi8ZafJzs07P1SkVPRU+lQ27tLdtWHX+G7R7ht7vPY07NXbW7z3/T7JvttVAVVN1WbVZftJ+7P3P66Jqun4lvttXa1ObXHtxwPSA/0HIw6217nU1R3SPVRSj9Yr60cOxx+ 1/p3vdy0NNg1VjZzG4iNwRHnk6fcJ3/ceDTradox7rOEH0x92HWcdL2pCmvKaRptTmvtbYlu6T8w+0dbq3nr8R9sfD5w0PFl5SvNUyWna6YLTk2fyz4ydlZ19fi753GDborZ752PO32oPb+ 16EHTh0kX/i +c7vDvOXPK4dPKy2+UTV7hXmq86X23qdOo8/pPTT8e7nLuarrlca7nuer21e2b36RueN87d9L158Rb/1tWeOT3dvfN6b/fF9/XfFt1+cif9zsu72Xcn7q28T7xf9EDtQdlD3YfVP1v+3Njv3H9qwHeg89HcR/cGhYPP/pH1jw9DBY+Zj8uGDYbrnjg+OTniP3L96fynQ89kzyaeF/6i/suuFxYvfvjV69fO0ZjRoZfyl5O/bXyl/erA6xmv28bCxh6+yXgzMV70VvvtwXfcdx3vo98PT+R8IH8o/2j5sfVT0Kf7kxmTk/8EA5jz/GMzLdsAAAAgY0hSTQAAeiUAAICDAAD5/wAAgOkAAHUwAADqYAAAOpgAABdvkl/FRgAAAVVJREFUeNpi/P37NwOxYM2pHtm7lw8uYmBgYGAiVtPC3RWh+88vuneT474Dv4DkcUZibJy8PG72le/nkn+zMzAaMhnNyY1clMpCjKbz/86lMLAzMMA0MTAwMOC1Ea6JgYFB9pPwncbMg6owOaY1p3pk15zqkcWnie8j63ddY18nZHmWI2eW3vzN/Jf168c3UfGuHathAXHl+7lkBnYGBtafDP8NVd3jQ8xKHiNrZMyeqPPtE/9vTgYGBgb1H4oHlHXt43ZfWfDwNzsDIwMDA4POX831RXGrg9BdxLhob63VgTurjsAUsv5k+A9jC3/g/NCdfVoQm/+ZIu3qjhnyW3XABJANMNL19cYVcPBQrZpq9eyFwCdJmIT6D8UD5cmbHXFphKccI9Mgc84vTH9goYhPE4rGELOSx0bSjsUMDAwMunJ2FQST0+/fv1Hw5BWJbehi2DBgAHTKsWmiz+rJAAAAAElFTkSuQmCC)"
        
        let element1 = AASeriesElement()
            .name("Predefined symbol")
            .data([0.45, 0.43, 0.50, 0.55, 0.58, 0.62, 0.83, 0.39, 0.56, 0.67, 0.50, 0.34, 0.50, 0.67, 0.58, 0.29, 0.46, 0.23, 0.47, 0.46, 0.38, 0.56, 0.48, 0.36])
            .marker(AAMarker()
                .symbol(predefinedSymbol1))
        
        let element2 = AASeriesElement()
            .name("Image symbol")
            .data([0.38, 0.31, 0.32, 0.32, 0.64, 0.66, 0.86, 0.47, 0.52, 0.75, 0.52, 0.56, 0.54, 0.60, 0.46, 0.63, 0.54, 0.51, 0.58, 0.64, 0.60, 0.45, 0.36, 0.67])
            .marker(AAMarker()
                .symbol(imageSymbol))
        
        let element3 = AASeriesElement()
            .name("Base64 symbol (*)")
            .data([0.46, 0.32, 0.53, 0.58, 0.86, 0.68, 0.85, 0.73, 0.69, 0.71, 0.91, 0.74, 0.60, 0.50, 0.39, 0.67, 0.55, 0.49, 0.65, 0.45, 0.64, 0.47, 0.63, 0.64])
            .marker(AAMarker()
                .symbol(base64Symbol))
        
        let element4 = AASeriesElement()
            .name("Custom symbol")
            .data([0.60, 0.51, 0.52, 0.53, 0.64, 0.84, 0.65, 0.68, 0.63, 0.47, 0.72, 0.60, 0.65, 0.74, 0.66, 0.65, 0.71, 0.59, 0.65, 0.77, 0.52, 0.53, 0.58, 0.53])
            .marker(AAMarker()
                .symbol(predefinedSymbol2))
        
        return AAChartModel()
            .chartType(.scatter)
            .title("")
            .subtitle("")
            .yAxisTitle("")
            .yAxisGridLineWidth(0)
            .stacking(.normal)
            .markerRadius(8)
            .dataLabelsEnabled(false)
            .series([element1,element2,element3,element4])
    }
    
    //refer to online sample https://jshare.com.cn/github/highcharts/highcharts/tree/master/samples/highcharts/plotoptions/series-marker-symbol/
    private func customLineChartMarkerSymbolContent() -> AAChartModel {
        let predefinedSymbol1 = AAChartSymbolType.triangle.rawValue
        let predefinedSymbol2 = AAChartSymbolType.circle.rawValue
        let imageSymbol = "url(https://www.highcharts.com/samples/graphics/sun.png)"
        let base64Symbol = "url(data:image/pngbase64,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 1dT1gvWd+ 1YfqGnRs+FYmKrhTbF5cVf9go3HjlG4dvyr+Z3JS0qavEuWTPZtJm6ebeLZ5bDpaql+aXDm4N2dq0Dd9WtO319kXbL5fNKNu7g7ZDuaO/PLi8ZafJzs07P1SkVPRU+lQ27tLdtWHX+G7R7ht7vPY07NXbW7z3/T7JvttVAVVN1WbVZftJ+7P3P66Jqun4lvttXa1ObXHtxwPSA/0HIw6217nU1R3SPVRSj9Yr60cOxx+ 1/p3vdy0NNg1VjZzG4iNwRHnk6fcJ3/ceDTradox7rOEH0x92HWcdL2pCmvKaRptTmvtbYlu6T8w+0dbq3nr8R9sfD5w0PFl5SvNUyWna6YLTk2fyz4ydlZ19fi753GDborZ752PO32oPb+ 16EHTh0kX/i +c7vDvOXPK4dPKy2+UTV7hXmq86X23qdOo8/pPTT8e7nLuarrlca7nuer21e2b36RueN87d9L158Rb/1tWeOT3dvfN6b/fF9/XfFt1+cif9zsu72Xcn7q28T7xf9EDtQdlD3YfVP1v+3Njv3H9qwHeg89HcR/cGhYPP/pH1jw9DBY+Zj8uGDYbrnjg+OTniP3L96fynQ89kzyaeF/6i/suuFxYvfvjV69fO0ZjRoZfyl5O/bXyl/erA6xmv28bCxh6+yXgzMV70VvvtwXfcdx3vo98PT+R8IH8o/2j5sfVT0Kf7kxmTk/8EA5jz/GMzLdsAAAAgY0hSTQAAeiUAAICDAAD5/wAAgOkAAHUwAADqYAAAOpgAABdvkl/FRgAAAVVJREFUeNpi/P37NwOxYM2pHtm7lw8uYmBgYGAiVtPC3RWh+88vuneT474Dv4DkcUZibJy8PG72le/nkn+zMzAaMhnNyY1clMpCjKbz/86lMLAzMMA0MTAwMOC1Ea6JgYFB9pPwncbMg6owOaY1p3pk15zqkcWnie8j63ddY18nZHmWI2eW3vzN/Jf168c3UfGuHathAXHl+7lkBnYGBtafDP8NVd3jQ8xKHiNrZMyeqPPtE/9vTgYGBgb1H4oHlHXt43ZfWfDwNzsDIwMDA4POX831RXGrg9BdxLhob63VgTurjsAUsv5k+A9jC3/g/NCdfVoQm/+ZIu3qjhnyW3XABJANMNL19cYVcPBQrZpq9eyFwCdJmIT6D8UD5cmbHXFphKccI9Mgc84vTH9goYhPE4rGELOSx0bSjsUMDAwMunJ2FQST0+/fv1Hw5BWJbehi2DBgAHTKsWmiz+rJAAAAAElFTkSuQmCC)"
        
        let element1 = AASeriesElement()
            .name("Predefined symbol")
            .data([0.45, 0.43, 0.50, 0.55, 0.58, 0.62, 0.83, 0.39, 0.56, 0.67, 0.50, 0.34, 0.50, 0.67, 0.58, 0.29, 0.46, 0.23, 0.47, 0.46, 0.38, 0.56, 0.48, 0.36])
            .marker(AAMarker()
                .symbol(predefinedSymbol1))
        
        let element2 = AASeriesElement()
            .name("Image symbol")
            .data([0.38, 0.31, 0.32, 0.32, 0.64, 0.66, 0.86, 0.47, 0.52, 0.75, 0.52, 0.56, 0.54, 0.60, 0.46, 0.63, 0.54, 0.51, 0.58, 0.64, 0.60, 0.45, 0.36, 0.67])
            .marker(AAMarker()
                .symbol(imageSymbol))
        
        let element3 = AASeriesElement()
            .name("Base64 symbol (*)")
            .data([0.46, 0.32, 0.53, 0.58, 0.86, 0.68, 0.85, 0.73, 0.69, 0.71, 0.91, 0.74, 0.60, 0.50, 0.39, 0.67, 0.55, 0.49, 0.65, 0.45, 0.64, 0.47, 0.63, 0.64])
            .marker(AAMarker()
                .symbol(base64Symbol))
        
        let element4 = AASeriesElement()
            .name("Custom symbol")
            .data([0.60, 0.51, 0.52, 0.53, 0.64, 0.84, 0.65, 0.68, 0.63, 0.47, 0.72, 0.60, 0.65, 0.74, 0.66, 0.65, 0.71, 0.59, 0.65, 0.77, 0.52, 0.53, 0.58, 0.53])
            .marker(AAMarker()
                .symbol(predefinedSymbol2))
        
        return AAChartModel()
            .chartType(.line)
            .title("")
            .subtitle("")
            .yAxisTitle("")
            .yAxisGridLineWidth(0)
            .stacking(.normal)
            .markerRadius(8)
            .dataLabelsEnabled(false)
            .series([element1,element2,element3,element4])
    }

    private func configureTriangleRadarChart() -> AAChartModel {
        return AAChartModel()
            .chartType(.area)
            .dataLabelsEnabled(false)
            .xAxisVisible(false)
            .markerRadius(0)
            .polar(true)
            .series([
                AASeriesElement()
                .data([15.0,15.0,15.0,]),
                AASeriesElement()
                .data([9.0,9.0,9.0,]),
                AASeriesElement()
                .data([6.0,6.0,6.0,]),
                AASeriesElement()
                .data([3.0,3.0,3.0,]),
                ])
    }
    
    private func configureQuadrangleRadarChart() -> AAChartModel {
        return AAChartModel()
            .chartType(.area)
            .dataLabelsEnabled(false)
            .xAxisVisible(false)
            .markerRadius(0)
            .polar(true)
            .series([
                AASeriesElement()
                    .data([15.0,15.0,15.0,15.0,]),
                AASeriesElement()
                    .data([9.0,9.0,9.0,9.0,]),
                AASeriesElement()
                    .data([6.0,6.0,6.0,6.0,]),
                AASeriesElement()
                    .data([3.0,3.0,3.0,3.0,]),
                ])
    }
    
    private func configurePentagonRadarChart() -> AAChartModel {
        return AAChartModel()
            .chartType(.area)
            .dataLabelsEnabled(false)
            .xAxisVisible(false)
            .markerRadius(0)
            .polar(true)
            .series([
                AASeriesElement()
                    .data([15.0,15.0,15.0,15.0,15.0,]),
                AASeriesElement()
                    .data([9.0,9.0,9.0,9.0,9.0,]),
                AASeriesElement()
                    .data([6.0,6.0,6.0,6.0,6.0,]),
                AASeriesElement()
                    .data([3.0,3.0,3.0,3.0,3.0,]),
                ])
    }
    
    private func configureHexagonRadarChart() -> AAChartModel {
        return AAChartModel()
            .chartType(.area)
            .dataLabelsEnabled(false)
            .xAxisVisible(false)
            .markerRadius(0)
            .polar(true)
            .series([
                AASeriesElement()
                    .data([15.0,15.0,15.0,15.0,15.0,15.0,]),
                AASeriesElement()
                    .data([9.0,9.0,9.0,9.0,9.0,9.0,]),
                AASeriesElement()
                    .data([6.0,6.0,6.0,6.0,6.0,6.0,]),
                AASeriesElement()
                    .data([3.0,3.0,3.0,3.0,3.0,3.0,]),
                ])
    }
}
