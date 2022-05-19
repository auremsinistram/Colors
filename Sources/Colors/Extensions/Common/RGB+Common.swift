//
// RGB+Common.swift
//

import UIKit

public extension RGB {
    
    // MARK: - Public static func
    
    static func + (lhs: RGB, rhs: RGB) -> RGB {
        let dst = lhs.unitSegments
        let src = rhs.unitSegments
        let const = dst.a * (1.0 - src.a)
        let a = src.a + const
        if a == 0.0 {
            return RGB(r: 0, g: 0, b: 0, a: 0.0)
        }
        return RGB(
            r: Int(((src.r * src.a + dst.r * const) / a) * 255.0),
            g: Int(((src.g * src.a + dst.g * const) / a) * 255.0),
            b: Int(((src.b * src.a + dst.b * const) / a) * 255.0),
            a: a
        )
    }
    
    static func * (lhs: RGB, rhs: RGB) -> RGB {
        let dst = lhs.unitSegments
        let src = rhs.unitSegments
        let const = 1.0 - src.a
        return RGB(
            r: Int((src.r + dst.r * const) * 255.0),
            g: Int((src.g + dst.g * const) * 255.0),
            b: Int((src.b + dst.b * const) * 255.0),
            a: src.a + dst.a * const
        )
    }
    
    // MARK: - Public var
    
    var color: UIColor {
        return UIColor(
            red: CGFloat(r) / 255.0,
            green: CGFloat(g) / 255.0,
            blue: CGFloat(b) / 255.0,
            alpha: CGFloat(a)
        )
    }
    
    var hsl: HSL {
        let r = Float(self.r) / 255.0
        let g = Float(self.g) / 255.0
        let b = Float(self.b) / 255.0
        let cMax = max(max(r, g), b)
        let cMin = min(min(r, g), b)
        let delta = cMax - cMin
        let l = (cMax + cMin) / 2.0
        let s = delta == 0.0 ? 0.0 : delta / (1.0 - abs(2.0 * l - 1.0))
        var h: Float
        if delta == 0.0 {
            h = 0.0
        } else if cMax == r {
            h = 60.0 * ((g - b) / delta).truncatingRemainder(dividingBy: 6.0)
        } else if cMax == g {
            h = 60.0 * ((b - r) / delta + 2.0)
        } else {
            h = 60.0 * ((r - g) / delta + 4.0)
        }
        if h < 0.0 {
            h += 360.0
        }
        return HSL(h: h, s: s, l: l, a: a)
    }
    
    var hsv: HSV {
        let r = Float(self.r) / 255.0
        let g = Float(self.g) / 255.0
        let b = Float(self.b) / 255.0
        let cMax = max(max(r, g), b)
        let cMin = min(min(r, g), b)
        let delta = cMax - cMin
        let s = cMax == 0.0 ? 0.0 : delta / cMax
        var h: Float
        if delta == 0.0 {
            h = 0.0
        } else if cMax == r {
            h = 60.0 * ((g - b) / delta).truncatingRemainder(dividingBy: 6.0)
        } else if cMax == g {
            h = 60.0 * ((b - r) / delta + 2.0)
        } else {
            h = 60.0 * ((r - g) / delta + 4.0)
        }
        if h < 0.0 {
            h += 360.0
        }
        return HSV(h: h, s: s, v: cMax, a: a)
    }
    
    var unitSegments: (r: Float, g: Float, b: Float, a: Float) {
        return (
            Float(r) / 255.0,
            Float(g) / 255.0,
            Float(b) / 255.0,
            a
        )
    }
}
