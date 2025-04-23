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
    private var currentPoints: [ParticlePoint] = []
    
    // 添加加载指示器
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .gray
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    private let numPoints = 600 // 点数量
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
    func setEmoji(_ emoji: String) {
        self.emoji = emoji
        
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
            let points = emojiImage.getEmojiPoints(numPoints: self.numPoints, canvasSize: self.canvasSize)
            
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
                .marker(AAMarker().radius(6).symbol(.circle))
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

class EmojiParticleAnimationVC: UIViewController {
    private var collectionView: UICollectionView!
    private let defaultEmojis = [
         "🍎",
         "🍐",
         "🍊",
         "🍋",
         "🍋‍🟩",
         "🍌",
         "🍉",
         "🍇",
         "🍓",
         "🫐",
         "🍈",
         "🍒",
         "🍑",
         "🥭",
         "🍍",
         "🥥",
         "🥝",
         "🍅",
         "🍆",
         "🥑",
         "🥦",
         "🫛",
         "🥬",
         "🫜",
         "🥒",
         "🌶",
         "🫑",
         "🌽",
         "🥕",
         "🫒",
         "🧄",
         "🧅",
         "🫚",
         "🥔",
         "🍠",
         "🫘",
         "🥐",
         "🥯",
         "🍞",
         "🥖",
         "🥨",
         "🧀",
         "🥚",
         "🍳",
         "🧈",
         "🥞",
         "🧇",
         "🥓",
         "🥩",
         "🍗",
         "🍖",
         "🦴",
         "🌭",
         "🍔",
         "🍟",
         "🍕",
         "🫓",
         "🥪",
         "🥙",
         "🧆",
         "🌮",
         "🌯",
         "🫔",
         "🥗",
         "🥘",
         "🫕",
         "🥫",
         "🍝",
         "🍜",
         "🍲",
         "🍛",
         "🍣",
         "🍱",
         "🥟",
         "🦪",
         "🍤",
         "🍙",
         "🍚",
         "🍘",
         "🍥",
         "🥠",
         "🥮",
         "🍢",
         "🍡",
         "🍧",
         "🍨",
         "🍦",
         "🥧",
         "🧁",
         "🍰",
         "🎂",
         "🍮",
         "🍭",
         "🍬",
         "🍫",
         "🍿",
         "🍩",
         "🍪",
         "🌰",
         "🥜",
         "🍯",
         "🥛",
         "🍼",
         "🫖",
         "☕️",
         "🍵",
         "🧃",
         "🥤",
         "🧋",
         "🫙",
         "🍶",
         "🍺",
         "🍻",
         "🥂",
         "🍷",
         "🫗",
         "🥃",
         "🍸",
         "🍹",
         "🧉",
         "🍾",
         "🧊",
         "🥄",
         "🍴",
         "🍽",
         "🥣",
         "🥡",
         "🥢",
         "🧂",
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
        let width = (view.frame.width - 30) / 4
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
        
        // 设置emoji - 异步加载
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
