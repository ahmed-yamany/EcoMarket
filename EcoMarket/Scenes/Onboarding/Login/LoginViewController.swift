//
//  LoginViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 10/01/2024.
//

import UIKit

class LoginViewController: UIViewController {

  // MARK: - Outlets
  /// TextFields IBOulets
  @IBOutlet weak var emailTextField: EMTextField!
  @IBOutlet weak var passwordTextField: EMTextField!
  /// Images IBOulets
  @IBOutlet weak var logoImage: UIImageView!
  /// Lables IBOutlet
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  /// Buttons IBOutlet
  @IBOutlet weak var loginButton: PrimaryButton!
  @IBOutlet weak var facebookButton: SecondaryButton!
  @IBOutlet weak var googleButton: GoogleButton!
  @IBOutlet weak var appleButton: AppleButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    configureViews()
  }

  // MARK: - Setup UI
  private func configureViews() {
    /// Email TextField UI
    emailTextField.title = L10n.email
    emailTextField.placeholder = L10n.Login.Email.placeholder

    /// Password TextField UI
    passwordTextField.title = L10n.password
    passwordTextField.placeholder = L10n.Login.Password.placholder

    /// Images UI
    logoImage.image = AppImage.appLogo

    /// Labels UI
    titleLabel.text = L10n.Login.title
    titleLabel.font = .h1
    subtitleLabel.text = L10n.Login.subtitle
    subtitleLabel.font = .medium

    /// Buttons UI
    loginButton.title = L10n.login
    facebookButton.title = L10n.Login.facebook
    googleButton.title = L10n.Login.google
    appleButton.title = L10n.Login.apple
  }
}