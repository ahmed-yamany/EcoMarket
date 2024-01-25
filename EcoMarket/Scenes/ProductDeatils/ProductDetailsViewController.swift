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
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var colorView: ColorView!
    @IBOutlet weak var sizeView: CustomSizeView!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productBrand: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var addToCartButton: PrimaryButton!
    
    // MARK: - View Lifecycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSizeView()
        setupColorView()
        configureUI()
    }
    
    // MARK: - Private Methods
    //
    /// UI Configuration
    private func configureUI() {
        productImage.layer.cornerRadius = 15
        setupLabelsUI()
        setupButtonsUI()
        setupdata()
    }
    
    private func setupLabelsUI() {
        // Labels Font
        productName.font = .h2
        productBrand.font = .regular
        titleLabel.font = .h2
        subtitleLabel.font = .regular
        subtitleLabel.font = .regular
        sizeLabel.font = .h2

        // Labels TextColor
        productBrand.textColor = AppColor.socialButton
        subtitleLabel.textColor = AppColor.socialButton
        
    }
    
    private func setupButtonsUI() {
        // Add To Cart Button UI
        addToCartButton.title = L10n.Product.Details.cart
        addToCartButton.setImage(AppImage.cartIcon, for: .normal)
        addToCartButton.tintColor = .white
        
        // Favourite Button UI
        favouriteButton.setImage(AppImage.favIcon, for: .normal)
        favouriteButton.setTitle("", for: .normal)
    }
    
    // MARK: - Data Setup
    //
    private func setupdata() {
        productImage.image = ProductModel.mockData.image
        productName.text = ProductModel.mockData.name
        productBrand.text = ProductModel.mockData.brand
        titleLabel.text = ProductModel.mockData.descriptionTitle
        subtitleLabel.text = ProductModel.mockData.description
        sizeLabel.text = ProductModel.mockData.sizeTitle
    }
    
    // MARK: - Setup Size and Color Views
    //
    private func setupSizeView() {
        sizeView.setSizes(ProductSize.allCases.map { $0.rawValue })
        sizeView.defaultColor = AppColor.backgroundColor
        sizeView.selectedColor = AppColor.primaryButton
        sizeView.delegate = self
    }
    
    private func setupColorView() {
        colorView.setColors(ProductColor.allCases.map { $0.uiColor })
        colorView.delegate = self
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
    func colorView(_ sizeView: ColorView, didSelect color: UIColor) {
        print(color)
    }
}
