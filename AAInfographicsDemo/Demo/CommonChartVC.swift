//
//  ViewController.swift
//  AAChartKit-Swift
//
//  Created by An An  on 17/4/18.
//  Copyright © 2017年 An An . All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit-Swift ***--- source code
//
//

import UIKit

class CommonChartVC: UIViewController,UIWebViewDelegate {
    open var chartType:String?
    open var chartModel: AAChartModel?
    open var aaChartView: AAChartView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.configureTheSwith()
        self.configureTheSegmentControl()
        
        aaChartView = AAChartView()
        aaChartView?.frame = CGRect(x:0,y:60,width:self.view.frame.size.width,height:self.view.frame.size.height-220)
        aaChartView?.contentHeight = self.view.frame.size.height-220//AAChartViewd的内容高度
        self.view.addSubview(aaChartView!)
        
        chartModel = AAChartModel.init()
            .chartTypeSet(AAChartType(rawValue: self.chartType!)!)//图形类型
            .pointHollowSet(false)//设置折线连接点是否为空心
            .animationTypeSet(AAChartAnimationType.EaseInBounce)//图形渲染动画类型
            .titleSet("都市天气")//图形标题
            .subtitleSet("2020年08月08日")//图形副标题
            .pointHollowSet(true)//折线连接点是否为空心
            .dataLabelEnabledSet(false)//是否显示数字
            .markerRadiusSet(5)//折线连接点半径长度,为0时相当于没有折线连接点
            .seriesSet([
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
                ]]);
        
        aaChartView?.aa_drawChartWithChartModel(chartModel!)
        
    }
    
    func configureTheSegmentControl() {
        
        let  segmentedArray = [["常规","堆叠","百分比堆叠"],
                               ["波点","方块","钻石","正三角","倒三角"]];
        let typeLabelNameArr = ["堆叠类型选择","折线连接点形状选择"];
        
        for i in 0..<5          //等同代码 fot( int i = 0 ; i < 5 ; i++ )
        {
            print(i)
        }
        
        for  i in 0..<segmentedArray.count {
            
            let segment=UISegmentedControl.init(items: segmentedArray[i])
            segment.frame = CGRect(x: 20, y: 40.0*CGFloat(i) + (self.view.frame.size.height-145), width: self.view.frame.size.width-40, height: 20)
            segment.tag = i;
            segment.tintColor = UIColor.purple
            segment.selectedSegmentIndex = 0
            segment.addTarget(self, action:#selector(segmentDidSelected(segmentedControl:)), for:.valueChanged)
            self.view.addSubview(segment)
            
            let subLabel = UILabel()
            subLabel.font = UIFont(name: "EuphemiaUCAS", size: 12.0)
            subLabel.frame = CGRect(x: 20, y:40*CGFloat(i)+(self.view.frame.size.height-165), width: self.view.frame.size.width-40, height: 20)
            subLabel.numberOfLines = 0
            subLabel.text = typeLabelNameArr[i]
            subLabel.backgroundColor = UIColor.white
            self.view .addSubview(subLabel)
            
        }
        
    }
    
    func segmentDidSelected(segmentedControl:UISegmentedControl){
        
        switch segmentedControl.tag {
        case 0:
            let stackingArr = [AAChartStackingType.False,
                               AAChartStackingType.Normal,
                               AAChartStackingType.Percent]
            self.chartModel?.stacking = stackingArr[segmentedControl.selectedSegmentIndex].rawValue
            break
            
        case 1:
            let symbolArr = [AAChartSymbolType.Circle,
                             AAChartSymbolType.Square,
                             AAChartSymbolType.Diamond,
                             AAChartSymbolType.Triangle,
                             AAChartSymbolType.Triangle_down]
            self.chartModel?.symbol = symbolArr[segmentedControl.selectedSegmentIndex].rawValue
            break
            
        default:
            break
        }
        aaChartView?.aa_refreshChartWithChartModel(chartModel!)
    }
    
    func configureTheSwith() {
        let nameArr = ["x轴翻转","y轴翻转","x 轴直立","辐射化图形","隐藏连接点","显示数字"]
        
        let switchWidth = (self.view.frame.size.width-40)/6
        
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
            subLabel.text = nameArr[i]
            subLabel.backgroundColor = UIColor.white
            self.view .addSubview(subLabel)
        }
        
        
    }
    
    func switchDidChange(switchView:UISwitch){
        
        switch switchView.tag {
        case 0:
            self.chartModel?.xAxisReversed = switchView.isOn
            break
        case 1:
            self.chartModel?.yAxisReversed = switchView.isOn
            break
        case 2:
            self.chartModel?.inverted = switchView.isOn
            break
        case 3:
            self.chartModel?.polar = switchView.isOn
            break
        case 4:
            self.chartModel?.markerRadius = switchView.isOn ? 0:5
            break
        case 5:
            self.chartModel?.dataLabelEnabled = switchView.isOn
            break
        default:
            break
        }
        
        aaChartView?.aa_refreshChartWithChartModel(chartModel!)
    }
    
    
    
}

