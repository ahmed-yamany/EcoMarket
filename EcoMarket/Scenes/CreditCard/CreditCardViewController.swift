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
    
    var viewModel: CreditCardViewModel
    private var cancellables = Set<AnyCancellable>()
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var addCardButton: PrimaryButton!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var cardStackView: UIStackView!
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardCVVTextField: CardTextField!
    @IBOutlet weak var cardExpDateTextField: CardTextField!
    @IBOutlet weak var cardHolderTextField: CardTextField!
    @IBOutlet weak var cardNumberTextField: CardTextField!
    @IBOutlet weak var containerStackView: UIStackView!
    
    @IBOutlet weak var cardView: CardView!
    init(viewModel: CreditCardViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        view.backgroundColor = .emBackground
        bindCardNumberTextField()
        bindCardHolderTextField()
        bindCVVTextField()
        bindExpDateTextField()
        configureUI()
        cardNumberTextField.delegate = self
    }
    
    private func bindCardNumberTextField() {
        cardNumberTextField.textField.keyboardType = .numberPad
        cardNumberTextField.textField.textFieldDidChange
            .sink { [weak self] value in
                let validValue = self?.viewModel.isValidTextField(value: value, 16)
                self?.cardNumberTextField.textField.text = validValue
                self?.cardView.setCardNumberTextField(cleanedValue: validValue ?? "")
            }.store(in: &cancellables)
    }
    
    private func bindCardHolderTextField() {
        cardHolderTextField.textField.textFieldDidChange
            .sink { [weak self] value in
                self?.cardView.setCardHolderName(value: value)
            }.store(in: &cancellables)
    }
    
    private func bindCVVTextField() {
        cardCVVTextField.textField.keyboardType = .numberPad
        cardCVVTextField.textField.textFieldDidChange
            .sink { [weak self] value in
                self?.cardCVVTextField.textField.text = self?.viewModel.isValidTextField(value: value, 3)
            }.store(in: &cancellables)
    }
    
    private func bindExpDateTextField() {
        cardExpDateTextField.textField.keyboardType = .numberPad
        cardExpDateTextField.textField.textFieldDidChange
            .sink { [weak self] value in
                let validValue = self?.viewModel.formatExpirationDate(value)
                self?.cardExpDateTextField.textField.text = validValue
                self?.cardView.setValidDate(value: validValue ?? "")
            }.store(in: &cancellables)
    }
    
    private func configureUI() {
        containerStackView.layoutMargins = .init(top: 0, left: 20, bottom: 0, right: 20)
        containerStackView.isLayoutMarginsRelativeArrangement = true
        configureTextFieldsPlaceHolder()
        configureCardLabel()
        configureHeaderLabel()
        configureButtonsUI()
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
    
    @IBAction func addCardButtonTapped(_ sender: Any) {
        viewModel.didTapAddCard()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        viewModel.didTapCancel()
    }
}

extension CreditCardViewController: CardTextFieldDelegate {
    func cardTextField(_ textField: CardTextField, textDidChange newText: String?) {
        
    }
}
