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
class EmojiAnimationCell: UICollectionViewCell {
    private(set) var aaChartView: AAChartView!
    private(set) var emoji: String = "😊" // 默认 emoji
    private(set) var isAnimating = false
    
    private var displayLink: CADisplayLink?
    private var startTime: CFTimeInterval = 0
    private var startPoints: [ParticlePoint] = []
    private var endPoints: [ParticlePoint] = []
    private var currentPoints: [ParticlePoint] = []
    
    private let numPoints = 400 // 减少每个图表的粒子数量以提高性能
    private let canvasSize = CGSize(width: 100, height: 100)
    private let animationDuration: TimeInterval = 1.5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupChartView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupChartView()
    }
    
    private func setupChartView() {
        aaChartView = AAChartView()
        aaChartView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(aaChartView)
        
        NSLayoutConstraint.activate([
            aaChartView.topAnchor.constraint(equalTo: contentView.topAnchor),
            aaChartView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            aaChartView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            aaChartView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        // 初始化随机点
        currentPoints = generateRandomPoints(num: numPoints)
        setupInitialChart()
    }
    
    private func setupInitialChart() {
        let aaChartModel = AAChartModel()
            .chartType(.scatter)
            .animationType(.easeOutCubic)
            .animationDuration(500)
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
                    .data(currentPoints.map { ["x": $0.x, "y": $0.y, "color": $0.color] })
                    .colorByPoint(true)
                    .marker(AAMarker()
                        .radius(2)
                        .symbol(.circle)
                        .states(AAMarkerStates()
                            .hover(AAMarkerHover()
                                .enabled(false)
                            )
                        )
                    )
                    .enableMouseTracking(false)
            ])

        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)

        aaOptions.plotOptions?
            .series(AASeries()
                .animation(AAAnimation()
                    .duration(0)
                )
            )
            .scatter(AAScatter())

        aaChartView.aa_drawChartWithChartOptions(aaOptions)
    }
    
    // 生成随机点
    private func generateRandomPoints(num: Int) -> [ParticlePoint] {
        return (0..<num).map { _ in
            ParticlePoint(x: Double.random(in: 0...100),
                          y: Double.random(in: 0...100),
                          color: "rgb(0,0,0)")
        }
    }
    
    // 设置并播放emoji动画
    func setEmoji(_ emoji: String) {
        self.emoji = emoji
        
        // 生成emoji图像
        guard let emojiImage = emoji.image(with: canvasSize) else {
            print("无法从 \(emoji) 创建图像")
            return
        }
        
        // 提取目标点
        let targetPoints = emojiImage.getEmojiPoints(numPoints: numPoints, canvasSize: canvasSize)
        
        // 准备动画
        self.startPoints = self.currentPoints
        self.endPoints = targetPoints
        startAnimation()
    }
    
    func startAnimation() {
        stopAnimation()
        isAnimating = true
        
        startTime = CACurrentMediaTime()
        displayLink = CADisplayLink(target: self, selector: #selector(updateAnimation))
        displayLink?.add(to: .main, forMode: .common)
    }
    
    func stopAnimation() {
        displayLink?.invalidate()
        displayLink = nil
        isAnimating = false
    }
    
    @objc private func updateAnimation(displaylink: CADisplayLink) {
        let currentTime = CACurrentMediaTime()
        let elapsedTime = currentTime - startTime
        var progress = min(elapsedTime / animationDuration, 1.0)
        
        // Ease out cubic function
        progress = 1.0 - pow(1.0 - progress, 3.0)
        
        let newData = interpolatePoints(start: startPoints, end: endPoints, progress: progress)
        
        // 更新图表数据
        let updatedOptions = AAOptions()
        updatedOptions.series = [
            AASeriesElement()
                .data(newData.map { ["x": $0.x, "y": $0.y, "color": $0.color] })
                .colorByPoint(true)
                .marker(AAMarker().radius(2).symbol(.circle))
        ]
        
        aaChartView.aa_onlyRefreshTheChartDataWithChartOptionsSeries(updatedOptions.series as! [AASeriesElement], animation: false)
        
        // 存储当前状态
        self.currentPoints = newData
        
        if elapsedTime >= animationDuration {
            stopAnimation()
            // 确保最终状态准确
            let finalData = interpolatePoints(start: startPoints, end: endPoints, progress: 1.0)
            self.currentPoints = finalData
            let finalOptions = AAOptions()
            finalOptions.series = [
                AASeriesElement()
                    .data(finalData.map { ["x": $0.x, "y": $0.y, "color": $0.color] })
                    .colorByPoint(true)
                    .marker(AAMarker().radius(2).symbol(.circle))
            ]
            aaChartView.aa_onlyRefreshTheChartDataWithChartOptionsSeries(finalOptions.series as! [AASeriesElement], animation: false)
        }
    }
    
    // 点的插值计算
    private func interpolatePoints(start: [ParticlePoint], end: [ParticlePoint], progress: Double) -> [ParticlePoint] {
        guard start.count == end.count else {
            print("Error: Start and end point counts differ.")
            return currentPoints
        }
        
        return zip(start, end).map { startPoint, endPoint in
            let newX = startPoint.x + (endPoint.x - startPoint.x) * progress
            let newY = startPoint.y + (endPoint.y - startPoint.y) * progress
            let newColor = interpolateColor(from: startPoint.color, to: endPoint.color, progress: progress)
            return ParticlePoint(x: newX, y: newY, color: newColor)
        }
    }
    
    // 颜色插值
    private func interpolateColor(from startColor: String, to endColor: String, progress: Double) -> String {
        guard let startRGB = parseRGB(startColor), let endRGB = parseRGB(endColor) else {
            return progress >= 1.0 ? endColor : startColor
        }
        
        let r = Int(round(Double(startRGB.r) + (Double(endRGB.r) - Double(startRGB.r)) * progress))
        let g = Int(round(Double(startRGB.g) + (Double(endRGB.g) - Double(startRGB.g)) * progress))
        let b = Int(round(Double(startRGB.b) + (Double(endRGB.b) - Double(startRGB.b)) * progress))
        
        // 限制值在0-255
        let clampedR = max(0, min(255, r))
        let clampedG = max(0, min(255, g))
        let clampedB = max(0, min(255, b))
        
        return "rgb(\(clampedR),\(clampedG),\(clampedB))"
    }
    
    // 解析RGB颜色
    private func parseRGB(_ rgbString: String) -> (r: Int, g: Int, b: Int)? {
        let scanner = Scanner(string: rgbString)
        guard scanner.scanString("rgb(") != nil,
              let r = scanner.scanInt(),
              scanner.scanString(",") != nil,
              let g = scanner.scanInt(),
              scanner.scanString(",") != nil,
              let b = scanner.scanInt(),
              scanner.scanString(")") != nil else {
            return nil
        }
        return (r, g, b)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        stopAnimation()
    }
}

