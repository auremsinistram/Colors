//
// HSL.swift
//

import Foundation
import PropertyWrappers

public struct HSL: CustomStringConvertible {
    
    // MARK: - Public var
    
    @Range(0.0...360.0, true)
    public var h: Float
    
    @Range(0.0...1.0)
    public var s: Float
    
    @Range(0.0...1.0)
    public var l: Float
    
    @Range(0.0...1.0)
    public var a: Float
    
    // MARK: - CustomStringConvertible
    
    public var description: String {
        return "(\(h)°, \(100.0 * s)%, \(100.0 * l)%, \(100.0 * a)%)"
    }
    
    // MARK: - Public init
    
    public init(h: Float, s: Float, l: Float, a: Float = 1.0) {
        self.h = h
        self.s = s
        self.l = l
        self.a = a
    }
}
