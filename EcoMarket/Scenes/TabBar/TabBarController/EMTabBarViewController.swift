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
    
    var cancellable = Set<AnyCancellable>()
    
    let viewModel: EMTabBarViewModelInterface
    init(viewModel: EMTabBarViewModelInterface) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isHidden = true
        viewControllers = EMTabBarType.allCases.map { $0.viewController }
        setupEMTapBar()
        viewModel.selectedTabPublisher.sink { [weak self] type in
            self?.selectedIndex = type.rawValue
            self?.emTabBar.selectItem(at: type.rawValue)
        }
        .store(in: &cancellable)
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
        viewModel.selectedTab = EMTabBarType(rawValue: emItem.tag) ?? .home
    }
}
