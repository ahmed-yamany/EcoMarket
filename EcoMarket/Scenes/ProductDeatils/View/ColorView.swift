//
//  ColorView.swift
//  EcoTest
//
//  Created by Ibrahim Nasser Ibrahim on 24/01/2024.
//

import UIKit

public protocol ColorViewDelegate: AnyObject {
    func colorView(_ sizeView: ColorView, didSelect color: UIColor)
}

@IBDesignable
open class ColorView: UIStackView {
    // MARK: Private Properties
    //
    private var buttons: [CustomColorButton] = []
    private var buttonColors: [UIColor] = []
    private let selectedColor = AppColor.socialButton
    private let buttonWidth: CGFloat = 20
    private let buttonHeight: CGFloat = 20
    
    // MARK: Public Properties
    //
    public var selectedButton: CustomColorButton?
    public var delegate: (any ColorViewDelegate)?
    
    // MARK: Initializer
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: Setup Methods
    //
    /// Configures the initial setup of the stack view.
    private func setup() {
        axis = .vertical
        spacing = 10
        distribution = .equalSpacing
        alignment = .center
        layoutMargins = UIEdgeInsets(top: 11, left: 10, bottom: 11, right: 10)
        isLayoutMarginsRelativeArrangement = true
        configureStackViewUI()
    }
    
    /// Configures the appearance of the stack view.
    private func configureStackViewUI() {
        backgroundColor = AppColor.mainTheme
        layer.shadowColor = AppColor.primaryButton.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 15
        layer.cornerRadius = 20
    }
    
    // MARK: - Public Methods
    
    /// Sets the available colors for the color view.
    ///
    /// - Parameter colors: An array of UIColor objects representing the available colors.
    public func setColors(_ colors: [UIColor]) {
        for color in colors {
            let button = createRoundedButton(for: color)
            buttons.append(button)
            buttonColors.append(color)
            addArrangedSubview(button)
        }
        selectButton(buttons.first)
    }
    
    // MARK: - Private Methods
    
    /// Creates a rounded button with a specified color.
    private func createRoundedButton(for color: UIColor) -> CustomColorButton {
        let button = CustomColorButton()
        button.backgroundColor = color
        button.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        button.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        button.addAction(.init(handler: {[weak self] _ in
            self?.buttonTapped(button, color: color)
        }), for: .touchUpInside)
                
        return button
    }
    
    /// Handles the tap on a  button.
    private func buttonTapped(_ tappedButton: CustomColorButton, color: UIColor) {
        selectButton(tappedButton)
        delegate?.colorView(self, didSelect: color)
    }
    
    private func selectButton(_ button: CustomColorButton?) {
        selectedButton = button
        updateSelectedButtonStyle(button)
    }
    
    /// Updates the visual style of color buttons, providing an animation for the selected button.
    private func updateSelectedButtonStyle(_ button: CustomColorButton?) {
        zip(buttonColors, buttons).forEach { color, btn in
            UIView.animate(withDuration: 0.3) {
                if button === btn {
                    btn.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//                    btn.backgroundColor = self.selectedColor
                    btn.setImage(AppImage.checkImage, for: .normal)
                    btn.tintColor = AppColor.mainTheme
                } else {
                    btn.transform = .identity
                    btn.backgroundColor = color
                    btn.setImage(UIImage(), for: .normal)
                }
            }
        }
    }
}
