//
//  SocialMediaButton.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 13/01/2024.
//

import UIKit

class SocialMediaButton: EcoMarketButton {
    override func setupButton() {
        super.setupButton()
        setTitleColor(AppColor.primaryText, for: .normal)
        backgroundColor = AppColor.mainTheme
        layer.borderWidth = 1
        layer.borderColor = AppColor.socialButton.cgColor
        if #available(iOS 15.0, *) {
            configuration = nil
            imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 20)
            tintColor = AppColor.primaryButton
        }
    }
}
