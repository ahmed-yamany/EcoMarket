//
//  ProductDetailsViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 24/01/2024.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    // MARK: - Outlets
    //
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var reviewView: ProductReviewView!
    @IBOutlet weak var stapperView: StapperView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productBrandLabel: UILabel!
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    @IBOutlet weak var descriptionSubTitleLabel: UILabel!
    @IBOutlet weak var sizeViewTitleLabel: UILabel!
    @IBOutlet weak var sizeView: CustomSizeView!
    @IBOutlet weak var colorView: ColorView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var addToCartButton: PrimaryButton!
    
    // MARK: - View Lifecycle
    //
    let product: ProductDetails
    
    init(product: ProductDetails) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        productNameLabel.text = product.name
        productBrandLabel.text = product.brand
        productImageView.image = product.uiImage
        sizeView.setSizes(product.sizes)
        colorView.setColors(product.uiColors)
        reviewView.setReview(count: "170 Review", review: 4.9)
        descriptionTitleLabel.text = product.descriptionTitle
        descriptionSubTitleLabel.text = product.description
        sizeViewTitleLabel.text = product.sizeTitle
    }
    
    // MARK: - Private Methods
    //
    /// UI Configuration
    private func configureUI() {
        view.backgroundColor = AppColor.backgroundColor
        productImageView.maskCustomProductShape()
        setupProductNameLabel()
        setupProductBrandLabel()
        setupDescriptionTitleLabel()
        setupDescriptionSubTitleLabel()
        setupSizeView()
        setupColorView()
        setupStapperView()
        setupFavoriteButton()
        setupAddToCartButton()
    }
    
    private func setupStapperView() {
        stapperView.maximumValue = 100
        stapperView.backgroundColor = AppColor.secondaryBackground
        stapperView.setTintColor(AppColor.primaryButton)
        stapperView.delegate = self
    }
    
    private func setupProductNameLabel() {
        productNameLabel.font = .h2
        productNameLabel.textColor = AppColor.primaryText
    }
    
    private func setupProductBrandLabel() {
        productBrandLabel.font = .regular
        productBrandLabel.textColor = AppColor.socialButton
    }
    
    private func setupDescriptionTitleLabel() {
        descriptionTitleLabel.font = .h2
        descriptionTitleLabel.textColor = AppColor.primaryText
    }
    
    private func setupDescriptionSubTitleLabel() {
        descriptionSubTitleLabel.font = .regular
        descriptionSubTitleLabel.textColor = AppColor.socialButton
    }
    
    private func setupSizeView() {
        sizeView.sizeDelegate = self
        sizeViewTitleLabel.font = .h2
        sizeViewTitleLabel.textColor = AppColor.primaryText
    }
    
    private func setupColorView() {
        colorView.delegate = self
    }
    
    private func setupFavoriteButton() {
        favoriteButton.setImage(AppImage.favIcon, for: .normal)
        favoriteButton.setTitle("", for: .normal)
    }
    
    private func setupAddToCartButton() {
        addToCartButton.title = L10n.Product.Details.cart
        addToCartButton.setImage(AppImage.cartIcon, for: .normal)
        addToCartButton.tintColor = .white
    }
}

// MARK: - SizeViewDelegate
//
extension ProductDetailsViewController: SizeViewDelegate {
    func sizeView(_ sizeView: CustomSizeView, didSelect size: String) {
        print(size)
    }
}

// MARK: - ColorViewDelegate
//
extension ProductDetailsViewController: ColorViewDelegate {
    func colorView(_ sizeView: ColorView, didSelect color: UIColor?) {
        print(color ?? .red)
    }
}

// MARK: - StapperDelegate
//
extension ProductDetailsViewController: StapperViewDelegate {
    func stapperView(_ stapper: StapperView, didSet value: Int) {
        print(value)
    }
}
