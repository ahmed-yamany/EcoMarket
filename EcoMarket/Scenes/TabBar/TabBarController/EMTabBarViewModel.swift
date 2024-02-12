//
//  EMTabBarViewModel.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 19/01/2024.
//

import UIKit
import Combine

class EMTabBarViewModel: ObservableObject {
protocol EMTabBarViewModelInterface: AnyObject {
    var selectedTab: EMTabBarType { get set }
    var selectedTabPublisher: Published<EMTabBarType>.Publisher { get }
}
class EMTabBarViewModel: ObservableObject, EMTabBarViewModelInterface {
    
    static let shared = EMTabBarViewModel()
    
    @Published var selectedTab: EMTabBarType = .home
    var selectedTabPublisher: Published<EMTabBarType>.Publisher { $selectedTab }
}
