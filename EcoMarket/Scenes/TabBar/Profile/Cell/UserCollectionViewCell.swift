//
//  UserCollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 07/02/2024.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var userStackView: UIStackView!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    func setup(user: UserModel) {
        userImage.image = UIImage(named: user.image)
        userName.text = user.name
        userEmail.text = user.email
        setupUI()
        configureContainerView()
    }
    
    private func setupUI() {
        backgroundColor = .clear
        
        // Labels UI
        userName.font = .h2
        userEmail.font = .medium
        userName.textColor = AppColor.primaryText
        userEmail.textColor = AppColor.socialButton
        
        // Image UI
        userImage.layer.cornerRadius = 10
    }
    
    /// Configures the appearance of the container view, including shadows and corner radius.
        private func configureContainerView() {
            userStackView.layoutMargins = .init(top: 10, left: 10, bottom: 10, right: 10)
            userStackView.isLayoutMarginsRelativeArrangement = true
            
            // Adding a custom view to the container with shadow
            userStackView.backgroundColor = AppColor.mainTheme
            userStackView.layer.shadowColor = AppColor.primaryButton.cgColor
            userStackView.layer.shadowOffset = .zero
            userStackView.layer.shadowOpacity = 0.2
            userStackView.layer.shadowRadius = 4
            userStackView.layer.cornerRadius = 15
        }
}
