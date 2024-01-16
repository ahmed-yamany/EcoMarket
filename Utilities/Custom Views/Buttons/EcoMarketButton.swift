//
//  EcoMarketButton.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 10/01/2024.
//

import UIKit

class EcoMarketButton: UIButton {
    var title: String? {
        get { titleLabel?.text }
        set { setTitle(newValue, for: .normal) }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    // MARK: - Setup Function For Creating Custom Button
    func setupButton() {
        let height: CGFloat = 52
        setTitleColor(.white, for: .normal)
        layer.cornerRadius   = height / 2
        heightAnchor.constraint(equalToConstant: height).isActive = true
        if #available(iOS 15.0, *) {
            configuration = nil
            imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 20)
            titleLabel?.font = .systemFont(ofSize: 16.0, weight: .bold)
        }
    }
}
