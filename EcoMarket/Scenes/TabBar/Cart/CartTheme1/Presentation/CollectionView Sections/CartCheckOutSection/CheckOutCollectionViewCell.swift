//
//  FooterCollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 27/01/2024.
//

import UIKit

protocol CheckOutCollectionViewCellDelegate: AnyObject {
    func didTapCheckout()
}

class CheckOutCollectionViewCell: UICollectionViewCell {
    // MARK: - Outlets
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var checkOutButton: PrimaryButton!
    
    weak var delegate: CheckOutCollectionViewCellDelegate?
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setup(totalPrice: String, productsCount: Int) {
        totalLabel.text = "Total (\(productsCount) items):"
        productPrice.text = "$\(totalPrice)"
    }
    
    // MARK: - UI Configuration
    
    /// Configures the initial UI settings for the cell.
    private func setupUI() {
        configureLabelsUI()
        configureButtonUI()
    }
    
    /// Configures the appearance of labels (total and price).
    private func configureLabelsUI() {
        // Total Label UI
        totalLabel.font = .medium
        totalLabel.textColor = AppColor.socialButton
        
        // Price Label UI
        productPrice.font = .h2
        productPrice.textColor = AppColor.primaryText
    }
    
    /// Configures the appearance of the checkout button.
    private func configureButtonUI() {
        checkOutButton.setTitle("Proceed to Checkout", for: .normal)
        checkOutButton.setTitleColor(AppColor.mainTheme, for: .normal)
        checkOutButton.layer.cornerRadius = 8
        checkOutButton.setImage(AppImage.Icon.arrow, for: .normal)
        checkOutButton.backgroundColor = AppColor.primaryButton
        
        // Set the semantic content attribute to force right-to-left layout
        checkOutButton.semanticContentAttribute = .forceRightToLeft
        
        if #available(iOS 15.0, *) {
            checkOutButton.configuration = nil
            checkOutButton.imageEdgeInsets = .init(top: 0, left: 130, bottom: 0, right: 0)
            checkOutButton.titleLabel?.font = .h3
            checkOutButton.tintColor = AppColor.mainTheme
        }
    }
    
    
    @IBAction func checkOutButtonTapped(_ sender: Any) {
        delegate?.didTapCheckout()
    }
}
