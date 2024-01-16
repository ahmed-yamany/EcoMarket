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

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    // MARK: - Setup UI
    private func configureViews() {
        configureLogoImage()
        configureTitleLabel()
        configureSubTitleLabel()
        configureEmailTextField()
        configurePassworedTextField()
        loginButton.title = L10n.login
    }
    
    private func configureLogoImage() {
        logoImage.image = AppImage.appLogo
    }
    
    private func configureTitleLabel() {
        titleLabel.text = L10n.Login.title
        titleLabel.font = .h1
    }
    
    private func configureSubTitleLabel() {
        subtitleLabel.text = L10n.Login.subtitle
        subtitleLabel.font = .medium
    }
    
    private func configureEmailTextField() {
        emailTextField.title = L10n.email
        emailTextField.placeholder = L10n.Login.Email.placeholder
    }
    
    private func configurePassworedTextField() {
        passwordTextField.title = L10n.password
        passwordTextField.placeholder = L10n.Login.Password.placholder
    }
    
}
