//
//  CustomRoundedButton.swift
//  EcoTest
//
//  Created by Ibrahim Nasser Ibrahim on 24/01/2024.
//

import UIKit
import Combine

open class CustomRoundedButton: UIButton {
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
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = AppColor.socialButton.cgColor
        
        setTitleColor(.gray, for: .normal)
        
        backgroundColor = AppColor.mainTheme
    }
}
