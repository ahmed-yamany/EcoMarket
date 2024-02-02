//
//  CartViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 27/01/2024.
//

import UIKit

protocol CollectionSection {
    associatedtype ItemsType
    var items: [ItemsType] { get set }
    func numberOfItems() -> Int
    func sectionLayout() -> NSCollectionLayoutSection
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    func collectionView(_ collectionView: UICollectionView, 
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView
    func registerCell(in collectionView: UICollectionView)
    func registerSupplementaryView(in collectionView: UICollectionView)
}

class CartViewController: UICollectionViewController {
    
    var sections: [any CollectionSection] = []
    
    // MARK: Initializer
    init() {
        super.init(collectionViewLayout: .init())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        let productsSection = CartProductsSection()
        productsSection.items = CartModel.products
        
        sections = [productsSection, CartPromoCodeSection(), CartCheckOutSection()]
        configureCollectionView()
        collectionView.reloadData()
    }
    
    // MARK: - UI Configuration
    
    /// Configures the collection view with necessary settings and registers cell classes.
    private func configureCollectionView() {
        sections.forEach { section in
            section.registerCell(in: self.collectionView)
            section.registerSupplementaryView(in: self.collectionView)
        }
        collectionView.backgroundColor = AppColor.backgroundColor
        collectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    // MARK: - Compositional Layout
    //
    /// Creates a compositional layout for the collection view.
    /// - Returns: A UICollectionViewCompositionalLayout object.
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, _) in
            self.sections[sectionIndex].sectionLayout()
        }
    }
    
    // MARK: - UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItems()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        sections[indexPath.section].collectionView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
    }
}
    
extension UICollectionReusableView: Identifiable {}

class Header: UICollectionReusableView {
    static let elementKind = String("My Cart")
    
    let label = UILabel()
    
    // MARK: - Initialization
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel() {
        label.font = .h2
        label.textColor = AppColor.primaryText
        addSubview(label)
    }
    
    public func setTitle(_ title: String) {
        label.text = title
    }
}
