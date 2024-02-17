//
//  CartTheme2CollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 29/01/2024.
//

import UIKit

class CartTheme2CollectionViewCell: UICollectionViewCell {
    // MARK: - Outlets
    //
    @IBOutlet weak var stapperView: StapperView!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    // MARK: - Data Setup Method
    
    /// Configures the cell with the provided product data.
    ///
    /// - Parameter product: The product model to be displayed.
    func setup(product: Cart2Model) {
        productName.text = product.name
        brandName.text = product.brand
        productPrice.text = product.price
        productImage.image = UIImage(named: product.image)
        configureUI()
    }
    
    // MARK: - UI Configuration
    
    /// Configures the initial UI settings for the cell.
    private func configureUI() {
        productImage.layer.cornerRadius = 12
        configureLabelsUI()
        configureButtonUI()
        setupStapperView()
    }
    
    /// Configures the appearance of labels (brand name, product price, and product name).
    private func configureLabelsUI() {
        // Labels Font
        brandName.font = .h3
        productPrice.font = .h3
        productName.font = .regular
        
        // Labels Color
        brandName.textColor = AppColor.primaryText
        productPrice.textColor = AppColor.primaryText
        productName.textColor = AppColor.socialButton
    }
    
    /// Configures the appearance of the delete button.
    private func configureButtonUI() {
        deleteButton.setTitle("", for: .normal)
        deleteButton.setImage(AppImage.delete, for: .normal)
    }
    
    private func setupStapperView() {
        stapperView.maximumValue = 100
        stapperView.backgroundColor = AppColor.backgroundColor
        stapperView.setTintColor(AppColor.primaryButton)
        stapperView.delegate = self
    }

    @IBAction func deleteButtonPressed(_ sender: Any) {
        print("Product Deleted")
    }
}

// MARK: - StapperDelegate
//
extension CartTheme2CollectionViewCell: StapperViewDelegate {
    func stapperView(_ stapper: StapperView, didSet value: Int) {
        print(value)
    }
}
