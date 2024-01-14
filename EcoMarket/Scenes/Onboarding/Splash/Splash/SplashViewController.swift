//
//  SplashViewController.swift
//  EcoMarket
//
//  Created by Youssef Eldeeb on 14/01/2024.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var logoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    private func initUI() {
        backgroundImage.image = UIImage.splash02
        backgroundImage.contentMode = .scaleAspectFill
        
        loginBtn.backgroundColor = .white
        loginBtn.tintColor = .black
        loginBtn.layer.cornerRadius = loginBtn.frame.height / 2
        loginBtn.clipsToBounds = true
        loginBtn.setTitle(L10n.Splash.Button.login, for: .normal)
        signupBtn.tintColor = .white
        signupBtn.layer.cornerRadius = signupBtn.frame.height / 2
        signupBtn.clipsToBounds = true
        signupBtn.layer.borderWidth = 2
        signupBtn.layer.borderColor = UIColor.white.cgColor
        signupBtn.setTitle(L10n.Splash.Button.login, for: .normal)
        logoImage.image = UIImage.logoVector
        logoImage.contentMode = .scaleAspectFill
        
        loginBtn.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        signupBtn.addTarget(self, action: #selector(goToSignup), for: .touchUpInside)
    }
    
    @objc private func goToLogin() {
        // Navigate to Login Page
    }
    @objc private func goToSignup() {
        // Navigate to Signup Page
    }
}
