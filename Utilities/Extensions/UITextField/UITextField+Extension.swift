//
//  UITextField+Extension.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 25/02/2024.
//

import UIKit
import Combine

extension UITextField {
    var textFieldDidChange: AnyPublisher < String, Never> {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap({($0.object as? UITextField)?.text})
            .eraseToAnyPublisher()
    }
    
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
    
    func setValid() {
            layer.borderColor = UIColor.green.cgColor
            layer.borderWidth = 1.0
        }
        
        func setInvalid() {
            layer.borderColor = UIColor.red.cgColor
            layer.borderWidth = 1.0
        }
}
