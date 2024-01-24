//
//  SignupViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 10/01/2024.
//

import UIKit

class SignupViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var usernameTextField: EMTextField!
    @IBOutlet weak var emailTextField: EMTextField!
    @IBOutlet weak var passwordTextField: EMTextField!
    @IBOutlet weak var confirmPasswordTextField: EMTextField!

    @IBOutlet weak var logoImage: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var termsLabel: UILabel!

    @IBOutlet weak var loginButton: PrimaryButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    // MARK: - Setup UI
    private func configureViews() {
        // Username textfield
        usernameTextField.title = L10n.Signup.username
        usernameTextField.placeholder = L10n.Signup.Username.placeholder
        
        // Email TextField
        emailTextField.title = L10n.email
        emailTextField.placeholder = L10n.Login.Email.placeholder
        
        // Password TextField UI
        passwordTextField.title = L10n.password
        passwordTextField.placeholder = L10n.Login.Password.placeholder
        
        // Confirm Password TextField UI
        confirmPasswordTextField.title = L10n.Signup.confirmPassword
        confirmPasswordTextField.placeholder = L10n.Login.Password.placeholder
        
        // Images UI
        logoImage.image = AppImage.appLogo
        
        // Labels UI
        titleLabel.text = L10n.Signup.title
        subtitleLabel.text = L10n.Signup.subtitle
        termsLabel.text = L10n.Signup.terms
        
        // Buttons UI
        loginButton.title = L10n.login
    }
}
