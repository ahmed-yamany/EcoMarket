//
//  text.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 12/01/2024.
//

import UIKit

class SecuiredTextField: CustomTextField {
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupSecuiredImageView()
  }

/// Adding secuired image to the rigth of text field with an action
  func setupSecuiredImageView() {
    self.rightViewMode = .always
    let rightView = UIImageView(frame: CGRect(x: self.frame.width - 36, y: self.frame.height / 2 - 10, width: 13, height: 13))
    rightView.tintColor = .black
    rightView.image = AppImage.eyeSlash
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        rightView.isUserInteractionEnabled = true
        rightView.addGestureRecognizer(tapGestureRecognizer)
    self.addSubview(rightView)
  }

/// What will happen when tapping the right image of the text field
  @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
    isSecureTextEntry = false
    if let imageView = tapGestureRecognizer.view as? UIImageView {
      imageView.image = UIImage(systemName: "eye")
    }
  }
}
