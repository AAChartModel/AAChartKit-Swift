//
//  AAChartView+ScreenRotation.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2025/4/24.
//  Copyright © 2025 An An. All rights reserved.
//

import AAInfographics
import UIKit

extension AAChartView {
    
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
        //        let jsFuncStr = "changeChartSize('\(frame.size.width)','\(frame.size.height)','\(animationJsonStr)')"
        let jsFuncStr =
                """
                function changeChartSize(receivedWidth, receivedHeight, receivedAnimation) {
                    let container = document.getElementById('container');
                    container.style.width = receivedWidth;
                    container.style.height = receivedHeight;
                    
                    let aaAnimation;
                    if (receivedAnimation) {
                        // Parse the received JSON string
                        aaAnimation = JSON.parse(receivedAnimation);
                        let animationEasingType = aaAnimation.easing;
                        aaAnimation.easing = configureTheChartAnimationEasingType(animationEasingType);
                    }
                    
                    aaGlobalChart.setSize(receivedWidth, receivedHeight, aaAnimation);
                }
                
                // Pass animationJsonStr as a string literal using single quotes
                changeChartSize(\(frame.size.width), \(frame.size.height), \(animationJsonStr))
                """
        safeEvaluateJavaScriptString(jsFuncStr)
    }
    
    private func safeEvaluateJavaScriptString (_ jsString: String) {
        evaluateJavaScript(jsString, completionHandler: { (item, error) in
#if DEBUG
            if error != nil {
                let objcError = error! as NSError
                let errorUserInfo = objcError.userInfo
                
                let errorInfo =
                """
                
                ☠️☠️💀☠️☠️WARNING!!!!!!!!!!!!!!!!!!!! JS WARNING !!!!!!!!!!!!!!!!!!!!WARNING☠️☠️💀☠️☠️
                ------------------------------------------------------------------------------------------
                code = \(objcError.code);
                domain = \(objcError.domain);
                userInfo = {
                    NSLocalizedDescription = "\(errorUserInfo["NSLocalizedDescription"] ?? "")";
                    WKJavaScriptExceptionColumnNumber = \(errorUserInfo["WKJavaScriptExceptionColumnNumber"] ?? "");
                    WKJavaScriptExceptionLineNumber = \(errorUserInfo["WKJavaScriptExceptionLineNumber"] ?? "");
                    WKJavaScriptExceptionMessage = \(errorUserInfo["WKJavaScriptExceptionMessage"] ?? "");
                    WKJavaScriptExceptionSourceURL = \(errorUserInfo["WKJavaScriptExceptionSourceURL"] ?? "");
                }
                ------------------------------------------------------------------------------------------
                ☠️☠️💀☠️☠️WARNING!!!!!!!!!!!!!!!!!!!! JS WARNING !!!!!!!!!!!!!!!!!!!!WARNING☠️☠️💀☠️☠️
                
                """
                print(errorInfo)
            }
#endif
        })
    }
#endif
    
}
