//
//  SceneDelegate.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 03/01/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    // swiftlint: disable all
    func scene(_ scene: UIScene,willConnectTo session: UISceneSession,options connectionOptions: UIScene.ConnectionOptions) {
        // swiftlint: enable all
        guard let windowScene = (scene as? UIWindowScene) else {
            Logger.log("Fialed to get windowScene", category: \.default, level: .fault)
            return
        }
        AppRouter.shared.makeWindow(from: windowScene)
    }
}
