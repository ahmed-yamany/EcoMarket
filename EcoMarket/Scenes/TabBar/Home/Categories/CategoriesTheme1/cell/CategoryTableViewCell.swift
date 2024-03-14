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
    func setup(categoryName: String, categoryDetail: (UIImage?, Int)) {
        categoryImage.image = categoryDetail.0
        self.categoryName.text = categoryName
        productCount.text = String(categoryDetail.1)
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
