//
//  CategoryTableViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 20/01/2024.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    //
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var productCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    /// Configures the cell with data from the provided `CategoryModel`.
    func setup(category: CategoryModel) {
        categoryImage.image = UIImage(named: category.image)
        categoryName.text = category.name
        productCount.text = category.productNumber
    }
    
    /// Configures the cell's UI, including background color, corner radius, text colors, and fonts.
    func setupUI() {
        // StackView UI
        stackView.backgroundColor = AppColor.primaryText
        stackView.layer.cornerRadius = 70 / 2
        
        // Labels UI
        categoryName.textColor = AppColor.secondaryText
        categoryName.font = UIFont.h3
        productCount.textColor = AppColor.secondaryText
        productCount.font = UIFont.regular
        
        // Cell UI
        backgroundColor = .clear
        selectionStyle = .none
    }
}
