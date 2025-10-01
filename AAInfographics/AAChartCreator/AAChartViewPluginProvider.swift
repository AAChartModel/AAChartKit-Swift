import Foundation

// MARK: - Plugin Provider Protocol

// Protocol defining the responsibility for providing required plugin paths
@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
internal protocol AAChartViewPluginProviderProtocol: AnyObject {
    func getRequiredPluginPaths(for options: AAOptions) -> Set<String>
}

// Default provider (can be used for the standard version or as a base)
@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
internal final class DefaultPluginProvider: AAChartViewPluginProviderProtocol {
    public init() {}

    public func getRequiredPluginPaths(for options: AAOptions) -> Set<String> {
        return Set()
    }
}

// Provider for the Pro version, handling specific chart type plugins
@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
internal final class AAChartViewPluginProvider: AAChartViewPluginProviderProtocol {
    public init(bundlePathLoader: BundlePathLoading = BundlePathLoader()) {
        self.bundlePathLoader = bundlePathLoader
    }

    private let bundlePathLoader: BundlePathLoading

    // Mapping from chart type rawValue to script names (standard version - AAChartKit-Swift)
    private static let chartTypeScriptMapping: [String: [String]] = [
        AAChartType.funnel.rawValue          : ["AAFunnel"],
        AAChartType.pyramid.rawValue         : ["AAFunnel"],
        AAChartType.columnpyramid.rawValue   : ["AAHighcharts-More"],
        AAChartType.bubble.rawValue          : ["AAHighcharts-More"],
        AAChartType.packedbubble.rawValue    : ["AAHighcharts-More"],
        AAChartType.arearange.rawValue       : ["AAHighcharts-More"],
        AAChartType.areasplinerange.rawValue : ["AAHighcharts-More"],
        AAChartType.columnrange.rawValue     : ["AAHighcharts-More"],
        AAChartType.gauge.rawValue           : ["AAHighcharts-More"],
        AAChartType.boxplot.rawValue         : ["AAHighcharts-More"],
        AAChartType.errorbar.rawValue        : ["AAHighcharts-More"],
        AAChartType.waterfall.rawValue       : ["AAHighcharts-More"],
        AAChartType.polygon.rawValue         : ["AAHighcharts-More"],
    ]

    public func getRequiredPluginPaths(for options: AAOptions) -> Set<String> {
        var requiredPaths = Set<String>()

        // Check for plugins based on AAOptions properties
        addChartPluginScripts(for: options, into: &requiredPaths)

        // Check for plugins based on the main chart type
        if let chartType = options.chart?.type {
            addChartPluginScripts(forType: chartType, into: &requiredPaths)
        }

        // Check for plugins based on individual series types
        if let seriesArray = options.series {
            for seriesElement in seriesArray {
                if let finalSeriesElement = seriesElement as? AASeriesElement,
                   let seriesType = finalSeriesElement.type {
                    addChartPluginScripts(forType: seriesType, into: &requiredPaths)
                }
            }
        }

        return requiredPaths
    }

    // Helper to add scripts based on chart type string
    private func addChartPluginScripts(forType chartType: String, into requiredPaths: inout Set<String>) {
        guard let scriptNames = Self.chartTypeScriptMapping[chartType] else {
            return
        }
        scriptNames.forEach { scriptName in
            if let scriptPath = generateScriptPathWithScriptName(scriptName) {
                requiredPaths.insert(scriptPath)
            }
        }
    }

    // Helper to add scripts based on specific AAOptions properties
    private func addChartPluginScripts(for options: AAOptions, into requiredPaths: inout Set<String>) {
        if options.chart?.polar == true {
            if let scriptPath = generateScriptPathWithScriptName("AAHighcharts-More") {
                requiredPaths.insert(scriptPath)
            }
        }
        // Add checks for other options properties that require specific plugins if needed
    }

    // Generates the full path for a given script name
    private func generateScriptPathWithScriptName(_ scriptName: String) -> String? {
        guard let path = bundlePathLoader
            .path(forResource: scriptName,
                  ofType: "js",
                  inDirectory: "AAJSFiles.bundle",
                  forLocalization: nil)
        else {
            #if DEBUG
            print("⚠️ Warning: Could not find path for script '\(scriptName).js'")
            //断言
            assert(false, "⚠️ Warning: Could not find path for script '\(scriptName).js'")
            #endif
            return nil
        }
        
        return path
    }
}

// MARK: - Bundle Path Loader Abstraction

internal protocol BundlePathLoading {
    func path(
        forResource name: String,
        ofType fileType: String,
        inDirectory subpath: String?,
        forLocalization localizationName: String?
    ) -> String?
}

extension BundlePathLoader: BundlePathLoading {}


