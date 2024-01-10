//
//  Router.swift
//  Grocer
//
//  Created by Ahmed Yamany on 01/1/2023.
//

import UIKit

/// Protocol definition for a Router, which is an AnyObject (class) protocol
public protocol Router: AnyObject {
    // Property to hold the parent view controller
    var parentViewController: UIViewController? { get set }
    
    // Method to present a view controller with animation and completion closure
    func present(_ viewController: UIViewController, animated: Bool, completion: @escaping () -> Void)
    
    // Method to dismiss the currently presented view controller with animation and completion closure
    func dismiss(animated: Bool, completion: @escaping () -> Void)
}

// Extension to provide default implementations for the present and dismiss methods
public extension Router {
    func present(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        present(viewController, animated: animated, completion: completion)
    }
    
    func dismiss(animated: Bool = true, completion: @escaping () -> Void = {}) {
        dismiss(animated: animated, completion: completion)
    }
}
