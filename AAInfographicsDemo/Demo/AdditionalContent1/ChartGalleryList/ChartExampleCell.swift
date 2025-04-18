import UIKit
import AAInfographics

class ChartExampleCell: UITableViewCell {
   // In ChartExampleCell.swift
   lazy var aaChartView: AAChartView = {
       let chartView = AAChartView()
       chartView.translatesAutoresizingMaskIntoConstraints = false
       // Design effects: rounded corners and shadow
       chartView.layer.cornerRadius = 8
       chartView.layer.shadowColor = UIColor.black.cgColor
       chartView.layer.shadowOpacity = 0.2
       chartView.layer.shadowOffset = CGSize(width: 0, height: 1)
       chartView.layer.shadowRadius = 4
       chartView.layer.masksToBounds = false
       return chartView
   }()

    //设置UI
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // 将 setupUI 设为 private
    private func setupUI() {
        // 添加 AAChartView 到 cell 的 contentView
        contentView.addSubview(aaChartView)

        // 设置约束
        NSLayoutConstraint.activate([
            aaChartView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            aaChartView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            aaChartView.topAnchor.constraint(equalTo: contentView.topAnchor),
            aaChartView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
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
        aaChartView.aa_drawChartWithChartOptions(options)
        completion?(aaChartView)
    }

    // 重写 prepareForReuse 方法以在单元格重用时清理
    override func prepareForReuse() {
        super.prepareForReuse()
        // 一个更安全的做法可能是加载一个空的 AAOptions 或默认状态
        // aaChartView.aa_drawChartWithChartOptions(AAOptions()) // 示例：绘制空图表
    }
}
