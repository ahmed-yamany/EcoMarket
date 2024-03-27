//
//  AddAddressViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 27/03/2024.
//

import UIKit

protocol AddAddressViewControllerDelegate: AnyObject {
    func addingAddress(_ address: [Address])
}

class AddAddressViewController: UIViewController {

    @IBOutlet weak var addButton: PrimaryButton!
    @IBOutlet weak var addressTextField: CardTextField!
    @IBOutlet weak var numberTextField: CardTextField!
    @IBOutlet weak var nameTextField: CardTextField!
    
    var viewModel: AddAddressViewModel
    weak var delegate: AddAddressViewControllerDelegate?
    
    init(viewModel: AddAddressViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .emBackground
        navigationItem.backButtonTitle = ""
        title = L10n.Address.title
        addButton.title = L10n.Address.AddButton.title
        configureTextFieldsPlaceholder()
    }
    
    private func configureTextFieldsPlaceholder() {
        nameTextField.placeholder = "Name"
        numberTextField.placeholder = "Phone Number"
        addressTextField.placeholder = "Address"
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        guard
            let name = nameTextField.textField.text, !name.isEmpty,
            let address = addressTextField.textField.text, !address.isEmpty,
            let phone = numberTextField.textField.text, !phone.isEmpty
        else {
            viewModel.showAlert()
            return
        }
        let addedAddress: [Address] = [.init(name: name, number: phone, address: address)]
        delegate?.addingAddress(addedAddress)
        print(addedAddress)
        viewModel.didTapAdd()
    }
}
