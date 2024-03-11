//
//  AppleButton.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 10/01/2024.
//

import UIKit

class AppleButton: SocialMediaButton {
    override func setupButton() {
        super.setupButton()
        title = L10n.Login.apple
        setImage(AppImage.Auth.appleIcon, for: .normal)
    }
}
