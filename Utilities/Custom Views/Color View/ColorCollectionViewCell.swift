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
    
    let imageView = UIImageView()
    
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
        contentView.layer.cornerRadius = 10
        
        contentView.addSubview(imageView)
        imageView.centerInSuperview()
        imageView.equalSizeConstraints(15)
        imageView.contentMode = .scaleAspectFit
    }
    
    // MARK: - Public Methods
    //
    func setupColor(_ color: UIColor) {
        contentView.backgroundColor = color
    }
    
    /// Updates the UI of the selected Cell and its Label
    func updateSelected() {
        imageView.image = UIImage(systemName: "checkmark")
        imageView.tintColor = .black
    }
    
    /// Updates the UI of the unselected Cell and its Label
    func updateUnSelected() {
        imageView.image = nil
    }
}
