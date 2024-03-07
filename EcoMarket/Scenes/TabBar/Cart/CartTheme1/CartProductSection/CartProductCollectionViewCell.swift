//
//  PrroductCollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 27/01/2024.
//

import UIKit

class CartProductCollectionViewCell: UICollectionViewCell {
    // MARK: - Outlets
    //
    @IBOutlet weak var stapperView: StapperView!
    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    // MARK: - Data Setup Method
    
    /// Configures the cell with the provided product data.
    ///
    /// - Parameter product: The product model to be displayed.
    func setup(product: CartModel) {
        productName.text = product.name
        brandName.text = product.brand
        productPrice.text = product.price
        productImage.image = UIImage(named: product.image)
        configureUI()
    }
    
    // MARK: - UI Configuration
    
    /// Configures the initial UI settings for the cell.
    private func configureUI() {
        clipsToBounds = false
        backgroundColor = .clear
        productImage.layer.cornerRadius = 8
        configureLabelsUI()
        configureContainerView()
        setupStapperView()
    }
    
    /// Configures the appearance of labels (brand name, product price, and product name).
    private func configureLabelsUI() {
        // Labels Font
        brandName.font = .medium
        productPrice.font = .medium
        productName.font = .regular
        
        // Labels Color
        brandName.textColor = AppColor.primaryText
        productPrice.textColor = AppColor.primaryText
        productName.textColor = AppColor.socialButton
    }
    
    /// Configures the appearance of the container view, including shadows and corner radius.
    private func configureContainerView() {
        containerView.layoutMargins = .init(top: 10, left: 10, bottom: 10, right: 10)
        containerView.isLayoutMarginsRelativeArrangement = true
        
        // Adding a custom view to the container with shadow
        containerView.backgroundColor = AppColor.mainTheme
        containerView.layer.shadowColor = AppColor.primaryButton.cgColor
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowRadius = 5
        containerView.layer.cornerRadius = 20
    }
    
    private func setupStapperView() {
        stapperView.maximumValue = 100
        stapperView.backgroundColor = AppColor.stapperBackground
        stapperView.setTintColor(AppColor.primaryButton)
        stapperView.delegate = self
    }
}

// MARK: - StapperDelegate
//
extension CartProductCollectionViewCell: StapperViewDelegate {
    func stapperView(_ stapper: StapperView, didSet value: Int) {
        print(value)
    }
}
