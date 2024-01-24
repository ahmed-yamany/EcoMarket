//
//  SizeView.swift
//  EcoTest
//
//  Created by Ibrahim Nasser Ibrahim on 24/01/2024.
//

import UIKit
import Combine

class CustomSizeView: UIStackView {
    
    private var cancellables: Set<AnyCancellable> = []
    private var buttons: [CustomRoundedButton] = []
    private let defaultColor = UIColor.white
    private let selectedColor = UIColor.black

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let buttonWidth: CGFloat = 40
        let buttonHeight: CGFloat = 40
        let spacing: CGFloat = 15

        axis = .horizontal
        self.spacing = spacing
        
        for title in ["S", "M", "L", "XL", "XXL"] {
            let button = CustomRoundedButton()
            button.setTitle(title, for: .normal)
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
    
    private func buttonTapped(_ tappedButton: CustomRoundedButton?) {
        buttons.forEach { $0.backgroundColor = defaultColor }
        buttons.forEach { $0.setTitleColor(.gray, for: .normal) }
        
        tappedButton?.backgroundColor = selectedColor
        tappedButton?.setTitleColor(.white, for: .normal)
        
        if let title = tappedButton?.currentTitle {
                    print("Tapped button title: \(title)")
                }
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
}
