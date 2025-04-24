//
//  AAChartView+API.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/4/16.
//  Copyright © 2025 An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 *  🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit-Swift/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

import UIKit

// MARK: - Configure Chart View Content With AAChartModel
@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
extension AAChartView {
    /// Function of drawing chart view
    ///
    /// - Parameter aaChartModel: The instance object of AAChartModel
    public func aa_drawChartWithChartModel(_ aaChartModel: AAChartModel) {
        let aaOptions = aaChartModel.aa_toAAOptions()
        aa_drawChartWithChartOptions(aaOptions)
    }
    
    /// Function of only refresh the chart data after the chart has been rendered
    /// Refer to https://api.highcharts.com/class-reference/Highcharts.Chart#update
    ///
    /// - Parameter chartModelSeries: chart model series  array
    /// - Parameter animation: enable animation effect or not
    public func aa_onlyRefreshTheChartDataWithChartModelSeries(_ chartModelSeries: [AASeriesElement], animation: Bool = true) {
        aa_onlyRefreshTheChartDataWithChartOptionsSeries(chartModelSeries, animation: animation)
    }
    
    ///  Function of refreshing whole chart view content after the chart has been rendered
    ///
    /// - Parameter aaChartModel: The instance object of AAChartModel
    public func aa_refreshChartWholeContentWithChartModel(_ aaChartModel: AAChartModel) {
        let aaOptions = aaChartModel.aa_toAAOptions()
        aa_refreshChartWholeContentWithChartOptions(aaOptions)
    }
}


// MARK: - Configure Chart View Content With AAOptions
@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
extension AAChartView {
    /// Function of drawing chart view
    ///
    /// - Parameter aaOptions: The instance object of AAOptions model
    public func aa_drawChartWithChartOptions(_ aaOptions: AAOptions) {
        if optionsJson == nil {
            configureOptionsJsonStringWithAAOptions(aaOptions)
            let path = BundlePathLoader()
                .path(forResource: "AAChartView",
                      ofType: "html",
                      inDirectory: "AAJSFiles.bundle")
            let urlStr = NSURL.fileURL(withPath: path!)
            let urlRequest = NSURLRequest(url: urlStr) as URLRequest
            load(urlRequest)
        } else {
            aa_refreshChartWholeContentWithChartOptions(aaOptions)
        }
    }
    
    /// Function of only refresh the chart data after the chart has been rendered
    /// Refer to https://api.highcharts.com/class-reference/Highcharts.Chart#update
    ///
    /// - Parameter chartOptionsSeries: chart options series  array
    /// - Parameter animation: enable animation effect or not
    public func aa_onlyRefreshTheChartDataWithChartOptionsSeries(_ chartOptionsSeries: [AASeriesElement], animation: Bool = true) {
        var seriesElementDicArr = [[String: Any]]()
        chartOptionsSeries.forEach { (aaSeriesElement) in
            seriesElementDicArr.append(aaSeriesElement.toDic())
        }
        
        let str = getJSONStringFromArray(array: seriesElementDicArr)
        let jsStr = "onlyRefreshTheChartDataWithSeries('\(str)','\(animation)');"
        safeEvaluateJavaScriptString(jsStr)
    }
    
    ///  Function of refreshing whole chart view content after the chart has been rendered
    ///
    /// - Parameter aaOptions: The instance object of AAOptions model
    public func aa_refreshChartWholeContentWithChartOptions(_ aaOptions: AAOptions) {
        configureOptionsJsonStringWithAAOptions(aaOptions)
        loadAllPluginsAndDrawChart()
    }
}


