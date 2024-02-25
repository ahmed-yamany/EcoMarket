//
//  CreditCardViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 25/02/2024.
//

import UIKit
import Combine
import MakeConstraints

class CreditCardViewController: UIViewController {

    @IBOutlet weak var cardDetailsStackView: UIStackView!
    @IBOutlet weak var validDate: UILabel!
    @IBOutlet weak var validLabel: UILabel!
    @IBOutlet weak var cardHolderName: UILabel!
    @IBOutlet weak var cardHolderLabel: UILabel!
    @IBOutlet weak var cardNumber: UILabel!
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var cardLogo: UIImageView!
    @IBOutlet weak var cardType: UILabel!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var addCardButton: PrimaryButton!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardStackView: UIStackView!
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardCVVTextField: CardTextField!
    @IBOutlet weak var cardExpDateTextField: CardTextField!
    @IBOutlet weak var cardHolderTextField: CardTextField!
    @IBOutlet weak var cardNumberTextField: CardTextField!
    @IBOutlet weak var containerStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        cardNumberTextField.delegate = self
    }
    
    private func configureUI() {
        containerStackView.layoutMargins = .init(top: 0, left: 20, bottom: 0, right: 20)
        containerStackView.isLayoutMarginsRelativeArrangement = true
        
        cardDetailsStackView.layoutMargins = .init(top: 20, left: 20, bottom: 20, right: 20)
        cardDetailsStackView.isLayoutMarginsRelativeArrangement = true
        
        cardImage.layer.cornerRadius = 15
        cardImage.image = AppImage.CreditCard.credit1

        configureTextFieldsPlaceHolder()
        configureCardLabel()
        configureHeaderLabel()
        configureButtonsUI()
        configureCardLabelsUI()
    }
    
    private func configureTextFieldsPlaceHolder() {
        cardNumberTextField.placeholder = L10n.Credit.Number.placeholder
        cardHolderTextField.placeholder = L10n.Credit.Holder.placeholder
        cardExpDateTextField.placeholder = L10n.Credit.Expdate.placeholder
        cardCVVTextField.placeholder = L10n.Credit.Cvv.placeholder
    }
    
    private func configureCardLabel() {
        cardLabel.font = .h2
        cardLabel.textColor = AppColor.primaryText
        cardLabel.text = L10n.Credit.Card.label
    }
    
    private func configureHeaderLabel() {
        headerLabel.font = .h2
        headerLabel.textColor = AppColor.primaryText
        headerLabel.text = L10n.Credit.Header.label
    }
    
    private func configureButtonsUI() {
        addCardButton.title = L10n.Credit.AddButton.label
        addCardButton.widthConstraints(160)
        
        if #available(iOS 15.0, *) {
            cancelButton.configuration = nil
            cancelButton.setTitle(L10n.Credit.CancelButton.label, for: .normal)
            cancelButton.setTitleColor(AppColor.cardTextFieldPlaceholder, for: .normal)
            cancelButton.titleLabel?.font = .medium
        }
    }
    
    private func configureCardLabelsUI() {
        configureLabel(cardType, text: nil, font: .h2, textColor: AppColor.secondaryText)
        configureLabel(cardNumberLabel, text: L10n.Credit.Details.cardNumber, font: .regular, textColor: AppColor.secondaryText)
        configureLabel(cardNumber, text: nil, font: .h3, textColor: AppColor.secondaryText)
        configureLabel(cardHolderLabel, text: L10n.Credit.Details.cardHolder, font: .regular, textColor: AppColor.secondaryText)
        configureLabel(cardHolderName, text: nil, font: .medium, textColor: AppColor.secondaryText)
        configureLabel(validLabel, text: L10n.Credit.Details.valid, font: .regular, textColor: AppColor.secondaryText)
        configureLabel(validDate, text: nil, font: .medium, textColor: AppColor.secondaryText)
    }
    
    private func configureLabel(_ label: UILabel, text: String?, font: UIFont?, textColor: UIColor) {
        label.text = text
        label.font = font
        label.textColor = textColor
    }
    
    @IBAction func addCardButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        
    }
}

extension CreditCardViewController: CardTextFieldDelegate {
    func cardTextField(_ textField: CardTextField, textDidChange: String?) {
        
    }
}
