//
//  ColorView.swift
//  EcoTest
//
//  Created by Ibrahim Nasser Ibrahim on 24/01/2024.
//

import UIKit

public protocol ColorViewDelegate: AnyObject {
    func colorView(_ sizeView: ColorView, didSelect color: UIColor?)
}

@IBDesignable
open class ColorView: UIStackView {
    // MARK: Private Properties
    //
    private var items: [ColorViewButton] = []
    private let itemWidth: CGFloat = 20
    private let itemHeight: CGFloat = 20
    
    // MARK: Public Properties
    //
    public var selectedItem: ColorViewButton?
    public var delegate: (any ColorViewDelegate)?
    public var colors: [UIColor] = []

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
    public func setColors(_ colors: [UIColor?]) {
        arrangedSubviews.forEach {
            self.removeArrangedSubview($0)
        }
        for color in colors {
            if let color {
                let button = createRoundedButton(for: color)
                items.append(button)
                self.colors.append(color)
                addArrangedSubview(button)
            }
        }
        if !colors.isEmpty {
            selectButton(items[0])
            delegate?.colorView(self, didSelect: colors[0])
        }

    }
    
    // MARK: - Private Methods
    
    /// Creates a rounded button with a specified color.
    private func createRoundedButton(for color: UIColor) -> ColorViewButton {
        let button = ColorViewButton()
        button.backgroundColor = color
        button.widthAnchor.constraint(equalToConstant: itemWidth).isActive = true
        button.heightAnchor.constraint(equalToConstant: itemHeight).isActive = true
        
        button.addAction(.init(handler: {[weak self] _ in
            self?.buttonTapped(button, color: color)
        }), for: .touchUpInside)
                
        return button
    }
    
    /// Handles the tap on a  button.
    private func buttonTapped(_ tappedButton: ColorViewButton, color: UIColor) {
        selectButton(tappedButton)
        delegate?.colorView(self, didSelect: color)
    }
    
    private func selectButton(_ button: ColorViewButton?) {
        selectedItem = button
        updateSelectedButtonStyle(button)
    }
    
    /// Updates the visual style of color buttons, providing an animation for the selected button.
    private func updateSelectedButtonStyle(_ button: ColorViewButton?) {
        zip(colors, items).forEach { color, btn in
            UIView.animate(withDuration: 0.3) {
                if button === btn {
                    btn.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
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
