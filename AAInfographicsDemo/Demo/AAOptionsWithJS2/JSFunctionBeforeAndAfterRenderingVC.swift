//
//  JSFunctionBeforeAndAfterRenderingVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/2/10.
//  Copyright © 2025 An An. All rights reserved.
//

import UIKit
import AAInfographics

class JSFunctionBeforeAndAfterRenderingVC: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func chartConfigurationWithSelectedIndex(_ selectedIndex: Int) -> Any? {
        switch (selectedIndex) {
        case 0: return JSFunctionBeforeAndAfterRenderingComposer.clockChart()
        case 1: return JSFunctionBeforeAndAfterRenderingComposer3.synchronizedChart()
        case 2: return JSFunctionBeforeAndAfterRenderingComposer4.sparklineChart()
            
        default:
            return nil
        }
    }

}
