//
//  JSFunctionForAAAxisVC2.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/4/1.
//  Copyright © 2025 An An. All rights reserved.
//

import UIKit
import AAInfographics

class JSFunctionForAAAxisVC2: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func chartConfigurationWithSelectedIndex(_ selectedIndex: Int) -> Any? {
        switch (selectedIndex) {
        case 0: return JSFunctionForAAAxisComposer2.customWidthForXAxisLabels()//自定义X轴文字标签的宽度
        case 1: return JSFunctionForAAAxisComposer2.customSimpleXAxisLabelsBeImages()//自定义简单的X轴文字标签为图片

        default:
            return nil
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
