//
//  SecondaryButtom.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 10/01/2024.
//
import UIKit

class SecondaryButton: EcoMarketButton {
  override func setupButton() {
    super.setupButton()
    backgroundColor = AppColor.secondaryButton
    setImage(.iconFacebook, for: .normal)
    tintColor = AppColor.mainTheme
  }
}
