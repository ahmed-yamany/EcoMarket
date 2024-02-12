//
//  Router.swift
//  Grocer
//
//  Created by Ahmed Yamany on 01/1/2023.
//

import UIKit

public protocol Router {
    
    var navigationController: UINavigationController { get }
        
    func present(_ viewController: UIViewController, animated: Bool, completion: @escaping () -> Void)
    
    func presentFullScreen(_ viewController: UIViewController, animated: Bool, completion: @escaping () -> Void)
    
    func presentOverFullScreen(_ viewController: UIViewController, animated: Bool, completion: @escaping () -> Void)
    
    func dismiss(animated: Bool, completion: @escaping () -> Void)
        
    func push(_ viewController: UIViewController, animated: Bool, completion: @escaping () -> Void)
    
    func popToViewController(_ viewController: UIViewController, animated: Bool, completion: @escaping () -> Void)
    
    func popToRoot(animated: Bool, completion: @escaping () -> Void)
}

extension Router {
    func present(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        self.present(viewController, animated: animated, completion: completion)
    }
    
    func presentFullScreen(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        self.presentFullScreen(viewController, animated: animated, completion: completion)
    }
    
    func presentOverFullScreen(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        self.presentOverFullScreen(viewController, animated: animated, completion: completion)
    }
    
    func dismiss(animated: Bool = true, completion: @escaping () -> Void = {}) {
        self.dismiss(animated: animated, completion: completion)
    }
    
    func push(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        self.push(viewController, animated: animated, completion: completion)
    }
    
    func popToViewController(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        self.popToViewController(viewController, animated: animated, completion: completion)
    }
    
    func popToRoot(animated: Bool = true, completion: @escaping () -> Void = {}) {
        self.popToRoot(animated: animated, completion: completion)
    }
}
