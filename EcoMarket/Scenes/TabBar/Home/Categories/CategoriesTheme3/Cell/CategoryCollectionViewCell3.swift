//
//  CategoryCollectionViewCell3.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 22/01/2024.
//

import UIKit

class CategoryCollectionViewCell3: UICollectionViewCell {

    // MARK: - Outlets
    //
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var productCount: UILabel!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    
    // MARK: - Cell Configuration
    //
    /// Configures the cell with data from the given category model.
    /// - Parameter category: The category model to display in the cell.
    func setup(categoryName: String, categoryDetail: (UIImage?, Int)) {
        categoryImage.image = categoryDetail.0
        self.categoryName.text = categoryName
        productCount.text = String(categoryDetail.1)
        setupUI()
    }
    
    // MARK: - UI Configuration
    //
    /// Applies additional UI configurations to the cell's subviews.
    func setupUI() {
        /// Image UI
        categoryImage.layer.cornerRadius = 16
        
        /// View UI
        bottomView.layer.cornerRadius = 16
        bottomView.backgroundColor = AppColor.mainTheme.withAlphaComponent(0.4)
        
        /// Labels UI
        categoryName.textColor = AppColor.primaryText
        categoryName.font = UIFont.h3
        productCount.textColor = AppColor.primaryText
        productCount.font = UIFont.regular
    }
}
