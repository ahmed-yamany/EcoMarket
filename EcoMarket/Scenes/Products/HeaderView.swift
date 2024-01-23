//
//  HeaderView.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 23/01/2024.
//

import UIKit

class Header: UICollectionReusableView {
    
    static let identifier = String(describing: Header.self)
    static let elementKind = String("Clothes")
    
    // Create a UILabel for displaying the header text
    let label = UILabel()
    
    // MARK: - Initialization
    //
    // Initializer when creating the header programmatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.text = "Clothes"
        label.font = .h2
        
        addSubview(label)
    }
    
    // LayoutSubviews is called whenever the layout of the header view is updated
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.frame = bounds
    }
    
    // Required initializer for implementing from a storyboard or nib file
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
