//
//  HeaderView.swift
//  EcoMarket
//
//  Created by Mohamed Khaled on 13/01/2024.
//

import UIKit

import UIKit

class HeaderView: UICollectionReusableView {
    // Cell identifier for dequeuing
    static let cellID = String(describing: HeaderView.self)
    
    // MARK: - @IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Set Title
    
    // Property observer to update the title label when the title is set
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
}
