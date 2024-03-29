//
//  GoogleButton.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 10/01/2024.
//

import UIKit

class GoogleButton: SocialMediaButton {
    override func setupButton() {
        super.setupButton()
        title = L10n.Login.google
        setImage(AppImage.Auth.googleIcon, for: .normal)
        addAction(.init(handler: { [weak self] _ in self?.start()}), for: .touchUpInside)
    }
    
    func start() {
        print("Btngan")
    }
}
