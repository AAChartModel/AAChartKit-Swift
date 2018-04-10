//
//  MixedChartVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2018/4/10.
//  Copyright © 2018年 An An. All rights reserved.
//

import UIKit

class MixedChartVC: UIViewController {

    open var chartType:String?
    open var aaChartModel: AAChartModel?
    open var aaChartView: AAChartView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.title = self.chartType
        
        /*不要将 AAChartView 作为第一个添加到 ViewController 上的子视图,否则会有 bug!!!!!!不信你试试注释掉中间这段*/
        let subLabel = UILabel()
        subLabel.frame = CGRect(x: 20, y:0, width: 5, height: 5)
        subLabel.text = "不要将 AAChartView 作为第一个子视图添加到 ViewController 上,否则会有 bug,不信你试试注释掉我"
        self.view .addSubview(subLabel)
        /*不要将 AAChartView 作为第一个添加到 ViewController 上的子视图,否则会有 bug!!!!!!不信你试试注释掉中间这段*/
        
        
        aaChartView = AAChartView()
        let chartWidth = self.view.frame.size.width
        let chartHeight = self.view.frame.size.height
        aaChartView?.frame = CGRect(x:0,y:60,width:chartWidth,height:chartHeight)
        aaChartView?.contentHeight = self.view.frame.size.height-60
        self.view.addSubview(aaChartView!)
        aaChartView?.scrollEnabled = false
        
        self.configureTheAAChartModel(chartTypeStr: self.chartType!)
        
