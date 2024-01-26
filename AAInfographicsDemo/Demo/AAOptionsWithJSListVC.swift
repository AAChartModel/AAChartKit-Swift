//
//  AAOptionsWithJSListVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/1/4.
//  Copyright © 2024 An An. All rights reserved.
//

import UIKit
import AAInfographics

//let kCustomTableViewCell = "CustomTableViewCell"

@available(iOS 10.0, macCatalyst 13.1, *)
class AAOptionsWithJSListVC: UIViewController {
    private var sectionTitleArr = [String]()
    private var chartTypeTitleArr = [[String]]()
    private var chartTypeArr = [[Any]]()
    private var colorsArr = [
//        "#5470c6",
//        "#91cc75",
//        "#fac858",
//        "#ee6666",
//        "#73c0de",
//        "#3ba272",
//        "#fc8452",
//        "#9a60b4",
//        "#ea7ccc",
//
//        "#5470c6",
//        "#91cc75",
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
          
            "JS Function For AAOptionns | 通过带有 JS 函数的 Options 绘图",
         
            "JS Function For AAAxis Labels | 通过带有 JS 函数的自定义 AAAxis 的文字标签",
            "JS Function For AALegend | 通过带有 JS 函数的自定义 AALegend",
            "JS Function For AAChartEvents---通过 JSFunction 自定义 AAChartEvents 的事件",
            "JS Function For AAChartEvents2---通过 JSFunction 自定义 AAChartEvents 的事件",
            "JS Function For AAOptions---通过 JSFunction 自定义 AAOptions 内容",
            

        ]
        
        chartTypeTitleArr = [
           
            /*JavaScript Formatter Function */
            [
                "customAreaChartTooltipStyleWithSimpleFormatString---简单字符串拼接",
                "customAreaChartTooltipStyleWithDifferentUnitSuffix---自定义不同单位后缀",
                "customAreaChartTooltipStyleWithColorfulHtmlLabels---自定义多彩颜色文字",
                "customLineChartTooltipStyleWhenValueBeZeroDoNotShow---值为0时,在tooltip中不显示",
                "customBoxplotTooltipContent---自定义箱线图の浮动提示框头部内容",
                "customStackedAndGroupedColumnChartTooltip---自定义分组堆积柱状图tooltip内容",
                "custom Arearange Chart Tooltip---自定义面积范围图浮动提示框",
                "customLineChartOriginalPointPositionByConfiguringXAxisFormatterAndTooltipFormatter---调整折线图の X 轴左边距",
                "customTooltipWhichDataSourceComeFromOutSideRatherThanSeries---通过来自外部の数据源来自定义 tooltip (而非常规の来自图表の series)",
                "customAreasplineChartTooltipStyleByDivWithCSS---通过自定义 div 的 css 样式来自定义复杂效果的 tooltip 浮动提示框",
            ],
       
            /*JS Function For AAAXis Labels*/
            [
                "customYAxisLabels---自定义Y轴文字",
                "customYAxisLabels2---自定义Y轴文字2",
                "customAreaChartXAxisLabelsTextUnitSuffix1---自定义X轴文字单位后缀(通过 formatter 函数)",
                "customAreaChartXAxisLabelsTextUnitSuffix2---自定义X轴文字单位后缀(不通过 formatter 函数)",
                "configureTheAxesLabelsFormattersOfDoubleYAxesChart---配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数 示例 1",
                "configureTheAxesLabelsFormattersOfDoubleYAxesChart2---配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数 示例 2",
                "configureTheAxesLabelsFormattersOfDoubleYAxesChart3---配置双 Y 轴图表的 Y 轴文字标签的 Formatter 函数 示例 3",
                "customColumnChartXAxisLabelsTextByInterceptTheFirstFourCharacters---通过截取前四个字符来自定义 X 轴 labels",
                "customSpiderChartStyle---自定义蜘蛛🕷🕸图样式",
                "customizeEveryDataLabelSinglelyByDataLabelsFormatter---通过 DataLabels 的 formatter 函数来实现单个数据标签🏷自定义",
                "customXAxisLabelsBeImages---自定义 X轴 labels 为一组图片",
            ],
            /*JS Function For AALegend*/
            [
                "disableLegendClickEventForNormalChart---禁用常规图表 legend 点击事件",
                "disableLegendClickEventForPieChart---禁用饼图 legend 点击事件",
                "customLegendItemClickEvent---自定义图例 legend 的点击事件",
            ],
            /*JS Function For AAChartEvents*/
            [
                "setCrosshairAndTooltipToTheDefaultPositionAfterLoadingChart---图表加载完成后设置 crosshair 和 tooltip 到默认位置",
                "generalDrawingChart---普通绘图",
                "advancedTimeLineChart---高级时间轴绘图",
                "configureBlinkMarkerChart---配置闪烁特效的 marker 图表",
                "configureSpecialStyleMarkerOfSingleDataElementChartWithBlinkEffect---配置闪烁特效的 marker 图表2",
                "configureScatterChartWithBlinkEffect---配置闪烁特效的散点图",
                "automaticallyHideTooltipAfterItIsShown---在浮动提示框显示后自动隐藏",
                "dynamicHeightGridLineAreaChart---动态高度的网格线区域填充图",
                "customizeYAxisPlotLinesLabelBeSpecialStyle---自定义 Y 轴轴线上面的标签文字特殊样式",
                "configureECGStyleChart---配置心电图样式的图表",
                "configureTheSizeOfTheSliceOfDonutAndPieChart---配置环形图和饼图的扇区大小",
                "configurePlotBackgroundClickEvent---配置绘图区的点击事件",
            ],
            /*JS Function For AAChartEvents 2*/
            [
                "addClickEventToXAxisLabelAndAccessData---为 X 轴文字标签添加点击事件并获取到所点击的点的信息",
                "defaultSelectedAPointForLineChart---默认选中折线图的一个点 marker",
              
            ],
            /*JS Function For AAOptions*/
            [
                "customDoubleXAxesChart---自定义双 X 轴图表",
                "disableColumnChartUnselectEventEffectBySeriesPointEventClickFunction---通过 Series 的 Point 的选中事件函数来禁用条形图反选效果",
                "customizeEveryDataLabelSinglelyByDataLabelsFormatter---通过 formatter 来自定义单个 dataLabels 元素",
                "configureColorfulDataLabelsForPieChart---为饼图配置多彩 dataLabels"
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
extension AAOptionsWithJSListVC: UITableViewDelegate, UITableViewDataSource {
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
            /*Custom Tooltip With JavaScript Formatter Function */
            let vc = JSFunctionForAATooltipVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            

        case 1:
            /*JS Function For AAAxis Labels*/
            let vc = JSFunctionForAAAxisVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            /*JS Function For AALegend*/
            let vc = JSFunctionForAALegendVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            /*JS Function For AAChartEventsVC*/
            let vc = JSFunctionForAAChartEventsVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        case 4:
            /*JS Function For AAChartEventsVC2*/
            let vc = JSFunctionForAAChartEventsVC2()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        case 5:
            /*JS Function For AAOptions*/
            let vc = JSFunctionForAAOptionsVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        
        default:
            break
        }
    }
    
}
