//
//  OnboardingRouter.swift
//  Grocer
//
//  Created by Ahmed Yamany on 01/1/2023.
//
import UIKit

/**
 A class that conforms to the `Router` protocol and provides modal presentation and dismissal functionality.
 */
class ModalRouter: Router {
    public var parentViewController: UIViewController?
    
     /// Presents a view controller modally on the parent view controller.
    func present(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        guard parentViewController != nil else {
            Logger.log("Modal Router parentViewController is nil", category: \.default, level: .info)
            // If nil, set the parentViewController to the provided viewController
            parentViewController = viewController
            return
        }
        viewController.modalPresentationStyle = .fullScreen
        parentViewController?.topMostViewController().present(viewController, animated: animated, completion: completion)
    }
    
    func dismiss(animated: Bool = true, completion: @escaping () -> Void = {}) {
        // Use the topMostViewController extension to get the topmost view controller
        // and dismiss the currently presented view controller
        parentViewController?.topMostViewController().dismiss(animated: animated, completion: completion)
    }
}
