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
  @IBOutlet weak var logoImage: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  @IBOutlet weak var usernameLabel: UILabel!
  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var passwordLabel: UILabel!
  @IBOutlet weak var confirmPasswordLabel: UILabel!
  @IBOutlet weak var termsLabel: UILabel!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    configureViews()
    }
}

// MARK: - Configurations
extension SignupViewController {
  private func configureViews() {
    /// TextFeild UI
    userNameTextField.setupRightImageView(image: AppImage.verifyImage ?? UIImage())

    /// Images UI
    logoImage.image = AppImage.appLogo

    /// Labels UI
    titleLabel.text = L10n.Signup.title
    subtitleLabel.text = L10n.Signup.subtitle
    usernameLabel.text = L10n.Signup.username
    emailLabel.text = L10n.Signup.email
    passwordLabel.text = L10n.Signup.password
    confirmPasswordLabel.text = L10n.Signup.comfirmPassword
    termsLabel.text = L10n.Signup.terms
  }
}
