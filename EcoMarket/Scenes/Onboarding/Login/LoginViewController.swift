//
//  LoginViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 10/01/2024.
//

import UIKit

class LoginViewController: UIViewController {

  // MARK: - Outlets
  @IBOutlet weak var emailTextField: CustomTextField!
  @IBOutlet weak var passwordTextField: CustomTextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViews()
  }
  
  // MARK: - Setup UI
  private func configureViews() {
    emailTextField.setupRightImageView(image: .verify)
    passwordTextField.setupRightImageView(image: .verify)
  }
}
