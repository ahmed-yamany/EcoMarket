//
//  SuccessViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 10/01/2024.
//

import UIKit

class SuccessViewController: UIViewController {

  // MARK: - Outlets
  @IBOutlet private(set) weak var successLabel: UILabel!
  @IBOutlet private(set) weak var successMesage: UILabel!
  @IBOutlet private(set) weak var imageView: UIImageView!

  @IBOutlet weak var startButton: PrimaryButton!
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  // MARK: - Setup UI
  private func setupUI() {
    /// Labels UI
    successLabel.text = L10n.Success.title
    successMesage.text = L10n.Success.message

    /// Images UI
    imageView.image = AppImage.successImage

    /// Buttons UI
    startButton.title = L10n.Success.Button.title
  }
}
