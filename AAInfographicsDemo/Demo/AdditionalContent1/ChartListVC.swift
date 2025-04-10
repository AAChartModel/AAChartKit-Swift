//
//  ChartListVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/2/6.
//  Copyright © 2025 An An. All rights reserved.
//

import UIKit
import AAInfographics

class ChartListVC: UIViewController {
    
    private let chartTypeArr: [AAChartType] = [
        AAChartType.column,
        AAChartType.bar,
        AAChartType.line,
        AAChartType.spline,
        AAChartType.area,
        AAChartType.areaspline,
        AAChartType.column,
        AAChartType.bar,
        AAChartType.line,
        AAChartType.spline,
        AAChartType.area,
        AAChartType.areaspline,
        AAChartType.bubble,
        AAChartType.column,
        AAChartType.line,
        AAChartType.spline,
        AAChartType.area,
        AAChartType.areaspline,
        AAChartType.bubble,
        AAChartType.column,
        AAChartType.line,
        AAChartType.spline,
        AAChartType.area,
        AAChartType.areaspline,
        AAChartType.bubble,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Charts List"
        setUpBasicView()
    }
    
    private func setUpBasicView() {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureChartModel() -> AAChartModel {
        let chartModel = AAChartModel()
            .chartType(.column)
            .yAxisVisible(true)
            .tooltipValueSuffix("℃")
//            .yAxisGridLineStyle(AALineStyle(width: 0))
            .stacking(.normal)
            .borderRadius(5)
            .series([
                AASeriesElement()
                    .name("Tokyo Hot")
                    .fillColor("rgba(255,255,255,0.4)")
                    .data([0.45, 0.43, 0.50, 0.55, 0.58, 0.62, 0.83, 0.39, 0.56, 0.67, 0.50, 0.34, 0.50, 0.67, 0.58, 0.29, 0.46, 0.23, 0.47, 0.46, 0.38, 0.56, 0.48, 0.36]),
                AASeriesElement()
                    .name("Berlin Hot")
                    .fillColor("rgba(255,255,255,0.6)")
                    .data([0.38, 0.31, 0.32, 0.32, 0.64, 0.66, 0.86, 0.47, 0.52, 0.75, 0.52, 0.56, 0.54, 0.60, 0.46, 0.63, 0.54, 0.51, 0.58, 0.64, 0.60, 0.45, 0.36, 0.67]),
                AASeriesElement()
                    .name("London Hot")
                    .fillColor("rgba(255,255,255,0.8)")
                    .data([0.46, 0.32, 0.53, 0.58, 0.86, 0.68, 0.85, 0.73, 0.69, 0.71, 0.91, 0.74, 0.60, 0.50, 0.39, 0.67, 0.55, 0.49, 0.65, 0.45, 0.64, 0.47, 0.63, 0.64]),
                AASeriesElement()
                    .name("NewYork Hot")
                    .fillColor("rgba(255,255,255,1.0)")
                    .data([0.60, 0.51, 0.52, 0.53, 0.64, 0.84, 0.65, 0.68, 0.63, 0.47, 0.72, 0.60, 0.65, 0.74, 0.66, 0.65, 0.71, 0.59, 0.65, 0.77, 0.52, 0.53, 0.58, 0.53])
            ])
        return chartModel
    }
}

extension ChartListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chartTypeArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ChartListCell
        if cell == nil {
            cell = ChartListCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.selectionStyle = .none
        cell?.isUserInteractionEnabled = false
        
        let chartModel = configureChartModel()
        chartModel.chartType = chartTypeArr[indexPath.row]
        
        // 根据图表类型配置不同属性
        let chartType: AAChartType = chartModel.chartType ?? .column
        if chartType == AAChartType.spline || chartType == AAChartType.areaspline {
            chartModel.markerRadius = 0
        } else if chartType == AAChartType.area || chartType == AAChartType.line {
            chartModel.stacking = AAChartStackingType.none
        }
        
        // 配置图表样式
        let aaOptions = configureChartStyle(chartModel: chartModel, index: indexPath.row)
//        cell?.aaChartView.aa_drawChartWithOptions(aaOptions)
        cell?.aaChartView.aa_drawChartWithChartOptions(aaOptions)
        
        return cell!
    }
}

