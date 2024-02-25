//
//  TopCollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 23/01/2024.
//

import UIKit

class TopProductCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    //
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var productImage: UIImageView!

    // MARK: - Cell Configuration
    func setup(product: Product) {
        productImage.image = product.image
        productName.text = product.name
        brandName.text = product.brandName
        productPrice.text = "\(product.price)"
        
        setupUI()
    }
    
    // MARK: - UI Configuration
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
