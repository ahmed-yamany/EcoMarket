//
//  PrimaryButton.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 10/01/2024.
//

import UIKit

class PrimaryButton: EcoMarketButton {
  override func setupButton() {
    super.setupButton()
    setTitleColor(.emMainTheme, for: .normal)
    backgroundColor = .emPrimaryButton
  }
}
