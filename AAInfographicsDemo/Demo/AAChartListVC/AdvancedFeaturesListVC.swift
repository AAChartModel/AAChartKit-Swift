//
//  AdvancedFeaturesListVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/1/5.
//  Copyright © 2024 An An. All rights reserved.
//

import UIKit
import AAInfographics

//let kCustomTableViewCell = "CustomTableViewCell"

@available(iOS 10.0, macCatalyst 13.1, *)
class AdvancedFeaturesListVC: UIViewController {
    private var sectionTitleArr = [String]()
    private var chartTypeTitleArr = [[String]]()
    private var chartTypeArr = [[Any]]()
    private var colorsArr = [
        "#5470c6",
        "#91cc75",
        "#fac858",
        "#ee6666",
        "#73c0de",
        "#3ba272",
        "#fc8452",
        "#9a60b4",
        "#ea7ccc",

        "#5470c6",
        "#91cc75",
        "#fac858",
        "#ee6666",
        "#73c0de",
        "#3ba272",
        "#fc8452",
        "#9a60b4",
        "#ea7ccc",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "AAInfographics"
        
        sectionTitleArr = [
            "Only Refresh data | 单纯刷新数据",
            "Double Chart View | 同时显示多个图表",
            "Rendering Animation types | 渲染动画示例",
            "Hide Or Show Chart Series | 隐藏或显示内容",
            "Evaluate JS String Function | 执行js函数",
            "Scrolling update chart data | 滚动刷新图表数据",
            "Scrollable chart | 可滚动の图表",
            //                  "Scrollable chart |可滚动の图表",
            "Data Sorting Chart With Animation| 图表动态排序",
            "Chart Options Advanced Updating | 图表高级更新",
            "XIB AAChartView | 在 XIB 中创建 AAChartView",
            "Custom Chart Event Callback | 自定义交互事件回调",
            "Custom X Axis Labels Click Event Callback | 自定义 X 轴文字点击事件回调",
        ]
        
        chartTypeTitleArr = [
            /*Only update chart data*/
            [  "Column Chart---柱形图",
               "Bar Chart---条形图",
               "Area Chart---折线填充图",
               "Areaspline Chart---曲线填充图",
               "Step Area Chart---直方折线填充图",
               "Step Line Chart---直方折线图",
               "Line Chart---折线图",
               "Spline Chart---曲线图",
               "Scatter Chart---散点图",
            ],
            /*Show double chart as the same time*/
            [
                "在同一个页面同时添加多个 AAChartView",
                " Double Charts Linkedwork 双表联动",
            ],
            /*Animation types*/
            [  "Column Chart---柱形图",
               "Bar Chart---条形图",
               "Area Chart---折线填充图",
               "Areaspline Chart---曲线填充图",
               "Step Area Chart---直方折线填充图",
               "Step Line Chart---直方折线图",
               "Line Chart---折线图",
               "Spline Chart---曲线图",
            ],
            /*Hide or show the chart series element*/
            [  "Column Chart---柱形图",
               "Bar Chart---条形图",
               "Area Chart---折线填充图",
               "Areaspline Chart---曲线填充图",
               "Step Area Chart---直方折线填充图",
               "Step Line Chart---直方折线图",
               "Line Chart---折线图",
               "Spline Chart---曲线图",
            ],
            /*Evaluate JavaScript function string*/
            [
                "Custom Chart DataLabel Sample One",
                "Custom Chart DataLabel Sample Two",
                "Custom Chart StackLabel Sample ",
                "Support Dragging Chart On X Axis",
            ],
        
            /*Scrolling update chart data*/
            [  "Column Chart---柱形图",
               "Bar Chart---条形图",
               "Area Chart---折线填充图",
               "Areaspline Chart---曲线填充图",
               "Step Area Chart---直方折线填充图",
               "Step Line Chart---直方折线图",
               "Line Chart---折线图",
               "Spline Chart---曲线图",
               "Scatter Chart---散点图",
            ],
            /*Scrollable  chart */
            [  "Column Chart---柱形图",
               "Bar Chart---条形图",
               "Area Chart---折线填充图",
               "Areaspline Chart---曲线填充图",
               "Step Area Chart---直方折线填充图",
               "Step Line Chart---直方折线图",
               "Line Chart---折线图",
               "Spline Chart---曲线图",
               "Scatter Chart---散点图",
            ],
            /*Data Sorting With Animation Charts*/
            [  "Column Chart---柱形图",
               "Bar Chart---条形图",
               "Scatter Chart---散点图",
               "Polar Column Chart---极化柱形图",
               "Polar Bar Chart---极化条形图",
               "Polar Scatter Chart---极化散点图",
            ],
            /*Advanced Updating Feature*/
            [
                "Column Chart---柱形图",
                "Bar Chart---条形图",
                "Area Chart---折线填充图",
                "Areaspline Chart---曲线填充图",
                "Step Area Chart---直方折线填充图",
                "Step Line Chart---直方折线图",
                "Line Chart---折线图",
                "Spline Chart---曲线图",
            ],
            /*XIB AAChartView*/
            [
                "XIB AAChartView---在 XIB 中创建 AAChartView"
            ],
            /*Custom event callback*/
            [
                "自定义监听触摸结束事件回调---CustomTouchEndEventCallbackVC"
            ],
            /*CustomXAxisLabelsClickEventCallbackVC*/
            [
                "自定义X轴文字点击事件回调---CustomXAxisLabelsClickEventCallbackVC"
            ],
     

        ]
        
        chartTypeArr = [
            /*Only update chart data*/
            [
                AAChartType.column,
                AAChartType.bar,
                AAChartType.area,
                AAChartType.areaspline,
                AAChartType.area,
                AAChartType.line,
                AAChartType.line,
                AAChartType.spline,
                AAChartType.scatter
            ],
            /*Show Many Charts In the Same View*/
            [//Empty Array,just for holding place
            ],
            /*Chart Rendering Animation Types*/
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
            /*Hide Or Show Chart Series Element*/
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
            /*Evaluate JavaScript String Function*/
            [//Empty Array,just for holding place
            ],
            /*Scrolling update chart data*/
            [
                AAChartType.column,
                AAChartType.bar,
                AAChartType.area,
                AAChartType.areaspline,
                AAChartType.area,
                AAChartType.line,
                AAChartType.line,
                AAChartType.spline,
                AAChartType.scatter
            ],
            /*Scrollable chart*/
            [
                AAChartType.column,
                AAChartType.bar,
                AAChartType.area,
                AAChartType.areaspline,
                AAChartType.area,
                AAChartType.line,
                AAChartType.line,
                AAChartType.spline,
                AAChartType.scatter
            ],
            
            /*Data Sorting With Animation Charts*/
            [
                AAChartType.column,
                AAChartType.bar,
                AAChartType.scatter,
                AAChartType.column,
                AAChartType.bar,
                AAChartType.scatter,
            ],
            /*Advanced Updating Feature*/
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
        ]
        
        
        view.backgroundColor = .white
        
        setUpMainTableView()
    }
    
