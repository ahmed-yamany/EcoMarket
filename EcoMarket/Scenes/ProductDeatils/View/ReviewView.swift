//
//  ReviewView.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 25/01/2024.
//

import UIKit

class ReviewView: UIView {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var reviewCount: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        configureView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
        configureView()
    }
    
    private func configureView() {
        mainView.layer.cornerRadius = 15
        mainView.backgroundColor = .black
        
        imageView.image = AppImage.ratingIcon
        
        reviewLabel.text = "4.9"
        reviewLabel.font = .medium
        reviewLabel.textColor = AppColor.backgroundColor
        
        reviewCount.text = "170 Review"
        reviewCount.font = .small
        reviewCount.textColor = AppColor.backgroundColor
    }
    /// Loads the view from a nib file and adds it as a subview to the OnboardingTextField view.
    private func loadNib() {
        // Please do not update this code, as it's used to load the view from a nib.
        // Disable swiftlint rules for this block
        // swiftlint:disable all
        
        // Load the view from the nib using the name of the current class
        if let loadedViews = Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil),
            let view = loadedViews.first as? UIView {
            // Add the loaded view as a subview
            addSubview(view)
            
            // Set the frame of the loaded view to match the bounds of the current view
            view.frame = bounds
        }
        
        // Enable swiftlint rules for the rest of the code
        // swiftlint:enable all
    }
}
