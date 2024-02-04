//
//  ProfileViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 04/02/2024.
//

import UIKit

class ProfileViewController: UIViewController {
    // MARK: - Outlets
    //
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userStackView: UIStackView!
    @IBOutlet weak var helpCenterView: CustomProfileView!
    @IBOutlet weak var personalDetailsView: CustomProfileView!
    @IBOutlet weak var containerStackView: UIStackView!
    
    // MARK: - View Lifecycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewsUI()
        personalDetailsView.data = ProfileModel.mockData1
        helpCenterView.data = ProfileModel.mockData2
        setupUserData(user: UserModel.user)
    }
    
    // MARK: - UI Setup
    //
    private func setupViewsUI() {
        view.backgroundColor = AppColor.backgroundColor
        containerStackView.isLayoutMarginsRelativeArrangement = true
        containerStackView.layoutMargins = UIEdgeInsets(top: 10, left: 25, bottom: 0, right: 25)
        userStackViewUI()
    }
    
    /// Sets up the UI components of the user stack view.
    private func userStackViewUI() {
        // Container Stack UI
        userStackView.isLayoutMarginsRelativeArrangement = true
        userStackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        // Adding a custom view to the container with shadow
        userStackView.backgroundColor = AppColor.mainTheme
        userStackView.layer.shadowColor = AppColor.primaryButton.cgColor
        userStackView.layer.shadowOffset = .zero
        userStackView.layer.shadowOpacity = 0.2
        userStackView.layer.shadowRadius = 5
        userStackView.layer.cornerRadius = 15
        
        // Labels UI
        userName.font = .h2
        userEmail.font = .medium
        userName.textColor = AppColor.primaryText
        userEmail.textColor = AppColor.socialButton
        
        // Image UI
        userImage.layer.cornerRadius = 5
    }
    
    // MARK: - User Data Setup
        
    /// Sets up user data for the UI components.
    private func setupUserData(user: UserModel) {
        userName.text = user.name
        userEmail.text = user.email
        userImage.image = UIImage(named: user.image)
    }
}
