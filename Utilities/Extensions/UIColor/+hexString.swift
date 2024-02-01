//
//  +hexString.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 30/01/2024.
//

import UIKit

public extension UIColor {
    convenience init?(hexString: String, alpha: CGFloat = 1.0) {
        var cleanedString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        //
        if cleanedString.hasPrefix("#") {
            cleanedString.remove(at: cleanedString.startIndex)
        }
        //
        var rgb: UInt64 = 0
        //
        Scanner(string: cleanedString).scanHexInt64(&rgb)
        //
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        //
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
