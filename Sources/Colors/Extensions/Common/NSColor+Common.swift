//
// NSColor+Common.swift
//

#if os(macOS)

import Cocoa

public extension NSColor {
    
    // MARK: - Public var
    
    var rgb: RGB {
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0
        usingColorSpace(.sRGB)?.getRed(&r, green: &g, blue: &b, alpha: &a)
        return RGB(
            r: Int(r * 255.0),
            g: Int(g * 255.0),
            b: Int(b * 255.0),
            a: Float(a)
        )
    }
}

#endif
