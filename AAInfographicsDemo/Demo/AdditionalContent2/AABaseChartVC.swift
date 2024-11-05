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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 *********************************************************************************
 
 */

import UIKit
import AAInfographics

@available(iOS 10.0, macCatalyst 13.1, *)
class AABaseChartVC: UIViewController {
    var navigationItemTitleArr: [Any]?
    var selectedIndex: Int = 0
    var aaChartView: AAChartView?
    var topConstraint: NSLayoutConstraint?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        adaptiveScreenRotation()
        setupTitle()
        setupNextTypeChartButton()
        setupChartView()
    }
    
    func setupTitle() {
        let chartType = navigationItemTitleArr?[selectedIndex]
        
        title = "\(chartType ?? "") Chart"
    }
    
    func setupNextTypeChartButton() {
        let barItem = UIBarButtonItem.init(title: "➷",
                                           style: .plain,
                                           target: self,
                                           action: #selector(monitorTap))

        navigationItem.rightBarButtonItem = barItem
        barItem.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28, weight: .bold)
        ], for: .normal)
 
    }
    
    @objc func monitorTap() {
        if (selectedIndex == navigationItemTitleArr!.count - 1) {
            title = "❗️This is the last chart❗️"
         } else {
             selectedIndex = selectedIndex + 1
            let chartType = navigationItemTitleArr?[selectedIndex]
            if chartType is String {
                title = chartType as? String
            } else if chartType is AAChartType {
                let originalTitle = chartType as! AAChartType
                title = originalTitle.rawValue
            }
            refreshChartWithChartConfiguration()
         }
    }
    
    private func setupChartView() {
        aaChartView = AAChartView()
        aaChartView!.isScrollEnabled = false
        //设置 aaChartView 可以调试
        if #available(iOS 16.4, *) {
            aaChartView!.isInspectable = true
        } else {
            // Fallback on earlier versions
        }
        aaChartView!.delegate = self as AAChartViewDelegate
        aaChartView!.aa_adaptiveScreenRotation()
        view.addSubview(aaChartView!)
        
        aaChartView?.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            aaChartView?.scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }
        view.addConstraints(configureTheConstraintArray(childView: aaChartView!,
                                                             fatherView: view))
        
        drawChartWithChartConfiguration()
    }
      
    private func configureTheConstraintArray(childView: UIView, fatherView: UIView) -> [NSLayoutConstraint] {
        let hairPhone = isHairPhoneScreen()

        var topConstraintConstant = 0
          // 如果statusBarFrame为CGRectZero,说明状态栏是隐藏的
        let statusBarFrame = UIApplication.shared.statusBarFrame
          let istatusHiden = (statusBarFrame.size.height == 0)

          if (hairPhone == true) {
              topConstraintConstant = 88
              if (istatusHiden == true) {
                  topConstraintConstant -= 44
              }
          } else {
              topConstraintConstant = 64
              if (istatusHiden == true) {
                  topConstraintConstant -= 20
              }
          }
        
        topConstraint = NSLayoutConstraint(item: childView,
                                           attribute: .top,
                                           relatedBy: .equal,
                                           toItem: fatherView,
                                           attribute: .top,
                                           multiplier: 1,
                                           constant: CGFloat(topConstraintConstant))
                
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
                topConstraint!,
                NSLayoutConstraint(item: childView,
                                   attribute: .bottom,
                                   relatedBy: .equal,
                                   toItem: fatherView,
                                   attribute: .bottom,
                                   multiplier: 1,
                                   constant: 0)]
    }
    
    func isHairPhoneScreen() -> Bool {
        guard #available(iOS 11.0, *) else {
            return false
        }
        
        let isX = UIApplication.shared.windows[0].safeAreaInsets.bottom > 0
        print("是不是刘海屏呢--->\(isX)")
        return isX
    }
    
    public func adaptiveScreenRotation() {
          NotificationCenter.default.addObserver(
              forName: UIDevice.orientationDidChangeNotification,
              object: nil,
              queue: nil) { [weak self] _ in
                  self?.handleDeviceOrientationChangeEvent()
          }
      }
      
    //屏幕旋转后动态调整 autolayout 布局参数
    private func handleDeviceOrientationChangeEvent() {
        let orientation = UIApplication.shared.statusBarOrientation
        
        if (   orientation == UIInterfaceOrientation.portrait
            || orientation == UIInterfaceOrientation.portraitUpsideDown) {
            let hairPhone = isHairPhoneScreen()
            if (hairPhone == true) {
                topConstraint!.constant = 88
            } else {
                topConstraint!.constant = 64
            }
        } else {
            topConstraint!.constant = 44
        }
        
        view.layoutSubviews()
        view.layoutIfNeeded()
    }

    
    func drawChartWithChartConfiguration() {
        var chartConfiguration =  chartConfigurationWithSelectedIndex(selectedIndex)
        if chartConfiguration == nil {
            let selectedChartType = navigationItemTitleArr?[selectedIndex]
            if selectedChartType != nil && ((selectedChartType as? AAChartType) != nil) {
                chartConfiguration = chartConfigurationWithSelectedChartType(selectedChartType as! AAChartType)
            }
        }
        if chartConfiguration == nil {
            let selectedChartTypeStr = navigationItemTitleArr?[selectedIndex]
            chartConfiguration = chartConfigurationWithSelectedChartTypeString(selectedChartTypeStr as! String)
        }
        if (chartConfiguration is AAChartModel) {
            let aaChartModel = chartConfiguration as! AAChartModel
            aaChartView?.aa_drawChartWithChartModel(aaChartModel)
        } else if (chartConfiguration is AAOptions) {
            let aaOptions = chartConfiguration as! AAOptions
//            aaOptions.touchEventEnabled = true
            aaChartView?.aa_drawChartWithChartOptions(aaOptions)
        }
    }
    
    func refreshChartWithChartConfiguration() {
        var chartConfiguration =  chartConfigurationWithSelectedIndex(selectedIndex)
        if chartConfiguration == nil {
            let selectedChartType = navigationItemTitleArr?[selectedIndex]
            if selectedChartType != nil && ((selectedChartType as? AAChartType) != nil) {
                chartConfiguration = chartConfigurationWithSelectedChartType(selectedChartType as! AAChartType)
            }
        }
        if chartConfiguration == nil {
            let selectedChartTypeStr = navigationItemTitleArr?[selectedIndex]
            chartConfiguration = chartConfigurationWithSelectedChartTypeString(selectedChartTypeStr as! String)
        }
        if (chartConfiguration is AAChartModel) {
            let aaChartModel = chartConfiguration as! AAChartModel
            aaChartView?.aa_refreshChartWholeContentWithChartModel(aaChartModel)
        } else if (chartConfiguration is AAOptions) {
            let aaOptions = chartConfiguration as! AAOptions
//            aaOptions.touchEventEnabled = true
            aaOptions.credits?
                .enabled(true)
                .text("https://github.com/AAChartModel/AAChartKit")
                .href("https://github.com/AAChartModel/AAChartKit")
                .style(AAStyle()
                    .color(AAColor.red)
                    .fontSize(9))
            
//            aaOptions.defaultOptions = AALang()
//                .noData("暂无数据")
//                .resetZoom("重置缩放比例")
            /**
             public class AAZooming: AAObject {
                 public var key: String?
                 public var mouseWheel: AAMouseWheel?
                 public var pinchType: String?
                 public var resetButton: AAResetButton?
                 public var singleTouch: Bool?
                 public var type: String?
             */
            /**
             chart: {
                     zooming: {
                         type: 'x',
                         resetButton: {
                             theme: {
                                 fill: 'yellow',
                                 stroke: 'green',
                                 r: 3,
                                 states: {
                                     hover: {
                                         fill: '#ff0000',
                                         style: {
                                             color: 'white'
                                         }
                                     }
                                 }
                             }
                         }
                     }
                 },
             */
            aaOptions.chart?.zooming = AAZooming()
                .resetButton(AAResetButton()
                    .theme([
                        "fill": "yellow",
                        "stroke": "green",
                        "r": 3,
                        "states": [
                            "hover": [
                                "fill": "#ff0000",
                                "style": [
                                    "color": "white"
                                ]
                            ]
                        ]
                    ]))
                .singleTouch(true)
                .type(.xy)
                    
                
                    
            
//            aaChartView?.isScrollEnabled = true
            aaChartView?.aa_refreshChartWholeContentWithChartOptions(aaOptions)
        }
    }
    
    func chartConfigurationWithSelectedIndex(_ selectedIndex: Int) -> Any? {
        return nil
    }
    
    func chartConfigurationWithSelectedChartType(_ selectedChartType: AAChartType) -> Any? {
        return nil
    }
    
    func chartConfigurationWithSelectedChartTypeString(_ selectedChartTypeStr: String) -> Any? {
        return nil
    }

}

