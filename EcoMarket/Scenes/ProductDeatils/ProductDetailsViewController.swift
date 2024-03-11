//
//  ProductDetailsViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 24/01/2024.
//

import UIKit
import Combine
class ProductDetailsViewController: UIViewController {
    
    // MARK: - Properties
    let viewModel: ProductDetailViewModel
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Outlets
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var reviewView: ProductReviewView!
    @IBOutlet weak var stapperView: StapperView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productBrandLabel: UILabel!
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    @IBOutlet weak var descriptionSubTitleLabel: UILabel!
    @IBOutlet weak var sizeViewTitleLabel: UILabel!
    @IBOutlet weak var sizeView: CustomSizeView!
    @IBOutlet weak var colorView: CustomColorView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var addToCartButton: PrimaryButton!
    
    // MARK: Initializer
    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bindUI()
    }
    
    // MARK: - Private Methods
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
    
    private func bindUI() {
        viewModel.$product.sink { [weak self] product in
            self?.productNameLabel.text = product.name
            self?.productBrandLabel.text = product.brandName
            self?.productImageView.image = product.image
        }.store(in: &cancellables)
        viewModel.$productDetail.sink { [weak self] productDetail in
            self?.reviewView.setReview(count: "\(productDetail.review)Review", review: productDetail.rating)
            self?.descriptionTitleLabel.text = "Description"
            self?.descriptionSubTitleLabel.text = productDetail.description
            self?.sizeViewTitleLabel.text = "sizes"
        }.store(in: &cancellables)
        viewModel.$availableSizes.sink { [weak self] sizes in
            self?.sizeView.setSizes(sizes)
        }
        .store(in: &cancellables)
        viewModel.$availableColors.sink { [weak self] colors in
            self?.colorView.setColors(colors)
        }
        .store(in: &cancellables)
        viewModel.$maxAvailableProduct.sink {[weak self] max in
            self?.stapperView.maximumValue = max
            self?.stapperView.minmumValue = 1
            
        }.store(in: &cancellables)
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
        colorView.colorDelegate = self
    }
    
    private func setupFavoriteButton() {
        favoriteButton.setImage(AppImage.ProductDetails.favourite, for: .normal)
        favoriteButton.setTitle("", for: .normal)
        favoriteButton.backgroundColor = AppColor.stapperBackground
        favoriteButton.layer.cornerRadius = 10
    }
    
    private func setupAddToCartButton() {
        addToCartButton.title = L10n.Product.Details.cart
        addToCartButton.setImage(AppImage.ProductDetails.cartIcon, for: .normal)
        addToCartButton.tintColor = .white
    }
    
    // MARK: - Buttons Action
    @IBAction func addToCartTapped(_ sender: PrimaryButton) {
        viewModel.addProductToCart()
    }
    
    @IBAction func addToFavoriteTapped(_ sender: Any) {
        print("Added")
    }
}

// MARK: - SizeViewDelegate
//
extension ProductDetailsViewController: SizeViewDelegate {
    func sizeView(_ sizeView: CustomSizeView, didSelect size: ProductSizes) {
        viewModel.selectedSize = size
    }
}

// MARK: - ColorViewDelegate
//
extension ProductDetailsViewController: CustomColorViewDelegate {
    func colorView(_ colorView: CustomColorView, didSelect color: UIColor) {
        viewModel.selectedColor = color
    }
}

// MARK: - StapperDelegate
//
extension ProductDetailsViewController: StapperViewDelegate {
    func stapperView(_ stapper: StapperView, didSet value: Int) {
        print(value)
    }
}
