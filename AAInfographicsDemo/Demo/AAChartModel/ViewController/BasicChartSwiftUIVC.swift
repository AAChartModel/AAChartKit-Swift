//
//  BasicChartSwiftUIVC.swift
//  AAInfographicsDemo
//
//  Created by Kiro on 2025/10/30.
//  Copyright © 2025 An An. All rights reserved.
//

import SwiftUI
import UIKit
import AAInfographics

/// A UIViewController wrapper for the SwiftUI BasicChartView
/// This allows the SwiftUI view to be used in UIKit navigation flows
@available(iOS 14.0, macCatalyst 13.1, *)
class BasicChartSwiftUIVC: UIHostingController<BasicChartView> {
    
    public var chartType: AAChartType!
    public var step: Bool?
    
    init() {
        // Initialize with a placeholder view
        super.init(rootView: BasicChartView(chartType: .column))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Update the root view with the actual chartType and step
        rootView = BasicChartView(chartType: chartType, step: step)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = UIColor(red: 0x22/255, green: 0x32/255, blue: 0x4c/255, alpha: 1.0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.barTintColor = .white
    }
}
