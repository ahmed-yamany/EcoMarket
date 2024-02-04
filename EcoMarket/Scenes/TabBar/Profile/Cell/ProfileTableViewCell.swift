//
//  ProfileTableViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 04/02/2024.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    // MARK: - Outlets
    //
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Initialization
    //
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - Configuration
    
    /// Configures the cell with the provided profile data.
    ///
    /// - Parameter profile: The profile model to be displayed.
    func setup(profile: ProfileModel) {
        titleLabel.text = profile.title
        titleImageView.image = UIImage(named: profile.image)
    }
    
    // MARK: - UI Setup
    
    /// Sets up the UI components of the cell.
    private func setupUI() {
        // Title Label UI
        titleLabel.font = .medium
        titleLabel.textColor = AppColor.primaryText
        
        // Cell UI
        backgroundColor = .clear
        selectionStyle = .none
    }
}
