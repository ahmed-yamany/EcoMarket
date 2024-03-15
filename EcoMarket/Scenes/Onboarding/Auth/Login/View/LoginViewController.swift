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
        navigationItem.backButtonTitle = ""
        configureViews()
    }
    
    // MARK: - UI Setup
        
    /// Configures the initial appearance of UI elements
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
    
    /// Configures email text field with title and placeholder
    private func configureEmailTextField() {
        emailTextField.title = L10n.email
        emailTextField.placeholder = L10n.Login.Email.placeholder
    }
    
    /// Configures password text field with title and placeholder
    private func configurePasswordTextField() {
        passwordTextField.title = L10n.password
        passwordTextField.placeholder = L10n.Login.Password.placeholder
    }
    
    /// Configures appearance of labels
    private func configureLabelsUI() {
        titleLabel.text = L10n.Login.title
        titleLabel.textColor = AppColor.primaryText
        titleLabel.font = .h1
        subtitleLabel.text = L10n.Login.subtitle
        subtitleLabel.textColor = AppColor.socialButton
        subtitleLabel.font = .medium
        orLabel.textColor = AppColor.primaryText
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        Logger.log("login Button Tapped", category: \.onboarding, level: .info)
        viewModel.loginButtonTapped()
    }
}
