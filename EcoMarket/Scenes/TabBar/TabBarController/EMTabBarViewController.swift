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
    var tabBarConstraints: AnchoredConstraints?
    
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
        viewModel.viewDidLoad()
        tabBar.isHidden = true
        viewControllers = viewModel.viewControllers
        setupEMTapBar()
        bindSelectedTab()
        bindTabBarIsHidden()
    }
    
    private func setupEMTapBar() {
        emTabBar.delegate = self
        view.addSubview(emTabBar)
        emTabBar.fillXSuperView()
        tabBarConstraints = emTabBar.makeConstraints(bottomAnchor: view.bottomAnchor)
        emTabBar.setItems(EMTabBarType.allCases.map { $0.tabBarItem })
    }
    
    private func bindSelectedTab() {
        viewModel.selectedTabPublisher.sink { [weak self] type in
            self?.selectedIndex = type.rawValue
            self?.emTabBar.selectItem(at: type.rawValue)
        }
        .store(in: &cancellable)
    }
    
    private func bindTabBarIsHidden() {
        viewModel.tabBarIsHiddenPublisher
            .sink { [self] hidden in
                self.tabBarConstraints?.bottom?.constant = hidden ? 100 : 0
                
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                    
                    if !hidden {
                        self.emTabBar.isHidden = hidden
                    }
                } completion: { _ in
                    self.emTabBar.isHidden = hidden
                }
                
            }
            .store(in: &cancellable)
    }
}

extension EMTabBarViewController: EMTamBarDelegate {
    func emTabBar(_ emTabBar: EMTabBar, didSelect emItem: EMTabBarItem) {
        selectedIndex = emItem.tag
        viewModel.selectedTab = EMTabBarType(rawValue: emItem.tag) ?? .home
    }
}
