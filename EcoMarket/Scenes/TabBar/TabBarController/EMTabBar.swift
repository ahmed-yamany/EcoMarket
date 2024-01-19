//
//  EMTabBar.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 19/01/2024.
//

import UIKit

class EMTabBar: UIView {
    // MARK: - subviews
    //
    let stackView: UIStackView = UIStackView()
    
    // MARK: - properties
    //
    var items: [EMTabBarItem] = []
    weak var selectedItem: EMTabBarItem?
    
    // MARK: - Intitializers
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
        setupStackView()
        backgroundColor = AppColor.backgroundColor
        heightConstraints(46 + (UIApplication.shared.mainWindow?.safeAreaInsets.bottom ?? 20))
        layer.cornerRadius = 12
        addTabsToStackView()
    }
    
    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
    }
    
    // MARK: - setup subviews
    //
    
    private func addTabsToStackView() {
        addSubview(stackView)
        stackView.fillSuperview(padding: UIEdgeInsets(top: 0,
                                                      left: 32,
                                                      bottom: (UIApplication.shared.mainWindow?.safeAreaInsets.bottom ?? 0) / 2,
                                                      right: 32))
        for type in EMTabBarType.allCases {
            
            let tab = EMTabBarItem(item: type.tabBarItem)
            stackView.addArrangedSubview(tab)
            items.append(tab)
        }
        
        stackView.arrangedSubviews.forEach { view in
            let tabGesture = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
            view.addGestureRecognizer(tabGesture)
        }
    }
    
    @objc func tapped(_ sender: UIView) {
//        print("Tapped")
//        EMTabBarViewModel.shared.selectedTab = type
    }
}
