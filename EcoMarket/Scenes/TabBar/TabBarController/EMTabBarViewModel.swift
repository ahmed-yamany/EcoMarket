//
//  EMTabBarViewModel.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 19/01/2024.
//

import UIKit
import Combine

class EMTabBarViewModel: ObservableObject {
    static let shared = EMTabBarViewModel()
    @Published var selectedTab: EMTabBarType = .home
}
