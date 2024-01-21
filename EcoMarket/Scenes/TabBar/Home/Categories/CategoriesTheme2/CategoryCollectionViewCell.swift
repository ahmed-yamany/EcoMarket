//
//  CategoryCollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 21/01/2024.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet weak var productCount: UILabel!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    
    // MARK: - Cell Configuration
       
       /// Configures the cell with data from the given category model.
       /// - Parameter category: The category model to display in the cell.
    func setup(category: CategoryModel) {
        categoryImage.image = UIImage(named: category.image)
        categoryName.text = category.name
        productCount.text = category.productNumber
        setupUI()
    }
    
    // MARK: - UI Configuration
        
        /// Applies additional UI configurations to the cell's subviews.
    func setupUI() {
        
        /// Image UI
        categoryImage.layer.cornerRadius = 15
        
        /// Labels UI
        categoryName.textColor = AppColor.primaryText
        categoryName.font = UIFont.h3
        productCount.textColor = AppColor.primaryText
        productCount.font = UIFont.regular
    }
}
