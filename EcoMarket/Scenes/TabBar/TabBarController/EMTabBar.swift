//
//  EMTabBar.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 19/01/2024.
//

import UIKit
import MakeConstraints

protocol EMTamBarDelegate: AnyObject {
    // called when a new view is selected by the user (but not programmatically)
    func emTabBar(_ emTabBar: EMTabBar, didSelect emItem: EMTabBarItem)
}

class EMTabBar: UIView {
    // MARK: - subviews
    //
    private let stackView: UIStackView = UIStackView()
    private var tapGestures: [UITapGestureRecognizer] = []
    // MARK: - properties
    //
    private(set) var emItems: [EMTabBarItem] = []
    weak private(set) var selectedItem: EMTabBarItem?
    
    weak var delegate: EMTamBarDelegate?
    
    // MARK: - Initializer
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - setup subviews
    //
    private func setup() {
        backgroundColor = AppColor.backgroundColor
        heightConstraints(46 + (UIApplication.shared.mainWindow?.safeAreaInsets.bottom ?? 20))
        layer.cornerRadius = 12
        setupStackView()
    }
    
    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        addSubview(stackView)
        
        let bottomPadding = (UIApplication.shared.mainWindow?.safeAreaInsets.bottom ?? 0) / 2
        let padding = UIEdgeInsets(top: 0, left: 32, bottom: bottomPadding, right: 32)
        stackView.fillSuperview(padding: padding)
    }
    
    public func setItems(_ items: [UITabBarItem]) {
        for item in items {
            let tabBarItem = EMTabBarItem(item: item)
            stackView.addArrangedSubview(tabBarItem)
            emItems.append(tabBarItem)
        }
        select(emItems.first)
        addTapGestures()
    }
    
    private func addTapGestures() {
        stackView.arrangedSubviews.forEach { view in
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
            view.addGestureRecognizer(tapGesture)
        }
    }

    @objc private func tapped(_ sender: UITapGestureRecognizer) {
        guard let emItem = sender.view as? EMTabBarItem else {
            return
        }
        select(emItem)
        delegate?.emTabBar(self, didSelect: emItem)
    }
    
    private func select(_ item: EMTabBarItem?) {
        selectedItem = item
        for emItem in emItems {
            if item === emItem {
                emItem.select()
            } else {
                emItem.unSelect()
            }
        }
    }
}
