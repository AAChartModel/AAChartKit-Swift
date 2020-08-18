//
//  AALabels.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/7/17.
//  Copyright © 2019 An An. All rights reserved.
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
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

import Foundation

public class AALabels: AAObject {
    public var align: String? // Alignment of axis labels. Available values ​​are "left", "center", and "right". The default value is intelligently judged based on the position of the coordinate axis (position in the chart), that is, the rotation angle of the label. The default is: center.
    public var autoRotation: Any? // Only valid for horizontal axis, allowing to automatically rotate the angle of the axis label when preventing axis labels from overlapping. When there is enough space, the axis labels will not be rotated. When the chart becomes smaller (mainly the width becomes smaller), the axis labels start to rotate by the corresponding angle, and then the spaced axis labels are deleted in order and try to rotate the angle in the array. You can turn off axis label rotation by setting this parameter to false (this will cause the labels to wrap automatically). The default is: [-45].
    public var autoRotationLimit: Float? // When the width of each category is much larger than the value of this parameter (pixels), the axis labels will not be automatically rotated, but the axis labels will be displayed in a new line. When the axis label contains multiple short words, displaying the axis label in a new line can make the axis label have enough space, so it is very meaningful to set a reasonable automatic rotation lower limit. The default is: 80.
    public var distance: Float? // Only valid for polar maps, defines the distance between the week label and the edge of the drawing area. The default is: 15.
    public var enabled: Bool? // Whether axis labels are displayed. The default is: true.
    public var format: String? /// Axis format string. The default is: {value}.
    public var formatter: String? // The axis format string. The default is: {value}.
    public var padding: Float? // The inner spacing of the axis labels, which is used to ensure that there is a gap between the axis labels. The default is: 5.
    public var rotation: Float? // The rotation angle of the axis label The default is: 0.
    public var staggerLines: Int? // Only valid for the horizontal axis, define the number of lines displayed on the axis label.
    public var step: Int? // Display multiple labels of n. For example, setting to 2 means that the labels are displayed one axis label apart. By default, in order to avoid the axis labels being overwritten, this parameter is automatically calculated according to the situation. You can prevent automatic calculations by setting this parameter to 1.
    public var style: AAStyle? // CSS style for axis labels
    public var x: Float? // The horizontal offset from the axis axis tick marks. The default is: 0.
    public var y: Float? // The vertical flat offset from the axis axis tick marks. The default is: null.
    public var useHTML: Bool? // HTML rendering
    
    @discardableResult
    public func align(_ prop: String) -> AALabels {
        align = prop
        return self
    }
    
    @discardableResult
    public func autoRotation(_ prop: Any) -> AALabels {
        autoRotation = prop
        return self
    }
    
    @discardableResult
    public func autoRotationLimit(_ prop: Float) -> AALabels {
        autoRotationLimit = prop
        return self
    }
    
    @discardableResult
    public func distance(_ prop: Float) -> AALabels {
        distance = prop
        return self
    }
    
    @discardableResult
    public func enabled(_ prop: Bool?) -> AALabels {
        enabled = prop
        return self
    }
    
    @discardableResult
    public func format(_ prop: String) -> AALabels {
        format = prop
        return self
    }
    
    @discardableResult
    public func formatter(_ prop: String) -> AALabels {
        formatter = prop.aa_toPureJSString()
        return self
    }
    
    @discardableResult
    public func padding(_ prop: Float) -> AALabels {
        padding = prop
        return self
    }
    
    @discardableResult
    public func rotation(_ prop: Float) -> AALabels {
        rotation = prop
        return self
    }
    
    @discardableResult
    public func staggerLines(_ prop: Int) -> AALabels {
        staggerLines = prop
        return self
    }
    
    @discardableResult
    public func step(_ prop: Int) -> AALabels {
        step = prop
        return self
    }
    
    @discardableResult
    public func style(_ prop: AAStyle) -> AALabels {
        style = prop
        return self
    }
    
    @discardableResult
    public func x(_ prop: Float) -> AALabels {
        x = prop
        return self
    }
    
    @discardableResult
    public func y(_ prop: Float) -> AALabels {
        y = prop
        return self
    }
    
    @discardableResult
    public func useHTML(_ prop: Bool) -> AALabels {
        useHTML = prop
        return self
    }
    
    public override init() {
        
    }
}
