//
//  CardTextField.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 25/02/2024.
//

import UIKit
import MakeConstraints

protocol CardTextFieldDelegate: AnyObject {
    func cardTextField(_ textField: CardTextField, textDidChange: String?)
}

class CardTextField: UIView {
    // MARK: Init
    //
    @IBOutlet weak var textField: UITextField!
    
    var placeholder: String? {
        get { textField.placeholder }
        set {
            textField.placeholder = newValue
            textField.setPlaceholderColor(AppColor.cardTextFieldPlaceholder)
            textField.setPlaceholderFont(.medium)
        }
    }
    
    weak var delegate: CardTextFieldDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
        configureUI()
    }
    
    private func configureUI() {
        heightConstraints(60)
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = AppColor.cardTextFieldBorder.cgColor
    }
    
    private func setupTextField() {
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        delegate?.cardTextField(self, textDidChange: textField.text)
    }
}

private extension CardTextField {
    /// Loads the view from a nib file and adds it as a subview to the SplashView view.
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
