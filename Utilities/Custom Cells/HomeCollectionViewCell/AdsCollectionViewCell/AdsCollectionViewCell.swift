//
//  AdsCollectionViewCell.swift
//  EcoMarket
//
//  Created by Mohamed Khaled on 13/01/2024.
//

import UIKit

class AdsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Varables
    
    static let cellID = String(describing: AdsCollectionViewCell.self)
    
    // MARK: - @IBOutlets
    
    @IBOutlet weak var adsImage: UIImageView!
    
    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyStyling()
    }
    
    func setupUI(_ item: Item) {
        adsImage.image = UIImage(named: item.image)
    }
    // MARK: - Apply Styling Method
    
    private func applyStyling() {
        adsImage.layer.cornerRadius = 8
    }
    
}
