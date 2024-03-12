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
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var productColor: UIView!
    @IBOutlet weak var productSize: UILabel!
    @IBOutlet weak var stapperView: StapperView!
    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    // MARK: - Data Setup Method
    func setup(cart: (Product, CartProduct)) {
        let product = cart.0
        let cartProduct = cart.1
        productName.text = product.name
        brandName.text = product.brandName
        productPrice.text = String(product.price)
        productImage.image = product.image
        productSize.text = "Size: \(cartProduct.selectedSize.rawValue.uppercased())"
        productColor.backgroundColor = cartProduct.selectedColor
        configureUI()
        stapperView.minmumValue = cartProduct.count
        productPrice.text = String(cartProduct.count)
    }
    
    // MARK: - UI Configuration
    private func configureUI() {
        clipsToBounds = false
        backgroundColor = .clear
        productImage.layer.cornerRadius = 8
        productColor.layer.cornerRadius = 5
        colorLabel.text = "Color:"
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
        productSize.font = .regular
        colorLabel.font = .regular
        
        // Labels Color
        brandName.textColor = AppColor.primaryText
        productPrice.textColor = AppColor.primaryText
        productName.textColor = AppColor.socialButton
        productSize.textColor = AppColor.socialButton
        colorLabel.textColor = AppColor.socialButton
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
//        stapperView.maximumValue = 100
        stapperView.backgroundColor = AppColor.stapperBackground
        stapperView.setTintColor(AppColor.primaryButton)
        stapperView.delegate = self
    }
}

// MARK: - StapperDelegate
extension CartProductCollectionViewCell: StapperViewDelegate {
    func stapperView(_ stapper: StapperView, didSet value: Int) {
        print(value)
    }
}
