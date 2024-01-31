//
//  PromoCodeCollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 27/01/2024.
//

import UIKit

class PromoCodeCollectionViewCell: UICollectionViewCell {
    // MARK: - Outlets
    //
    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var codeField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureUI()
    }

    // MARK: - UI Configuration
       
       /// Configures the initial UI settings for the cell.
       private func configureUI() {
           configureContainerView()
           configureTextFieldUI()
           configureButtonUI()
       }
       
       /// Configures the appearance of the container view.
       private func configureContainerView() {
           containerView.layoutMargins = .init(top: 10, left: 10, bottom: 10, right: 10)
           containerView.isLayoutMarginsRelativeArrangement = true
           containerView.backgroundColor = AppColor.searchbarBackground
           containerView.layer.cornerRadius = 10
       }
       
       /// Configures the appearance of the promo code text field.
       private func configureTextFieldUI() {
           codeField.borderStyle = .none
           codeField.placeholder = "Promo Code"
       }
       
       /// Configures the appearance of the apply button.
       private func configureButtonUI() {
           applyButton.setTitle("Apply", for: .normal)
           applyButton.setTitleColor(AppColor.mainTheme, for: .normal)
           applyButton.backgroundColor = AppColor.primaryButton
           applyButton.layer.cornerRadius = 10
           
           if #available(iOS 15.0, *) {
               applyButton.configuration = nil
               applyButton.titleLabel?.font = .medium
           }
       }
       
       // MARK: - Actions
       
       /// Handles the action when the apply button is pressed.
       ///
       /// - Parameter sender: The button that triggered the action.
       @IBAction func applyButtonPressed(_ sender: Any) {
           applyPromoCode()
       }
       
       // MARK: - Private Methods
       
       /// Applies the entered promo code.
       private func applyPromoCode() {
           guard let promoCode = codeField.text, !promoCode.isEmpty else {
               // Handle the case when the promo code is empty
               return
           }

           // Apply the promo code logic here
           print("Applying promo code: \(promoCode)")
       }
   }
