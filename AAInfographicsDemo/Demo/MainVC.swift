//
//  CommonChartViewController.swift
//  AAChartKit-Swift
//
//  Created by An An on 2017/5/23.
//  Copyright © 2017年 An An . All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit-Swift ***--- source code
//

/*
 
 *********************************************************************************
 *
 * ❤❤❤❤❤   WARM TIPS!!!   ❤❤❤❤❤
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


class MainVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    open var chartTypeArr = Array<Array<String>>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "AAInfographics"
        chartTypeArr = [
            /*基础类型图表*/
            [
                "Column Chart---柱形图",
                "Bar Chart---条形图",
                "Area Chart---折线填充图",
                "Areaspline Chart---曲线填充图",
                "Line Chart---折线图",
                "Spline Chart---曲线图",
                ],
            /*特殊类型图表*/
            [
                "Pie Chart---扇形图",
                "Bubble Chart---气泡图",
                "Scatter Chart---散点图",
                "Arearange Chart---区域范围图",
                "Columnrange Chart--- 柱形范围图",
                "Step Line Chart--- 直方折线图",
                "Step Area Chart--- 直方折线填充图",
                "Boxplot Chart--- 箱线图",
                "Waterfall Chart--- 瀑布图",
                "Pyramid Chart---金字塔图",
                "Funnel Chart---漏斗图",
                ],
            /*Mixed Chart---混合图*/
            /*同时显示多个图表*/
            ["在同一个页面同时添加多个 AAChartView"]
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return chartTypeArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chartTypeArr[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.white
        
        let sectionTitleArr = ["Basic Type Chart --- 基础类型图表","Special Type Chart --- 特殊类型图表","同时显示多个图表"]
        
        let sectionTitleLabel = UILabel()
        sectionTitleLabel.text = sectionTitleArr[section]
        sectionTitleLabel.textColor = UIColor.blue
        sectionTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        sectionTitleLabel.textAlignment = NSTextAlignment.center
        view.addSubview(sectionTitleLabel)
        
        sectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        sectionTitleLabel.superview!.addConstraints(self.configureTheConstraintArray(childView: sectionTitleLabel, fatherView: view))
        
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let cellTitle = chartTypeArr[indexPath.section][indexPath.row]
        cell.textLabel?.text = cellTitle
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.textLabel?.textColor = UIColor.darkGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let AAChartTypeArr = [
            /*基础类型图表*/
            [
                AAChartType.Column,
                AAChartType.Bar,
                AAChartType.Area,
                AAChartType.AreaSpline,
                AAChartType.Line,
                AAChartType.Spline,
                ],
            /*特殊类型图表*/
            [
                AAChartType.Pie,
                AAChartType.Bubble,
                AAChartType.Scatter,
                AAChartType.Arearange,
                AAChartType.Columnrange,
                AAChartType.Line,
                AAChartType.Area,
                AAChartType.Boxplot,
                AAChartType.Waterfall,
                AAChartType.Pyramid,
                AAChartType.Funnel,
                ],
        ]
        
        if (indexPath.section == 0) {
            /*基础类型图表*/
            let commonChartVC  = CommonChartVC()
            commonChartVC.chartType = AAChartType(rawValue: AAChartTypeArr[indexPath.section][indexPath.row].rawValue)
            self.navigationController?.pushViewController(commonChartVC, animated:true)
        } else if (indexPath.section == 1) {
            /*特殊类型图表*/
            let specialChartVC = SpecialChartVC()
            specialChartVC.chartType = AAChartTypeArr[indexPath.section][indexPath.row].rawValue
            self.navigationController?.pushViewController(specialChartVC, animated:true)
            
        } else {
            /*同时显示多个图表*/
            let specialChartVC = ShowManyChartViewVC()
            self.navigationController?.pushViewController(specialChartVC, animated:true)
        }

    }
    
    func configureTheConstraintArray(childView:UIView, fatherView:UIView) -> [NSLayoutConstraint] {
        return [NSLayoutConstraint(item:childView,
                                   attribute:NSLayoutAttribute.left,
                                   relatedBy:NSLayoutRelation.equal,
                                   toItem:fatherView,
                                   attribute:NSLayoutAttribute.left,
                                   multiplier:1.0,
                                   constant:0),
                NSLayoutConstraint(item:childView,
                                   attribute:NSLayoutAttribute.right,
                                   relatedBy:NSLayoutRelation.equal,
                                   toItem:fatherView,
                                   attribute:NSLayoutAttribute.right,
                                   multiplier:1.0,
                                   constant:0),
                NSLayoutConstraint(item:childView,
                                   attribute:NSLayoutAttribute.top,
                                   relatedBy:NSLayoutRelation.equal,
                                   toItem:fatherView,
                                   attribute:NSLayoutAttribute.top,
                                   multiplier:1.0,
                                   constant:0),
                NSLayoutConstraint(item:childView,
                                   attribute:NSLayoutAttribute.bottom,
                                   relatedBy:NSLayoutRelation.equal,
                                   toItem:fatherView,
                                   attribute:NSLayoutAttribute.bottom,
                                   multiplier:1.0,
                                   constant:0)]
    }
    
}
