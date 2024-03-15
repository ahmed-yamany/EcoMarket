//
//  SplashViewController.swift
//  EcoMarket
//
//  Created by Youssef Eldeeb on 14/01/2024.
//

import UIKit

class SplashViewController: UIViewController {
    // MARK: - IBOutlets
    //
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var logoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        setup()
    }
    
    let coordinator: AuthCoordinatorProtocol
    init(coordinator: AuthCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    //
    private func setup() {
        setupBackgroundImage()
        setupLogoImage()
        setupLoginButton()
        setupSignupButton()
    }
    
    private func setupBackgroundImage() {
        backgroundImage.image = AppImage.Onboarding.splash1
        backgroundImage.contentMode = .scaleAspectFill
    }
    
    private func setupLogoImage() {
        logoImage.image = AppImage.Onboarding.logo
        logoImage.contentMode = .scaleAspectFill
    }
    
    private func setupLoginButton() {
        loginButton.backgroundColor = .white
        loginButton.tintColor = .black
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        loginButton.clipsToBounds = true
        loginButton.setTitle(L10n.login, for: .normal)
        loginButton.addAction(.init(handler: { [weak self] _ in self?.loginButtonTapped() }), for: .touchUpInside)
    }
    
    private func setupSignupButton() {
        signupButton.tintColor = .white
        signupButton.layer.cornerRadius = signupButton.frame.height / 2
        signupButton.clipsToBounds = true
        signupButton.layer.borderWidth = 2
        signupButton.layer.borderColor = UIColor.white.cgColor
        signupButton.setTitle(L10n.signup, for: .normal)
        signupButton.addAction(.init(handler: { [weak self] _ in self?.signupButtonTapped() }), for: .touchUpInside)
    }
    
    private func loginButtonTapped() {
        coordinator.showLogin()
    }
    
    private func signupButtonTapped() {
        coordinator.showSignup()
    }
}
