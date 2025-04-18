//
//  ChartSampleTableViewCell.swift
//  AAInfographics-ProDemo
//
//  Created by AnAn on 2025/4/18.
//

import UIKit
import AAInfographics

class ChartSampleTableViewCell: UITableViewCell {
    @IBOutlet weak var aaChartView: AAChartView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Public Methods
    /// Set chart options
    /// - Parameter options: AAOptions object
    /// - Parameter completion: Completion handler
    /// - Returns: Void
    /// - Note: This method sets the chart options and updates the chart view.
    /// - Note: It also handles the completion handler for the chart view.
    /// - Note: The method is marked as public to allow access from outside the class.
    /// - Note: The method returns Void.
    public func setChartOptions(_ options: AAOptions, completion: ((AAChartView) -> Void)? = nil) {
        // Add guard let to safely unwrap aaChartView
        guard let chartView = aaChartView else {
            print("❌ Error: aaChartView is nil in ChartSampleTableViewCell. Check IBOutlet connection in XIB/Storyboard.")
            return // Exit the function if aaChartView is nil
        }
        
        chartView.aa_drawChartWithChartOptions(options)
        if let completion = completion {
            completion(chartView)
        }
    }
    
}
