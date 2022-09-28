//
//  JSFunctionForAALegendVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2022/9/28.
//  Copyright © 2022 An An. All rights reserved.
//

import UIKit
import AAInfographics

class JSFunctionForAALegendVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //https://bbs.hcharts.cn/article-109-1.html
    //图表自带的图例点击事件是：
    //点击某个显示/隐藏的图例，该图例对应的serie就隐藏/显示。
    //个人觉得不合理，正常来说，有多条折线(或其他类型的图表)，点击某个图例是想只看该图例对应的数据；
    //于是修改了图例点击事件。
    //
    //实现的效果是(以折线图为例)：
    //1. 当某条折线隐藏时，点击该折线的图例 --> 该折线显示；
    //2. 当全部折线都显示时，点击某个图例 --> 该图例对应的折线显示，其他折线均隐藏；
    //3. 当只有一条折线显示时，点击该折线的图例 --> 全部折线均显示；
    //4. 其他情况，按默认处理：
    //显示 --> 隐藏；
    //隐藏 --> 显示；
    //Customized legendItemClick Event online: http://code.hcharts.cn/rencht/hhhhLv/share
    private func customLegendItemClickEvent() -> AAOptions  {
        let aaChartModel = AAChartModel()
            .chartType(.column)
            .stacking(.normal)
            .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])//设置主题颜色数组
            .markerRadius(0)
            .series([
                AASeriesElement()
                    .name("2017")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]),
                AASeriesElement()
                    .name("2018")
                    .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]),
                AASeriesElement()
                    .name("2019")
                    .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]),
                AASeriesElement()
                    .name("2020")
                    .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]),
            ])
        let aaOptions = aaChartModel.aa_toAAOptions()
        
        aaOptions.legend?
            .enabled(true)
            .align(.right)//设置图例位于水平方向上的右侧
            .layout(.vertical)//设置图例排列方式为垂直排布
            .verticalAlign(.top)//设置图例位于竖直方向上的顶部
        
        
        //自定义图例点击事件
        aaOptions.plotOptions?.series?.events = AAEvents()
            .legendItemClick(#"""
            function(event) {
                function getVisibleMode(series, serieName) {
                    var allVisible = true;
                    var allHidden = true;
                    for (var i = 0; i < series.length; i++) {
                        if (series[i].name == serieName)
                            continue;
                        allVisible &= series[i].visible;
                        allHidden &= (!series[i].visible);
                    }
                    if (allVisible && !allHidden)
                        return 'all-visible';
                    if (allHidden && !allVisible)
                        return 'all-hidden';
                    return 'other-cases';
                }
                
                var series = this.chart.series;
                var mode = getVisibleMode(series, this.name);
                var enableDefault = false;
                if (!this.visible) {
                    enableDefault = true;
                }
                else if (mode == 'all-visible') {
                    var seriesLength = series.length;
                    for (var i = 0; i < seriesLength; i++) {
                        var serie = series[i];
                        serie.hide();
                    }
                    this.show();
                }
                else if (mode == 'all-hidden') {
                    var seriesLength = series.length;
                    for (var i = 0; i < seriesLength; i++) {
                        var serie = series[i];
                        serie.show();
                    }
                }
                else {
                    enableDefault = true;
                }
                return enableDefault;
            }
        """#)
        
        return aaOptions
    }
    
}
