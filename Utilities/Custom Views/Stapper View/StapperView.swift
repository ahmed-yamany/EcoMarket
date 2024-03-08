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
    func stapperView(_ stapper: StapperView, didSet value: Int)
}

open class StapperView: UIView {
    // MARK: - Outlets
    //
    @IBOutlet weak private(set) var counterLabel: UILabel!
    @IBOutlet weak private(set) var plusButton: UIButton!
    @IBOutlet weak private(set) var minusButton: UIButton!
    
    // MARK: - Properties
    //
    private (set) var value: Int = 0
    var maximumValue: Int = 100
    var minmumValue: Int = 0 {
        didSet(newValue) {
            updateValue(newValue)
           value = newValue
        }
    }
    
    weak var delegate: (any StapperViewDelegate)?

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
    
    public func setTintColor(_ color: UIColor) {
        plusButton.setTitleColor(color, for: .normal)
        minusButton.setTitleColor(color, for: .normal)
        counterLabel.textColor = color
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
        counterLabel.text = String(minmumValue)
        counterLabel.font = .medium
    }
    
    private func configureContainerView() {
        backgroundColor = .gray
        layer.cornerRadius = 15
    }
    
    private func configureStepperButtons() {
        stepperButton(button: plusButton, text: "+", value: 1)
        stepperButton(button: minusButton, text: "-", value: -1)
        
        plusButton.addAction(.init(handler: {_ in self.plusButtonTapped() }), for: .touchUpInside)
        minusButton.addAction(.init(handler: {_ in self.minusButtonTapped() }), for: .touchUpInside)
    }
    
    /// Configures a UIButton to represent a stepper button.
    private func stepperButton(button: UIButton, text: String, value: Int) {
        button.setTitle(text, for: .normal)
        button.tag = value
        button.titleLabel?.font = .medium
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = .clear
    }
    
    private func plusButtonTapped() {
        if value <= maximumValue {
            value += 1
            updateValue(value)
        }
    }
    
    private func minusButtonTapped() {
        if value > minmumValue {
            value -= 1
            updateValue(value)
        }
    }
    
    private func updateValue(_ value: Int) {
        counterLabel.text = String(value)
        delegate?.stapperView(self, didSet: value)
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
