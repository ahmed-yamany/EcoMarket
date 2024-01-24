//
//  UIView+centerInSuperviewConstraints.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 05/01/2023.
//

import UIKit

extension UIView {
    /**
       Centers the view within its superview with optional size and position adjustments.
       
       - Parameters:
          - size: The size of the view (default is CGSize.zero).
          - xConstant: The constant value to adjust the view's centerX constraint (default is 0).
          - yConstant: The constant value to adjust the view's centerY constraint (default is 0).
       
       - Returns: An `AnchoredConstraints` instance that stores all the created constraints.
       */
    @discardableResult
    public func centerInSuperview(size: CGSize = .zero,
                                  xConstant: CGFloat = 0,
                                  yConstant: CGFloat = 0) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        if let superview = superview {
            anchoredConstraints.centerX = centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: xConstant)
            anchoredConstraints.centerY = centerYAnchor.constraint(equalTo: superview.centerYAnchor,
                                                                   constant: yConstant)
        }
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        [anchoredConstraints.centerX, anchoredConstraints.centerY,
         anchoredConstraints.width, anchoredConstraints.height].forEach { $0?.isActive = true }
        return anchoredConstraints
    }
    /**
     Centers the view horizontally within its superview with an optional constant adjustment.
     
     - Parameters:
        - constant: The constant value to adjust the view's centerX constraint.
     
     - Returns: The `NSLayoutConstraint` instance representing the centerX constraint, if created; otherwise, `nil`.
     */
    @discardableResult
    public func centerXInSuperview(constant: CGFloat = 0) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            let constraint = centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: constant)
            constraint.isActive = true
            return constraint
        }
        return nil
    }

    /**
        Centers the view vertically within its superview with an optional constant adjustment.
        
        - Parameters:
           - constant: The constant value to adjust the view's centerY constraint.
        
        - Returns: The `NSLayoutConstraint` instance representing the centerY constraint, if created; otherwise, `nil`.
        */
    @discardableResult
    public func centerYInSuperview(constant: CGFloat = 0) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
         if let superview = superview {
             let constraint = centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: constant)
             constraint.isActive = true
             return constraint
         }
        return nil
    }
}
