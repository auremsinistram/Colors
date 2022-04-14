//
// RGB+Common.swift
//

import UIKit

public extension RGB {
    
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
}
