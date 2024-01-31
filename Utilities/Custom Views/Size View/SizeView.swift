//
//  SizeView.swift
//  EcoTest
//
//  Created by Ibrahim Nasser Ibrahim on 24/01/2024.
//

import UIKit
import MakeConstraints

public protocol SizeViewDelegate {
    func sizeView(_ sizeView: CustomSizeView, didSelect size: String)
}

@IBDesignable
open class CustomSizeView: UIView {
    
    // MARK: Properties
    //
    let collectionView = SizeCollectionView(frame: .zero, collectionViewLayout: .init())
    private let animatedView: UIView = UIView()
    private var animatedViewConstraints: NSLayoutConstraint?
    
    // MARK: Private Properties
    //
    private var sizeLabels: [String] = []
    private var buttonWidth: CGFloat { frame.height }
    private var buttonHeight: CGFloat { frame.height }
    
    // MARK: Public Properties
    //
    public var selectedButton: String?
    public var sizeDelegate: (any SizeViewDelegate)?
    
    // MARK: Initializer
    //
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: Setup Methods
    //
    /// Configures the initial setup of the  view.
    func setup() {
        backgroundColor = .clear
        configureCollectionView()
        setupAnimatedViewLayout()
        
        addSubview(collectionView)
        collectionView.fillSuperview()
    }
    
    /// setting up and configuring the UICollectionView
    private func configureCollectionView() {
        collectionView.sizeCollectionDelegate = self
    }
    
    /// Sets up the layout for the animated view.
    private func setupAnimatedViewLayout() {
        addSubview(animatedView)
        animatedView.translatesAutoresizingMaskIntoConstraints = false
        animatedView.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        animatedView.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        animatedView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        setupAnimatedView()
    }
    
    /// Sets up the appearance for the animated view.
    private func setupAnimatedView() {
        animatedView.backgroundColor = collectionView.selectedColor
        animatedView.layer.cornerRadius = buttonWidth / 2
    }
    
    /// Animates the selected button and updates the animated view position.
    private func animate(to view: UIView?) {
        animatedViewConstraints?.isActive = false
        if let view {
            animatedViewConstraints = animatedView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            animatedViewConstraints?.isActive = true
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.02) {
            self.layoutIfNeeded()
        }
    }
    
    // MARK: - Public Methods
    /// Sets the sizes for the buttons in the view.
    ///
    /// - Parameter sizes: An array of size strings to be displayed as buttons.
    public func setSizes(_ sizes: [String]) {
        collectionView.setLabels(sizes: sizes)
        self.sizeLabels = sizes
        collectionView.reloadData()
    }
}

// MARK: - SizeCollectionViewDelegate
//
extension CustomSizeView: SizeCollectionViewDelegate {
    func sizeView(_ sizeView: SizeCollectionView, didSelect size: String, cell: UICollectionViewCell, at indexPath: Int) {
        animate(to: cell)
        sizeDelegate?.sizeView(self, didSelect: sizeLabels[indexPath])
    }
}