// MARK: - Additional update Chart View Content methods
@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
extension AAChartView {
    /// A common chart update function
    /// (you can update any chart element) to open, close, delete, add, resize, reformat, etc. elements in the chart.
    /// Refer to https://api.highcharts.com/highcharts#Chart.update
    ///
    /// It should be noted that when updating the array configuration,
    /// for example, when updating configuration attributes including arrays such as xAxis, yAxis, series, etc., the updated data will find existing objects based on id and update them. If no id is configured or passed If the id does not find the corresponding object, the first element of the array is updated. Please refer to this example for details.
    ///
    /// In a responsive configuration, the response of the different rules responsive.rules is actually calling chart.update, and the updated content is configured in chartOptions.
    ///
    /// - Parameter options: A configuration object for the new chart options as defined in the options section of the API.
    /// - Parameter redraw: Whether to redraw after updating the chart, the default is true
    public func aa_updateChart(options: AAObject, redraw: Bool) {
        let isOptionsClass: Bool = options is AAOptions
        let optionsDic = options.toDic()
        let finalOptionsDic: [String : Any]!
        
        if isOptionsClass == true {
            finalOptionsDic = optionsDic
        } else {
            var classNameStr = options.classNameString
            if classNameStr.contains(".") {
                classNameStr = classNameStr.components(separatedBy: ".")[1];
            }
            
            classNameStr = classNameStr.replacingOccurrences(of: "AA", with: "")
            
            //convert first character to be lowercase string
            let firstChar = classNameStr.prefix(1)
            let lowercaseFirstChar = firstChar.lowercased()
            let index = classNameStr.index(classNameStr.startIndex, offsetBy: 1)
            classNameStr = String(classNameStr.suffix(from: index))
            let finalClassNameStr = lowercaseFirstChar + classNameStr
            finalOptionsDic = [finalClassNameStr: optionsDic as Any]
        }
        
#if DEBUG
        let data = try? JSONSerialization.data(withJSONObject: finalOptionsDic as Any, options: .prettyPrinted)
        if data != nil {
            let prettyPrintedModelJson = String(data: data!, encoding: String.Encoding.utf8)
            print("""
                
                -----------📊🔄🖨 console log AAOptions JSON information of advanced updating 🖨🔄📊-----------:
                \(prettyPrintedModelJson!)
                
                """)
        }
#endif
        
        let optionsStr = getJSONStringFromDictionary(dictionary: finalOptionsDic)
        let jsStr = "updateChart('\(optionsStr)','\(redraw)')"
        safeEvaluateJavaScriptString(jsStr)
    }
    
    public func aa_addPointToChartSeriesElement(elementIndex: Int, options: Any) {
        aa_addPointToChartSeriesElement(
            elementIndex: elementIndex,
            options: options,
            shift: true
        )
    }
    
    public func aa_addPointToChartSeriesElement(
        elementIndex: Int,
        options: Any,
        shift: Bool
    ) {
        aa_addPointToChartSeriesElement(
            elementIndex: elementIndex,
            options: options,
            redraw: true,
            shift: shift,
            animation: true
        )
    }
    
    /// Add a new point to the data column after the chart has been rendered.
    /// The new point can be the last point, or it can be placed in the corresponding position given the X value (first, middle position, depending on the x value)
    /// Refer to https://api.highcharts.com/highcharts#Series.addPoint
    ///
    /// - Parameter elementIndex: The specific series element
    /// - Parameter options: The configuration of the data point can be a single value, indicating the y value of the data point; it can also be an array containing x and y values; it can also be an object containing detailed data point configuration. For detailed configuration, see series.data.
    /// - Parameter redraw: The default is true, whether to redraw the icon after the operation is completed. When you need to add more than one point, it is highly recommended to set redraw to false and manually call chart.redraw() to redraw the chart after all operations have ended.
    /// - Parameter shift: The default is false. When this property is true, adding a new point will delete the first point in the data column (that is, keep the total number of data points in the data column unchanged). This property is very useful in the inspection chart
    /// - Parameter animation: The default is true, which means that when adding a point, it contains the default animation effect. This parameter can also be passed to the object form containing duration and easing. For details, refer to the animation related configuration.
    public func aa_addPointToChartSeriesElement(
        elementIndex: Int,
        options: Any,
        redraw: Bool,
        shift: Bool,
        animation: Bool
    ) {
        var optionsStr = ""
        if options is Int || options is Float || options is Double {
            optionsStr = "\(options)"
        } else if options is [Any] {
            optionsStr = getJSONStringFromArray(array: options as! [Any])
        } else {
            let aaOption: AAObject = options as! AAObject
            optionsStr = aaOption.toJSON()
        }
        
        let javaScriptStr = "addPointToChartSeries('\(elementIndex)','\(optionsStr)','\(redraw)','\(shift)','\(animation)')"
        safeEvaluateJavaScriptString(javaScriptStr)
    }
    
