//
//  AppRouter.swift
//  Grocer
//
//  Created by Ahmed Yamany on 01/1/2023.
//

import UIKit
import SwiftUI
import Combine

final class AppRouter: Router {
    public static let shared = AppRouter()
    
    var window: UIWindow?
    var parentViewController: UIViewController?
    
    private init() { }
    
    func makeWindow(from windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        window.makeKeyAndVisible()
        self.window = window
        self.present(EMTabBarViewController())
    }
    
    func present(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        guard let window else {
            Logger.log("App Router Window is nil", category: \.default, level: .fault)
            return
        }
        window.rootViewController = viewController
    }
    
    func dismiss(animated: Bool = true, completion: @escaping () -> Void = {}) {}
}
