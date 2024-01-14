//
//  CustomTextField.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 10/01/2024.
//

import UIKit

class CustomTextField: UITextField {
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupUnderLinedTextField()
  }

  // MARK: - Setup UnderLine
  func setupUnderLinedTextField() {
    let bottomLayer = CALayer()
    bottomLayer.frame = CGRect(x: 0, y: self.frame.height, width: self.frame.width - 24, height: 1)
    bottomLayer.backgroundColor = AppColor.textFieldUnderLine.cgColor
    self.layer.addSublayer(bottomLayer)
  }

  // MARK: - Adding Image To The Right Of TextField
  func setupRightImageView(image: UIImage) {
    self.rightViewMode = .always
    let rightView = UIImageView(frame: CGRect(x: self.frame.width - 36, y: self.frame.height / 2 - 10, width: 13, height: 13))
    rightView.tintColor = .black
    rightView.image = image
    self.addSubview(rightView)
  }
}
