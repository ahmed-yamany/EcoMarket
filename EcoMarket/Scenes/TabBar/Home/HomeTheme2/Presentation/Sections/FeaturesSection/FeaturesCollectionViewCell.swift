//
//  FeaturesCollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 17/02/2024.
//

import UIKit

protocol FeaturesCollectionViewCellDelegate: AnyObject {
    func featuresCell(_ cell: UICollectionViewCell, didTapped model: Product)
}

class FeaturesCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    //
    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var goToProductButton: UIButton!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    weak var delegate: FeaturesCollectionViewCellDelegate?
    var model: Product?
    // MARK: - Lifecycle Methods
    //
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    // MARK: - Configuration
    //
    func setup(product: Product, delegate: FeaturesCollectionViewCellDelegate?) {
        productImage.image = product.image
        productName.text = product.name
        brandName.text = product.brandName
        productPrice.text = "\(product.price)"
        self.delegate = delegate
        self.model = product
    }
    
    // MARK: - UI Configuration
    
    /// Configures the initial UI settings for the cell.
    private func configureUI() {
        backgroundColor = .clear
        clipsToBounds = false
        productImage.layer.cornerRadius = 8
        configureLabelsUI()
        configureContainerView()
        setupButtonUI()
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
    
    private func setupButtonUI() {
        goToProductButton.setTitle("", for: .normal)
        goToProductButton.setImage(AppImage.HomeTheme2.arrowButtonIcon, for: .normal)
    }
    
    @IBAction func goToProductButtonTapped(_ sender: Any) {
        guard let model = model else {
            Logger.log("could not wrap model", category: \.default, level: .error)
            return
        }
        delegate?.featuresCell(self, didTapped: model)
    }
}
