//
//  GenderCustomView.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 05/02/2024.
//

import UIKit
import MakeConstraints

@IBDesignable
class GenderCustomView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    
    // Track the currently selected button
        private var selectedButton: UIButton?
    
    // MARK: Properities
    //
    var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
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
    
    private func configureUI() {
        heightConstraints(30)
        configureTitleLable()
        // Set the initial state for the buttons
        unSelectedButtonUI(button: maleButton)
        unSelectedButtonUI(button: femaleButton)
    }
    
    private func unSelectedButtonUI(button: UIButton) {
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = AppColor.profileColor.cgColor
        button.setTitleColor(AppColor.profileColor, for: .normal)
        button.setImage(AppImage.dot2, for: .normal)
        button.backgroundColor = AppColor.backgroundColor
        if #available(iOS 15.0, *) {
            button.configuration = nil
            button.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 20)
            button.titleLabel?.font = .medium
            button.tintColor = AppColor.profileColor
        }
    }
    
    private func selectedButtonUI(button: UIButton) {
        button.layer.cornerRadius = 10
        button.setTitleColor(AppColor.secondaryText, for: .normal)
        button.setImage(AppImage.dot1, for: .normal)
        button.backgroundColor = AppColor.primaryButton
        if #available(iOS 15.0, *) {
            button.configuration = nil
            button.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 20)
            button.titleLabel?.font = .medium
            button.tintColor = AppColor.backgroundColor
        }
    }
    
    private func configureTitleLable() {
        titleLabel.textColor = AppColor.profileColor
        titleLabel.font = .h3
    }
    
    @IBAction func femaleButtonPressed(_ sender: UIButton) {
        handleButtonSelection(sender)
    }
    
    @IBAction func maleButtonPressed(_ sender: UIButton) {
        handleButtonSelection(sender)
    }
    
    // MARK: - Button Selection Logic

        private func handleButtonSelection(_ selectedButton: UIButton) {
            // Deselect the currently selected button
            if let currentSelectedButton = self.selectedButton {
                unSelectedButtonUI(button: currentSelectedButton)
            }

            // Select the new button
            selectedButtonUI(button: selectedButton)
            self.selectedButton = selectedButton
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
