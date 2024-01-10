//
//  mainWindow.swift
//  Grocer
//
//  Created by Ahmed Yamany on 07/01/2024.
//

import UIKit

@available(iOS 13.0, *)
public extension UIApplication {
    var mainWindow: UIWindow? {
        connectedScenes
            .compactMap {
                $0 as? UIWindowScene
            }
            .flatMap {
                $0.windows
            }
            .first {
                $0.isKeyWindow
            }
    }
}

public extension UIApplication {
    // This function returns the topmost view controller by starting from the root view controller of the key window.
    @available(iOS 13.0, *)
    func topMostViewController() -> UIViewController? {
        return self.mainWindow?.rootViewController?.topMostViewController()
    }
}
