//
//  CommonChartViewController.swift
//  AAChartKit-Swift
//
//  Created by An An on 2017/5/23.
//  Copyright © 2017年 An An . All rights reserved.
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


class MainVC: UIViewController {
    
    private var chartTypeTitleArr = [[String]]()
    private var chartTypeArr = [[Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "AAInfographics"
        
        chartTypeTitleArr = [
            /*基础类型图表*/
            [
                "Column Chart---柱形图",
                "Bar Chart---条形图",
                "Area Chart---折线填充图",
                "Areaspline Chart---曲线填充图",
                "Step Area Chart--- 直方折线填充图",
                "Step Line Chart--- 直方折线图",
                "Line Chart---折线图",
                "Spline Chart---曲线图",
            ],
            /*特殊类型图表*/
            [
                "Polar Chart---极地图",
                "Pie Chart---扇形图",
                "Bubble Chart---气泡图",
                "Scatter Chart---散点图",
                "Arearange Chart---折线区域范围图",
                "Area Spline range Chart--曲线区域范围图",
                "Columnrange Chart--- 柱形范围图",
                "Step Line Chart--- 直方折线图",
                "Step Area Chart--- 直方折线填充图",
                "Boxplot Chart--- 箱线图",
                "Waterfall Chart--- 瀑布图",
                "Pyramid Chart---金字塔图",
                "Funnel Chart---漏斗图",
            ],
            /*一些仅仅通过AAChartModel自定义风格样式图表*/
            [
             "Colorful Column Chart---多彩条形图",
             "Colorful Gradient Color Chart---多彩颜色渐变条形图",
             "Discontinuous Data Chart---数值不连续的图表",
             "Mixed Line Chart---虚实线混合折线图",
             "Random Colors Colorful Column Chart---随机颜色的多彩柱形图",
             "Gradient Color Bar Chart---颜色渐变条形图",
             "With Dividing Line---带有阈值分割线区域图",
             "Area Chart with minus--带有负数的区域填充图",
             "Step Line Chart--直方折线图",
             "Step Area Chart--直方折线填充图",
             "Nightingale Rose Chart---南丁格尔玫瑰图",
             "Specific Data Customize Datalabel",
             "Chart With Shadow Style---带有阴影效果の图表",
             "Colorful gradient Areaspline Chart---多层次渐变区域填充图",
             "Colorful gradient Spline Chart---多层次渐变曲线图",
             "Gradient Color Areaspline Chart---半透明渐变效果区域填充图",
             "Special Style Marker Of Single Data Element Chart",
             "Special Style Column Of Single Data Element Chart",
             "configure Area Chart Threshold---自定义阈值",
             "custom Scatter Chart Marker Symbol Content---自定义散点图的标志点内容",
             "custom Line Chart Marker Symbol Content---自定义折线图的标志点内容",
             "Triangle Radar Chart---三角形雷达图",
             "Quadrangle Radar Chart---四角形雷达图",
             "Pentagon Radar Chart---五角形雷达图",
             "Hexagon Radar Chart----六角形雷达图"
            ],
            /*Mixed Chart---混合图*/
            [
                "Arearange Mixed Line---面积范围均线图",
                "Columnrange Mixed Line---柱形范围图混合折线图",
                "Stacking Column Mixed Line---堆积柱形图混合折线图",
                "Dash Style Types Mixed---多种类型曲线混合图",
                "Negative Color Mixed---基准线以下异色混合图",
                "scatterMixedLine---散点图混合折线图",
                "Negative Color Mixed bubble---基准线以下异色气泡图",
                "Polygon Mixed Scatter---多边形混合散点图",
                "Polar Chart Mixed---极地混合图",
                "Column Mixed Scatter---柱形图混合散点图",
                "Pie Mixed Line Mixed Column---扇形折线柱形混合图",
                "Line Chart With Shadow---带有阴影效果的折线图"
            ],
            /*单纯刷新数据*/
            [  "Column Chart---柱形图",
               "Bar Chart---条形图",
               "Area Chart---折线填充图",
               "Areaspline Chart---曲线填充图",
               "Step Area Chart--- 直方折线填充图",
               "Step Line Chart--- 直方折线图",
               "Line Chart---折线图",
               "Spline Chart---曲线图",
            ],
            /*同时显示多个图表*/
            [
                "在同一个页面同时添加多个 AAChartView",
                " Double Charts Linkedwork 双表联动",
            ],
            /*动画类型示例*/
            [  "Column Chart---柱形图",
               "Bar Chart---条形图",
               "Area Chart---折线填充图",
               "Areaspline Chart---曲线填充图",
               "Step Area Chart--- 直方折线填充图",
               "Step Line Chart--- 直方折线图",
               "Line Chart---折线图",
               "Spline Chart---曲线图",
            ],
            /*隐藏或显示 Series*/
            [  "Column Chart---柱形图",
               "Bar Chart---条形图",
               "Area Chart---折线填充图",
               "Areaspline Chart---曲线填充图",
               "Step Area Chart--- 直方折线填充图",
               "Step Line Chart--- 直方折线图",
               "Line Chart---折线图",
               "Spline Chart---曲线图",
            ],
            /*执行由 JavaScript 字符串映射转换成的 js function 函数*/
            [
                "Custom Chart DataLabel Sample One",
                "Custom Chart DataLabel Sample Two",
                "Custom Chart StackLabel Sample "
            ],
            
            /*通过options字典来绘制图表*/
            [
                "Custom Chart  Sample One",
                "Custom Chart  Sample Two",
                "Custom Chart  Sample three",
                "Custom Chart  Sample 4",
                "Custom Chart  Sample 5",
                "Adjust Y Axis Min value",
                "Mirror Chart",
                "Adjust The XAxis Labels",
                "Adjust GroupPadding Between Columns",
                "configureAAPlotBandsForChart",
                "configureAAPlotLinesForChart",
                "customAATooltipWithJSFuntion",
                "customXAxisCrosshairStyle",
                "configureXAxisLabelsFontColorWithHTMLString",
                "configureXAxisLabelsFontColorAndFontSizeWithHTMLString",
                "configure_DataLabels_XAXis_YAxis_Legend_Style",
                "configureXAxisPlotBand",
            ],
            [
                "简单字符串拼接",
                "自定义不同单位后缀",
                "值为0时,在tooltip中不显示",
                "自定义多彩颜色文字",
                "自定义箱线图的浮动提示框头部内容",
                "自定义Y轴文字",
                "自定义分组堆积柱状图tooltip内容",
            ]
        ]
        
        chartTypeArr = [
            /*基础类型图表*/
            [
                AAChartType.column,
                AAChartType.bar,
                AAChartType.area,
                AAChartType.areaspline,
                AAChartType.area,
                AAChartType.line,
                AAChartType.line,
                AAChartType.spline,
                ],
            /*特殊类型图表*/
            [
                AAChartType.column,
                AAChartType.pie,
                AAChartType.bubble,
                AAChartType.scatter,
                AAChartType.arearange,
                AAChartType.areasplinerange,
                AAChartType.columnrange,
                AAChartType.line,
                AAChartType.area,
                AAChartType.boxplot,
                AAChartType.waterfall,
                AAChartType.pyramid,
                AAChartType.funnel,
                ],
            [//Empty Array,just for holding place
            ],
            /*Mixed Chart---混合图*/
            [
                "arearangeMixedLine",
                "columnrangeMixedLine",
                "stackingColumnMixedLine",
                "dashStyleTypeMixed",
                "negativeColorMixed",
                "scatterMixedLine",
                "negativeColorMixedBubble",
                "polygonMixedScatter",
                "polarChartMixed",
                "columnMixedScatter",
                "PieMixeLineMixedColumn",
                "LineChartWithShadow"
            ],
            
            [
                AAChartType.column,
                AAChartType.bar,
                AAChartType.area,
                AAChartType.areaspline,
                AAChartType.area,
                AAChartType.line,
                AAChartType.line,
                AAChartType.spline,
                ],
            [//Empty Array,just for holding place
            ],
            [
                AAChartType.column,
                AAChartType.bar,
                AAChartType.area,
                AAChartType.areaspline,
                AAChartType.area,
                AAChartType.line,
                AAChartType.line,
                AAChartType.spline,
                ],
            [
                AAChartType.column,
                AAChartType.bar,
                AAChartType.area,
                AAChartType.areaspline,
                AAChartType.area,
                AAChartType.line,
                AAChartType.line,
                AAChartType.spline,
                ],
            [//Empty Array,just for holding place
            ],
            [//Empty Array,just for holding place
            ],
        ]
        
        view.backgroundColor = .white
        
        setUpMainTableView()
    }
    
   private func setUpMainTableView() {
        let myTableView = UITableView()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.backgroundColor = .white
        myTableView.rowHeight = 40
        myTableView.sectionHeaderHeight = 35
        view.addSubview(myTableView)
        
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.superview!.addConstraints(configureTheConstraintArray(childView: myTableView, fatherView: view))//Note:父控件添加约束
    }
 
   private func configureTheConstraintArray(childView: UIView, fatherView: UIView) -> [NSLayoutConstraint] {
        return [NSLayoutConstraint(item: childView,
                                   attribute: .left,
                                   relatedBy: .equal,
                                   toItem: fatherView,
                                   attribute: .left,
                                   multiplier: 1.0,
                                   constant: 0),
                NSLayoutConstraint(item: childView,
                                   attribute: .right,
                                   relatedBy: .equal,
                                   toItem: fatherView,
                                   attribute: .right,
                                   multiplier: 1.0,
                                   constant: 0),
                NSLayoutConstraint(item: childView,
                                   attribute: .top,
                                   relatedBy: .equal,
                                   toItem: fatherView,
                                   attribute: .top,
                                   multiplier: 1.0,
                                   constant: 0),
                NSLayoutConstraint(item: childView,
                                   attribute: .bottom,
                                   relatedBy: .equal,
                                   toItem: fatherView,
                                   attribute: .bottom,
                                   multiplier: 1.0,
                                   constant: 0)]
    }
    
   private func kRGBColorFromHex(rgbValue: Int) -> (UIColor) {
        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,
                       alpha: 1.0)
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return chartTypeTitleArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chartTypeTitleArr[section].count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = kRGBColorFromHex(rgbValue: 0xF5F5F5)//白烟
        
        let sectionTitleLabel = UILabel()
        let sectionTitleArr = [
            "Basic Type Chart --- 基础类型图表",
            "Special Type Chart --- 特殊类型图表",
            "Some Custom Style---一些自定义风格样式图表",
            "Mixed Chart --- 混合图形",
            "Only Refresh data ---单纯刷新数据",
            "Double Chart View---同时显示多个图表",
            "Rendering Animation types ---渲染动画示例",
            "Hide Or Show Chart Series---隐藏或显示内容",
            "Evaluate JS String Function---执行js函数",
            "Draw Chart With Options Dictionary---通过Options绘图",
            "Custom Tooltip With JS Function ---通过JS函数自定义Tooltip",
        ]
        sectionTitleLabel.text = sectionTitleArr[section]
        sectionTitleLabel.textColor =  kRGBColorFromHex(rgbValue: 0x7B68EE)//熏衣草花的淡紫色
        sectionTitleLabel.font = .boldSystemFont(ofSize: 14)
        sectionTitleLabel.textAlignment = .center
        view.addSubview(sectionTitleLabel)
        
        sectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        sectionTitleLabel.superview!.addConstraints(configureTheConstraintArray(childView: sectionTitleLabel, fatherView: view))
        
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cell"
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        
        let cellTitle = chartTypeTitleArr[indexPath.section][indexPath.row]
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.text = cellTitle
        cell?.textLabel?.font = .systemFont(ofSize: 13)
        cell?.textLabel?.textColor = .darkGray
        cell?.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            /*Basic Type Charts*/
            let vc = CommonChartVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            /*Special Type Charts*/
            let vc = SpecialChartVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            /*Mixed Type Charts*/
            let vc = CustomStyleChartVC()
            vc.chartType = indexPath.row
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            /*Mixed Type Charts*/
            let vc = MixedChartVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? String
            navigationController?.pushViewController(vc, animated: true)
        case 4:
            /*Only Refresh Chart Data Dynamiclly*/
            let vc = OnlyRefreshChartDataVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            vc.step = false
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            navigationController?.pushViewController(vc, animated: true)
        case 5:
            /*Show Many Charts In the Same View*/
            if indexPath.row == 0 {
                let vc = ShowManyChartViewVC()
                navigationController?.pushViewController(vc, animated: true)
            } else {
                let vc = DoubleChartsLinkedWorkVC()
                navigationController?.pushViewController(vc, animated: true)
            }
         
        case 6:
            /*Chart Rendering Animation Types*/
            let vc = AnimationTypeVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            vc.step = false
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            navigationController?.pushViewController(vc, animated: true)
        case 7:
            /*Hide Or Show Chart Series Element*/
            let vc = ChartSeriesHideOrShowVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            vc.step = false
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            navigationController?.pushViewController(vc, animated: true)
        case 8:
            /*Evaluate JavaScript String Function*/
            let vc = EvaluateJSStringFunctionVC()
            vc.sampleChartTypeIndex = indexPath.row
            navigationController?.pushViewController(vc, animated: true)
        case 9:
            /*Draw Chart With AAOptions Instance Object*/
            let vc = DrawChartWithAAOptionsVC()
            vc.chartType = indexPath.row
            navigationController?.pushViewController(vc, animated: true)
        case 10:
            /*Custom Tooltip With JavaScript Function */
            let vc = CustomTooltipWithJSFunctionVC()
            vc.selectedIndex = indexPath.row
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
    
}
