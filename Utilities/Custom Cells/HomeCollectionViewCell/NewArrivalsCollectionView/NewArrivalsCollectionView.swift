//
//  NewArrivalsCollectionView.swift
//  EcoMarket
//
//  Created by Mohamed Khaled on 24/01/2024.
//

import UIKit

class NewArrivalsCollectionView: UICollectionViewCell {
    
    // MARK: - Variables
    // Outlets for UI elements
        
    @IBOutlet private(set) weak var favoriteButton: UIButton!
    @IBOutlet private(set) weak var productImage: UIImageView!
    @IBOutlet private(set) weak var productTitle: UILabel!
    @IBOutlet private(set) weak var productDescription: UILabel!
    @IBOutlet private(set) weak var productPrice: UILabel!
    
    // MARK: - Lifecycle Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    // MARK: - Private Methods

    // Set up the initial UI configurations
    private func setupUI() {
        favoriteButton.layer.cornerRadius = 10
    }

    // Update the cell UI with data from the model
    func updateUI(_ model: ProductModel) {
        productImage.image = UIImage(named: model.image)
        productTitle.text = model.name
        productDescription.text = model.description
        productPrice.text = model.price
    }
}
