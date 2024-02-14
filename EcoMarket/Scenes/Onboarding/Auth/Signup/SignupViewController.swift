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
    
    // MARK: - Life Cycle Methods
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    // MARK: - UI Setup
    
    /// Configures the initial appearance of UI elements
    private func configureViews() {
        view.backgroundColor = AppColor.backgroundColor
        
        // Images UI
        logoImage.image = AppImage.appLogo
        
        // Buttons UI
        loginButton.title = L10n.login
        
        configureUsernameTextField()
        configureEmailTextField()
        configurePasswordTextField()
        configureLabelsUI()
    }
    
    /// Configures username text field with title and placeholder
    private func configureUsernameTextField() {
        usernameTextField.title = L10n.Signup.username
        usernameTextField.placeholder = L10n.Signup.Username.placeholder
    }
    
    /// Configures email text field with title and placeholder
    private func configureEmailTextField() {
        emailTextField.title = L10n.email
        emailTextField.placeholder = L10n.Login.Email.placeholder
    }
    
    /// Configures password text field with title and placeholder
    private func configurePasswordTextField() {
        // Password TextField UI
        passwordTextField.title = L10n.password
        passwordTextField.placeholder = L10n.Login.Password.placeholder
        
        // Confirm Password TextField UI
        confirmPasswordTextField.title = L10n.Signup.confirmPassword
        confirmPasswordTextField.placeholder = L10n.Login.Password.placeholder
    }
    
    /// Configures appearance of labels
    private func configureLabelsUI() {
        titleLabel.text = L10n.Signup.title
        titleLabel.textColor = AppColor.primaryText
        
        subtitleLabel.text = L10n.Signup.subtitle
        subtitleLabel.textColor = AppColor.socialButton
        
        termsLabel.text = L10n.Signup.terms
        termsLabel.textColor = AppColor.socialButton
    }
}
