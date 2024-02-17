//
//  SettingsCustomView.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 05/02/2024.
//

import UIKit
import MakeConstraints

protocol SettingsCustomTextFieldDelegate: AnyObject {
}
//
@IBDesignable
class SettingsCustomTextField: UIView {
    
    // MARK: - IBOutlets
    //
    @IBOutlet weak var bottomLine: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: Properities
    var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    var placeholder: String? {
        get { textField.placeholder }
        set { textField.placeholder = newValue }
    }
    
    weak var delegate: SettingsCustomTextFieldDelegate?
    
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

// MARK: - Configurations
private extension SettingsCustomTextField {
    func configureUI() {
        backgroundColor = AppColor.backgroundColor
        configureTitleLable()
        configureTextField()
        configureButtomLine()
        heightConstraints(22)
    }
    
    func configureTitleLable() {
        titleLabel.textColor = AppColor.profileColor
        titleLabel.font = .h3
    }
    
    func configureTextField() {
        textField.borderStyle = .none
        textField.textColor = AppColor.primaryText
    }
    
    func configureButtomLine() {
        bottomLine.backgroundColor = AppColor.textFieldUnderLine
    }
}
