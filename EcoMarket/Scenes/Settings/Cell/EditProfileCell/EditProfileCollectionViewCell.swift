//
//  EditProfileCollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 07/02/2024.
//

import UIKit

class EditProfileCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    //
    @IBOutlet weak var genderView: GenderCustomView!
    @IBOutlet weak var emailTextField: SettingsCustomTextField!
    @IBOutlet weak var ageTextField: SettingsCustomTextField!
    @IBOutlet weak var nameTextField: SettingsCustomTextField!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
    // MARK: - Lifecycle
    //
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - UI Configuration
    //
    func setupUI() {
        profileImage.image = AppImage.profileImage
        profileImage.layer.cornerRadius = 10
        configureNameTextField()
        configureAgeTextField()
        configureEmailTextField()
        configureGenderView()
        configureEditButtonUI()
        genderView.delegate = self
    }
    
    /// Configure Text Fields
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
    
    /// Configure Gender View
    private func configureGenderView() {
        genderView.maleButton.setTitle("Male", for: .normal)
        genderView.femaleButton.setTitle("Female", for: .normal)
    }
    
    /// Configure Edit Button
    private func configureEditButtonUI() {
        editButton.setTitle("", for: .normal)
        editButton.setImage(AppImage.editButton, for: .normal)
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        print("Edit Tapped")
    }
}

// MARK: - GenderViewDelegate
//
extension EditProfileCollectionViewCell: GenderViewDelegate {
    func getSelected(_ genderView: GenderCustomView, for gender: String) {
        print(gender)
    }
}
