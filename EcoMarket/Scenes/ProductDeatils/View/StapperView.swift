//
//  CustomStapper.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 26/01/2024.
//

import UIKit
import MakeConstraints

// MARK: - StapperDelegate
//
public protocol StapperViewDelegate: AnyObject {
    func stapperView(_ stapper: StapperView, didSet value: String)
}

open class StapperView: UIView {
    // MARK: - Outlets
    //
    @IBOutlet weak private(set) var containerView: UIStackView!
    @IBOutlet weak private(set) var counterLabel: UILabel!
    @IBOutlet weak private(set) var plusButton: UIButton!
    @IBOutlet weak private(set) var minusButton: UIButton!
    
    // MARK: - Properties
    //
    private (set) var value: Double = 0
    var maximum: Double = 100
    var minmum: Double = 0
    weak var stapperDelegate: (any StapperViewDelegate)?

    // MARK: - Initialization
    //
    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        setup()
    }
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
        setup()
    }
    
    // MARK: - Setup
    //
    private func setup() {
        configureCounterLabel()
        configureContainerView()
        configureStepperButtons()
        widthConstraints(70)
        heightConstraints(30)
    }
    
    private func configureCounterLabel() {
        counterLabel.text = "0"
        counterLabel.font = .medium
    }
    
    private func configureContainerView() {
        containerView.backgroundColor = AppColor.secondaryBackground
        containerView.layer.cornerRadius = 15
    }
    
    private func configureStepperButtons() {
        configureStepperButton(button: plusButton, text: "+", value: 1)
        configureStepperButton(button: minusButton, text: "-", value: -1)
    }
    
    private func configureStepperButton(button: UIButton, text: String, value: Int) {
        stepperButton(button: button, text: text, value: value)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    /// Configures a UIButton to represent a stepper button.
   private func stepperButton(button: UIButton, text: String, value: Int) {
        button.setTitle(text, for: .normal)
        button.tag = value
        button.titleLabel?.font = .medium
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = AppColor.secondaryBackground
        button.layer.cornerRadius = 15
    }
    
    // MARK: - Value Update
    //
    private func updateValue(_ newValue: Double) {
        guard (minmum...maximum) ~= (value + newValue) else {
            return
        }
        value += newValue
        
        if #available(iOS 15.0, *) {
            counterLabel.text = String(value.formatted())
            stapperDelegate?.stapperView(self, didSet: counterLabel.text ?? "")
        } else {
            // Fallback on earlier versions
        }
    }
    
    private func didPressedStepper(value: Double) {
        updateValue(value * 1)
    }
    
    // MARK: - Button Action
    //
    @objc private func buttonTapped(_ sender: UIButton) {
        didPressedStepper(value: Double(sender.tag))
    }
    
    /// Loads the view from a nib file and adds it as a subview to the OnboardingTextField view.
    private func loadNib() {
        // Please do not update this code, as it's used to load the view from a nib.
        // Disable swiftlint rules for this block
        // swiftlint:disable all
        
        // Load the view from the nib using the name of the current class
        if let loadedViews = Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil),
            let view = loadedViews.first as? UIView {
            // Add the loaded view as a subview
            addSubview(view)
            
            // Set the frame of the loaded view to match the bounds of the current view
            view.frame = bounds
        }
        
        // Enable swiftlint rules for the rest of the code
        // swiftlint:enable all
    }

}
