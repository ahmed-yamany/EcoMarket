//
//  CustomRoundedButton.swift
//  EcoTest
//
//  Created by Ibrahim Nasser Ibrahim on 24/01/2024.
//

import UIKit
import Combine

open class CustomRoundedButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        layer.cornerRadius = 20
        setTitleColor(.gray, for: .normal)
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
    }
}
