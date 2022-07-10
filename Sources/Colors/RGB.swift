//
// RGB.swift
//

import Foundation
import PropertyWrappers

public struct RGB: Codable, Hashable, CustomStringConvertible {
    
    // MARK: - Private enum
    
    private enum Key: CodingKey {
        
        case hex, a
    }
    
    // MARK: - Public var
    
    @Range(0...255)
    public var r: Int
    
    @Range(0...255)
    public var g: Int
    
    @Range(0...255)
    public var b: Int
    
    @Range(0.0...1.0)
    public var a: Float
    
    public var hex: String {
        return String(format: "%06X", r << 16 | g << 08 | b << 00)
    }
    
    // MARK: - CustomStringConvertible
    
    public var description: String {
        return "(\(r), \(g), \(b), \(100.0 * a)%)"
    }
    
    // MARK: - Public init
    
    public init(r: Int, g: Int, b: Int, a: Float = 1.0) {
        self.r = r
        self.g = g
        self.b = b
        self.a = a
    }
    
    public init(hex: String, a: Float = 1.0) {
        var rgb = UInt64()
        Scanner(string: hex).scanHexInt64(&rgb)
        let r = Int(rgb >> 16 & 0xff)
        let g = Int(rgb >> 08 & 0xff)
        let b = Int(rgb >> 00 & 0xff)
        self.init(r: r, g: g, b: b, a: a)
    }
    
    // MARK: - Codable
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        let hex = try container.decode(String.self, forKey: .hex)
        let a = try container.decode(Float.self, forKey: .a)
        self.init(hex: hex, a: a)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        try container.encode(hex, forKey: .hex)
        try container.encode(a, forKey: .a)
    }
    
    // MARK: - Hashable
    
    public static func == (lhs: RGB, rhs: RGB) -> Bool {
        return lhs.r == rhs.r && lhs.g == rhs.g && lhs.b == rhs.b && lhs.a == rhs.a
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(r)
        hasher.combine(g)
        hasher.combine(b)
        hasher.combine(a)
    }
}