    /// Add a new group of points to the data column after the chart has been rendered.
    ///
    public func aa_addPointsToChartSeriesArray(
        optionsArr: [Any],
        shift: Bool = true,
        animation: Bool = true
    ) {
        for (index, options) in optionsArr.enumerated() {
            aa_addPointToChartSeriesElement(
                elementIndex: index,
                options: options,
                redraw: false,
                shift: shift,
                animation: false
            )
        }
        
        aa_redraw(animation: animation)
    }
    
    /// Add a new series element to the chart after the chart has been rendered.
    /// Refer to https://api.highcharts.com/highcharts#Chart.addSeries
    ///
    /// - Parameter element: chart series element
    public func aa_addElementToChartSeries(element: AASeriesElement) {
        let elementJson = element.toJSON()
        let pureElementJsonStr = elementJson.aa_toPureJSString()
        let jsStr = "addElementToChartSeriesWithElement('\(pureElementJsonStr)')"
        safeEvaluateJavaScriptString(jsStr)
    }
    
    /// Remove a specific series element from the chart after the chart has been rendered.
    /// Refer to https://api.highcharts.com/highcharts#Series.remove
    ///
    /// - Parameter elementIndex: chart series element index
    public func aa_removeElementFromChartSeries(elementIndex: Int) {
        let jsStr = "removeElementFromChartSeriesWithElementIndex('\(elementIndex)')"
        safeEvaluateJavaScriptString(jsStr)
    }
    
    /// Show the series element content with index
    ///
    /// - Parameter elementIndex: elementIndex element index
    public func aa_showTheSeriesElementContentWithSeriesElementIndex(_ elementIndex: NSInteger) {
        let jsStr = "showTheSeriesElementContentWithIndex('\(elementIndex)');"
        safeEvaluateJavaScriptString(jsStr)
    }
    
    ///  Hide the series element content with index
    ///
    /// - Parameter elementIndex: element index
    public func aa_hideTheSeriesElementContentWithSeriesElementIndex(_ elementIndex: NSInteger) {
        let jsStr = "hideTheSeriesElementContentWithIndex('\(elementIndex)');"
        safeEvaluateJavaScriptString(jsStr as String)
    }
    
    ///  Evaluate JavaScript string function body
    ///
    /// - Parameter JSFunctionString: valid JavaScript function body string
    public func aa_evaluateJavaScriptStringFunction(_ JSFunctionString: String) {
        if optionsJson != nil {
            let pureJSFunctionStr = JSFunctionString.aa_toPureJSString()
            let jsFunctionNameStr = "evaluateTheJavaScriptStringFunction('\(pureJSFunctionStr)')"
            safeEvaluateJavaScriptString(jsFunctionNameStr)
        }
    }
    
    /// Update the X axis categories of chart
    /// Refer to https://api.highcharts.com/class-reference/Highcharts.Axis#setCategories
    ///
    /// - Parameters:
    ///   - categories: The X axis categories array
    ///   - redraw: Redraw whole chart or not
    public func aa_updateXAxisCategories(_ categories: [String], redraw: Bool = true) {
        let finalJSArrStr = categories.aa_toJSArray()
        let jsFunctionStr = "aaGlobalChart.xAxis[0].setCategories(\(finalJSArrStr),\(redraw));"
        safeEvaluateJavaScriptString(jsFunctionStr)
    }
    
