import Foundation

// MARK: - Shared Plugin Script Definition (Standard Version)

/// Enum representing available plugin scripts for standard version
@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
internal enum PluginScript: String {
    case funnel = "AAFunnel"
    case highchartsMore = "AAHighcharts-More"
    
    /// Returns the complete JavaScript file name with .js extension
    var fileName: String {
        return rawValue + ".js"
    }
}

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

// Provider for the standard version, handling specific chart type plugins
@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
internal final class AAChartViewPluginProvider: AAChartViewPluginProviderProtocol {
    public init(bundlePathLoader: BundlePathLoading = BundlePathLoader()) {
        self.bundlePathLoader = bundlePathLoader
    }

    private let bundlePathLoader: BundlePathLoading

    private struct ChartPluginConfiguration {
        let types: Set<AAChartType>
        let scripts: [PluginScript]

        init(types: [AAChartType], scripts: [PluginScript]) {
            self.types = Set(types)
            self.scripts = scripts
        }
    }

    /// Plugin configurations for standard version chart types
    private static let pluginConfigurations: [ChartPluginConfiguration] = [
        // --- Funnel & Pyramid Charts ---
        .init(types: [.funnel, .pyramid], scripts: [.funnel]),
        
        // --- Advanced Charts requiring Highcharts-More ---
        .init(types: [
            .columnpyramid,
            .bubble,
            .packedbubble,
            .arearange,
            .areasplinerange,
            .columnrange,
            .gauge,
            .boxplot,
            .errorbar,
            .waterfall,
            .polygon
        ], scripts: [.highchartsMore])
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
        guard let resolvedType = AAChartType(rawValue: chartType) else {
            return
        }

        let scripts = Self.pluginConfigurations.reduce(into: Set<PluginScript>()) { result, configuration in
            guard configuration.types.contains(resolvedType) else {
                return
            }
            configuration.scripts.forEach { result.insert($0) }
        }

        scripts.forEach { script in
            if let scriptPath = generateScriptPath(for: script) {
                requiredPaths.insert(scriptPath)
            }
        }
    }

    // Helper to add scripts based on specific AAOptions properties
    private func addChartPluginScripts(for options: AAOptions, into requiredPaths: inout Set<String>) {
        // For polar charts, Highcharts-More is required
        if options.chart?.polar == true {
            if let scriptPath = generateScriptPath(for: .highchartsMore) {
                requiredPaths.insert(scriptPath)
            }
        }
    }

    // Generates the full path for a given script name
    private func generateScriptPath(for script: PluginScript) -> String? {
        let scriptName = script.rawValue
        let fullScriptName = script.fileName
        guard let path = bundlePathLoader
            .path(forResource: scriptName,
                  ofType: "js",
                  inDirectory: "AAJSFiles.bundle",
                  forLocalization: nil)
        else {
            #if DEBUG
            print("⚠️ Warning: Could not find path for script '\(fullScriptName)'")
            //断言
            assert(false, "⚠️ Warning: Could not find path for script '\(fullScriptName)'")
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


