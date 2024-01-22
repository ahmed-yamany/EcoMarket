//
//  TabBarViewController.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 11/01/2024.
//

import UIKit
import MakeConstraints
import Combine

class EMTabBarViewController: UITabBarController {
    let emTabBar = EMTabBar()
    
//    let viewModel = EMTabBarViewModel.shared
    
    var cancellableSet = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isHidden = true
        viewControllers = EMTabBarType.allCases.map { $0.viewController }
        setupEMTapBar()
    }
    
    private func setupEMTapBar() {
        emTabBar.delegate = self
        view.addSubview(emTabBar)
        emTabBar.fillXSuperView()
        emTabBar.makeConstraints(bottomAnchor: view.bottomAnchor)
        emTabBar.setItems(EMTabBarType.allCases.map { $0.tabBarItem })
    }
}

extension EMTabBarViewController: EMTamBarDelegate {
    func emTabBar(_ emTabBar: EMTabBar, didSelect emItem: EMTabBarItem) {
        selectedIndex = emItem.tag
    }
}
