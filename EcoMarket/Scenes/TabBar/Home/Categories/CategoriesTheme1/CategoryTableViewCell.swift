//
//  CategoryTableViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 20/01/2024.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var productCount: UILabel!
    
     /// Configures the cell with data from the provided `CategoryModel`.
    func setup(category: CategoryModel) {
        categoryImage.image = UIImage(named: category.image)
        categoryName.text = category.name
        productCount.text = category.productNumber
        
        setupUI()
    }
    
    /// Configures the cell's UI, including background color, corner radius, text colors, and fonts.
    func setupUI() {
        /// StackView UI
        stackView.backgroundColor = AppColor.primaryText
        stackView.layer.cornerRadius = stackView.height / 2
        
        /// Labels UI
        categoryName.textColor = AppColor.secondaryText
        categoryName.font = UIFont.h3
        productCount.textColor = AppColor.secondaryText
        productCount.font = UIFont.regular
        
        /// Cell UI
        backgroundColor = .clear
        selectionStyle = .none
    }
}
