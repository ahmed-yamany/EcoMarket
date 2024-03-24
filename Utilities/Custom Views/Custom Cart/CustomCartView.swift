//
//  CustomCartView.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 22/03/2024.
//

import UIKit

class CustomCartView: UIView {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var labelRoundedView: UIView!
    @IBOutlet weak var cartIcon: UIImageView!
    @IBOutlet weak var cartRoundedView: UIView!
    
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
        countLabel.text = "100"
    }
    
    private func configureViewsUI() {
        cartRoundedView.backgroundColor = .white
        cartRoundedView.layer.cornerRadius = 15
        cartRoundedView.layer.shadowColor = UIColor.black.cgColor
        cartRoundedView.layer.shadowOpacity = 0.5
        cartRoundedView.layer.shadowOffset = .zero
        cartRoundedView.layer.shadowRadius = 10
        labelRoundedView.backgroundColor = .black
        labelRoundedView.layer.cornerRadius = 8
        
        cartIcon.image = AppImage.Icon.cart
    }
    
    private func configureCountLabelUI() {
        countLabel.textColor = .emBackground
        countLabel.font = .regular
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
