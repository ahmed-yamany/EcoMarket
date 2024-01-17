//
//  SignupViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 10/01/2024.
//

import UIKit

class SignupViewController: UIViewController {
    
    // MARK: - Outlets
    /// TextFields IBOulets
    @IBOutlet weak var usernameTextField: EMTextField!
    @IBOutlet weak var emailTextField: EMTextField!
    @IBOutlet weak var passwordTextField: EMTextField!
    @IBOutlet weak var confirmPasswordTextField: EMTextField!
    /// Images IBOulets
    @IBOutlet weak var logoImage: UIImageView!
    /// Lables IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var termsLabel: UILabel!
    /// Buttons IBOutlet
    @IBOutlet weak var loginButton: PrimaryButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    // MARK: - Setup UI
    private func configureViews() {
        /// Username TextFeild UI
        usernameTextField.title = L10n.Signup.username
        usernameTextField.placeholder = L10n.Signup.Username.placeholder
        
        /// Email TextField UI
        emailTextField.title = L10n.email
        emailTextField.placeholder = L10n.Login.Email.placeholder
        
        /// Password TextField UI
        passwordTextField.title = L10n.password
        passwordTextField.placeholder = L10n.Login.Password.placholder
        
        /// Confirm Password TextField UI
        confirmPasswordTextField.title = L10n.Signup.comfirmPassword
        confirmPasswordTextField.placeholder = L10n.Login.Password.placholder
        
        /// Images UI
        logoImage.image = AppImage.appLogo
        
        /// Labels UI
        titleLabel.text = L10n.Signup.title
        subtitleLabel.text = L10n.Signup.subtitle
        termsLabel.text = L10n.Signup.terms
        
        /// Buttons UI
        loginButton.title = L10n.login
    }
}
