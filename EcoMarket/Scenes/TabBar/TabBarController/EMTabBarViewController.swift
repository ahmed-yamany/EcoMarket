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
    let customTabBar = EMTabBar()
    
    let viewModel = EMTabBarViewModel.shared
    
    var cancellableSet = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = EMTabBarType.allCases.map { $0.viewController }
        tabBar.isHidden = true
        view.addSubview(customTabBar)
        customTabBar.fillXSuperView()
        customTabBar.makeConstraints(bottomAnchor: view.bottomAnchor)
        
        viewModel.$selectedTab.sink { type in
//            self.selectedIndex = type.rawValue
            for item in self.customTabBar.items {
//                print(item.tag, type.rawValue)
                if item.tag == type.rawValue {
                    item.select()
                } else {
                    item.unSelect()
                }
            }
        }
        .store(in: &cancellableSet)
        
    }
}
