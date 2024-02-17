//
//  SuccessViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 10/01/2024.
//

import UIKit

class SuccessViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private(set) weak var containerView: UIView!
    @IBOutlet private(set) weak var successLabel: UILabel!
    @IBOutlet private(set) weak var successMessage: UILabel!
    @IBOutlet private(set) weak var imageView: UIImageView!
    
    @IBOutlet weak var startButton: PrimaryButton!
    
    let coordinator: AuthCoordinatorProtocol
    init(coordinator: AuthCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = AppColor.backgroundColor
        containerView.backgroundColor = AppColor.backgroundColor
        
        // Labels UI
        successLabel.text = L10n.Success.title
        successLabel.textColor = AppColor.primaryText
        
        successMessage.text = L10n.Success.message
        successMessage.textColor = AppColor.socialButton
        
        // Images UI
        imageView.image = AppImage.successImage
        
        // Buttons UI
        startButton.title = L10n.Success.Button.title
    }
    @IBAction func startShoppingButtonTapped(_ sender: UIButton) {
        Logger.log("Start Shopping Button Tapped", category: \.onboarding, level: .info)
        coordinator.showTabBar()
    }
}
