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
    @IBOutlet weak var reviewView: ReviewView!
    @IBOutlet weak var stapperView: StapperView!
    @IBOutlet weak var sizeView: CustomSizeView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var colorView: ColorView!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productBrand: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var addToCartButton: PrimaryButton!
    
    // MARK: - View Lifecycle
    //
    let product: Product
    
    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        
        productImage.image = product.uiImage
        sizeView.setSizes(product.sizes)
        colorView.setColors(product.uiColors)
        reviewView.setReview(count: "170 Review", review: 4.9)
    }
    
    // MARK: - Private Methods
    //
    /// UI Configuration
    private func configureUI() {
        setupSizeView()
        setupColorView()
        setupStapperView()
        productImage.maskCustomProductShape()
        
        setupLabelsUI()
        setupButtonsUI()
        setupdata()
    }
    
    private func setupStapperView() {
        stapperView.maximumValue = 100
        stapperView.backgroundColor = AppColor.secondaryBackground
        stapperView.setTintColor(AppColor.primaryButton)
        stapperView.delegate = self
    }
    
    private func setupLabelsUI() {
        // Labels Font
        productNameLabel.font = .h2
        productBrand.font = .regular
        titleLabel.font = .h2
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
        productNameLabel.text = Product.mockData.name
        productBrand.text = Product.mockData.brand
        titleLabel.text = Product.mockData.descriptionTitle
        subtitleLabel.text = Product.mockData.description
        sizeLabel.text = Product.mockData.sizeTitle
    }
    
    // MARK: - Setup Size and Color Views
    //
    private func setupSizeView() {
        sizeView.sizeDelegate = self
    }
    
    private func setupColorView() {
        colorView.delegate = self
    }
}

// MARK: - SizeViewDelegate
//
extension ProductDetailsViewController: SizeViewDelegate {
    func sizeView(didSelect size: String) {
        print(size)
    }
    
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

// MARK: - StapperDelegate
//
extension ProductDetailsViewController: StapperViewDelegate {
    func stapperView(_ stapper: StapperView, didSet value: Int) {
        print(value)
    }
}
