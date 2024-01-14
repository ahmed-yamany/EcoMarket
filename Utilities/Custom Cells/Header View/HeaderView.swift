//
//  HeaderView.swift
//  EcoMarket
//
//  Created by Mohamed Khaled on 13/01/2024.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    // MARK: - @IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Set Title
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
}
