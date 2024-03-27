//
//  CardView.swift
//  EcoMarket
//
//  Created by Hassan on 26/03/2024.
//

import UIKit

class CardView: UIView {
    
    @Published var cardNumberTextField: String = ""
    
    @IBOutlet weak var cardDetailsStackView: UIStackView!
    @IBOutlet weak var validDate: UILabel!
    @IBOutlet weak var validLabel: UILabel!
    @IBOutlet weak var cardHolderName: UILabel!
    @IBOutlet weak var cardHolderLabel: UILabel!
    @IBOutlet weak var cardNumber: UILabel!
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var cardLogo: UIImageView!
    @IBOutlet weak var cardType: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        configureUI()
        configureCardLabelsUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
        configureUI()
        configureCardLabelsUI()
    }
    
    func configureUI() {
        cardDetailsStackView.layoutMargins = .init(top: 20, left: 20, bottom: 20, right: 20)
        cardDetailsStackView.isLayoutMarginsRelativeArrangement = true
        
        cardImage.image = AppImage.CreditCard.credit1
        cardImage.layer.cornerRadius = 15
        
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
    
    func setCardNumberTextField(cleanedValue: String) {
        var formattedValue = cleanedValue
        
        formattedValue.replace(by: " ", after: 4)
        cardNumber.text = formattedValue
        
        if cleanedValue.isEmpty {
            cardLogo.image = UIImage()
            cardType.text = ""
        } else if cleanedValue.hasPrefix("4") || cleanedValue.hasPrefix("3") {
            cardImage.image = AppImage.CreditCard.credit3
            cardLogo.image = AppImage.CreditCard.visaLogo
            cardType.text = "VISA"
        } else if cleanedValue.hasPrefix("5") || cleanedValue.hasPrefix("8") {
            cardImage.image = AppImage.CreditCard.credit2
            cardLogo.image = AppImage.CreditCard.masterCardLogo
            cardType.text = "MasterCard"
        } else if cleanedValue.hasPrefix("6") || cleanedValue.hasPrefix("7") {
            cardImage.image = AppImage.CreditCard.credit4
            cardLogo.image = AppImage.CreditCard.paypalLogo
            cardType.text = "PAYPAl"
        } else if cleanedValue.hasPrefix("1") || cleanedValue.hasPrefix("2") {
            cardImage.image = AppImage.CreditCard.credit1
            cardLogo.image = AppImage.CreditCard.americanLogo
            cardType.text = "AMERICAN EXPRESS"
        }
    }
    
    func setCardHolderName(value: String) {
        cardHolderName.text = value.uppercased()
    } 
    
    func setValidDate(value: String) {
        validDate.text = value
    }

}
private extension CardView {
    /// Loads the view from a nib file and adds it as a subview to the OnboardingTextField view.
    private func loadNib() {
        // swiftlint:disable all
        if let loadedViews = Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil),
           let view = loadedViews.first as? UIView {
            addSubview(view)
            view.frame = bounds
        }
        // swiftlint:enable all
    }
}
