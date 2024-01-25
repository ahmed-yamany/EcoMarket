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
        mainView.layer.cornerRadius = 10
        mainView.backgroundColor = .black
        
        imageView.image = UIImage(named: "rating")
        
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
        // swiftlint:disable all
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil)![0] as! UIView
        addSubview(view)
        view.frame = bounds
        // swiftlint:enable all
    }
}
