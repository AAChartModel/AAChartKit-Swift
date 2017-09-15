//
//  CommonChartViewController.swift
//  AAChartKit-Swift
//
//  Created by An An on 2017/5/23.
//  Copyright © 2017年 An An . All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit-Swift ***--- source code
//

import UIKit


class MainVC: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    open var chartTypeArr: NSArray?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "AAInfographics"
        chartTypeArr = [
             /*基础类型图表*/
            "Column Chart---柱形图",
            "Bar Chart---条形图",
            "Area Chart---折线填充图",
            "Areaspline Chart---曲线填充图",
            "Line Chart---折线图",
            "Spline Chart---曲线图",
            /*特殊类型图表*/
            "Pie Chart---扇形图",
            "Bubble Chart---气泡图",
            "Scatter Chart---散点图",
            "Pyramid Chart---金字塔图",
            "Funnel Chart---漏斗图",
            "Arearange Chart---区域范围图",
            "Columnrange Chart--- 柱形范围图"
//          "Mixed Chart---混合图"
        ];
        self.view.backgroundColor=UIColor.orange
        let myTableView = UITableView()
        myTableView.frame = CGRect(x:0,y:0,width:self.view.frame.size.width,height:self.view.frame.size.height)
        self.view.addSubview(myTableView)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.backgroundColor = UIColor.white
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chartTypeArr!.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let cellTitle = chartTypeArr?.object(at: indexPath.row)
        cell.textLabel?.text = cellTitle as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let AAChartTypeArr = [
            /*基础类型图表*/
            AAChartType.Column,
            AAChartType.Bar,
            AAChartType.Area,
            AAChartType.AreaSpline,
            AAChartType.Line,
            AAChartType.Spline,
            /*特殊类型图表*/
            AAChartType.Pie,
            AAChartType.Bubble,
            AAChartType.Scatter,
            AAChartType.Pyramid,
            AAChartType.Funnel,
            AAChartType.Arearange,
            AAChartType.Columnrange
        ];
        
        if (indexPath.row<6) {
            /*基础类型图表*/
            let commonChartVC  = CommonChartVC()
            commonChartVC.chartType = AAChartTypeArr[indexPath.row].rawValue
            self.navigationController?.pushViewController(commonChartVC, animated:true)
        } else {
            /*特殊类型图表*/
            let specialChartVC = SpecialChartVC()
            specialChartVC.chartType = AAChartTypeArr[indexPath.row].rawValue
            self.navigationController?.pushViewController(specialChartVC, animated:true)
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
