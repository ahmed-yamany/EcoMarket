//
//  AddressCollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 27/03/2024.
//

import UIKit

class AddressCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var locationIcon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    func setup(address: Address) {
        nameLabel.text = "Name: \(address.name)"
        addressLabel.text = "Address: \(address.address)"
        phoneLabel.text = "Phone: \(address.number)"
    }
    
    private func configureUI() {
        clipsToBounds = false
        locationIcon.image = AppImage.Icon.location
        configureContainerView()
        configureLabelsUI()
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
    
    private func configureLabelsUI() {
        nameLabel.textColor = .emPrimaryText
        nameLabel.font = .h3
        
        addressLabel.textColor = .emSocialButton
        addressLabel.font = .medium
        
        phoneLabel.textColor = .emPrimaryText
        phoneLabel.font = .medium
    }
}
