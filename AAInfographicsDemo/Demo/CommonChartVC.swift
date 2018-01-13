//
//  ViewController.swift
//  AAChartKit-Swift
//
//  Created by An An  on 17/4/18.
//  Copyright © 2017年 An An . All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit-Swift ***--- source code
//
//

/*
 
 *********************************************************************************
 *
 * ❀❀❀   WARM TIPS!!!   ❀❀❀
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

class CommonChartVC: UIViewController,UIWebViewDelegate {
    open var chartType:AAChartType?
    open var aaChartModel: AAChartModel?
    open var aaChartView: AAChartView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.title = self.chartType.map { $0.rawValue }
        self.configureTheSwith()
        self.configureTheSegmentControl()
        
        aaChartView = AAChartView()
        let chartViewWidth = self.view.frame.size.width
        let chartViewHeight = self.view.frame.size.height-220
        aaChartView?.frame = CGRect(x:0,y:60,width:chartViewWidth,height:chartViewHeight)
        ///AAChartViewd的内容高度(内容高度默认和 AAChartView 等高)
        //aaChartView?.contentHeight = chartViewHeight
        self.view.addSubview(aaChartView!)
        aaChartView?.scrollEnabled = false//禁止图表内容滚动
        
        aaChartModel = AAChartModel.init()
            .chartType(self.chartType!)//图形类型
            .animationType(AAChartAnimationType.Bounce)//图形渲染动画类型为"bounce"
            .backgroundColor("#4b2b7f")//图表背景色
            .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])//主题颜色数组
            .title("")//图形标题
            .subtitle("")//图形副标题
            .dataLabelEnabled(false)//是否显示数字
            .tooltipValueSuffix("℃")//浮动提示框单位后缀
            //            .xAxisVisible(false)// X 轴是否可见
            //            .yAxisVisible(false)// Y 轴是否可见
            .series([
                [
                    "name": "Tokyo",
                    "data": [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
                ], [
                    "name": "New York",
                    "data": [0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
                ], [
                    "name": "Berlin",
                    "data": [0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
                ], [
                    "name": "London",
                    "data": [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
                ]])
        
        
        if self.chartType == AAChartType.Column
            || self.chartType == AAChartType.Bar {
            aaChartModel = aaChartModel?
                .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun","Jul", "Aug", "Sep", "Oct", "Nov", "Dec"])
                .legendEnabled(true)
            //                .colorsTheme(["#EA007B", "#49C1B6", "#1E90FF", "#F78320", "#068E81",])
        } else if self.chartType == AAChartType.Area
            || self.chartType == AAChartType.AreaSpline {
            aaChartModel = aaChartModel?
                .symbolStyle(AAChartSymbolStyleType(rawValue: AAChartSymbolStyleType.InnerBlank.rawValue)!)//设置折线连接点样式为:内部白色
                .gradientColorEnable(true)
                .legendEnabled(true)
                .markerRadius(5)
            //            aaChartModel?.animationType = AAChartAnimationType.EaseFrom.rawValue //设置图表渲染动画类型为 EaseFrom
            
        } else if self.chartType == AAChartType.Line
            || self.chartType == AAChartType.Spline {
            aaChartModel = aaChartModel?
                .symbolStyle(AAChartSymbolStyleType(rawValue: AAChartSymbolStyleType.BorderBlank.rawValue)!)//设置折线连接点样式为:边缘白色
                .markerRadius(6)
            //            aaChartModel?.animationType = AAChartAnimationType.SwingFromTo.rawValue //设置图表渲染动画类型为 SwingFromTo
        }
        
        aaChartView?.aa_drawChartWithChartModel(aaChartModel!)
        
    }
    
    func configureTheSegmentControl() {
        var segmentedNamesArray:NSArray
        var typeLabelNameArr:NSArray
        
        if self.chartType == AAChartType.Column
            || self.chartType == AAChartType.Bar {
            segmentedNamesArray = [["No stacking","Normal stacking","Percent stacking"],
                                   ["Square corners","Rounded corners","Wedge"]
            ];
            typeLabelNameArr = ["Stacking type selection","Corners Style type selection"];
        } else {
            segmentedNamesArray = [["No stacking","Normal stacking","Percent stacking"],
                                   ["Circle","Square","Diamond","Triangle","Triangle-down"]
            ];
            typeLabelNameArr = ["Stacking type selection","Chart symbol type selection"];
        }
        
        for  i in 0..<segmentedNamesArray.count {
            let segment = UISegmentedControl.init(items: segmentedNamesArray[i] as? [Any])
            segment.frame = CGRect(x: 20, y: 40.0*CGFloat(i) + (self.view.frame.size.height-145), width: self.view.frame.size.width-40, height: 20)
            segment.tag = i;
            segment.tintColor = UIColor.purple
            segment.selectedSegmentIndex = 0
            segment.addTarget(self, action:#selector(segmentDidSelected(segmentedControl:)), for:.valueChanged)
            self.view.addSubview(segment)
            
            let subLabel = UILabel()
            subLabel.font = UIFont(name: "EuphemiaUCAS", size: 12.0)
            subLabel.frame = CGRect(x: 20, y: 40*CGFloat(i)+(self.view.frame.size.height-165), width: self.view.frame.size.width-40, height: 20)
            subLabel.numberOfLines = 0
            subLabel.text = typeLabelNameArr[i] as? String
            subLabel.backgroundColor = UIColor.white
            self.view.addSubview(subLabel)
        }
    }
    
    func segmentDidSelected(segmentedControl:UISegmentedControl) {
        
        switch segmentedControl.tag {
        case 0:
            let stackingArr = [AAChartStackingType.False,
                               AAChartStackingType.Normal,
                               AAChartStackingType.Percent]
            aaChartModel = aaChartModel?.stacking(AAChartStackingType(rawValue: stackingArr[segmentedControl.selectedSegmentIndex].rawValue)!)
            break
            
        case 1:
            if self.chartType == AAChartType.Column || self.chartType == AAChartType.Bar {
                let borderRadiusArr = [0,10,100]
                aaChartModel = aaChartModel?.borderRadius(borderRadiusArr[segmentedControl.selectedSegmentIndex])
            } else {
                let symbolArr = [AAChartSymbolType.Circle,
                                 AAChartSymbolType.Square,
                                 AAChartSymbolType.Diamond,
                                 AAChartSymbolType.Triangle,
                                 AAChartSymbolType.Triangle_down]
                aaChartModel = aaChartModel?.symbol(AAChartSymbolType(rawValue: symbolArr[segmentedControl.selectedSegmentIndex].rawValue)!)
            }
            break
            
        default:
            break
        }
        aaChartView?.aa_refreshChartWholeContentWithChartModel(aaChartModel!)
    }
    
    func configureTheSwith() {
        var nameArr:NSArray
        var switchWidth:CGFloat
        
        if self.chartType == AAChartType.Column || self.chartType == AAChartType.Bar {
            nameArr = ["xAxisReversed","yAxisReversed","xAxisInverted","Polarization","DataLabelShow",];
            switchWidth = (self.view.frame.size.width-40)/5
        } else {
            nameArr = ["xAxisReversed","yAxisReversed","xAxisInverted","Polarization","DataShow","HideMarker"];
            switchWidth = (self.view.frame.size.width-40)/6
        }
        
        for  i in 0..<nameArr.count {
            let uiswitch = UISwitch()
            uiswitch.frame = CGRect(x: switchWidth*CGFloat(i)+20, y: self.view.frame.size.height-70, width: switchWidth, height: 20)
            uiswitch.isOn = false
            uiswitch.tag = i;
            uiswitch.onTintColor = UIColor.red
            uiswitch.addTarget(self, action: #selector(switchDidChange(switchView:)), for:.valueChanged)
            self.view.addSubview(uiswitch)
            
            let subLabel = UILabel()
            subLabel.font = UIFont(name: "EuphemiaUCAS", size: 10.0)
            subLabel.frame = CGRect(x: switchWidth*CGFloat(i)+20, y:self.view.frame.size.height-35, width:  switchWidth, height: 35)
            subLabel.numberOfLines = 0
            subLabel.text = nameArr[i] as? String
            subLabel.backgroundColor = UIColor.white
            self.view .addSubview(subLabel)
        }
    }
    
    func switchDidChange(switchView:UISwitch) {
        
        switch switchView.tag {
        case 0:
            aaChartModel = aaChartModel?.xAxisReversed(switchView.isOn)
            break
        case 1:
            aaChartModel = aaChartModel?.yAxisReversed(switchView.isOn)
            break
        case 2:
            aaChartModel = aaChartModel?.inverted(switchView.isOn)
            break
        case 3:
            aaChartModel = aaChartModel?.polar(switchView.isOn)
            break
        case 4:
            aaChartModel = aaChartModel?.dataLabelEnabled(switchView.isOn)
            break
        case 5:
            aaChartModel = aaChartModel?.markerRadius(switchView.isOn ? 0:5)//折线连接点半径长度,为0时相当于没有折线连接点
            break
        default:
            break
        }
        
        aaChartView?.aa_refreshChartWholeContentWithChartModel(aaChartModel!)
    }
    
    
    
}

