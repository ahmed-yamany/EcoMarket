//
//  UIView+FillSuperviewConstraints.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 05/01/2023.
//

import UIKit

extension UIView {
    /**
      Fills the view within its superview with optional padding on all sides.
      
      - Parameters:
         - padding: The padding to apply on all sides of the view (default is UIEdgeInsets.zero).
    */
    public func fillSuperview(padding: UIEdgeInsets = .zero) {
        self.fillYSuperView(paddingTop: padding.top, paddingBottom: padding.bottom)
        self.fillXSuperView(paddingLeft: padding.left, paddingRight: padding.right)
    }
    /**
       Fills the view horizontally within its superview with optional padding on the leading and trailing sides.
       
       - Parameters:
          - paddingLeft: The padding value to apply on the leading side of the view (default is 0).
          - paddingRight: The padding value to apply on the trailing side of the view (default is 0).
    */
    public func fillXSuperView(paddingLeft: CGFloat = 0, paddingRight: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: paddingLeft).isActive = true
        }
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -paddingRight).isActive = true
        }
    }
    /**
       Fills the view vertically within its superview with optional padding on the top and bottom sides.
       
       - Parameters:
          - paddingTop: The padding value to apply on the top side of the view (default is 0).
          - paddingBottom: The padding value to apply on the bottom side of the view (default is 0).
    */
    public func fillYSuperView(paddingTop: CGFloat = 0, paddingBottom: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: paddingTop).isActive = true
        }
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -paddingBottom).isActive = true
        }
    }
}
