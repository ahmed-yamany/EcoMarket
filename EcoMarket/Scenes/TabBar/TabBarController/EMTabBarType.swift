//
//  EMTabBarType.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 19/01/2024.
//

import UIKit

enum EMTabBarType: Int, CaseIterable, Hashable {
    case home = 0
    case cart
    case notification
    case profile
    
    private var title: String {
        switch self {
            case .home: return "Home"
            case .cart: return "Cart"
            case .notification: return "Notifi"
            case .profile: return "Profile"
        }
    }
    var viewController: UIViewController {
        let vcc = UIViewController()

        switch self {
            case .home:
           return HomeTheme1VC()
            case .cart:
                vcc.view.backgroundColor = .green
            case .notification:
                vcc.view.backgroundColor = .yellow
            case .profile:
                vcc.view.backgroundColor = .red
        }
        return vcc

    }
    
    private var icon: UIImage? {
        switch self {
            case .home: return UIImage(named: "tabbar/home")?.withRenderingMode(.alwaysOriginal)
            case .cart: return UIImage(named: "tabbar/cart")?.withRenderingMode(.alwaysOriginal)
            case .notification: return UIImage(named: "tabbar/notification")?.withRenderingMode(.alwaysOriginal)
            case .profile: return UIImage(named: "tabbar/profile")?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    private var selectedIcon: UIImage? {
        switch self {
            case .home: return UIImage(named: "tabbar/home-selected")?.withRenderingMode(.alwaysOriginal)
            case .cart: return UIImage(named: "tabbar/cart-selected")?.withRenderingMode(.alwaysOriginal)
            case .notification: return UIImage(named: "tabbar/notification-selected")?.withRenderingMode(.alwaysOriginal)
            case .profile: return UIImage(named: "tabbar/profile-selected")?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    var tabBarItem: UITabBarItem {
        let item = UITabBarItem(title: title, image: icon, selectedImage: selectedIcon)
        item.tag = self.rawValue
        return item
    }
}
