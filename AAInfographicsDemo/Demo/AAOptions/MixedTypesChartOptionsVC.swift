//
//  MixedTypesChartOptionsVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/4/21.
//  Copyright © 2025 An An. All rights reserved.
//

import UIKit
import AAInfographics

class MixedTypesChartOptionsVC: AABaseChartVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func chartConfigurationWithSelectedIndex(_ selectedIndex: Int) -> Any? {
        switch selectedIndex {
        case 0: return MixedTypesChartOptionsComposer.columnrangeAndScatterMixedTypesChart()

            
            
        default:
            return AAOptions()
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
