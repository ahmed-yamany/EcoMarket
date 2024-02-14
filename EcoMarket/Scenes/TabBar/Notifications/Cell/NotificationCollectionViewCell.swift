//
//  NotificationCollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 14/02/2024.
//

import UIKit

class NotificationCollectionViewCell: UICollectionViewCell {
    // MARK: - Outlets
    //
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    // MARK: - Lifecycle Methods
    //
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
        // Make user image view rounded
        userImageView.makeRounded()
    }
    
    // MARK: - Public Methods
        
        /// Configures the cell with the provided notification data.
        ///
        /// - Parameter notification: The notification data to be displayed.
    func setup(notification: NotificationModel) {
        userImageView.image = UIImage(named: notification.image)
        userNameLabel.text = notification.name
        messageLabel.text = notification.message
        
        if let date = notification.date {
            timeLabel.text = formatDate(date)
        } else {
            timeLabel.text = ""
        }
    }
    // MARK: - Private Methods
    //
    /// Formats the given date object into a string using a specific date format.
    private func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy - HH:mm"
        return dateFormatter.string(from: date)
    }
    
    /// Configures the UI appearance of the cell's subviews.
    private func configureUI() {
        userNameLabel.textColor = AppColor.primaryText
        userNameLabel.font = .medium
        
        messageLabel.textColor = AppColor.socialButton
        messageLabel.font = .regular
        
        timeLabel.textColor = AppColor.socialButton
        timeLabel.font = .regular
    }
}
