//
//  GenderCustomView.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 05/02/2024.
//

import UIKit
import MakeConstraints

protocol GenderViewDelegate: AnyObject {
    func getSelected(_ genderView: GenderCustomView, for gender: String)
}
// Enum to represent gender options
enum Gender: String, CaseIterable {
    case male, female
}

@IBDesignable
class GenderCustomView: UIView {
    
    // MARK: - IBOutlets
    //
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    
    // MARK: Properties
    //
    @Published var selectedGender: Gender = .male {
        didSet {
            switch selectedGender {
                case .male:
                    selectedButtonUI(button: maleButton)
                    unSelectedButtonUI(button: femaleButton)
                case .female:
                    selectedButtonUI(button: femaleButton)
                    unSelectedButtonUI(button: maleButton)
            }
        }
    }
    
    /// Track the currently selected button
    private var selectedButton: UIButton?
    weak var delegate: GenderViewDelegate?
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
    
    // MARK: - UI Configuration
    //
    private func configureUI() {
        backgroundColor = AppColor.backgroundColor
        titleLabel.text =  L10n.Profile.genderTitle
        heightConstraints(30)
        configureTitleLable()
        
        // Set the initial state for the buttons
        unSelectedButtonUI(button: maleButton)
        unSelectedButtonUI(button: femaleButton)
        defaultUI(for: maleButton)
        defaultUI(for: femaleButton)
    }
    
    /// Title Label UI
    private func configureTitleLable() {
        titleLabel.textColor = AppColor.profileColor
        titleLabel.font = .h3
    }
    
    // MARK: - Button UI Styling
    //
    /// Style for unselected state
    private func unSelectedButtonUI(button: UIButton) {
        UIView.animate(withDuration: 0.2) {
            button.layer.borderWidth = 1
            button.layer.borderColor = AppColor.profileColor.cgColor
            button.setTitleColor(AppColor.profileColor, for: .normal)
            button.setImage(AppImage.Settings.dot2, for: .normal)
            button.backgroundColor = AppColor.backgroundColor
        }
    }
    
    /// Style for selected state
    private func selectedButtonUI(button: UIButton) {
        UIView.animate(withDuration: 0.2) {
            button.setTitleColor(AppColor.secondaryText, for: .normal)
            button.setImage(AppImage.Settings.dot1, for: .normal)
            button.backgroundColor = AppColor.primaryButton
        }
    }
    
    /// Default Button UI
    private func defaultUI(for button: UIButton) {
        button.layer.cornerRadius = 10
        if #available(iOS 15.0, *) {
            button.configuration = nil
            button.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 20)
            button.titleLabel?.font = .medium
            button.tintColor = AppColor.profileColor
        }
    }
    
    // MARK: - Gender Change Animation
    //
    private func animateGenderChange(to gender: Gender) {
        UIView.transition(with: self, duration: 0.1, options: .transitionCrossDissolve, animations: {
            self.selectedGender = gender
        })
    }
    
    // MARK: - Button Actions
    //
    @IBAction func femaleButtonPressed(_ sender: UIButton) {
        selectedGender = .female
        animateGenderChange(to: .female)
        guard let gender = sender.titleLabel?.text else {
            return
        }
        delegate?.getSelected(self, for: gender)
    }
    
    @IBAction func maleButtonPressed(_ sender: UIButton) {
        selectedGender = .male
        animateGenderChange(to: .male)
        guard let gender = sender.titleLabel?.text else {
            return
        }
        delegate?.getSelected(self, for: gender)
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
