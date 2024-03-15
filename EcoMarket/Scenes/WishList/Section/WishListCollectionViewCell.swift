//
//  WishListCollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 11/03/2024.
//

import UIKit

class WishListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    // MARK: - Data Setup Method
    func setup(product: Product) {
        productName.text = product.name
        brandName.text = product.brandName
        productPrice.text = String(product.price)
        productImage.image = product.image
    }
    
    // MARK: - UI Configuration
    private func configureUI() {
        clipsToBounds = false
        backgroundColor = .clear
        productImage.layer.cornerRadius = 8
        configureLabelsUI()
        configureContainerView()
        configureAddToCartButtonUI()
    }
    
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
    
    private func configureAddToCartButtonUI() {
        addToCartButton.setTitle("Add to cart", for: .normal)
        addToCartButton.setTitleColor(.white, for: .normal)
        addToCartButton.layer.cornerRadius = 20
        addToCartButton.tintColor = .emBackground
        addToCartButton.backgroundColor = .emPrimaryButton
        if #available(iOS 15.0, *) {
            addToCartButton.configuration = nil
            addToCartButton.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .bold)
        }
    }
}
