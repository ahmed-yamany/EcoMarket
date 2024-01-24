//
//  ColorView.swift
//  EcoTest
//
//  Created by Ibrahim Nasser Ibrahim on 24/01/2024.
//

import UIKit
import Combine


class ColorView: UIStackView {
    
    private var cancellables: Set<AnyCancellable> = []
    private var buttons: [CustomColorButton] = []
    private let selectedColor = UIColor(named: "selectedColor")
    
    private var originalColors: [UIColor?] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let buttonWidth: CGFloat = 20
        let buttonHeight: CGFloat = 20
        let spacing: CGFloat = 10
        
        axis = .vertical
        self.spacing = spacing
        
        for color in [UIColor(named: "Color1"), UIColor(named: "Color2"), UIColor(named: "Color3"), UIColor(named: "Color4")] {
            let button = CustomColorButton()
            button.backgroundColor = color
            originalColors.append(color)
            button.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
            button.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
            addArrangedSubview(button)
            
            buttons.append(button)
            
            button.tapPublisher
                .sink { [weak self, weak button] in
                    self?.buttonTapped(button)
                }
                .store(in: &cancellables)
        }
    }
    
    private func buttonTapped(_ tappedButton: CustomColorButton?) {
        for (index, button) in buttons.enumerated() {
            button.backgroundColor = originalColors[index]
            button.setImage(UIImage(), for: .normal)
        }
        
        tappedButton?.backgroundColor = selectedColor
        tappedButton?.setImage(UIImage(named: "Vector 1"), for: .normal)
        
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
}
