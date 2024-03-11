//
//  ReviewView.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 25/01/2024.
//

import UIKit

class ProductReviewView: UIView {
    
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var starImageView: UIImageView!
    
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
        layer.cornerRadius = 15
        backgroundColor = .black
        
        starImageView.image = AppImage.Icon.rating
        configureReviewLabel()
        configureReviewCountLabel()
    }
    
    private func configureReviewLabel() {
        reviewLabel.font = .medium
        reviewLabel.textColor = AppColor.backgroundColor
    }
    
    private func configureReviewCountLabel() {
        reviewCountLabel.font = .small
        reviewCountLabel.textColor = AppColor.backgroundColor
    }
    
    public func setReview(count: String, review: Double) {
        reviewLabel.text = String(review)
        reviewCountLabel.text = String(count)

    }
    
    /// Loads the view from a nib file and adds it as a subview to the OnboardingTextField view.
    private func loadNib() {
        // swiftlint:disable all
        if let loadedViews = Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil),
           let view = loadedViews.first as? UIView {
            addSubview(view)
            
            view.frame = bounds
        }
        // swiftlint:enable all
    }
}