extension ChartListVC {
    private func configureChartStyle(chartModel: AAChartModel, index: Int) -> AAOptions {
        // 渐变色数组
        let gradientColorArr: [AAGradientColor] = [
            AAGradientColor.oceanBlueColor(.toTopLeft),
            AAGradientColor.sanguineColor(.toTopLeft),
            AAGradientColor.lusciousLimeColor(.toTopLeft),
            AAGradientColor.purpleLakeColor(.toTopLeft),
            AAGradientColor.freshPapayaColor(.toTopLeft),
            AAGradientColor.ultramarineColor(.toTopLeft),
            AAGradientColor.pinkSugarColor(.toTopLeft),
            AAGradientColor.lemonDrizzleColor(.toTopLeft),
            AAGradientColor.victoriaPurpleColor(.toTopLeft),
            AAGradientColor.springGreensColor(.toTopLeft),
            AAGradientColor.mysticMauveColor(.toTopLeft),
            AAGradientColor.reflexSilverColor(.toTopLeft),
            AAGradientColor.newLeafColor(.toTopLeft),
            AAGradientColor.pixieDustColor(.toTopLeft),
            AAGradientColor.fizzyPeachColor(.toTopLeft),
            AAGradientColor.sweetDreamColor(.toTopLeft),
            AAGradientColor.firebrickColor(.toTopLeft),
            AAGradientColor.wroughtIronColor(.toTopLeft),
            AAGradientColor.deepSeaColor(.toTopLeft),
            AAGradientColor.coastalBreezeColor(.toTopLeft),
            AAGradientColor.eveningDelightColor(.toTopLeft),
            AAGradientColor.cottonCandyColor(.toTopLeft),
            // 重复颜色
            AAGradientColor.oceanBlueColor(.toTopLeft),
            AAGradientColor.sanguineColor(.toTopLeft),
            AAGradientColor.lusciousLimeColor(.toTopLeft),
            AAGradientColor.purpleLakeColor(.toTopLeft)
        ]
        
        let gradientColor = gradientColorArr[index]
        
        // 设置主题颜色
        chartModel.colorsTheme = [
            "rgba(255,255,255,0.4)",
            "rgba(255,255,255,0.6)",
            "rgba(255,255,255,0.8)",
            "rgba(255,255,255,1.0)"
        ]
        
        chartModel.backgroundColor = gradientColor as AnyObject
        
        // 配置图表选项
        let aaOptions = chartModel.aa_toAAOptions()
        
        // 禁用动画
        aaOptions.plotOptions?.series?.animation = false as AnyObject
        
        // 配置Y轴样式
        aaOptions.yAxis?
            .lineWidth(1.5)
            .lineColor(AAColor.white)
            .gridLineWidth(0)
        
        aaOptions.yAxis?.labels?
            .style(AAStyle()
                .color(AAColor.white))
        
        // 配置X轴样式
        aaOptions.xAxis?
            .tickWidth(0)
            .lineWidth(1.5)
            .lineColor(AAColor.white)
        
        aaOptions.xAxis?.labels?
            .style(AAStyle()
                .color(AAColor.white))
        
        // 配置图例样式
        aaOptions.legend?
            .itemStyle(AAStyle()
                .color(AAColor.white)
//                .fontSize("13px")
                .fontWeight(.thin))
        
        return aaOptions
    }
}

// ChartListCell
class ChartListCell: UITableViewCell {
    
    var aaChartView: AAChartView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        aaChartView = AAChartView()
        contentView.addSubview(aaChartView)
        
        aaChartView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            aaChartView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            aaChartView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            aaChartView.topAnchor.constraint(equalTo: contentView.topAnchor),
            aaChartView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
