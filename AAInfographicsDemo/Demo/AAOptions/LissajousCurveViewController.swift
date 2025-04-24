import UIKit
import AAInfographics

class LissajousCurveViewController: UIViewController {
    
    // MARK: - Properties
    private var aaChartView: AAChartView!
    private var freqXSlider: UISlider!
    private var freqYSlider: UISlider!
    private var phaseSlider: UISlider!
    private var pointsSlider: UISlider!
    private var freqXTextField: UITextField!
    private var freqYTextField: UITextField!
    private var phaseTextField: UITextField!
    private var pointsTextField: UITextField!
    private var animateSwitch: UISwitch!
    private var phaseControlStack: UIStackView!
    
    // 参数
    private var freqX: Double = 3.0
    private var freqY: Double = 4.0
    private var phase: Double = 1.57
    private var points: Int = 2000
    private var isAnimating: Bool = true
    private let amplitudeA: Double = 1.0
    private let amplitudeB: Double = 1.0
    
    // 动画属性
    private let animationSpeed: Double = 0.02
    private var displayLink: CADisplayLink?
    
    // MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupChart()
        
        // 初始设置
        updateChart()
        if isAnimating {
            startAnimation()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopAnimation()
    }
    
    // MARK: - UI设置
    private func setupUI() {
        view.backgroundColor = UIColor(red: 0.06, green: 0.06, blue: 0.12, alpha: 1.0)
        title = "增强版利萨茹曲线演示"
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        // 图表视图
        aaChartView = AAChartView()
        aaChartView.translatesAutoresizingMaskIntoConstraints = false
        aaChartView.backgroundColor = .clear
        aaChartView.layer.cornerRadius = 12
        aaChartView.layer.borderWidth = 1
        aaChartView.layer.borderColor = UIColor.white.withAlphaComponent(0.1).cgColor
        contentView.addSubview(aaChartView)
        
        // 控制面板容器
        let controlsContainer = UIView()
        controlsContainer.translatesAutoresizingMaskIntoConstraints = false
        controlsContainer.backgroundColor = UIColor(white: 1.0, alpha: 0.05)
        controlsContainer.layer.cornerRadius = 10
        controlsContainer.layer.borderWidth = 1
        controlsContainer.layer.borderColor = UIColor.white.withAlphaComponent(0.1).cgColor
        contentView.addSubview(controlsContainer)
        
        // 设置控制器
        setupControls(in: controlsContainer)
        
        // 布局约束
        setupConstraints(for: scrollView, contentView: contentView, chartView: aaChartView, controlsContainer: controlsContainer)
    }
    
