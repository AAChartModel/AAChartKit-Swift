//
//  TripleChartsLinkedWorkVC2.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/11/22.
//  Copyright © 2024 An An. All rights reserved.
//


class TripleChartsLinkedWorkVC2: AABaseChartVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    override func chartConfigurationWithSelectedChartTypeString(_ selectedChartTypeStr: String) -> Any? {
        return JSFunctionBeforeAndAfterRenderingComposer3.synchronizedChart()
    }

}
