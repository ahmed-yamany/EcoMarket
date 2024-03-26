//
//  CustomCartView.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 22/03/2024.
//

import UIKit

class CustomCartView: UIView {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var cartIcon: UIImageView!
    @IBOutlet weak var cartRoundedView: UIView!
    @IBOutlet weak var cartCountLabelWidthConstraints: NSLayoutConstraint!
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
        configureUI()
    }
    
    func configureUI() {
        configureViewsUI()
        configureCountLabelUI()
    }
    
    private func configureViewsUI() {
        self.layer.masksToBounds = false
        self.equalSizeConstraints(30)
        cartRoundedView.backgroundColor = .white
        cartRoundedView.layer.cornerRadius = 15
        cartRoundedView.layer.shadowColor = UIColor.black.cgColor
        cartRoundedView.layer.shadowOpacity = 0.3
        cartRoundedView.layer.shadowOffset = .zero
        cartRoundedView.layer.shadowRadius = 5
        cartIcon.image = AppImage.Icon.cart
    }
    
    private func configureCountLabelUI() {
        countLabel.textColor = .emBackground
        countLabel.font = .custom(size: 7, weight: .semibold)
        countLabel.backgroundColor = .black
        countLabel.clipsToBounds = true
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
    
    func setCount(_ count: Int) {
        DispatchQueue.main.async {
            if count == 0 {
                self.countLabel.isHidden = true
            } else {
                self.countLabel.isHidden = false
                self.countLabel.text = "\(count)"
                self.countLabel.layer.cornerRadius = self.cartCountLabelWidthConstraints.constant / 2
            }
        }
    }
}
