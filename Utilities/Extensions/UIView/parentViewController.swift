//
//  parentViewController.swift
//  Grocer
//
//  Created by Ahmed Yamany on 06/01/2024.
//

import UIKit

public extension UIView {
    /// Returns the nearest parent view controller for the current view.
    var parentViewController: UIViewController? {
        sequence(first: self) {
            $0.next
        }.first { $0 is UIViewController } as? UIViewController
    }
}
