//
//  PrroductCollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 27/01/2024.
//

import UIKit

class PrroductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(product: CartModel) {
        productName.text = product.name
        brandName.text = product.brand
        productPrice.text = product.price
        productImage.image = UIImage(named: product.image)
        configureUI()
    }
    
    private func configureUI() {
//        containerView.layoutMargins = .init(top: 10, left: 10, bottom: 10, right: 10)
//        containerView.isLayoutMarginsRelativeArrangement = true
        containerView.backgroundColor = AppColor.mainTheme
        containerView.layer.shadowColor = AppColor.primaryButton.cgColor
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowRadius = 15
        containerView.layer.cornerRadius = 25
        backgroundColor = .white
    }

}
