//
//  CategoriesCollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 17/02/2024.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    //
    @IBOutlet weak var categoryName: UILabel!
    
    // MARK: - Lifecycle Methods
    //
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    // MARK: - Configuration
    //
    func setup(category: String, isSelected: Bool) {
        categoryName.text = category
        selected(isSelected: isSelected)
    }
    
    // MARK: - Private Methods
    //
    private func configureUI() {
        layer.cornerRadius = 15
        backgroundColor = AppColor.backgroundColor
        layer.borderWidth = 1
        layer.borderColor = AppColor.primaryText.cgColor
        categoryName.font = .medium
        categoryName.textColor = AppColor.primaryText
    }
    
    func selected(isSelected: Bool) {
        if isSelected {
            backgroundColor = AppColor.primaryText
            categoryName.textColor = AppColor.secondaryText
        } else {
            backgroundColor = AppColor.backgroundColor
            layer.borderWidth = 1
            categoryName.textColor = AppColor.primaryText
        }
    }
}
