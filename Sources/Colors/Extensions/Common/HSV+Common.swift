//
// HSV+Common.swift
//

import Foundation

public extension HSV {
    
    // MARK: - Public var
    
    var rgb: RGB {
        let c = v * s
        let x = c * (1.0 - abs((h / 60.0).truncatingRemainder(dividingBy: 2.0) - 1.0))
        let m = v - c
        var rgb: (r: Float, g: Float, b: Float)
        if 0.0 <= h && h < 60.0 {
            rgb = (c, x, 0.0)
        } else if 60.0 <= h && h < 120.0 {
            rgb = (x, c, 0.0)
        } else if 120.0 <= h && h < 180.0 {
            rgb = (0.0, c, x)
        } else if 180.0 <= h && h < 240.0 {
            rgb = (0.0, x, c)
        } else if 240.0 <= h && h < 300.0 {
            rgb = (x, 0.0, c)
        } else {
            rgb = (c, 0.0, x)
        }
        return RGB(
            r: Int((rgb.r + m) * 255.0),
            g: Int((rgb.g + m) * 255.0),
            b: Int((rgb.b + m) * 255.0),
            a: a
        )
    }
}
