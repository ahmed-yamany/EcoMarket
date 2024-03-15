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

class EMTabBarViewModel: ObservableObject, EMTabBarViewModelInterface, WishListUseCaseProtocol, CartUseCaseProtocol {
    
    
    static let shared = EMTabBarViewModel()
    
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
    
    // MARK: - WishListProtocol -
    @Published var wishlist: [Product]
    
    var wishlistPublisher: AnyPublisher<[Product], Never> { $wishlist.eraseToAnyPublisher() }
    
    func addToWishList(_ product: Product) async throws {
        wishlist.append(product)
    }
    
    // MARK: - CartProtocol -
    @Published var cart: [CartProduct] = []
    var cartPublisher: AnyPublisher<[CartProduct], Never> { $cart.eraseToAnyPublisher() }
    
    func addToCart(_ product: CartProduct) async throws {
        cart.append(product)
    }
    
    func removeFromCart(_ product: CartProduct) async throws {
        cart.removeAll(where: {$0 == product })
    }
    
    func updateCount(for product: CartProduct, with count: Int) {
        
    }
}

struct CartProduct: Identifiable, Hashable {
    var id: String { productId }
    let productId: String
    let selectedColor: UIColor
    let selectedSize: ProductSizes
    var count: Int = 0
}
