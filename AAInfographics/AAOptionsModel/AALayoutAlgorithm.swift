//
//  AALayoutAlgorithm.swift
//  AAInfographics-ProDemo
//
//  Created by AnAn on 2020/11/10.
//


public class AALayoutAlgorithm: AAObject {
    public var gravitationalConstant: Any?
    public var splitSeries: Bool?
    public var seriesInteraction: Bool?
    public var dragBetweenSeries: Bool?
    public var parentNodeLimit: Bool?
    
    @discardableResult
    public func gravitationalConstant(_ prop: Any?) -> AALayoutAlgorithm {
        gravitationalConstant = prop
        return self
    }
    
    @discardableResult
    public func splitSeries(_ prop: Bool?) -> AALayoutAlgorithm {
        splitSeries = prop
        return self
    }
    
    @discardableResult
    public func seriesInteraction(_ prop: Bool?) -> AALayoutAlgorithm {
        seriesInteraction = prop
        return self
    }
    
    @discardableResult
    public func dragBetweenSeries(_ prop: Bool?) -> AALayoutAlgorithm {
        dragBetweenSeries = prop
        return self
    }
    
    @discardableResult
    public func parentNodeLimit(_ prop: Bool?) -> AALayoutAlgorithm {
        parentNodeLimit = prop
        return self
    }
    
    public override init() {
        
    }
    
}
