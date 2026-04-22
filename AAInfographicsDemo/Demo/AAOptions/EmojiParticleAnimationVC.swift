//
//  ParticlePoint.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/4/23.
//  Copyright © 2025 An An. All rights reserved.
//

import UIKit
import AAInfographics

// Helper structure to hold point data
struct ParticlePoint {
    var x: Double
    var y: Double
    var color: String // Store as "rgb(r,g,b)" string for Highcharts compatibility
}

// Extension to draw String (Emoji) as UIImage
extension String {
    func image(with size: CGSize, fontSize: CGFloat? = nil) -> UIImage? {
//        let testImage = UIImage(named: "licensed-image.jpeg")
//        return testImage
        
        let defaultFontSize = size.height * 0.8
        let font = UIFont.systemFont(ofSize: fontSize ?? defaultFontSize)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.black // Color doesn't matter much here, we read pixels later
        ]
        let attributedString = NSAttributedString(string: self, attributes: attributes)
        let textRect = attributedString.boundingRect(with: size, options: .usesLineFragmentOrigin, context: nil)

        let renderer = UIGraphicsImageRenderer(size: size)
        let image = renderer.image { ctx in
            // Clear background (optional, default is transparent)
            // ctx.cgContext.setFillColor(UIColor.clear.cgColor)
            // ctx.cgContext.fill(CGRect(origin: .zero, size: size))

            // Center the text
            let drawPoint = CGPoint(x: (size.width - textRect.width) / 2,
                                    y: (size.height - textRect.height) / 2)
            attributedString.draw(at: drawPoint)
        }
        return image
    }
}

// Extension to get pixel data (simplified)
extension UIImage {
    func getPixelColor(pos: CGPoint) -> UIColor? {
        guard let cgImage = self.cgImage,
              let pixelData = cgImage.dataProvider?.data,
              let data = CFDataGetBytePtr(pixelData) else {
            return nil
        }

        let bytesPerRow = cgImage.bytesPerRow
        let bytesPerPixel = cgImage.bitsPerPixel / 8
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * bytesPerPixel

        guard pixelInfo + 3 < CFDataGetLength(pixelData) else { return nil } // Check bounds

        let a = CGFloat(data[pixelInfo+3]) / 255.0
        // Premultiplied alpha handling (common case)
        let r = CGFloat(data[pixelInfo]) / 255.0 / (a > 0 ? a : 1.0)
        let g = CGFloat(data[pixelInfo+1]) / 255.0 / (a > 0 ? a : 1.0)
        let b = CGFloat(data[pixelInfo+2]) / 255.0 / (a > 0 ? a : 1.0)


        // Consider alpha threshold
        guard a > 0.5 else { // Equivalent to alpha > 128
             return nil
        }

        return UIColor(red: r, green: g, blue: b, alpha: a)
    }

    func getEmojiPoints(numPoints: Int, canvasSize: CGSize = CGSize(width: 100, height: 100)) -> [ParticlePoint] {
        guard let cgImage = self.cgImage else { return [] }

        let width = Int(canvasSize.width)
        let height = Int(canvasSize.height)
        var availablePoints: [ParticlePoint] = []

        // Create a context to draw the image, ensuring consistent format
        let colorSpace = CGColorSpaceCreateDeviceRGB() // Directly assign, it's not optional
        guard let context = CGContext(data: nil,
                                      width: width,
                                      height: height,
                                      bitsPerComponent: 8,
                                      bytesPerRow: width * 4,
                                      space: colorSpace,
                                      bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Big.rawValue),
              let data = context.data?.bindMemory(to: UInt8.self, capacity: width * height * 4)
        else {
            print("Error creating context or getting data")
            return []
        }

        context.draw(cgImage, in: CGRect(origin: .zero, size: canvasSize))

        for y in 0..<height {
            for x in 0..<width {
                let index = (y * width + x) * 4
                let alpha = data[index + 3]

                if alpha > 128 { // Check alpha channel
                    let r = data[index]
                    let g = data[index + 1]
                    let b = data[index + 2]

                    // Map canvas coordinates (top-left origin) to Highcharts coordinates (bottom-left origin, 0-100)
                    let chartX = Double(x) / Double(width) * 100.0
                    let chartY = (Double(height - 1 - y) / Double(height)) * 100.0 // Flip Y axis
                    let colorString = "rgb(\(r),\(g),\(b))"

                    availablePoints.append(ParticlePoint(x: chartX, y: chartY, color: colorString))
                }
            }
        }

        // Sampling logic (similar to JS)
        if availablePoints.isEmpty {
            print("Warning: No usable points found from Emoji image.")
            // Return random gray points if no points found
             return (0..<numPoints).map { _ in ParticlePoint(x: Double.random(in: 0...100), y: Double.random(in: 0...100), color: "rgb(128,128,128)") }
        }

        var sampledPoints: [ParticlePoint] = []
        let targetCount = min(numPoints, availablePoints.count)

        while sampledPoints.count < targetCount {
            let index = Int.random(in: 0..<availablePoints.count)
            sampledPoints.append(availablePoints.remove(at: index))
        }

        // Pad if necessary
        while sampledPoints.count < numPoints && !sampledPoints.isEmpty {
             sampledPoints.append(sampledPoints.last!) // Duplicate last point
        }
         // Final fallback if still empty (shouldn't happen if initial check passed)
         if sampledPoints.isEmpty {
             return (0..<numPoints).map { _ in ParticlePoint(x: Double.random(in: 0...100), y: Double.random(in: 0...100), color: "rgb(0,0,0)") }
         }


        return sampledPoints
    }
}

