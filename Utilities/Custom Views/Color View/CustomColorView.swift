//
//  CustomColorView.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 07/03/2024.
//

import UIKit
import MakeConstraints

public protocol CustomColorViewDelegate {
    func colorView(_ colorView: CustomColorView, didSelect color: UIColor)
}

@IBDesignable
open class CustomColorView: UIView {
    
    // MARK: Properties
    let collectionView = ColorCollectionView(frame: .zero, collectionViewLayout: .init())
    
    // MARK: Private Properties
    private var colors: [UIColor] = []
    
    // MARK: Public Properties
    public var selectedButton: UIColor?
    public var colorDelegate: (any CustomColorViewDelegate)?
    
    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: Setup Methods
    func setup() {
        mainViewUI()
        configureCollectionView()
        addSubview(collectionView)
        collectionView.fillSuperview(padding: .init(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    private func mainViewUI() {
        backgroundColor = .white
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.4
        layer.cornerRadius = 20
    }
    
    private func configureCollectionView() {
        collectionView.colorCollectionDelegate = self
    }
    
    // MARK: - Public Methods
    /// Sets the sizes for the buttons in the view.
    ///
    /// - Parameter sizes: An array of size strings to be displayed as buttons.
    public func setColors(_ colors: [UIColor]) {
        collectionView.setColors(colors: colors)
        self.colors = colors
        collectionView.reloadData()
    }
}

// MARK: - SizeCollectionViewDelegate
extension CustomColorView: ColorCollectionViewDelegate {
    func colorView(_ colorView: ColorCollectionView, didSelect color: UIColor, cell: UICollectionViewCell, at indexPath: Int) {
        colorDelegate?.colorView(self, didSelect: colors[indexPath])
    }
}
