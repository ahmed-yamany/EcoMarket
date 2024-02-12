//
//  EMTabBarViewModel.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 19/01/2024.
//

import UIKit
import Combine

protocol EMTabBarViewModelInterface: AnyObject {
    var tabBarIsHidden: Bool { get set }
    var tabBarIsHiddenPublisher: Published<Bool>.Publisher { get }
    
    var selectedTab: EMTabBarType { get set }
    var selectedTabPublisher: Published<EMTabBarType>.Publisher { get }
    
    var viewControllers: [UIViewController] { get set }
}

class EMTabBarViewModel: ObservableObject, EMTabBarViewModelInterface {
    static let shared = EMTabBarViewModel()
    
    @Published var tabBarIsHidden: Bool = false
    var tabBarIsHiddenPublisher: Published<Bool>.Publisher { $tabBarIsHidden }
    
    @Published var selectedTab: EMTabBarType = .cart
    var selectedTabPublisher: Published<EMTabBarType>.Publisher { $selectedTab }
    
    var viewControllers: [UIViewController] = []

}
