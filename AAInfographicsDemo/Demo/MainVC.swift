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
        self.title = "AAChartKit-Swift"
        chartTypeArr = [
            "Column Chart---柱形图",
            "Bar Chart---条形图",
            "Area Chart---折线填充图",
            "Areaspline Chart---曲线填充图",
            "Line Chart---折线图",
            "Spline Chart---曲线图",
            "Scatter Chart---散点图",
            "Pie Chart---扇形图",
            "Bubble Chart---气泡图",
            "Pyramid Chart---金字塔图",
            "Funnel Chart---漏斗图",
            "Mixed Chart---混合图"
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
            AAChartType.Column,
            AAChartType.Bar,
            AAChartType.Area,
            AAChartType.AreaSpline,
            AAChartType.Line,
            AAChartType.Spline,
            AAChartType.Scatter,
            AAChartType.Pie,
            AAChartType.Bubble,
            AAChartType.Pyramid,
            AAChartType.Funnel,
            AAChartType.Columnrange
        ];
        
        let commonChartVC  = CommonChartVC()
        commonChartVC.chartType = AAChartTypeArr[indexPath.row].rawValue
        self.navigationController?.pushViewController(commonChartVC, animated:true)
        //self.present(locationAlertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
