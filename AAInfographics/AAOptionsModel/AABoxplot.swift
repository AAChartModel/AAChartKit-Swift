//
// Created by AnAn on 2022/8/25.
//

import Foundation

public class AABoxplot: AAObject {
    public var boxDashStyle: String?
    public var fillColor: Any?
    public var lineWidth: Float?
    public var medianColor: String?
    public var medianDashStyle: String?
    public var medianWidth: Float?
    public var stemColor: String?
    public var stemDashStyle: String?
    public var stemWidth: Float?
    public var whiskerColor: String?
    public var whiskerDashStyle: String?
    public var whiskerLength: String?
    public var whiskerWidth: Float?

    @discardableResult
    public func boxDashStyle(_ prop: AAChartLineDashStyleType?) -> AABoxplot {
        boxDashStyle = prop?.rawValue
        return self
    }

    @discardableResult
    public func fillColor(_ prop: Any?) -> AABoxplot {
        fillColor = prop
        return self
    }

    @discardableResult
    public func lineWidth(_ prop: Float?) -> AABoxplot {
        lineWidth = prop
        return self
    }

    @discardableResult
    public func medianColor(_ prop: String?) -> AABoxplot {
        medianColor = prop
        return self
    }

    @discardableResult
    public func medianDashStyle(_ prop: AAChartLineDashStyleType?) -> AABoxplot {
        medianDashStyle = prop?.rawValue
        return self
    }

    @discardableResult
    public func medianWidth(_ prop: Float?) -> AABoxplot {
        medianWidth = prop
        return self
    }

    @discardableResult
    public func stemColor(_ prop: String?) -> AABoxplot {
        stemColor = prop
        return self
    }

    @discardableResult
    public func stemDashStyle(_ prop: AAChartLineDashStyleType?) -> AABoxplot {
        stemDashStyle = prop?.rawValue
        return self
    }

    @discardableResult
    public func stemWidth(_ prop: Float?) -> AABoxplot {
        stemWidth = prop
        return self
    }

    @discardableResult
    public func whiskerColor(_ prop: String?) -> AABoxplot {
        whiskerColor = prop
        return self
    }

    @discardableResult
    public func whiskerDashStyle(_ prop: AAChartLineDashStyleType?) -> AABoxplot {
        whiskerDashStyle = prop?.rawValue
        return self
    }

    @discardableResult
    public func whiskerLength(_ prop: String?) -> AABoxplot {
        whiskerLength = prop
        return self
    }

    @discardableResult
    public func whiskerWidth(_ prop: Float?) -> AABoxplot {
        whiskerWidth = prop
        return self
    }
    
    public override init() {
        
    }

}
