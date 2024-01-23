//
//  EMTextField.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 16/01/2024.
//

import UIKit
import MakeConstraints

protocol EMTextFieldDelegate: AnyObject {
}
//
class EMTextField: UIView {
    // MARK: IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var bottomLine: UIView!
    
    // MARK: Properities
    var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    var placeholder: String? {
        get { textfield.placeholder }
        set { textfield.placeholder = newValue }
    }
    
    weak var delegate: EMTextFieldDelegate?
    // MARK: Init
    //
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
}

// MARK: - Configurations
private extension EMTextField {
    func configureUI() {
        configureTitleLable()
        configureTextField()
        configureButtomLine()
        heightConstraints(48)
    }
    
    func configureTitleLable() {
        titleLabel.textColor = AppColor.primaryText
        titleLabel.font = .h3
    }
    
    func configureTextField() {
        textfield.borderStyle = .none
    }
    
    func configureButtomLine() {
        bottomLine.backgroundColor = AppColor.textFieldUnderLine
    }
}

// MARK: - Actions
private extension EMTextField {
}

private extension EMTextField {
    /// Loads the view from a nib file and adds it as a subview to the SplashView view.
    func loadNib() {
        // Please do not update this code, as it's used to load the view from a nib.
        // swiftlint:disable all
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil)![0] as! UIView
        addSubview(view)
        view.frame = bounds
        // swiftlint:enable all
    }
}
