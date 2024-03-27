//
//  SplashViewController.swift
//  EcoMarket
//
//  Created by Youssef Eldeeb on 14/01/2024.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var ecoMarketView: LottieAnimationView!
    
    let coordinator: AuthCoordinatorProtocol
    init(coordinator: AuthCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        setup()
        ecoLottieAnimation()
    }
    
    private func ecoLottieAnimation() {
        ecoMarketView.animation = .named("EcoMarket")
        ecoMarketView.loopMode = .loop
        ecoMarketView.play()
    }
    
    // MARK: - Setup UI
    private func setup() {
        navigationItem.backButtonTitle = ""
        setupLoginButton()
        setupSignupButton()
    }
    
    private func setupLoginButton() {
        loginButton.backgroundColor = .white
        loginButton.tintColor = .black
        loginButton.layer.borderWidth = 2
        loginButton.layer.borderColor = UIColor.black.cgColor
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        loginButton.clipsToBounds = true
        loginButton.setTitle(L10n.login, for: .normal)
        loginButton.addAction(.init(handler: { [weak self] _ in self?.loginButtonTapped() }), for: .touchUpInside)
    }
    
    private func setupSignupButton() {
        signupButton.tintColor = .white
        signupButton.backgroundColor = .black
        signupButton.layer.cornerRadius = signupButton.frame.height / 2
        signupButton.clipsToBounds = true
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
