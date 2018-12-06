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
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
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
                "Colorful Gradient Bar Chart---多彩渐变色条形图",
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
            /*Mixed Chart---混合图*/
            [
                "Colorful Bar Chart---多彩条形图",
                "Arearange Mixed Line---面积范围均线图",
                "Columnrange Mixed Line---柱形范围图混合折线图",
                "Stacking Column Mixed Line---堆积柱形图混合折线图",
                "Dash Style Types Mixed---多种类型曲线混合图",
                "Negative Color Mixed---基准线以下异色混合图",
                "scatterMixedLine---散点图混合折线图(待完成)",
                "Negative Color Mixed bubble---基准线以下异色气泡图",
                "Polygon Mixed Scatter---多边形混合散点图",
                "Polar Chart Mixed---极地混合图",
                "Column Mixed Scatter---柱形图混合散点图",
                "Pie Mixed Line Mixed Column---扇形折线柱形混合图"
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
                "在同一个页面同时添加多个 AAChartView"
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
                "执行由 JavaScript 字符串映射转换成的 js function 函数"
            ],
        ]
        
        chartTypeArr = [
            /*基础类型图表*/
            [
                AAChartType.column,
                AAChartType.bar,
                AAChartType.area,
                AAChartType.areaSpline,
                AAChartType.area,
                AAChartType.line,
                AAChartType.line,
                AAChartType.spline,
                ],
            /*特殊类型图表*/
            [   AAChartType.bar,
                AAChartType.column,
                AAChartType.pie,
                AAChartType.bubble,
                AAChartType.scatter,
                AAChartType.areaRange,
                AAChartType.areaSplineRange,
                AAChartType.columnRange,
                AAChartType.line,
                AAChartType.area,
                AAChartType.boxplot,
                AAChartType.waterfall,
                AAChartType.pyramid,
                AAChartType.funnel,
                ],
            [
                "manyColorMixedBar",
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
                "PieMixeLineMixedColumn"
            ],
            
            [
                AAChartType.column,
                AAChartType.bar,
                AAChartType.area,
                AAChartType.areaSpline,
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
                AAChartType.areaSpline,
                AAChartType.area,
                AAChartType.line,
                AAChartType.line,
                AAChartType.spline,
                ],
            [
                AAChartType.column,
                AAChartType.bar,
                AAChartType.area,
                AAChartType.areaSpline,
                AAChartType.area,
                AAChartType.line,
                AAChartType.line,
                AAChartType.spline,
                ],
            [//Empty Array,just for holding place
            ],
        ]
        
        view.backgroundColor = .white
        
        setUpMainTableView()
    }
    
    func setUpMainTableView() {
        let myTableView = UITableView()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.backgroundColor = .white
        view.addSubview(myTableView)
        
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.superview!.addConstraints(configureTheConstraintArray(childView: myTableView, fatherView: view))//Note:父控件添加约束
    }
 
    func configureTheConstraintArray(childView: UIView, fatherView: UIView) -> [NSLayoutConstraint] {
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
    
    func kRGBColorFromHex(rgbValue: Int) -> (UIColor) {
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = kRGBColorFromHex(rgbValue: 0xF5F5F5)//白烟
        
        let sectionTitleLabel = UILabel()
        let sectionTitleArr = [
            "Basic Type Chart --- 基础类型图表",
            "Special Type Chart --- 特殊类型图表",
            "Mixed Chart --- 混合图形",
            "Only Refresh data ---单纯刷新数据",
            "Double Chart View---同时显示多个图表",
            "Rendering Animation types ---渲染动画示例",
            "Hide Or Show Chart Series---隐藏或显示内容",
            "Evaluate JS String Function---执行js函数"
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
        cell?.textLabel?.text = cellTitle
        cell?.textLabel?.font = .systemFont(ofSize: 13)
        cell?.textLabel?.textColor = .darkGray
        cell?.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            /*基础类型图表*/
            let vc = CommonChartVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 1 {
            /*特殊类型图表*/
            let vc = SpecialChartVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 2 {
            /*混合类型图表*/
            let vc = MixedChartVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? String
            navigationController?.pushViewController(vc, animated: true)
        }  else if indexPath.section == 3 {
            /*动态刷新图表数据*/
            let vc = OnlyRefreshChartDataVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            vc.step = false
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 4 {
            /*同时显示多个图表*/
            let vc = ShowManyChartViewVC()
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 5 {
            /*图表渲染动画*/
            let vc = AnimationTypeVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            vc.step = false
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 6 {
            /*图表 sereies 元素显示或隐藏*/
            let vc = ChartSeriesHideOrShowVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            vc.step = false
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 7 {
            /*图表 sereies 元素显示或隐藏*/
            let vc = EvaluateJSStringFunctionVC()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
