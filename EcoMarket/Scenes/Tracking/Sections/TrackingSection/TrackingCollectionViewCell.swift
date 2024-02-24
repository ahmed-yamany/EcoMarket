//
//  TrackingCollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 23/02/2024.
//

import UIKit

class TrackingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var shippingStatus: UILabel!
    @IBOutlet weak var shippingArea: UILabel!
    @IBOutlet weak var shippingID: UILabel!
    @IBOutlet weak var transportImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureContainerStackView()
        configureLabelsUI()
    }

    func setup(shipping: Shipping) {
        transportImage.image = UIImage(named: shipping.transportImage)
        shippingID.text = shipping.shippingID
        shippingArea.text = shipping.shippingArea
        shippingStatus.text = shipping.shippingStatus
    }
    
    private func configureContainerStackView() {
        containerView.layoutMargins = .init(top: 20, left: 20, bottom: 20, right: 20)
        containerView.isLayoutMarginsRelativeArrangement = true
        
        // Adding a custom view to the container with shadow
        containerView.backgroundColor = AppColor.mainTheme
        containerView.layer.shadowColor = AppColor.primaryButton.cgColor
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowRadius = 5
        containerView.layer.cornerRadius = 20
    }
    
    private func configureLabelsUI() {
        shippingID.textColor = AppColor.primaryText
        shippingID.font = .h3
        
        shippingArea.textColor = AppColor.socialButton
        shippingArea.font = .medium
        
        shippingStatus.textColor = AppColor.primaryText
        shippingStatus.font = .h3
    }
}
