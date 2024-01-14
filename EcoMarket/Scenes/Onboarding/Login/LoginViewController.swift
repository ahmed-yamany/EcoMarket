//
//  LoginViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 10/01/2024.
//

import UIKit

class LoginViewController: UIViewController {

  // MARK: - Outlets
  @IBOutlet weak var emailTextField: CustomTextField!
  @IBOutlet weak var passwordTextField: CustomTextField!
  @IBOutlet weak var logoImage: UIImageView!
  @IBOutlet weak var wellcomeLabel: UILabel!
  @IBOutlet weak var messageLabel: UILabel!
  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var passwordLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViews()
  }
  
  // MARK: - Setup UI
  private func configureViews() {
    /// TextField UI
    emailTextField.setupRightImageView(image: AppImage.verifyImage ?? UIImage())
    passwordTextField.setupRightImageView(image: AppImage.verifyImage ?? UIImage())

    /// Images UI
    logoImage.image = AppImage.appLogo

    /// Labels UI
    wellcomeLabel.text = L10n.Login.wellcome
    messageLabel.text = L10n.Login.message
    emailLabel.text = L10n.Login.email
    passwordLabel.text = L10n.Login.password
  }
}
