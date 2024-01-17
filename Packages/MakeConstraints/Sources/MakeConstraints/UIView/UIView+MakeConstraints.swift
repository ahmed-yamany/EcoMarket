//
//  UIView+Constraints.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 05/01/2023.
//

import UIKit

/**
 A structure to store constraints for the edges and size of a view.
 */
public struct AnchoredConstraints {
    public var top: NSLayoutConstraint?
    public var leading: NSLayoutConstraint?
    public var bottom: NSLayoutConstraint?
    public var trailing: NSLayoutConstraint?
    public var centerX: NSLayoutConstraint?
    public var centerY: NSLayoutConstraint?
    public var width: NSLayoutConstraint?
    public var height: NSLayoutConstraint?
}
extension UIView {
    /**
     Creates constraints for the edges and size of the view.
     
     - Parameters:
        - topAnchor: The top anchor to create a constraint for the top edge of the view.
        - bottomAnchor: The bottom anchor to create a constraint for the bottom edge of the view.
        - leadingAnchor: The leading anchor to create a constraint for the leading edge of the view.
        - trailingAnchor: The trailing anchor to create a constraint for the trailing edge of the view.
        - centerXAnchor: The centerX anchor to create a constraint for the centerX of the view.
        - centerYAnchor: The centerY anchor to create a constraint for the centerY of the view.
        - padding: The padding values to apply to the constraints (default is UIEdgeInsets.zero).
        - size: The size to create constraints for the width and height of the view (default is CGSize.zero).
     
     - Returns: An `AnchoredConstraints` instance that stores all the created constraints.
     */
    @discardableResult
    public func makeConstraints(
          topAnchor: NSLayoutYAxisAnchor? = nil,
          bottomAnchor: NSLayoutYAxisAnchor? = nil,
          leadingAnchor: NSLayoutXAxisAnchor? = nil,
          trailingAnchor: NSLayoutXAxisAnchor? = nil,
          centerXAnchor: NSLayoutXAxisAnchor? = nil,
          centerYAnchor: NSLayoutYAxisAnchor? = nil,
          padding: UIEdgeInsets = .zero,
          size: CGSize = .zero ) -> AnchoredConstraints {
            /// Tell the view to disable automatic constraints
            translatesAutoresizingMaskIntoConstraints = false
            var anchoredConstraints = AnchoredConstraints()

            /// If a top anchor is provided, create a constraint for the top edge of the view
            if let topAnchor = topAnchor {
                anchoredConstraints.top = self.topAnchor.constraint(equalTo: topAnchor, constant: padding.top)
            }

            /// If a leading anchor is provided, create a constraint for the leading edge of the view
            if let leadingAnchor = leadingAnchor {
                anchoredConstraints.leading = self.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                                            constant: padding.left)
            }

            /// If a bottom anchor is provided, create a constraint for the bottom edge of the view
            if let bottomAnchor = bottomAnchor {
                anchoredConstraints.bottom = self.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                                          constant: -padding.bottom)
            }
            /// If a trailing anchor is provided, create a constraint for the trailing edge of the view

            if let trailingAnchor = trailingAnchor {
                anchoredConstraints.trailing = self.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                                              constant: -padding.right)
            }
            /// If a centerX anchor is provided, create a constraint for the centerX of the view
            if let centerXAnchor = centerXAnchor {
                anchoredConstraints.centerX = self.centerXAnchor
                    .constraint(equalTo: centerXAnchor,
                                constant: padding.right > 0 ? -padding.right : padding.left)
            }
            /// If a centerY anchor is provided, create a constraint for the centerY of the view
            if let centerYAnchor = centerYAnchor {
                anchoredConstraints.centerY = self.centerYAnchor
                    .constraint(equalTo: centerYAnchor,
                                constant: padding.top > 0 ? padding.top : -padding.bottom)
            }
            /// If a width value is provided, create a constraint for the width of the view
            if size.width != 0 {
              anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
            }

            /// If a height value is provided, create a constraint for the height of the view
            if size.height != 0 {
              anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
            }

            /// Activate all of the constraints
              [anchoredConstraints.top, anchoredConstraints.leading,
               anchoredConstraints.bottom, anchoredConstraints.trailing,
               anchoredConstraints.width, anchoredConstraints.height,
               anchoredConstraints.centerX, anchoredConstraints.centerY].forEach { $0?.isActive = true }

            /// Return the anchoredConstraints instance
            return anchoredConstraints
        }
}
