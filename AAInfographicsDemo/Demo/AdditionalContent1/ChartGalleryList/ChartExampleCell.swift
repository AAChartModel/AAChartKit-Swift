import UIKit
import AAInfographics

class ChartExampleCell: UITableViewCell {
    lazy var aaChartView: AAChartView = {
        let chartView = AAChartView()
        chartView.translatesAutoresizingMaskIntoConstraints = false
        // Enhanced design: rounded corners and improved shadow
        chartView.layer.cornerRadius = 6
        chartView.layer.shadowColor = UIColor.darkGray.cgColor
        chartView.layer.shadowOpacity = 0.3
        chartView.layer.shadowOffset = CGSize(width: 0, height: 2)
        chartView.layer.shadowRadius = 6
        chartView.layer.masksToBounds = false
        chartView.backgroundColor = .white
        
        // Add a container view that clips to bounds to ensure perfect rounded corners
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 6
        containerView.layer.masksToBounds = true
        containerView.backgroundColor = .white
        containerView.addSubview(chartView)
        return chartView
    }()
    
    // Add a container view for better shadow and corner effects
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 6
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var shadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 8
        view.layer.cornerRadius = 6
        view.backgroundColor = .white
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.backgroundColor = UIColor(white: 0.97, alpha: 1.0)
        selectionStyle = .none
        
        // Add shadow view first, then container view
        contentView.addSubview(shadowView)
        shadowView.addSubview(containerView)
        containerView.addSubview(aaChartView)
        
        // Set constraints for better visual design
        NSLayoutConstraint.activate([
            // Shadow view constraints
            shadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            shadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            shadowView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            shadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            // Container view fills the shadow view
            containerView.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: shadowView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor),
            
            // Chart view has a small margin inside the container
            aaChartView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            aaChartView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            aaChartView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            aaChartView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0)
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
        // Clean up chart view state if needed
        aaChartView.layer.removeAllAnimations()
    }
}
