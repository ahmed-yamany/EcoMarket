//
//  SecondaryButtom.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 10/01/2024.
//
import UIKit

class FacebookButton: EcoMarketButton {
    override func setupButton() {
        super.setupButton()
        backgroundColor = AppColor.secondaryButton
        setImage(AppImage.Auth.facebookIcon, for: .normal)
        tintColor = AppColor.mainTheme
        title = L10n.Login.facebook
    }
}
