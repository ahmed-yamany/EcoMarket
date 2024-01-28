//
//  CustomColorButton.swift
//  EcoTest
//
//  Created by Ibrahim Nasser Ibrahim on 24/01/2024.
//

import UIKit
import Combine

open class CustomColorButton: UIButton {
    // MARK: - Initializer
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Setup Method
    //
    private func setup() {
        // Button UI
        layer.cornerRadius = 10
        layer.borderColor = UIColor.gray.cgColor
    }
}