// 自定义 Collection Cell，用于展示每个 emoji 动画
@available(iOS 13.0, *)
class EmojiAnimationCell: UICollectionViewCell {
    private(set) var aaChartView: AAChartView!
    private(set) var emoji: String = "😊" // 默认 emoji
    private var currentPoints: [ParticlePoint] = []
    
    // 添加加载指示器
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .gray
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    // 使用从控制器传递的配置
    var pointCount: Int = 1000
    var markerRadius: CGFloat = 6
    var markerSymbol: AAChartSymbolType = .circle
    
    private let canvasSize = CGSize(width: 100, height: 100)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        // 设置图表视图
        aaChartView = AAChartView()
        aaChartView.isScrollEnabled = false
        aaChartView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(aaChartView)
        
        // 添加活动指示器
        contentView.addSubview(activityIndicator)
        
        // 布局约束
        NSLayoutConstraint.activate([
            aaChartView.topAnchor.constraint(equalTo: contentView.topAnchor),
            aaChartView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            aaChartView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            aaChartView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        // 初始图表设置 - 先显示空图表
        setupInitialChart()
    }
    
    private func setupInitialChart() {
        // 初始化空的图表，稍后用真实数据更新
        let aaChartModel = AAChartModel()
            .chartType(.scatter)
            .animationDuration(0)
            .backgroundColor("transparent")
            .title("")
            .legendEnabled(false)
            .tooltipEnabled(false)
            .xAxisVisible(false)
            .yAxisVisible(false)
            .colorsTheme(["#000000"])
            .series([
                AASeriesElement()
                    .name("Particles")
                    .data([]) // 空数据，等待异步加载
                    .colorByPoint(true)
                    .marker(AAMarker()
                        .radius(6)
                        .symbol(.circle)
                    )
                    .enableMouseTracking(false)
            ])

        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)
        aaChartView.aa_drawChartWithChartOptions(aaOptions)
    }
    
    // 设置emoji并异步加载数据
    func setEmoji(_ emoji: String, pointCount: Int? = nil, markerRadius: CGFloat? = nil, markerSymbol: AAChartSymbolType? = nil) {
        self.emoji = emoji
        
        // 更新配置（如果提供）
        if let pointCount = pointCount {
            self.pointCount = pointCount
        }
        
        if let markerRadius = markerRadius {
            self.markerRadius = markerRadius
        }
        
        if let markerSymbol = markerSymbol {
            self.markerSymbol = markerSymbol
        }
        
        // 显示加载指示器
        activityIndicator.startAnimating()
        
        // 异步处理数据合成
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            
            // 生成emoji图像
            guard let emojiImage = emoji.image(with: self.canvasSize) else {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    print("无法从 \(emoji) 创建图像")
                }
                return
            }
            
            // 提取目标点
            let points = emojiImage.getEmojiPoints(numPoints: self.pointCount, canvasSize: self.canvasSize)
            
