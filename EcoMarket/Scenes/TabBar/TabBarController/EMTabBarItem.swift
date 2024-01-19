//
//  EMTabBarItem.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 19/01/2024.
//

import UIKit
import MakeConstraints

class EMTabBarItem: UIView {
    // MARK: - subViews
    //
    private let stackView: UIStackView = UIStackView()
    public let titleLabel = UILabel()
    private let iconView = UIView()
    public let iconImageView = UIImageView()
    
    // MARK: - Properties
    //
    private var widthConstraint: NSLayoutConstraint?
    private let _height: CGFloat = 30
    private let _width: CGFloat = 76
    
    let item: UITabBarItem
    init(item: UITabBarItem) {
        self.item = item
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - setup subviews
    //
    private func setup() {
        layer.cornerRadius = _height / 2
        setupStackView()
        setupIconView()
        setupIconImageView()
        setupTitleLabel()
        addSubViews()
    }
    
    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 2
    }
    
    private func setupIconView() {
        iconView.equalSizeConstraints(_height)
        iconView.layer.cornerRadius = _width - (_height * 2)
    }
    
    private func setupIconImageView() {
        iconImageView.contentMode = .scaleAspectFit
    }
    
    private func setupTitleLabel() {
        titleLabel.text = item.title
        titleLabel.font = .custom(size: 12, weight: .medium)
        titleLabel.textColor = AppColor.primaryText
        titleLabel.textAlignment = .center
    }
    
    // MARK: - add subviews
    //
    private func addSubViews() {
        heightConstraints(_height)
        widthConstraint = widthConstraints(_width)
        
        // add stackView
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 0, left: 0, bottom: 0, right: 2))
        
        // add icon, ImageView
        stackView.addArrangedSubview(iconView)
        iconView.addSubview(iconImageView)
        iconImageView.centerInSuperview(size: .init(width: 14, height: 14))
        
        // add title label
        stackView.addArrangedSubview(titleLabel)
    }
    
    // MARK: - Public Methods
    public func select() {
        widthConstraint?.constant = _width
        backgroundColor = AppColor.secondaryBackground
        iconView.backgroundColor = AppColor.primaryButton
        
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.iconImageView.image = self?.item.selectedImage
            self?.superview?.layoutIfNeeded()
        }
    }
    
    public func unSelect() {
        widthConstraint?.constant = _height
        backgroundColor = .clear
        iconView.backgroundColor = .clear

        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.iconImageView.image = self?.item.image
            self?.superview?.layoutIfNeeded()
        }
    }
}
