//
//  PrroductCollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 27/01/2024.
//

import UIKit

protocol CustomProductDetailsViewCellDelegate: AnyObject {
    func addToCart(_ cell: CustomProductDetailsCollectionViewCell, product: CustomProductDetails)
    func updateCount(_ cell: CustomProductDetailsCollectionViewCell, for product: CustomProductDetails?, with count: Int)
}

class CustomProductDetailsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var productColor: UIView!
    @IBOutlet weak var productSize: UILabel!
    @IBOutlet weak var stapperView: StapperView!
    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var addToCartButton: UIButton!
    
    weak var delegate: CustomProductDetailsViewCellDelegate?
    var cartProduct: CustomProductDetails?
    
    // MARK: - Data Setup Method
    func setup(cart: (Product, CustomProductDetails), delegate: CustomProductDetailsViewCellDelegate?) {
        let product = cart.0
        let cartProduct = cart.1
        self.cartProduct = cartProduct
        productName.text = product.name
        brandName.text = product.brandName
        productPrice.text = String(product.price)
        productImage.image = product.image
        productSize.text = "Size: \(cartProduct.selectedSize.rawValue.uppercased())"
        productColor.backgroundColor = cartProduct.selectedColor
        configureUI()
        self.delegate = delegate
        stapperView.minmumValue = cartProduct.count
        if cart.1.isFavorite {
            stapperView.isHidden = true
        } else {
            addToCartButton.isHidden = true
        }
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
        configureAddToCartButtonUI()
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
        stapperView.backgroundColor = AppColor.stapperBackground
        stapperView.setTintColor(AppColor.primaryButton)
        stapperView.delegate = self
    }
    
    private func configureAddToCartButtonUI() {
        addToCartButton.setTitle("Add to cart", for: .normal)
        addToCartButton.setTitleColor(.white, for: .normal)
        addToCartButton.layer.cornerRadius = 15
        addToCartButton.tintColor = .emBackground
        addToCartButton.backgroundColor = .emPrimaryButton
        if #available(iOS 15.0, *) {
            addToCartButton.configuration = nil
            addToCartButton.titleLabel?.font = .custom(size: 10, weight: .bold)
        }
    }
    
    @IBAction func addToCartButtonTapped(_ sender: Any) {
        guard let product = cartProduct else {
            Logger.log("Failed", category: \.default, level: .fault)
            return
        }
        print("Donne")
        delegate?.addToCart(self, product: product)
    }
}

// MARK: - StapperDelegate
extension CustomProductDetailsCollectionViewCell: StapperViewDelegate {
    func stapperView(_ stapper: StapperView, didSet value: Int) {
        delegate?.updateCount(self, for: cartProduct, with: value)
    }
}
