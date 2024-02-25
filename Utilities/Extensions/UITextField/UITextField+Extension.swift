//
//  UITextField+Extension.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 25/02/2024.
//

import UIKit

extension UITextField {
    func setPlaceholderColor(_ color: UIColor) {
        guard let placeholder = placeholder else { return }
        let attributes = [NSAttributedString.Key.foregroundColor: color]
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
    }
    
    func setPlaceholderFont(_ font: UIFont) {
        guard let placeholder = placeholder else { return }
        let attributes = [NSAttributedString.Key.font: font]
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
    }
}
