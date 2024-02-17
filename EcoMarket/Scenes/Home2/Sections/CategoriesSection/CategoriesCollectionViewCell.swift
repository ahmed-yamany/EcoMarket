//
//  CategoriesCollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 17/02/2024.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    func setup(category: CategoriesModel, isSelected: Bool) {
        categoryName.text = category.name
        selected(isSelected: isSelected)
    }
    
    func configureUI() {
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

struct CategoriesModel {
    let name: String
}

extension CategoriesModel {
    static let mockData: [CategoriesModel] = [
        .init(name: "Dresses"),
        .init(name: "Jackets"),
        .init(name: "Jeans"),
        .init(name: "Shoese")
    ]
}
