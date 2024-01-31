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
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    func registerCell(in collectionView: UICollectionView)
    func registerSupplementaryView(in collectionView: UICollectionView)
}

class CartProductsSection: CollectionSection {
    typealias ItemsType = CartModel
    var items: [CartModel] = []
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: PrroductCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
            Logger.log("Can't dequeue ProductsCollectionViewCell", category: \.default, level: .fault)
            return UICollectionViewCell()
        }
        cell.setup(product: CartModel.products[indexPath.row])
        return cell
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    let interItemSpacing: CGFloat = 5
    let padding: CGFloat = 15.0
    let height: CGFloat = 130
    
    func sectionLayout() -> NSCollectionLayoutSection {
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(height))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: padding, bottom: 0, trailing: padding)
        
        // Header
        let header = createHeader()
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [header]
        section.contentInsets.bottom = 40
        return section
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                           withReuseIdentifier: Header.identifier,
                                                                           for: indexPath) as? Header else {
            Logger.log("Failed to get header view", category: \.default, level: .fault)
            return UICollectionReusableView()
        }
        header.setTitle("My Cart")
        return header
    }
    
    func registerCell(in collectionView: UICollectionView) {
        collectionView.registerNib(PrroductCollectionViewCell.self)
    }
    private func createHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .estimated(50))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: Header.elementKind,
            alignment: .top
        )
        
        header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)
        return header
    }
    func registerSupplementaryView(in collectionView: UICollectionView) {
        collectionView.register(Header.self,
                                forSupplementaryViewOfKind: Header.elementKind,
                                withReuseIdentifier: Header.identifier)
    }
}

class CartPromoCodeSecton: CollectionSection {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        UICollectionReusableView()
    }
    
    typealias ItemsType = String
    var items: [String] =  [""]
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: PromoCodeCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
            Logger.log("Can't dequeue ProductsCollectionViewCell", category: \.default, level: .fault)
            return UICollectionViewCell()
        }
        return cell
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    let interItemSpacing: CGFloat = 5
    let padding: CGFloat = 15.0
    let height: CGFloat = 130
    
    func sectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25)
        group.interItemSpacing = .fixed(interItemSpacing)
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.bottom = 85
        return section
    }

    func registerCell(in collectionView: UICollectionView) {
        collectionView.registerNib(PromoCodeCollectionViewCell.self)
    }
    func registerSupplementaryView(in collectionView: UICollectionView) {
  
    }
}

class CartCheckOutSection: CollectionSection {
    typealias ItemsType = String
    var items: [String] = [""]
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: FooterCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
            Logger.log("Can't dequeue ProductsCollectionViewCell", category: \.default, level: .fault)
            return UICollectionViewCell()
        }
        return cell
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    let interItemSpacing: CGFloat = 5
    let padding: CGFloat = 15.0
    let height: CGFloat = 130
    
    func sectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(110))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25)
        group.interItemSpacing = .fixed(interItemSpacing)
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        UICollectionReusableView()
    }
    
    func registerCell(in collectionView: UICollectionView) {
        collectionView.registerNib(FooterCollectionViewCell.self)
    }
    
    func registerSupplementaryView(in collectionView: UICollectionView) {
        
    }
}

class CartViewController: UICollectionViewController {
    
    var sections: [any CollectionSection] = []
    
    // MARK: Intializer
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
        
        sections = [productsSection, CartPromoCodeSecton(), CartCheckOutSection()]
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
        addSubview(label)
    }
    
    public func setTitle(_ title: String) {
        label.text = title
    }
}