    private func setUpMainTableView() {
        let tableView = UITableView()
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.sectionHeaderHeight = 45
        tableView.sectionIndexColor = .red
        tableView.register(UINib.init(nibName: kCustomTableViewCell, bundle: Bundle.main), forCellReuseIdentifier: kCustomTableViewCell)
        view.addSubview(tableView)
    }
    
    private func kRGBColorFromHex(rgbValue: Int) -> UIColor {
        UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,
                green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,
                blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,
                alpha: 1.0)
    }

    //convert hex color string to UIColor
    private func kColorWithHexString(_ hexString: String) -> UIColor {
        var cString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }

        if (cString.count != 6) {
            return UIColor.gray
        }

        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)

        var r: CUnsignedInt = 0, g: CUnsignedInt = 0, b: CUnsignedInt = 0
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)

        return UIColor(
            red: CGFloat(r) / 255.0,
            green: CGFloat(g) / 255.0,
            blue: CGFloat(b) / 255.0,
            alpha: 1
        )
    }
}

@available(macCatalyst 13.1, *)
extension AdvancedFeaturesListVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        chartTypeTitleArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chartTypeTitleArr[section].count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var listTitles = [String]()
        for item: String in sectionTitleArr {
            let titleStr = item.prefix(1)
            listTitles.append(String(titleStr))
        }
        return listTitles
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeaderView = UIView()
        let bgColor = kColorWithHexString(colorsArr[section % 18])
        sectionHeaderView.backgroundColor = bgColor
        
        let sectionTitleLabel = UILabel()
        sectionTitleLabel.frame = sectionHeaderView.bounds
        sectionTitleLabel.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        sectionTitleLabel.text = sectionTitleArr[section]
        sectionTitleLabel.textColor = .white
        sectionTitleLabel.font = .boldSystemFont(ofSize: 17)
        sectionTitleLabel.textAlignment = .center
        sectionHeaderView.addSubview(sectionTitleLabel)
  
        
        return sectionHeaderView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCustomTableViewCell) as! CustomTableViewCell
        cell.accessoryType = .disclosureIndicator
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .white
        } else {
            cell.backgroundColor = kRGBColorFromHex(rgbValue: 0xE6E6FA)// kRGBColorFromHex(rgbValue: 0xF5F5F5)//白烟
        }
        
        let cellTitle = chartTypeTitleArr[indexPath.section][indexPath.row]
        cell.titleLabel?.text = cellTitle
        cell.titleLabel.textColor = .black
        cell.numberLabel.text = String(indexPath.row + 1)
        let bgColor = kColorWithHexString(colorsArr[indexPath.section % 18])
        cell.numberLabel.backgroundColor = bgColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            /*Only Refresh Chart Data Dynamiclly*/
            let vc = OnlyRefreshChartDataVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            vc.step = false
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            /*Show Many Charts In the Same View*/
            if indexPath.row == 0 {
                let vc = ShowManyChartViewVC()
                vc.hidesBottomBarWhenPushed = true
                navigationController?.pushViewController(vc, animated: true)
            } else {
                let vc = DoubleChartsLinkedWorkVC()
                vc.hidesBottomBarWhenPushed = true
                navigationController?.pushViewController(vc, animated: true)
            }
            
        case 2:
            /*Chart Rendering Animation Types*/
            let vc = AnimationTypeVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            vc.step = false
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 3:
            /*Hide Or Show Chart Series Element*/
            let vc = HideOrShowChartSeriesVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            vc.step = false
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 4:
            /*Evaluate JavaScript String Function*/
            let vc = EvaluateJSStringFunctionVC()
            vc.sampleChartTypeIndex = indexPath.row
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
         
 
        case 5:
            /*Scrolling update Chart Data Dynamiclly*/
            let vc = ScrollingUpdateDataVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            vc.step = false
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 6:
            /*Scrollable Charts*/
            let vc = ScrollableChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 7:
            /*Data Sorting With Animation Charts*/
            let vc = DataSortingWithAnimationChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            if indexPath.row >= 3 {
                vc.polar = true
            }
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 8:
            /*Advanced Updating Feature*/
            let vc = AdvancedUpdatingFeatureVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 9:
            /*Special Type Charts*/
            let vc = TestAAChartViewForXibVC()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
          
        case 10:
            /*CustomTouchEndEventCallbackVCs*/
            let vc = CustomTouchEndEventCallbackVC()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)

        case 11:
            /*CustomXAxisLabelsClickEventCallbackVC*/
            let vc = CustomXAxisLabelsClickEventCallbackVC()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)



        default:
            break
        }
    }
    
}

