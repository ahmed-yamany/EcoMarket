//
//  ProfileCollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 07/02/2024.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var indicatorImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        indicatorImage.image = AppImage.arrow
        setupUI()
    }

    func setup(profile: ProfileModel) {
        titleLabel.text = profile.title
        image.image = UIImage(named: profile.image)
    }
    
    // MARK: - UI Setup
    
    /// Sets up the UI components of the cell.
    private func setupUI() {
        // Title Label UI
        titleLabel.font = .medium
        titleLabel.textColor = AppColor.primaryText
        
        // Cell UI
        backgroundColor = .clear
    }
}
