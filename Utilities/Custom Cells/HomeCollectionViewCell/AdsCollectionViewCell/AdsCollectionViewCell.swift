//
//  AdsCollectionViewCell.swift
//  EcoMarket
//
//  Created by Mohamed Khaled on 13/01/2024.
//

import UIKit

import UIKit

class AdsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Variables
    
    // Cell identifier for dequeuing
    static let cellID = String(describing: AdsCollectionViewCell.self)
    
    // MARK: - @IBOutlets
    
    @IBOutlet weak var adsImage: UIImageView!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Apply initial styling when the cell is loaded
        applyStyling()
    }
    
    // MARK: - UI Setup Method
    
    // Update the cell UI with data from the model
    func setupUI(_ item: Adds) {
        adsImage.image = UIImage(named: item.image)
    }
    
    // MARK: - Apply Styling Method
    
    // Apply styling to the UI elements of the cell
    private func applyStyling() {
        adsImage.layer.cornerRadius = 8
    }
}
