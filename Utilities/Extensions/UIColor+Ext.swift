//
//  UIColor+Ext.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 14/01/2024.
//
import UIKit

public extension UIColor {

    // MARK: - Initializers

    /// Creates a UIColor instance from RGB components.
    ///
    /// - Parameters:
    ///   - red: Red component (0 to 255).
    ///   - green: Green component (0 to 255).
    ///   - blue: Blue component (0 to 255).
    ///   - alpha: Opacity (0.0 to 1.0).
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        assert((0...255).contains(red) && (0...255).contains(green) && (0...255).contains(blue), "Invalid RGB component")
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: alpha
        )
    }

    /// Creates a UIColor instance from a hexadecimal color value.
    ///
    /// - Parameters:
    ///   - hex: Hexadecimal color value.
    ///   - alpha: Opacity (0.0 to 1.0).
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            alpha: alpha
        )
    }

    /// Creates a UIColor instance from a hexadecimal color string.
    ///
    /// - Parameter hexString: Hexadecimal color string (e.g., "#RRGGBB").
    convenience init(hexString: String) {
        // Remove "#" character and convert to UInt64
        guard let hexValue = UInt64(hexString.replacingOccurrences(of: "#", with: ""), radix: 16) else {
            // Return black for an invalid hex string
            self.init(red: 0, green: 0, blue: 0)
            return
        }

        // Extract RGB components from hex value
        self.init(
            red: Int((hexValue >> 16) & 0xFF),
            green: Int((hexValue >> 8) & 0xFF),
            blue: Int(hexValue & 0xFF)
        )
    }
}
