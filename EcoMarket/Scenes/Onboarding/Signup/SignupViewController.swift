//
//  SignupViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 10/01/2024.
//

import UIKit

class SignupViewController: UIViewController {

  // MARK: - Outlets
  @IBOutlet weak var userNameTextField: CustomTextField!

  override func viewDidLoad() {
        super.viewDidLoad()
    configureViews()
    }
}

// MARK: - Configurations
extension SignupViewController {
  private func configureViews() {
    userNameTextField.setupRightImageView(image: AppImage.verifyImage ?? UIImage())
  }
}