            // 回到主线程更新UI
            DispatchQueue.main.async {
                self.updateChartWithPoints(points)
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    // 更新图表
    private func updateChartWithPoints(_ points: [ParticlePoint]) {
        self.currentPoints = points
        
        let updatedOptions = AAOptions()
        updatedOptions.series = [
            AASeriesElement()
                .data(points.map { ["x": $0.x, "y": $0.y, "color": $0.color] })
                .colorByPoint(true)
                .marker(AAMarker().radius(Float(markerRadius)).symbol(markerSymbol))
        ]
        
        aaChartView.aa_onlyRefreshTheChartDataWithChartOptionsSeries(updatedOptions.series as! [AASeriesElement], animation: false)
    }
    
    func stopAnimation() {
        // 保留兼容性
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // 停止指示器，避免重用时继续显示
        activityIndicator.stopAnimating()
    }
}

// 控制面板视图
@available(iOS 13.0, *)
class ControlPanelView: UIView {
    // 点数量滑块
    let pointCountSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 200
        slider.maximumValue = 3000
        slider.value = 1000
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    // 点大小滑块
    let markerRadiusSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.value = 6
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    // 点形状选择器
    let markerSymbolSegment: UISegmentedControl = {
        let items = ["圆形", "方形", "菱形", "三角形", "十字"]
        let segment = UISegmentedControl(items: items)
        segment.selectedSegmentIndex = 0
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    // 点数量标签
    let pointCountLabel: UILabel = {
        let label = UILabel()
        label.text = "点数量: 1000"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 点大小标签
    let markerRadiusLabel: UILabel = {
        let label = UILabel()
        label.text = "点大小: 6"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 应用按钮
    let applyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("应用设置", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        
        // 添加子视图
        addSubview(pointCountSlider)
        addSubview(markerRadiusSlider)
        addSubview(markerSymbolSegment)
        addSubview(pointCountLabel)
        addSubview(markerRadiusLabel)
        addSubview(applyButton)
        
        // 布局约束
        NSLayoutConstraint.activate([
            pointCountLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            pointCountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            pointCountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            pointCountSlider.topAnchor.constraint(equalTo: pointCountLabel.bottomAnchor, constant: 6),
            pointCountSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            pointCountSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            markerRadiusLabel.topAnchor.constraint(equalTo: pointCountSlider.bottomAnchor, constant: 12),
            markerRadiusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            markerRadiusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            markerRadiusSlider.topAnchor.constraint(equalTo: markerRadiusLabel.bottomAnchor, constant: 6),
            markerRadiusSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            markerRadiusSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            markerSymbolSegment.topAnchor.constraint(equalTo: markerRadiusSlider.bottomAnchor, constant: 12),
            markerSymbolSegment.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            markerSymbolSegment.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            applyButton.topAnchor.constraint(equalTo: markerSymbolSegment.bottomAnchor, constant: 12),
            applyButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            applyButton.widthAnchor.constraint(equalToConstant: 120),
            applyButton.heightAnchor.constraint(equalToConstant: 36),
            applyButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
        
        // 添加事件处理
        pointCountSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        markerRadiusSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        if sender == pointCountSlider {
            let value = Int(sender.value)
            pointCountLabel.text = "点数量: \(value)"
        } else if sender == markerRadiusSlider {
            let value = Int(sender.value)
            markerRadiusLabel.text = "点大小: \(value)"
        }
    }
    
    // 获取当前设置
    var currentPointCount: Int {
        return Int(pointCountSlider.value)
    }
    
    var currentMarkerRadius: CGFloat {
        return CGFloat(markerRadiusSlider.value)
    }
    
    var currentMarkerSymbol: AAChartSymbolType {
        switch markerSymbolSegment.selectedSegmentIndex {
        case 0: return .circle
        case 1: return .square
        case 2: return .diamond
        case 3: return .triangle
        case 4: return .triangleDown
        default: return .circle
        }
    }
}

@available(iOS 13.0, *)
class EmojiParticleAnimationVC: UIViewController {
    private var collectionView: UICollectionView!
    private var controlPanel: ControlPanelView!
    private var controlPanelVisible = true
    private var controlPanelHeight: CGFloat = 220
    
    // 当前渲染设置
    private var currentPointCount = 1000
    private var currentMarkerRadius: CGFloat = 6
    private var currentMarkerSymbol: AAChartSymbolType = .circle
    
    private let defaultEmojis = EmojiProvider.clothingAndAccessories() + EmojiProvider.foodAndDrink()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupControlPanel()
        setupCollectionView()
        
        // 添加导航栏按钮用于显示/隐藏控制面板
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "设置", style: .plain, 
            target: self, action: #selector(toggleControlPanel)
        )
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopAllAnimations()
    }
    
    private func setupControlPanel() {
        controlPanel = ControlPanelView()
        controlPanel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controlPanel)
        
        NSLayoutConstraint.activate([
            controlPanel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            controlPanel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            controlPanel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            controlPanel.heightAnchor.constraint(equalToConstant: controlPanelHeight)
        ])
        
        // 添加应用按钮事件
        controlPanel.applyButton.addTarget(self, action: #selector(applySettings), for: .touchUpInside)
    }
    
    private func setupCollectionView() {
        // 创建网格布局
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        // 计算cell大小
        let width = (view.frame.width - 30) / 4
        layout.itemSize = CGSize(width: width, height: width * 1.2)
        
        // 创建CollectionView，考虑控制面板高度
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(EmojiAnimationCell.self, forCellWithReuseIdentifier: "EmojiCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        // 应用约束，考虑控制面板
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: controlPanel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc private func toggleControlPanel() {
        controlPanelVisible = !controlPanelVisible
        
        UIView.animate(withDuration: 0.3) {
            self.controlPanel.alpha = self.controlPanelVisible ? 1.0 : 0.0
        } completion: { _ in
            // 调整集合视图的位置
            UIView.animate(withDuration: 0.3) {
                if self.controlPanelVisible {
                    self.collectionView.contentInset = UIEdgeInsets(
                        top: 0, left: 0, bottom: 0, right: 0
                    )
                } else {
                    self.collectionView.contentInset = UIEdgeInsets(
                        top: -self.controlPanelHeight, left: 0, bottom: 0, right: 0
                    )
                }
            }
        }
        
        navigationItem.rightBarButtonItem?.title = controlPanelVisible ? "隐藏设置" : "显示设置"
    }
    
    @objc private func applySettings() {
        // 获取当前控制面板设置
        currentPointCount = controlPanel.currentPointCount
        currentMarkerRadius = controlPanel.currentMarkerRadius
        currentMarkerSymbol = controlPanel.currentMarkerSymbol
        
        // 更新所有可见单元格
        for cell in collectionView.visibleCells {
            if let emojiCell = cell as? EmojiAnimationCell {
                emojiCell.setEmoji(
                    emojiCell.emoji, 
                    pointCount: currentPointCount,
                    markerRadius: currentMarkerRadius,
                    markerSymbol: currentMarkerSymbol
                )
            }
        }
    }
    
    private func stopAllAnimations() {
        // 停止所有cell的动画
        for i in 0..<collectionView.numberOfItems(inSection: 0) {
            if let cell = collectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? EmojiAnimationCell {
                cell.stopAnimation()
            }
        }
    }
}

// MARK: - UICollectionViewDataSource
@available(iOS 13.0, *)
extension EmojiParticleAnimationVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return defaultEmojis.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmojiCell", for: indexPath) as? EmojiAnimationCell else {
            fatalError("无法创建EmojiAnimationCell")
        }
        
        // 设置当前配置
        cell.pointCount = currentPointCount
        cell.markerRadius = currentMarkerRadius
        cell.markerSymbol = currentMarkerSymbol
        
        // 设置emoji并应用配置
        cell.setEmoji(defaultEmojis[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegate
@available(iOS 13.0, *)
extension EmojiParticleAnimationVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 点击时重新播放动画
        if let cell = collectionView.cellForItem(at: indexPath) as? EmojiAnimationCell {
            cell.setEmoji(
                defaultEmojis[indexPath.item],
                pointCount: currentPointCount,
                markerRadius: currentMarkerRadius,
                markerSymbol: currentMarkerSymbol
            )
        }
    }
}

// Helper extension for Scanner (if needed, depending on iOS version)
#if !swift(>=5.7)
extension Scanner {
    func scanInt() -> Int? {
        var value: Int = 0
        if self.scanInt(&value) {
            return value
        }
        return nil
    }
     func scanString(_ string: String) -> String? {
         var scannedString: NSString?
         if self.scanString(string, into: &scannedString) {
             return scannedString as String?
         }
         return nil
     }
}
#endif
