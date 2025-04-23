//
//  ParticlePoint.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/4/23.
//  Copyright © 2025 An An. All rights reserved.
//


//  EmojiParticleAnimationVC.swift
//  AAInfographicsDemo
//
//  Created by GitHub Copilot on 2025/04/23.
//  Copyright © 2025 GitHub Copilot. All rights reserved.
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


class EmojiParticleAnimationVC: UIViewController {

    private var aaChartView: AAChartView!
    private var textField: UITextField!
    private var generateButton: UIButton!

    private let numPoints = 800 // Number of particles
    private let canvasSize = CGSize(width: 100, height: 100) // Internal canvas size for pixel extraction
    private let animationDuration: TimeInterval = 1.5 // seconds

    private var displayLink: CADisplayLink?
    private var startTime: CFTimeInterval = 0
    private var startPoints: [ParticlePoint] = []
    private var endPoints: [ParticlePoint] = []
    private var currentPoints: [ParticlePoint] = [] // Holds the initial state before animation

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        setupUI()
        setupInitialChart()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopAnimation() // Clean up display link
    }

    private func setupUI() {
        // Text Field
        textField = UITextField()
        textField.placeholder = "输入 Emoji (例如 😊)"
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 20) // Make emoji input larger
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)

        // Button
        generateButton = UIButton(type: .system)
        generateButton.setTitle("生成动画", for: .normal)
        generateButton.addTarget(self, action: #selector(generateButtonTapped), for: .touchUpInside)
        generateButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(generateButton)

        // ChartView
        aaChartView = AAChartView()
        aaChartView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aaChartView)

        // Layout
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 40),

            generateButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
            generateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            aaChartView.topAnchor.constraint(equalTo: generateButton.bottomAnchor, constant: 20),
            aaChartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            aaChartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            aaChartView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }

    private func setupInitialChart() {
        // Generate initial random points
        currentPoints = generateRandomPoints(num: numPoints)

        let aaChartModel = AAChartModel()
            .chartType(.scatter)
            .animationType(.easeOutCubic) // Use for initial draw, animation handled manually later
            .animationDuration(500)
            .backgroundColor("transparent")
            .title("") // No title
            .legendEnabled(false)
            .tooltipEnabled(false)
            .xAxisVisible(false)
            .yAxisVisible(false)
            .colorsTheme(["#000000"]) // Initial color (will be overridden by point color)
            .series([
                AASeriesElement()
                    .name("Particles")
                    .data(currentPoints.map { ["x": $0.x, "y": $0.y, "color": $0.color] })
                    .colorByPoint(true) // Crucial: Allow individual point colors
                    .marker(AAMarker()
                        .radius(2)
                        .symbol(.circle)
                        .states(AAMarkerStates() // Disable hover effects
                            .hover(AAMarkerHover()
                                .enabled(false)
                            )
                        )
                    )
                    .enableMouseTracking(false) // Improve performance
            ])

        let aaOptions = AAOptionsConstructor.configureChartOptions(aaChartModel)

        // Disable Highcharts internal animation for scatter updates
        aaOptions.plotOptions?
            .series(AASeries()
                .animation(AAAnimation() // Disable animation on data updates
                    .duration(0)
                )
            )
            .scatter(AAScatter()
//                .animation(false) // Ensure scatter animation is off
             )


//        aaChartView.aa_drawChartWithOptions(aaOptions)
        aaChartView.aa_drawChartWithChartOptions(aaOptions)
    }

    // Generate random points
    private func generateRandomPoints(num: Int) -> [ParticlePoint] {
        return (0..<num).map { _ in
            ParticlePoint(x: Double.random(in: 0...100),
                          y: Double.random(in: 0...100),
                          color: "rgb(0,0,0)") // Initial color black
        }
    }

    @objc private func generateButtonTapped() {
        guard let emoji = textField.text, !emoji.isEmpty else {
            showAlert(message: "请输入一个 Emoji！")
            return
        }

        // Use the first character if multiple are entered
        let firstEmoji = String(emoji.prefix(1))

        // Generate image from emoji
        guard let emojiImage = firstEmoji.image(with: canvasSize) else {
            showAlert(message: "无法将 Emoji 渲染为图像。")
            return
        }

        // Extract target points from the image
        let targetPoints = emojiImage.getEmojiPoints(numPoints: numPoints, canvasSize: canvasSize)

        if targetPoints.count < numPoints {
             print("Warning: Could not extract the full number of points (\(targetPoints.count)/\(numPoints)). Animation might look sparse.")
             // Proceed anyway, the sampling logic should have padded the array
        }
         guard !targetPoints.isEmpty else {
             showAlert(message: "无法从 Emoji 图像中提取点。")
             return
         }


        // Prepare for animation
        self.startPoints = self.currentPoints // Use the current state as the start
        self.endPoints = targetPoints
        startAnimation()
    }

    private func startAnimation() {
        stopAnimation() // Ensure previous animation is stopped

        startTime = CACurrentMediaTime()
        displayLink = CADisplayLink(target: self, selector: #selector(updateAnimation))
        displayLink?.add(to: .main, forMode: .common)
    }

    private func stopAnimation() {
        displayLink?.invalidate()
        displayLink = nil
    }

    @objc private func updateAnimation(displaylink: CADisplayLink) {
        let currentTime = CACurrentMediaTime()
        let elapsedTime = currentTime - startTime
        var progress = min(elapsedTime / animationDuration, 1.0) // Clamp progress to 0-1

        // Ease out cubic function
        progress = 1.0 - pow(1.0 - progress, 3.0)

        let newData = interpolatePoints(start: startPoints, end: endPoints, progress: progress)

        // Update chart data efficiently
        let updatedOptions = AAOptions()
        updatedOptions.series = [
            AASeriesElement()
                .data(newData.map { ["x": $0.x, "y": $0.y, "color": $0.color] })
                // Important: Re-apply necessary series options if aa_onlyRefreshTheChartDataWithChartOptions resets them
                .colorByPoint(true)
                .marker(AAMarker().radius(2).symbol(.circle)) // Keep marker style consistent
        ]

        // Use the method designed for data-only updates
//        aaChartView.aa_onlyRefreshTheChartDataWithChartOptions(updatedOptions, redraw: true)
        aaChartView.aa_onlyRefreshTheChartDataWithChartOptionsSeries(updatedOptions.series as! [AASeriesElement], animation: true)

        // Store the current state for the next animation
        self.currentPoints = newData

        if elapsedTime >= animationDuration {
            stopAnimation()
            // Ensure final state is accurate
             let finalData = interpolatePoints(start: startPoints, end: endPoints, progress: 1.0)
             self.currentPoints = finalData // Store final state
             let finalOptions = AAOptions()
             finalOptions.series = [
                 AASeriesElement()
                     .data(finalData.map { ["x": $0.x, "y": $0.y, "color": $0.color] })
                     .colorByPoint(true)
                     .marker(AAMarker().radius(2).symbol(.circle))
             ]
//             aaChartView.aa_onlyRefreshTheChartDataWithChartOptions(finalOptions, redraw: true)
            aaChartView.aa_onlyRefreshTheChartDataWithChartOptionsSeries(updatedOptions.series as! [AASeriesElement], animation: true)

            print("Animation finished")
        }
    }

    // Interpolate between start and end points
    private func interpolatePoints(start: [ParticlePoint], end: [ParticlePoint], progress: Double) -> [ParticlePoint] {
        guard start.count == end.count else {
            print("Error: Start and end point counts differ.")
            return currentPoints // Return current state on error
        }

        return zip(start, end).map { startPoint, endPoint in
            let newX = startPoint.x + (endPoint.x - startPoint.x) * progress
            let newY = startPoint.y + (endPoint.y - startPoint.y) * progress
            let newColor = interpolateColor(from: startPoint.color, to: endPoint.color, progress: progress)
            return ParticlePoint(x: newX, y: newY, color: newColor)
        }
    }

    // Interpolate between two "rgb(r,g,b)" color strings
    private func interpolateColor(from startColor: String, to endColor: String, progress: Double) -> String {
        guard let startRGB = parseRGB(startColor), let endRGB = parseRGB(endColor) else {
            // Fallback to end color if parsing fails or at the end
            return progress >= 1.0 ? endColor : startColor
        }

        let r = Int(round(Double(startRGB.r) + (Double(endRGB.r) - Double(startRGB.r)) * progress))
        let g = Int(round(Double(startRGB.g) + (Double(endRGB.g) - Double(startRGB.g)) * progress))
        let b = Int(round(Double(startRGB.b) + (Double(endRGB.b) - Double(startRGB.b)) * progress))

        // Clamp values to 0-255
        let clampedR = max(0, min(255, r))
        let clampedG = max(0, min(255, g))
        let clampedB = max(0, min(255, b))

        return "rgb(\(clampedR),\(clampedG),\(clampedB))"
    }

    // Parse "rgb(r,g,b)" string
    private func parseRGB(_ rgbString: String) -> (r: Int, g: Int, b: Int)? {
        let scanner = Scanner(string: rgbString)
        guard scanner.scanString("rgb(") != nil,
              let r = scanner.scanInt(),
              scanner.scanString(",") != nil,
              let g = scanner.scanInt(),
              scanner.scanString(",") != nil,
              let b = scanner.scanInt(),
              scanner.scanString(")") != nil else {
            // Handle potential hex color from initial options? Unlikely here.
            // print("Failed to parse RGB: \(rgbString)")
            return nil
        }
        return (r, g, b)
    }

    // Helper to show alerts
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .default))
        present(alert, animated: true)
    }
}

// Helper extension for Scanner (if needed, depending on iOS version)
#if !swift(>=5.7) // Add compatibility for older Swift versions if necessary
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