    /// Update the X axis Extremes
    /// Refer to https://api.highcharts.com/class-reference/Highcharts.Axis#setExtremes
    ///
    /// - Parameters:
    ///   - min: X axis minimum
    ///   - max: X axis maximum
    public func aa_updateXAxisExtremes(min: Int, max: Int) {
        let jsStr = "aaGlobalChart.xAxis[0].setExtremes(\(min), \(max))"
        safeEvaluateJavaScriptString(jsStr)
    }
    
    /// Redraw chart view
    /// - Parameter animation: Have animation effect or not
    public func aa_redraw(animation: Bool = true) {
        let jsStr = "redrawWithAnimation('\(animation)')"
        safeEvaluateJavaScriptString(jsStr)
    }
    
#if os(iOS)
    /// Set the chart view content be adaptive to screen rotation with default animation effect
    public func aa_adaptiveScreenRotation() {
        let aaAnimation = AAAnimation()
            .duration(800)
            .easing(.easeOutQuart)
        aa_adaptiveScreenRotationWithAnimation(aaAnimation)
    }
    
    /// Set the chart view content be adaptive to screen rotation with custom animation effect
    /// Refer to https://api.highcharts.com/highcharts#Chart.setSize
    ///
    /// - Parameter animation: The instance object of AAAnimation
    public func aa_adaptiveScreenRotationWithAnimation(_ animation: AAAnimation) {
        NotificationCenter.default.addObserver(
            forName: UIDevice.orientationDidChangeNotification,
            object: nil,
            queue: nil) { [weak self] _ in
                //Delay execution by 0.01 seconds to prevent incorrect screen width and height obtained when the screen is rotated
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                    self?.aa_resizeChart(animation: animation)
                }
            }
    }
    
    public func aa_resizeChart(animation: AAAnimation) {
        let animationJsonStr = animation.toJSON()
        let jsFuncStr = "changeChartSize('\(frame.size.width)','\(frame.size.height)','\(animationJsonStr)')"
        safeEvaluateJavaScriptString(jsFuncStr)
    }
#endif
    
}


// MARK: - JSONSerialization
@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
extension AAChartView {
    
    private func getJSONStringFromDictionary(dictionary: [String: Any]) -> String {
        guard JSONSerialization.isValidJSONObject(dictionary) else {
            print("❌ Dictionary object is not valid JSON")
            return ""
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: dictionary, options: [])
            if let jsonString = String(data: data, encoding: .utf8) {
                return jsonString
            }
        } catch {
            print("❌ Error serializing dictionary to JSON: \(error.localizedDescription)")
        }
        return ""
    }
    
    private func getJSONStringFromArray(array: [Any]) -> String {
        guard JSONSerialization.isValidJSONObject(array) else {
            print("❌ Array object is not valid JSON")
            return ""
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: array, options: [])
            if let jsonString = String(data: data, encoding: .utf8) {
                return jsonString
            }
        } catch {
            print("❌ Error serializing array to JSON: \(error.localizedDescription)")
        }
        return ""
    }
    
    private func getDictionaryFromJSONString(jsonString: String) -> [String: Any] {
        guard let jsonData = jsonString.data(using: .utf8) else {
            print("❌ Failed to convert string to data")
            return [:]
        }
        
        do {
            if let dict = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String: Any] {
                return dict
            }
        } catch {
            print("❌ Error parsing JSON string to dictionary: \(error.localizedDescription)")
        }
        return [:]
    }
    
    private func getArrayFromJSONString(jsonString: String) -> [Any] {
        guard let jsonData = jsonString.data(using: .utf8) else {
            print("❌ Failed to convert string to data")
            return []
        }
        
        do {
            if let array = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [Any] {
                return array
            }
        } catch {
            print("❌ Error parsing JSON string to array: \(error.localizedDescription)")
        }
        return []
    }
}
