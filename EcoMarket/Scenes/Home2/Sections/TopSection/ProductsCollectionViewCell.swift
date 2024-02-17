//
//  ProductsCollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 23/01/2024.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    //
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var productImage: UIImageView!

    // MARK: - Cell Configuration
    //
    /// Configures the cell with data from the given product model.
    /// - Parameter product: The product model to display in the cell.
    func setup(product: ProductModel) {
        productImage.image = UIImage(named: product.image)
        productName.text = product.name
        brandName.text = product.brand
        productPrice.text = product.price
        
        setupUI()
    }
    
    // MARK: - UI Configuration
    //
    /// Applies additional UI configurations to the cell's subviews.
    private func setupUI() {
        // ImageUI
        productImage.layer.cornerRadius = 15
        
        // Button UI
        favouriteButton.setTitle("", for: .normal)
        favouriteButton.setImage(AppImage.Icon.loveButton, for: .normal)
        favouriteButton.tintColor = AppColor.primaryButton
        
        // Labels UI
        brandName.font = .h3
        productName.font = .regular
        productPrice.font = .h3
        brandName.textColor = AppColor.primaryText
        productName.textColor = AppColor.socialButton
        productPrice.textColor = AppColor.primaryText
    }
    
    @IBAction func favouriteButtonTapped(_ sender: Any) {
        print("Added to favourites")
    }
}
