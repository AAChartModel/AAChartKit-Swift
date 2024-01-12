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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 *********************************************************************************
 
 */

import UIKit
import AAInfographics

let kCustomTableViewCell = "CustomTableViewCell"

@available(iOS 10.0, macCatalyst 13.1, *)
class MainVC: UIViewController {
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
            "Basic Type Chart | 基础类型图表",
            "Special Type Chart | 特殊类型图表",
            "Custom Style Chart| 一些自定义风格样式图表",
            "Mixed Chart | 混合图形",
            "Pie Chart With Custom Style | 一些自定义风格样式饼图",
        ]
        
        chartTypeTitleArr = [
            /*Basic types chart*/
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
            /*Special types chart*/
            [
                "Polar Column Chart---玫瑰图",
                "Polar Bar Chart---径向条形图",
                "Polar Line Chart---蜘蛛图",
                "Polar Area Chart---雷达图",
                "Step Line Chart---直方折线图",
                "Step Area Chart---直方折线填充图",
                "Pie Chart---扇形图",
                "Bubble Chart---气泡图",
                "Scatter Chart---散点图",
                "Arearange Chart---折线区域范围图",
                "Area Spline range Chart--曲线区域范围图",
                "Columnrange Chart---柱形范围图",
                "Boxplot Chart---箱线图",
                "Waterfall Chart---瀑布图",
                "Pyramid Chart---金字塔图",
                "Funnel Chart---漏斗图",
                "Error Bar Chart---误差图",
                "Gauge Chart---仪表图",
                "Polygon Chart---多边形图"
            ],
            /*Custom chart style by AAChartModel*/
            [
                "Colorful Column Chart---多彩条形图",
                "Colorful Gradient Color Chart---多彩颜色渐变条形图",
                "Discontinuous Data Chart---数值不连续の图表",
                "Mixed Line Chart---虚实线混合折线图",
                "Random Colors Colorful Column Chart---随机颜色の多彩柱形图",
                "Gradient Color Bar Chart---颜色渐变条形图",
                "Stacking polar chart---百分比堆积效果の极地图",
                "Area Chart with minus--带有负数の区域填充图",
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
                "custom Scatter Chart Marker Symbol Content---自定义散点图の标志点内容",
                "custom Line Chart Marker Symbol Content---自定义折线图の标志点内容",
                "Triangle Radar Chart---三角形雷达图",
                "Quadrangle Radar Chart---四角形雷达图",
                "Pentagon Radar Chart---五角形雷达图",
                "Hexagon Radar Chart----六角形雷达图",
                "Draw Line Chart With Points Coordinates----通过点坐标来绘制折线图",
                "custom Special Style DataLabel Of Single Data Element Chart",
                "custom Bar Chart Hover Color and Select Color---自定义条形图手指滑动颜色和单个长条被选中颜色",
                "custom Line Chart Chart Hover And Select Halo Style",
                "custom Spline Chart Marker States Hover Style",
                "customNormalStackingChartDataLabelsContentAndStyle---自定义堆积柱状图 DataLabels の内容及样式",
                "upsideDownPyramidChart---倒立の金字塔图",
                "doubleLayerPieChart---双层嵌套扇形图",
                "doubleLayerDoubleColorsPieChart---双层嵌套双颜色主题扇形图",
                "disableSomeOfLinesMouseTrackingEffect---针对部分数据列关闭鼠标或手指跟踪行为",
                "configureColorfulShadowChart---彩色阴影效果の曲线图",
                "configureColorfulDataLabelsStepLineChart---彩色 DataLabels の直方折线图",
                "configureColorfulGradientColorAndColorfulDataLabelsStepAreaChart---彩色渐变效果且彩色 DataLabels の直方折线填充图",
                "disableSplineChartMarkerHoverEffect---禁用曲线图の手指滑动 marker 点の光圈变化放大の效果",
                "configureMaxAndMinDataLabelsForChart---为图表最大值最小值添加 DataLabels 标记",
                "customVerticalXAxisCategoriesLabelsByHTMLBreakLineTag---通过 HTML 的换行标签来实现图表的 X 轴的 分类文字标签的换行效果",
                "noMoreGroupingAndOverlapEachOtherColumnChart---不分组的相互重叠柱状图📊",
                "noMoreGroupingAndNestedColumnChart---不分组的嵌套柱状图📊",
                "topRoundedCornersStackingColumnChart---顶部为圆角的堆积柱状图📊",
                "freeStyleRoundedCornersStackingColumnChart---各个圆角自由独立设置的堆积柱状图📊",
                "customColumnChartBorderStyleAndStatesHoverColor---自定义柱状图 border 样式及手指掠过图表 series 元素时的柱形颜色",
                
                "customLineChartWithColorfulMarkersAndLines---彩色连接点和连接线的折线图📈",
                "customLineChartWithColorfulMarkersAndLines2---彩色连接点和连接线的多组折线的折线图📈",
                "drawLineChartWithPointsCoordinates---通过点坐标来绘制折线图",
                "configureSpecialStyleColumnForNegativeDataMixedPositiveData---为正负数混合的柱形图自定义特殊样式效果",
                "configureMultiLevelStopsArrGradientColorAreasplineMixedLineChart---多层次半透明渐变效果的曲线填充图混合折线图📈",
                "connectNullsForSingleAASeriesElement---为单个 AASeriesElement 单独设置是否断点重连",
                "lineChartsWithLargeDifferencesInTheNumberOfDataInDifferentSeriesElement---测试有多组数据时, 数据量较大时, 不同组数据量差距较大时的折线图📈",
                "customAreasplineChartWithColorfulGradientColorZones---彩色渐变色区域填充图",

            ],
            /*Mixed Chart*/
            [
                "Arearange Mixed Line---面积范围均线图",
                "Columnrange Mixed Line---柱形范围图混合折线图",
                "Stacking Column Mixed Line---堆积柱形图混合折线图",
                "Dash Style Types Mixed---多种类型曲线混合图",
                "Negative Color Mixed Column Chart---基准线以下异色混合图",
                "scatterMixedLine---散点图混合折线图",
                "Negative Color Mixed Bubble Chart---基准线以下异色气泡图",
                "Polygon Mixed Scatter---多边形混合散点图",
                "Polar Chart Mixed---极地混合图",
                "Column Mixed Scatter---柱形图混合散点图",
                "Pie Mixed Line Mixed Column---扇形折线柱形混合图",
                "Line Chart With Shadow---带有阴影效果の折线图",
                "Negative Color Mixed Areaspline chart---基准线以下异色混合曲线填充图",
                "Aerasplinerange Mixed Columnrange Mixed Line Chart---曲线面积范围混合柱形范围混合折线图",
                "boxplot Mixed Scatter Chart With Jitter---带有抖动的箱线混合散点图",
            ],
            /*Custom chart style by AAChartModel*/
            [
                "pieChart---扇形图",
                "doubleLayerPieChart---双层扇形图",
                "doubleLayerDoubleColorsPieChart---双层双色扇形图",

                "pieChartWithSoftCorners---弱圆角扇形图",
                "doubleLayerPieChartWithSoftCorners---弱圆角双层扇形图",
                "doubleLayerDoubleColorsPieChartWithSoftCorners---弱圆角双层双色扇形图",

                "pieChartWithRoundedCorners---圆角扇形图",
                "doubleLayerPieChartWithRoundedCorners---圆角双层扇形图",
                "doubleLayerDoubleColorsPieChartWithRoundedCorners---圆角双层双色扇形图",
            ]




        ]
        
        chartTypeArr = [
            /*Basic types chart*/
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
            /*Special Types chart*/
            [
                AAChartType.column,
                AAChartType.bar,
                AAChartType.line,
                AAChartType.area,
                AAChartType.spline,
                AAChartType.areaspline,
                AAChartType.pie,
                AAChartType.bubble,
                AAChartType.scatter,
                AAChartType.arearange,
                AAChartType.areasplinerange,
                AAChartType.columnrange,
                AAChartType.boxplot,
                AAChartType.waterfall,
                AAChartType.pyramid,
                AAChartType.funnel,
                AAChartType.errorbar,
                AAChartType.gauge,
                AAChartType.polygon,
            ],
            [//Empty Array,just for holding place
            ],
            /*Mixed Chart*/
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
                "PieMixedLineMixedColumn",
                "LineChartWithShadow",
                "NegativeColorMixedAreasplineChart",
                "AerasplinerangeMixedColumnrangeMixedLineChart",
                "boxplotMixedScatterChartWithJitter"
            ],
            /*Custom chart style by AAChartModel*/
            [
                "pieChart",
                "doubleLayerPieChart",
                "doubleLayerDoubleColorsPieChart",

                "pieChartWithSoftCorners",
                "doubleLayerPieChartWithSoftCorners",
                "doubleLayerDoubleColorsPieChartWithSoftCorners",

                "pieChartWithRoundedCorners",
                "doubleLayerPieChartWithRoundedCorners",
                "doubleLayerDoubleColorsPieChartWithRoundedCorners",
            ]
          
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
extension MainVC: UITableViewDelegate, UITableViewDataSource {
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
            /*Basic Type Charts*/
            let vc = BasicChartVC()
            vc.chartType = chartTypeArr[indexPath.section][indexPath.row] as? AAChartType
            if indexPath.row == 4 || indexPath.row == 5 {
                vc.step = true
            }
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            /*Special Type Charts*/
            let vc = SpecialChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 2:
            /*Mixed Type Charts*/
            let vc = CustomStyleChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeTitleArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
        case 3:
            /*Mixed Type Charts*/
            let vc = MixedChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)

        case 4:
            /*Custom chart style by AAChartModel*/
            let vc = CustomStyleForPieChartVC()
            vc.selectedIndex = indexPath.row
            vc.navigationItemTitleArr = chartTypeArr[indexPath.section]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        
            
        default:
            break
        }
    }
    
}
