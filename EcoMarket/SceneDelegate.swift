//
//  SceneDelegate.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 03/01/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        print("Youssef Pull Test")
        window.rootViewController = ViewController()
        window.makeKeyAndVisible()
        self.window = window
    }
}
