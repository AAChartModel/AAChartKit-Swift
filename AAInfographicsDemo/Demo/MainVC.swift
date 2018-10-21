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
        
        self.title = "AAInfographics"
        
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
            /*Mixed Chart---混合图*/
            [
                "Arearange Mixed Line---面积范围均线图",
                "Columnrange Mixed Line---柱形范围图混合折线图",
                "Stacking Column Mixed Line---堆积柱形图混合折线图",
                "Dash Style Types Mixed---多种类型曲线混合图",
                "Negative Color Mixed---基准线以下异色混合图",
                "scatterMixedLine---散点图混合折线图(待完成)",
                "Negative Color Mixed bubble---基准线以下异色气泡图",
                "Polygon Mixed Scatter---多边形混合散点图",
                "Polar Chart Mixed---极地混合图"
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
            [
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
            ["arearangeMixedLine",
             "columnrangeMixedLine",
             "stackingColumnMixedLine",
             "dashStyleTypeMixed",
             "negativeColorMixed",
             "scatterMixedLine",
             "negativeColorMixedBubble",
             "polygonMixedScatter",
             "polarChartMixed"
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
                ]
        ]
        
        self.view.backgroundColor = UIColor.white
        
        let myTableView = UITableView()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.backgroundColor = UIColor.white
        self.view.addSubview(myTableView)

        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.superview!.addConstraints(self.configureTheConstraintArray(childView: myTableView, fatherView: self.view))//Note:父控件添加约束
        
    }
 
    func configureTheConstraintArray(childView: UIView, fatherView: UIView) -> [NSLayoutConstraint] {
        return [NSLayoutConstraint(item: childView,
                                   attribute: NSLayoutConstraint.Attribute.left,
                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                   toItem: fatherView,
                                   attribute: NSLayoutConstraint.Attribute.left,
                                   multiplier: 1.0,
                                   constant: 0),
                NSLayoutConstraint(item: childView,
                                   attribute: NSLayoutConstraint.Attribute.right,
                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                   toItem: fatherView,
                                   attribute: NSLayoutConstraint.Attribute.right,
                                   multiplier: 1.0,
                                   constant: 0),
                NSLayoutConstraint(item: childView,
                                   attribute: NSLayoutConstraint.Attribute.top,
                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                   toItem: fatherView,
                                   attribute: NSLayoutConstraint.Attribute.top,
                                   multiplier: 1.0,
                                   constant: 0),
                NSLayoutConstraint(item: childView,
                                   attribute: NSLayoutConstraint.Attribute.bottom,
                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                   toItem: fatherView,
                                   attribute: NSLayoutConstraint.Attribute.bottom,
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
        let sectionTitleArr = ["Basic Type Chart --- 基础类型图表",
                               "Special Type Chart --- 特殊类型图表",
                               "Mixed Chart --- 混合图形",
                               "Only Refresh data ---单纯刷新数据",
                               "Double Chart View---同时显示多个图表",
                               "Rendering Animation types ---渲染动画示例",
                               "Hide Or Show Chart Series---隐藏或显示内容"]
        sectionTitleLabel.text = sectionTitleArr[section]
        sectionTitleLabel.textColor =  kRGBColorFromHex(rgbValue: 0x7B68EE)//熏衣草花的淡紫色
        sectionTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        sectionTitleLabel.textAlignment = NSTextAlignment.center
        view.addSubview(sectionTitleLabel)
        
        sectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        sectionTitleLabel.superview!.addConstraints(self.configureTheConstraintArray(childView: sectionTitleLabel, fatherView: view))
        
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let cellTitle = chartTypeTitleArr[indexPath.section][indexPath.row]
        cell.textLabel?.text = cellTitle
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.textLabel?.textColor = UIColor.darkGray
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            /*基础类型图表*/
            let commonChartVC  = CommonChartVC()
            commonChartVC.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            if indexPath.row == 4 || indexPath.row == 5 {
                commonChartVC.step = true
            }
            self.navigationController?.pushViewController(commonChartVC, animated: true)
            
        } else if indexPath.section == 1 {
            /*特殊类型图表*/
            let specialChartVC = SpecialChartVC()
            specialChartVC.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            self.navigationController?.pushViewController(specialChartVC, animated: true)
            
        } else if indexPath.section == 2 {
            let mixedChartVC = MixedChartVC()
            mixedChartVC.chartType = chartTypeArr[indexPath.section][indexPath.row] as? String
            self.navigationController?.pushViewController(mixedChartVC, animated: true)
        }  else if indexPath.section == 3 {
            let refreshchartDataVC = OnlyRefreshChartDataVC()
            refreshchartDataVC.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            refreshchartDataVC.step = false
            if indexPath.row == 4 || indexPath.row == 5 {
                refreshchartDataVC.step = true
            }
            self.navigationController?.pushViewController(refreshchartDataVC, animated: true)
        } else if indexPath.section == 4 {
            /*同时显示多个图表*/
            let manyChartVC = ShowManyChartViewVC()
            self.navigationController?.pushViewController(manyChartVC, animated: true)
        } else if indexPath.section == 5 {
            let animationTypeVC = AnimationTypeVC()
            animationTypeVC.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            animationTypeVC.step = false
            if indexPath.row == 4 || indexPath.row == 5 {
                animationTypeVC.step = true
            }
            self.navigationController?.pushViewController(animationTypeVC, animated: true)
        } else if indexPath.section == 6 {
            let seriesHideOrShowVC = ChartSeriesHideOrShowVC()
            seriesHideOrShowVC.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            seriesHideOrShowVC.step = false
            if indexPath.row == 4 || indexPath.row == 5 {
                seriesHideOrShowVC.step = true
            }
            self.navigationController?.pushViewController(seriesHideOrShowVC, animated: true)
        }
    }
    
}
