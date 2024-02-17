//
//  AppRouter.swift
//  Grocer
//
//  Created by Ahmed Yamany on 01/1/2023.
//

import UIKit

public final class AppRouter {
    public let navigationController: UINavigationController
    public let alertInterface: AlertInterface & UIViewController
    
    var window: UIWindow?
    var parentViewController: UIViewController?
    
    private init() { }
    
    func makeWindow(from windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        window.makeKeyAndVisible()
        self.window = window
        self.present(ProductsViewController(viewModel: .init()))
    }
}
