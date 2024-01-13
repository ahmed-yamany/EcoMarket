//
//  TabBarViewController.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 11/01/2024.
//

import UIKit
import MakeConstraints

enum TabBarType: String, CaseIterable, Hashable {
    case home, cart, notification, profile
    
    var viewController: UIViewController {
       UIViewController()
    }
}

class TabBarViewModel: ObservableObject {
    @Published var selectedTab: TabBarType = .home
}

class TabBarViewController: UITabBarController {
    let customTabBar = CustomTabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = TabBarType.allCases.map { $0.viewController }
        tabBar.isHidden = true
        view.addSubview(customTabBar)
        customTabBar.fillXSuperView()
        customTabBar.makeConstraints(bottomAnchor: view.bottomAnchor)
    }
}

class CustomTabBar: UIView {
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = .white
        heightConstraints(46 + (UIApplication.shared.mainWindow?.safeAreaInsets.bottom ?? 20))
        layer.cornerRadius = 12
        addTabsToStackView()
    }
    
    private func addTabsToStackView() {
        addSubview(stackView)
        stackView.fillSuperview(padding: UIEdgeInsets(top: 0,
                                                      left: 24,
                                                      bottom: (UIApplication.shared.mainWindow?.safeAreaInsets.bottom ?? 0) / 2,
                                                      right: 24))
        for type in TabBarType.allCases {
            let tab = CustomTabBarItem(type: type)
            stackView.addArrangedSubview(tab)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                tab.unSelect()
            }
//            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                tab.select()
            }
        }

    }
    
}

class CustomTabBarItem: UIView {
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        return stackView
    }()
    let label = UILabel()
    let iconView = UIImageView()
    
    private var widthConstraint: NSLayoutConstraint?
    private let _height: CGFloat = 30
    private let _width: CGFloat = 76
    
    let type: TabBarType
    init(type: TabBarType) {
        self.type = type
        super.init(frame: .zero)
        setup()
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setup() {
        heightConstraints(_height)
        widthConstraint = widthConstraints(_width)
        backgroundColor = .red
        layer.cornerRadius = _height / 2
        //
        addSubview(stackView)
        stackView.fillSuperview()
        addIcon()
        addLabel()
    }
    
    private func addIcon() {
        iconView.backgroundColor = .black
        stackView.addArrangedSubview(iconView)
        iconView.equalSizeConstraints(_height)
        iconView.layer.cornerRadius = _width - (_height * 2)
    }
    
    private func addLabel() {
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.text = type.rawValue
        stackView.addArrangedSubview(label)
        label.textAlignment = .center
    }
    
    public func select() {
        widthConstraint?.constant = _width
        UIView.animate(withDuration: 0.5) {
            self.superview?.layoutIfNeeded()
        }
    }
    
    public func unSelect() {
        widthConstraint?.constant = _height
        UIView.animate(withDuration: 0.5) {
            self.superview?.layoutIfNeeded()
        }
    }
}
