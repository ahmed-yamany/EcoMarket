//
//  SettingsViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 05/02/2024.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var genderView: GenderCustomView!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var emailTextField: SettingsCustomTextField!
    @IBOutlet weak var ageTextField: SettingsCustomTextField!
    @IBOutlet weak var nameTextField: SettingsCustomTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    private func setupUI() {
        view.backgroundColor = AppColor.backgroundColor
        containerStackView.layoutMargins = UIEdgeInsets(top: 34, left: 25, bottom: 34, right: 25)
        containerStackView.isLayoutMarginsRelativeArrangement = true
        profileImage.image = AppImage.profileImage
        profileImage.layer.cornerRadius = 10
        configureNameTextField()
        configureAgeTextField()
        configureEmailTextField()
        configureGenderView()
        configureEditButtonUI()
        configureLogOutButtonUI()
    }
    
    private func configureNameTextField() {
        nameTextField.title = L10n.Profile.nameTitle
        nameTextField.textField.text = L10n.Profile.nameText
    }
    
    private func configureAgeTextField() {
        ageTextField.title = L10n.Profile.ageTitle
        ageTextField.textField.text = L10n.Profile.ageText
    }
    
    private func configureEmailTextField() {
        emailTextField.title = L10n.Profile.emailTitle
        emailTextField.textField.text = L10n.Profile.emailText
    }
    
    private func configureGenderView() {
        genderView.maleButton.setTitle("Male", for: .normal)
        genderView.femaleButton.setTitle("Female", for: .normal)
    }
    
    private func configureEditButtonUI() {
        editButton.setTitle("", for: .normal)
        editButton.setImage(AppImage.editButton, for: .normal)
    }
    
    private func configureLogOutButtonUI() {
        logoutButton.setTitle(L10n.Logout.title, for: .normal)
        logoutButton.setImage(AppImage.logout, for: .normal)
        logoutButton.backgroundColor = AppColor.primaryButton
        logoutButton.setTitleColor(AppColor.secondaryText, for: .normal)
        logoutButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoutButton.layer.cornerRadius = 10
        if #available(iOS 15.0, *) {
            logoutButton.configuration = nil
            logoutButton.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 20)
            logoutButton.titleLabel?.font = .medium
            logoutButton.tintColor = AppColor.backgroundColor
        }
    }
}
