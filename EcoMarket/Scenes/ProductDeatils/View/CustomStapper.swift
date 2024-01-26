//
//  CustomStapper.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 26/01/2024.
//

import UIKit

// MARK: - StapperDelegate
//
protocol StapperDelegate: AnyObject {
    func getCount(_ stapper: CustomStapper, for count: String)
}

class CustomStapper: UIView {
    
    // MARK: - Properties
    //
    private (set) var value: Double = 0
    var maximum: Double = 100
    var minmum: Double = 0
    weak var stapperDelegate: (any StapperDelegate)?
    
    // MARK: - Outlets
    //
    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    // MARK: - Initialization
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        setup()
    }
    required init?(coder: NSCoder) {
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
            stapperDelegate?.getCount(self, for: counterLabel.text ?? "")
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
        // swiftlint:disable all
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil)![0] as! UIView
        addSubview(view)
        view.frame = bounds
        // swiftlint:enable all
    }
}
