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
    
    let viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    // MARK: - Setup UI
    private func configureViews() {
        // Email TextField
        emailTextField.title = L10n.email
        emailTextField.placeholder = L10n.Login.Email.placeholder
        
        // Password TextField UI
        passwordTextField.title = L10n.password
        passwordTextField.placeholder = L10n.Login.Password.placeholder
        
        // Images UI
        logoImage.image = AppImage.appLogo
        
        // Labels UI
        titleLabel.text = L10n.Login.title
        titleLabel.font = .h1
        subtitleLabel.text = L10n.Login.subtitle
        subtitleLabel.font = .medium
        
        // Buttons UI
        loginButton.title = L10n.login
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        Logger.log("login Button Tapped", category: \.onboarding, level: .info)
        viewModel.loginButtonTapped()
    }
}
