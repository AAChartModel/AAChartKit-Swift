//
//  OfficialChartSampleVC.swift
//  AAInfographics-ProDemo
//
//  Created by AnAn on 2024/12/6.
//

import UIKit
import SwiftUI

@available(macCatalyst 14.0, *)
class OfficialChartSampleVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // 将 SwiftUI 视图嵌入到当前 UIViewController
        let swiftUIView = GridView()
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        // 添加为子控制器
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        // 设置布局
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        hostingController.didMove(toParent: self)
    }
}