class EmojiParticleAnimationVC: UIViewController {
    private var collectionView: UICollectionView!
    private let defaultEmojis = [
        "😊", "🚀", "🌈", "🍎", "🐱", "🎉", "🌟", "🎵", "👍", "❤️",
        "💡", "🌍", "🔥", "🌸", "🍔", "⚽️", "🎈", "🐶", "🍕", "🎂",
        "🚗", "🏖️", "🎶", "🍉", "🌼", "🐰", "🍦", "🌻", "🎁", "💖",
        "🌊", "🍩", "🐻", "🍓", "🎃", "🏆", "🌺", "🍇", "🐸", "🍉",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupCollectionView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopAllAnimations()
    }
    
    private func setupCollectionView() {
        // 创建网格布局
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        // 计算cell大小，每行显示2个
        let width = (view.frame.width - 30) / 3
        layout.itemSize = CGSize(width: width, height: width * 1.2)
        
        // 创建CollectionView
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(EmojiAnimationCell.self, forCellWithReuseIdentifier: "EmojiCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        // 应用约束
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
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
extension EmojiParticleAnimationVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return defaultEmojis.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmojiCell", for: indexPath) as? EmojiAnimationCell else {
            fatalError("无法创建EmojiAnimationCell")
        }
        
        // 设置emoji
        cell.setEmoji(defaultEmojis[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension EmojiParticleAnimationVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 点击时重新播放动画
        if let cell = collectionView.cellForItem(at: indexPath) as? EmojiAnimationCell {
            cell.setEmoji(defaultEmojis[indexPath.item])
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
