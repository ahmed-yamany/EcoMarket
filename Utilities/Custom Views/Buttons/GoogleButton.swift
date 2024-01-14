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
    setImage(AppImage.googleIcon, for: .normal)
  }
}
