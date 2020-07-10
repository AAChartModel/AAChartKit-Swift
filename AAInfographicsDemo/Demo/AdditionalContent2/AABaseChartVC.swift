//
//  AABaseChartVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2020/7/10.
//  Copyright © 2020 An An. All rights reserved.
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
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 *********************************************************************************
 
 */

import UIKit

class AABaseChartVC: UIViewController {
    var navigationItemTitleArr: [Any]?
    var selectedIndex: Int = 0
    var aaChartView: AAChartView?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        setupTitle()
        setupNextTypeChartButton()
        setupChartView()
    }
    
    func setupTitle() {
        let chartType = self.navigationItemTitleArr?[self.selectedIndex]
        
        self.title = "\(chartType ?? "") Chart"
    }
    
    func setupNextTypeChartButton() {
        let barItem = UIBarButtonItem.init(title: "Next Chart",
                                           style: .plain,
                                           target: self,
                                           action: #selector(monitorTap))
        self.navigationItem.rightBarButtonItem = barItem
    }
    
    @objc func monitorTap() {
        if (self.selectedIndex == self.navigationItemTitleArr!.count - 1) {
            self.title = "❗️This is the last chart❗️"
         } else {
             self.selectedIndex = self.selectedIndex + 1;
            let chartType = self.navigationItemTitleArr?[self.selectedIndex]
            if chartType is String {
                self.title = chartType as? String
            } else if chartType is AAChartType {
                let originalTitle = chartType as! AAChartType
                self.title = originalTitle.rawValue
            }
            self.refreshChartWithChartConfiguration()
         }
    }
    
    private func setupChartView() {
        aaChartView = AAChartView()
        aaChartView!.scrollEnabled = false
        aaChartView!.aa_adaptiveScreenRotation()
        view.addSubview(aaChartView!)
        
        aaChartView?.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints(configureTheConstraintArray(childView: aaChartView!,
                                                             fatherView: self.view))
        
        drawChartWithChartConfiguration()
    }
      
      private func configureTheConstraintArray(childView: UIView, fatherView: UIView) -> [NSLayoutConstraint] {
          return [NSLayoutConstraint(item: childView,
                                     attribute: .left,
                                     relatedBy: .equal,
                                     toItem: fatherView,
                                     attribute: .left,
                                     multiplier: 1,
                                     constant: 0),
                  NSLayoutConstraint(item: childView,
                                     attribute: .right,
                                     relatedBy: .equal,
                                     toItem: fatherView,
                                     attribute: .right,
                                     multiplier: 1,
                                     constant: 0),
                  NSLayoutConstraint(item: childView,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: fatherView,
                                     attribute: .top,
                                     multiplier: 1,
                                     constant: 0),
                  NSLayoutConstraint(item: childView,
                                     attribute: .bottom,
                                     relatedBy: .equal,
                                     toItem: fatherView,
                                     attribute: .bottom,
                                     multiplier: 1,
                                     constant: 0)]
      }
      
    
    func drawChartWithChartConfiguration() {
        var chartConfiguration =  chartConfigurationWithSelectedIndex(self.selectedIndex)
        if chartConfiguration == nil {
            let selectedChartType = self.navigationItemTitleArr?[self.selectedIndex]
            chartConfiguration = chartConfigurationWithSelectedChartType(selectedChartType as! AAChartType)
        }
        if (chartConfiguration is AAChartModel) {
            let aaChartModel = chartConfiguration as! AAChartModel
            aaChartModel.touchEventEnabled = true;
            self.aaChartView?.aa_drawChartWithChartModel(aaChartModel)
        } else if (chartConfiguration is AAOptions) {
            let aaOptions = chartConfiguration as! AAOptions;
            aaOptions.touchEventEnabled = true;
            self.aaChartView?.aa_drawChartWithChartOptions(aaOptions)
        }
    }
    
    func refreshChartWithChartConfiguration() {
        var chartConfiguration =  chartConfigurationWithSelectedIndex(self.selectedIndex)
        if chartConfiguration == nil {
            let selectedChartType = self.navigationItemTitleArr?[self.selectedIndex]
            chartConfiguration = chartConfigurationWithSelectedChartType(selectedChartType as! AAChartType)
        }
        if (chartConfiguration is AAChartModel) {
            let aaChartModel = chartConfiguration as! AAChartModel
            aaChartModel.touchEventEnabled = true;
            self.aaChartView?.aa_refreshChartWholeContentWithChartModel(aaChartModel)
        } else if (chartConfiguration is AAOptions) {
            let aaOptions = chartConfiguration as! AAOptions;
            aaOptions.touchEventEnabled = true;
            self.aaChartView?.aa_refreshChartWholeContentWithChartOptions(aaOptions)
        }
    }
    
    func chartConfigurationWithSelectedIndex(_ selectedIndex: Int) -> Any? {
        return nil
    }
    
    func chartConfigurationWithSelectedChartType(_ selectedChartType: AAChartType) -> Any? {
        return nil
    }

}
