//
//  FooterCollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 08/02/2024.
//

import UIKit

protocol FooterCollectionViewCellDelegate: AnyObject {
    func didTapLogOut()
}

class FooterCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var logoutButton: UIButton!
    
    weak var delegate: FooterCollectionViewCellDelegate?
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLogOutButtonUI()
    }
    
    // MARK: - UI Configuration
    private func configureLogOutButtonUI() {
        logoutButton.setTitle(L10n.Logout.title, for: .normal)
        logoutButton.setImage(AppImage.Auth.logout, for: .normal)
        logoutButton.backgroundColor = AppColor.primaryButton
        logoutButton.setTitleColor(AppColor.secondaryText, for: .normal)
        logoutButton.layer.cornerRadius = 10
        if #available(iOS 15.0, *) {
            logoutButton.configuration = nil
            logoutButton.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 20)
            logoutButton.titleLabel?.font = .medium
            logoutButton.tintColor = AppColor.backgroundColor
        }
    }
    
    // MARK: - Actions
    @IBAction func logoutPressed(_ sender: UIButton) {
        self.delegate?.didTapLogOut()
    }
}
