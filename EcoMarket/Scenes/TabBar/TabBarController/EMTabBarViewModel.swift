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
    
    var notifications: [Notification] { get set }
    var notificationsPublisher: Published<[Notification]>.Publisher { get }
    
    var viewControllers: [UIViewController] { get set }
    
    func viewDidLoad()
}

class EMTabBarViewModel: ObservableObject, EMTabBarViewModelInterface, CustomProductUseCaseProtocol {
    
    static let shared = EMTabBarViewModel()
    
    @Published var tabBarIsHidden: Bool = false
    var tabBarIsHiddenPublisher: Published<Bool>.Publisher { $tabBarIsHidden }
    
    @Published var selectedTab: EMTabBarType = .home
    var selectedTabPublisher: Published<EMTabBarType>.Publisher { $selectedTab }
    
    @Published var notifications: [Notification] = []
    var notificationsPublisher: Published<[Notification]>.Publisher { $notifications }
    
    var viewControllers: [UIViewController] = []
    
    func viewDidLoad() {
        getData()
    }
    
    private func getData() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.notifications = Notification.mockData
            }
        }
    }
    
    // MARK: - CartProtocol -
    @Published var savedProduct: [CustomProductDetails] = []
    var savedProductPublisher: AnyPublisher<[CustomProductDetails], Never> { $savedProduct.eraseToAnyPublisher() }
    
    func saveProduct(_ product: CustomProductDetails) async throws {
        if let index = savedProduct.firstIndex(where: { $0.id == product.id}) {
            savedProduct[index].isFavorite = true
            savedProduct[index].inCart = true
        } else {
            savedProduct.append(product)
        }
    }
    
    func removeFromSaved(_ product: CustomProductDetails, fromCart: Bool) async throws {
        if let index = savedProduct.firstIndex(where: { $0.id == product.id}), product.isFavorite && product.inCart {
            if fromCart {
                savedProduct[index].inCart = false
            } else {
                savedProduct[index].isFavorite = false
            }
        } else {
            savedProduct.removeAll(where: {$0 == product })
        }
    }
    
    func updateCount(for product: CustomProductDetails, with count: Int) {
        
    }
}