        aaChartView?.aa_drawChartWithChartModel(aaChartModel!)
        
    }
    
    func configureTheAAChartModel(chartTypeStr:String) {
        
        switch chartTypeStr {
        case "arearangeMixedLine":
            let rangesArr = [[1246406400000, 14.3, 27.7],
                             [1246492800000, 14.5, 27.8],
                             [1246579200000, 15.5, 29.6],
                             [1246665600000, 16.7, 30.7],
                             [1246752000000, 16.5, 25.0],
                             [1246838400000, 17.8, 25.7],
                             [1246924800000, 13.5, 24.8],
                             [1247011200000, 10.5, 21.4],
                             [1247097600000, 9.2, 23.8],
                             [1247184000000, 11.6, 21.8],
                             [1247270400000, 10.7, 23.7],
                             [1247356800000, 11.0, 23.3],
                             [1247443200000, 11.6, 23.7],
                             [1247529600000, 11.8, 20.7],
                             [1247616000000, 12.6, 22.4],
                             [1247702400000, 13.6, 19.6],
                             [1247788800000, 11.4, 22.6],
                             [1247875200000, 13.2, 25.0],
                             [1247961600000, 14.2, 21.6],
                             [1248048000000, 13.1, 17.1],
                             [1248134400000, 12.2, 15.5],
                             [1248220800000, 12.0, 20.8],
                             [1248307200000, 12.0, 17.1],
                             [1248393600000, 12.7, 18.3],
                             [1248480000000, 12.4, 19.4],
                             [1248566400000, 12.6, 19.9],
                             [1248652800000, 11.9, 20.2],
                             [1248739200000, 11.0, 19.3],
                             [1248825600000, 10.8, 17.8],
                             [1248912000000, 11.8, 18.5],
                             [1248998400000, 10.8, 16.1]]
            
            let averagesArr = [[1246406400000, 21.5],
                               [1246492800000, 22.1],
                               [1246579200000, 23],
                               [1246665600000, 23.8],
                               [1246752000000, 21.4],
                               [1246838400000, 21.3],
                               [1246924800000, 18.3],
                               [1247011200000, 15.4],
                               [1247097600000, 16.4],
                               [1247184000000, 17.7],
                               [1247270400000, 17.5],
                               [1247356800000, 17.6],
                               [1247443200000, 17.7],
                               [1247529600000, 16.8],
                               [1247616000000, 17.7],
                               [1247702400000, 16.3],
                               [1247788800000, 17.8],
                               [1247875200000, 18.1],
                               [1247961600000, 17.2],
                               [1248048000000, 14.4],
                               [1248134400000, 13.7],
                               [1248220800000, 15.7],
                               [1248307200000, 14.6],
                               [1248393600000, 15.3],
                               [1248480000000, 15.3],
                               [1248566400000, 15.8],
                               [1248652800000, 15.2],
                               [1248739200000, 14.8],
                               [1248825600000, 14.4],
                               [1248912000000, 15],
                               [1248998400000, 13.6]]
            
            let seriesArr = [
                [
                    "name": "Temperature",
                    "color": "#1E90FF",
                    "type": AAChartType.Line.rawValue,
                    "data": averagesArr,
                    "zIndex": 1,
                    "marker": [
                        "fillColor":"#1E90FF" ,
                        "lineWidth": 2,
                        "lineColor":"white"
                    ]
                ],
                [
                    "name": "Range",
                    "data": rangesArr,
                    "type": AAChartType.Arearange.rawValue,
                    "lineWidth": 0,
                    "linkedTo": ":previous",
                    "fillOpacity": 0.4,
                    "zIndex": 0,
                    "color": "#1E90FF",
                    "marker": [
                        "enabled": false
                    ]
                ]
            ]
            
            aaChartModel = AAChartModel.init()
                .title("LANGUAGE MARKET SHARES JANUARY,2020 TO MAY")
                .subtitle("virtual data")
                .series(seriesArr)
            break
            
        case "columnrangeMixedLine":
            aaChartModel = AAChartModel.init()
                .colorsTheme(["#1e90ff","#EA007B", "#49C1B6", "#FDC20A", "#F78320", "#068E81",])//主题颜色数组
                .title("")//图形标题
                .subtitle("")//图形副标题
                .chartType(AAChartType.Line)
                .dataLabelEnabled(false)
                .symbolStyle(AAChartSymbolStyleType(rawValue: AAChartSymbolStyleType.BorderBlank.rawValue)!)
                .series([
                    [
                        "name": "Temperature",
                        "type": AAChartType.Columnrange.rawValue,
                        "dataLabels":["enabled":true],
                        "data": [
                            [(-9.7), 9.4],
                            [(-8.7), 6.5],
                            [(-3.5), 9.4],
                            [(-1.4),19.9],
                            [0.0 ,  22.6],
                            [2.9 ,  29.5],
                            [9.2 ,  30.7],
                            [7.3 ,  26.5],
                            [4.4 ,  18.0],
                            [(-3.1),11.4],
                            [(-5.2),10.4],
                            [(-9.9),16.8]
                        ]
                    ],
                    [
                        "name": "Tokyo",
                        "type": AAChartType.Line.rawValue,
                        "data": [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
                    ], [
                        "name": "New York",
                        "type": AAChartType.Line.rawValue,
                        "data": [0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
                    ], [
                        "name": "Berlin",
                        "type": AAChartType.Line.rawValue,
                        "data": [0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
                    ], [
                        "name": "London",
                        "type": AAChartType.Line.rawValue,
                        "data": [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
                    ]])
            
            break
            
        case "DashStyleTypeMixed":
            aaChartModel = AAChartModel.init()
                .chartType(AAChartType.Line)//图形类型
                .dataLabelEnabled(false)//是否显示数字
                .markerRadius(0)
                .series([
                    [
                        "name": AALineDashSyleType.Dash.rawValue,
                        "lineWidth":3,
                        "dashStyle": AALineDashSyleType.Dash.rawValue,
                        "data": [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
                    ], [
                        "name": AALineDashSyleType.DashDot.rawValue,
                        "lineWidth":3,
                        "dashStyle": AALineDashSyleType.DashDot.rawValue,
                        "data": [0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
                    ], [
                        "name": AALineDashSyleType.LongDash.rawValue,
                        "lineWidth":3,
                        "dashStyle": AALineDashSyleType.LongDash.rawValue,
                        "data": [0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
                    ], [
                        "name": AALineDashSyleType.LongDashDot.rawValue,
                        "lineWidth":3,
                        "dashStyle": AALineDashSyleType.LongDashDot.rawValue,
                        "data": [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
                    ]])
            break
            
            
        default:
            break
        }
        
    }

}
