//
//  colorCollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 07/03/2024.
//

import UIKit
import Combine
import MakeConstraints

open class ColorCollectionViewCell: UICollectionViewCell {
    
    let button = ColorViewButton()
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
        layer.cornerRadius = 10
        
        // Label
        addSubview(button)
        button.fillSuperview()
    }
    
    // MARK: - Public Methods
    //
    func setupColor(_ color: UIColor) {
        button.backgroundColor = color
    }
    
    /// Updates the UI of the selected Cell and its Label
    func updateSelected() {
        button.setImage(AppImage.checkImage, for: .normal)
    }
    
    /// Updates the UI of the unselected Cell and its Label
    func updateUnSelected() {
        button.setImage(UIImage(), for: .normal)
    }
}