@available(macCatalyst 13.1, *)
extension AABaseChartVC: AAChartViewDelegate {
    open func aaChartViewDidFinishLoad(_ aaChartView: AAChartView) {
       print("🚀🚀🚀, AAChartView Did Finished Load!!!")
    }
    
    open func aaChartView(_ aaChartView: AAChartView, clickEventMessage: AAClickEventMessageModel) {
        print(
            """

            clicked point series element name: \(clickEventMessage.name ?? "")
            🖱🖱🖱WARNING!!!!!!!!!!!!!!!!!!!! Click Event Message !!!!!!!!!!!!!!!!!!!! WARNING🖱🖱🖱
            ------------------------------------------------------------------------------------------
            user finger moved over!!!,get the move over event message: {
                category : \(clickEventMessage.category ?? "")
                index : \(clickEventMessage.index ?? 0)
                name : \(clickEventMessage.name ?? "")
                offset : \(clickEventMessage.offset ?? [String: Any]())
                x : \(clickEventMessage.x ?? 0.0)
                y : \(clickEventMessage.y ?? 0.0)
            }
            ------------------------------------------------------------------------------------------

            
            """
        )
    }

    open func aaChartView(_ aaChartView: AAChartView, moveOverEventMessage: AAMoveOverEventMessageModel) {
        print(
            """
            
            selected point series element name: \(moveOverEventMessage.name ?? "")
            👌👌👌👌👌WARNING!!!!!!!!!!!!!!!!!! Touch Event Message !!!!!!!!!!!!!!!!! WARNING👌👌👌👌👌
            | ------------------------------------------------------------------------------------------
            | user finger moved over!!!,get the move over event message: {
            |     category : \(moveOverEventMessage.category ?? "")
            |     index : \(moveOverEventMessage.index ?? 0)
            |     name : \(moveOverEventMessage.name ?? "")
            |     offset : \(moveOverEventMessage.offset ?? [String: Any]())
            |     x : \(moveOverEventMessage.x ?? 0.0)
            |     y : \(moveOverEventMessage.y ?? 0.0)
            | }
            | ------------------------------------------------------------------------------------------
            
            
            """
        )
    }
}