    private func setupControls(in container: UIView) {
        // X频率控制
        let freqXLabel = createLabel(text: "X 频率 (a)")
        freqXSlider = createSlider(min: 0.5, max: 10, value: Float(freqX))
        freqXTextField = createTextField(text: String(format: "%.1f", freqX))
        
        // Y频率控制
        let freqYLabel = createLabel(text: "Y 频率 (b)")
        freqYSlider = createSlider(min: 0.5, max: 10, value: Float(freqY))
        freqYTextField = createTextField(text: String(format: "%.1f", freqY))
        
        // 相位差控制
        let phaseLabel = createLabel(text: "相位差 (δ)")
        phaseSlider = createSlider(min: 0, max: 6.283, value: Float(phase))
        phaseTextField = createTextField(text: String(format: "%.2f", phase))
        
        phaseControlStack = UIStackView(arrangedSubviews: [phaseLabel, phaseSlider, phaseTextField])
        phaseControlStack.axis = .vertical
        phaseControlStack.spacing = 8
        phaseControlStack.translatesAutoresizingMaskIntoConstraints = false
        
        // 点数控制
        let pointsLabel = createLabel(text: "点数 (影响平滑度/性能)")
        pointsSlider = createSlider(min: 200, max: 10000, value: Float(points))
        pointsTextField = createTextField(text: String(points))
        
        // 动画开关
        let animateLabel = createLabel(text: "动画相位差 (δ)")
        animateSwitch = UISwitch()
        animateSwitch.isOn = isAnimating
        animateSwitch.addTarget(self, action: #selector(animateSwitchChanged), for: .valueChanged)
        
        let animateStack = UIStackView(arrangedSubviews: [animateSwitch, animateLabel])
        animateStack.axis = .horizontal
        animateStack.spacing = 10
        animateStack.translatesAutoresizingMaskIntoConstraints = false
        
        // 添加所有控件到容器
        let controlsStack = UIStackView(arrangedSubviews: [
            createControlGroup(label: freqXLabel, slider: freqXSlider, textField: freqXTextField),
            createControlGroup(label: freqYLabel, slider: freqYSlider, textField: freqYTextField),
            phaseControlStack,
            createControlGroup(label: pointsLabel, slider: pointsSlider, textField: pointsTextField),
            animateStack
        ])
        
        controlsStack.axis = .vertical
        controlsStack.spacing = 20
        controlsStack.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(controlsStack)
        
        // 控件布局
        NSLayoutConstraint.activate([
            controlsStack.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            controlsStack.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            controlsStack.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            controlsStack.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20)
        ])
        
        // 添加事件监听
        freqXSlider.addTarget(self, action: #selector(freqXChanged), for: .valueChanged)
        freqYSlider.addTarget(self, action: #selector(freqYChanged), for: .valueChanged)
        phaseSlider.addTarget(self, action: #selector(phaseChanged), for: .valueChanged)
        pointsSlider.addTarget(self, action: #selector(pointsChanged), for: .valueChanged)
        
        freqXTextField.addTarget(self, action: #selector(textFieldValueChanged), for: .editingDidEnd)
        freqYTextField.addTarget(self, action: #selector(textFieldValueChanged), for: .editingDidEnd)
        phaseTextField.addTarget(self, action: #selector(textFieldValueChanged), for: .editingDidEnd)
        pointsTextField.addTarget(self, action: #selector(textFieldValueChanged), for: .editingDidEnd)
    }
    
    private func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = UIColor(red: 0.75, green: 0.75, blue: 1.0, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return label
    }
    
    private func createSlider(min: Float, max: Float, value: Float) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = min
        slider.maximumValue = max
        slider.value = value
        slider.tintColor = UIColor(red: 0.54, green: 0.43, blue: 1.0, alpha: 1.0) // #8a6dff
        return slider
    }
    
    private func createTextField(text: String) -> UITextField {
        let textField = UITextField()
        textField.text = text
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(white: 1.0, alpha: 0.08)
        textField.textColor = UIColor(red: 0.91, green: 0.91, blue: 1.0, alpha: 1.0)
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.keyboardType = .decimalPad
        return textField
    }
    
    private func createControlGroup(label: UILabel, slider: UISlider, textField: UITextField) -> UIStackView {
        let group = UIStackView()
        group.axis = .vertical
        group.spacing = 8
        group.addArrangedSubview(label)
        group.addArrangedSubview(slider)
        group.addArrangedSubview(textField)
        return group
    }
    
    private func setupConstraints(for scrollView: UIScrollView, contentView: UIView, chartView: AAChartView, controlsContainer: UIView) {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            chartView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            chartView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            chartView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            chartView.heightAnchor.constraint(equalToConstant: 550),
            
            controlsContainer.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 20),
            controlsContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            controlsContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            controlsContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    // MARK: - 图表设置
    private func setupChart() {
        let aaChartModel = AAChartModel()
            .chartType(.scatter)
            .backgroundColor(AAColor.black)
            .zoomType(.xy)
//            .panEnabled(true)
            .title("利萨茹曲线")
//            .titleStyle(AAStyle().color("#ffffff").fontSize(20).fontWeight("500"))
            .xAxisLabelsStyle(AAStyle().color("#c0c0ff"))
            .yAxisLabelsStyle(AAStyle().color("#c0c0ff"))
//            .xAxisGridLineColor("rgba(255, 255, 255, 0.08)")
//            .yAxisGridLineColor("rgba(255, 255, 255, 0.08)")
//            .xAxisLineColor("rgba(255, 255, 255, 0.2)")
//            .yAxisLineColor("rgba(255, 255, 255, 0.2)")
//            .xAxisMin(-amplitudeA * 1.1)
//            .xAxisMax(amplitudeA * 1.1)
            .yAxisMin(-amplitudeB * 1.1)
            .yAxisMax(amplitudeB * 1.1)
            .legendEnabled(false)
            .tooltipEnabled(false)
            .series([generateSeriesData()])
            
        aaChartView.aa_drawChartWithChartModel(aaChartModel)
    }
    
    private func generateSeriesData() -> AASeriesElement {
        let data = generateLissajousData(a: freqX, b: freqY, delta: phase, points: points)
        
        return AASeriesElement()
            .name("Lissajous Curve")
            .data(data)
            .lineWidth(1.8)
            .color(AAGradientColor.linearGradient(
                direction: .toBottomRight,
                stops: [
                    [0.0, "#8a6dff"],
                    [0.5, "#00ffcc"],
                    [1.0, "#ff6b6b"]
                ]
            ))
            .shadow(AAShadow()
                .color("rgba(138, 109, 255, 0.3)")
                .offsetX(0)
                .offsetY(0)
                .opacity(1)
                .width(8)
            )
            .marker(AAMarker().enabled(false))
    }
    
    // MARK: - 数据生成
    private func generateLissajousData(a: Double, b: Double, delta: Double, points: Int) -> [[Double]] {
        var data: [[Double]] = []
        let tMax = 2.0 * Double.pi
        let step = tMax / Double(points)
        
        for i in 0...points {
            let t = Double(i) * step
            let x = amplitudeA * sin(a * t + delta)
            let y = amplitudeB * sin(b * t)
            data.append([x, y])
        }
        
        return data
    }
    
    // MARK: - 图表更新
    private func updateChart() {
        aaChartView.aa_onlyRefreshTheChartDataWithChartOptionsSeries(
            [generateSeriesData()]
        )
        
        // 根据动画状态更新UI
        phaseSlider.isEnabled = !isAnimating
        phaseTextField.isEnabled = !isAnimating
        phaseControlStack.alpha = isAnimating ? 0.6 : 1.0
    }
    
    // MARK: - 动画
    private func startAnimation() {
        stopAnimation() // 停止任何现有动画
        
        displayLink = CADisplayLink(target: self, selector: #selector(updateAnimation))
        displayLink?.add(to: .main, forMode: .common)
    }
    
    private func stopAnimation() {
        displayLink?.invalidate()
        displayLink = nil
    }
    
    @objc private func updateAnimation() {
        if isAnimating {
            phase += animationSpeed
            
            // 更新UI以反映当前相位
            let displayPhase = phase.truncatingRemainder(dividingBy: (2 * Double.pi))
            phaseTextField.text = String(format: "%.2f", displayPhase)
            phaseSlider.value = Float(displayPhase)
            
            updateChart()
        }
    }
    
    // MARK: - UI操作
    @objc private func freqXChanged(_ slider: UISlider) {
        freqX = Double(slider.value)
        freqXTextField.text = String(format: "%.1f", freqX)
        updateChart()
    }
    
    @objc private func freqYChanged(_ slider: UISlider) {
        freqY = Double(slider.value)
        freqYTextField.text = String(format: "%.1f", freqY)
        updateChart()
    }
    
    @objc private func phaseChanged(_ slider: UISlider) {
        if !isAnimating {
            phase = Double(slider.value)
            phaseTextField.text = String(format: "%.2f", phase)
            updateChart()
        }
    }
    
    @objc private func pointsChanged(_ slider: UISlider) {
        points = Int(slider.value)
        pointsTextField.text = String(points)
        updateChart()
    }
    
    @objc private func textFieldValueChanged(_ textField: UITextField) {
        guard let text = textField.text, !text.isEmpty else { return }
        
        if textField == freqXTextField, let value = Double(text) {
            if value >= 0.5 && value <= 10 {
                freqX = value
                freqXSlider.value = Float(value)
                updateChart()
            }
        } else if textField == freqYTextField, let value = Double(text) {
            if value >= 0.5 && value <= 10 {
                freqY = value
                freqYSlider.value = Float(value)
                updateChart()
            }
        } else if textField == phaseTextField, let value = Double(text), !isAnimating {
            if value >= 0 && value <= 6.283 {
                phase = value
                phaseSlider.value = Float(value)
                updateChart()
            }
        } else if textField == pointsTextField, let value = Int(text) {
            if value >= 200 && value <= 10000 {
                points = value
                pointsSlider.value = Float(value)
                updateChart()
            }
        }
    }
    
    @objc private func animateSwitchChanged(_ sender: UISwitch) {
        isAnimating = sender.isOn
        
        if isAnimating {
            startAnimation()
        } else {
            stopAnimation()
            // 停止动画时，将相位更新为当前滑块值
            phase = Double(phaseSlider.value)
            updateChart()
        }
        
        // 根据动画状态更新UI
        phaseSlider.isEnabled = !isAnimating
        phaseTextField.isEnabled = !isAnimating
        phaseControlStack.alpha = isAnimating ? 0.6 : 1.0
    }
}
