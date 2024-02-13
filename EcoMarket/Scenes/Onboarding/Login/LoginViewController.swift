//
//  LoginViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 10/01/2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var emailTextField: EMTextField!
    @IBOutlet weak var passwordTextField: EMTextField!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var loginButton: PrimaryButton!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var orLabel: UILabel!
    
    // MARK: - Life Cycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    // MARK: - Setup UI
    private func configureViews() {
        view.backgroundColor = AppColor.backgroundColor
        lineView.backgroundColor = AppColor.textFieldUnderLine
        
        // Images UI
        logoImage.image = AppImage.appLogo
        
        // Buttons UI
        loginButton.title = L10n.login
        
        configureEmailTextField()
        configurePasswordTextField()
        configureLabelsUI()
    }
    
    private func configureEmailTextField() {
        emailTextField.title = L10n.email
        emailTextField.placeholder = L10n.Login.Email.placeholder
    }
    
    private func configurePasswordTextField() {
        passwordTextField.title = L10n.password
        passwordTextField.placeholder = L10n.Login.Password.placeholder
    }
    
    private func configureLabelsUI() {
        titleLabel.text = L10n.Login.title
        titleLabel.textColor = AppColor.primaryText
        titleLabel.font = .h1
        subtitleLabel.text = L10n.Login.subtitle
        subtitleLabel.textColor = AppColor.socialButton
        subtitleLabel.font = .medium
        orLabel.textColor = AppColor.primaryText
    }
}
