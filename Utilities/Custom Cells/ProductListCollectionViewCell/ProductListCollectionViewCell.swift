//
//  ProductListCollectionViewCell.swift
//  EcoMarket
//
//  Created by Mohamed Khaled on 13/01/2024.
//

import UIKit

class ProductListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Varables
    
    static let cellID = String(describing: ProductListCollectionViewCell.self)
    
    // MARK: - @IBOutlets
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var detailsButton: UIButton!
    
    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyStyling()
    }
    
    // MARK: - Apply Styling Method
    
    private func applyStyling() {
        productImage.layer.cornerRadius = 8
        detailsButton.layer.cornerRadius = 8
    }

}
