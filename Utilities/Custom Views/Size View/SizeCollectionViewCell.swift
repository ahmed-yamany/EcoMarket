//
//  CustomRoundedButton.swift
//  EcoTest
//
//  Created by Ibrahim Nasser Ibrahim on 24/01/2024.
//

import UIKit
import Combine
import MakeConstraints

open class SizeCollectionViewCell: UICollectionViewCell {
    
    let label = UILabel()
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
    
    // MARK: - Setup
    //
    private func setup() {
        // Button UI
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = AppColor.socialButton.cgColor
        
        // Label
        addSubview(label)
        label.centerInSuperview()
        
        // Font
        label.font = .medium
    }
    
    // MARK: - Public Methods
    //
    func setupTitle(_ text: String) {
        label.text = text
    }
    
    /// Updates the UI of the selected Cell and its Label
    func updateSelected(color: UIColor) {
        backgroundColor = color
        label.textColor = .white
    }
    
    /// Updates the UI of the unselected Cell and its Label
    func updateUnSelected(color: UIColor) {
        backgroundColor = color
        label.textColor = .gray
    }
}
