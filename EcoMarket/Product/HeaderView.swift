//
//  HeaderView.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 23/01/2024.
//

import UIKit

extension UICollectionReusableView: Identifiable {}

class Header: UICollectionReusableView {
    static let elementKind = String("Clothes")
    
    let label = UILabel()
    
    // MARK: - Initialization
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel() {
        label.font = .h2
        addSubview(label)
    }
    
    public func setTitle(_ title: String) {
        label.text = title
    }
}
