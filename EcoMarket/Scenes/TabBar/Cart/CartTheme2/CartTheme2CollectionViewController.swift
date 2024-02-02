//
//  CartTheme2CollectionViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 29/01/2024.
//

import UIKit

class CartTheme2CollectionViewController: UICollectionViewController {
    
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
        configureCollectionView()
    }
    
    // MARK: - UI Configuration
    
    /// Configures the collection view with necessary settings and registers cell classes.
    private func configureCollectionView() {
        collectionView.backgroundColor = AppColor.backgroundColor
        collectionView.registerNib(CartTheme2CollectionViewCell.self)
        collectionView.registerNib(CheckOutCollectionViewCell.self)
        
        collectionView.register(Header.self,
                                forSupplementaryViewOfKind: Header.elementKind,
                                withReuseIdentifier: Header.identifier)
        collectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    // MARK: - Compositional Layout
    //
    /// Creates a compositional layout for the collection view.
    /// - Returns: A UICollectionViewCompositionalLayout object.
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let interItemSpacing: CGFloat = 5
        let padding: CGFloat = 25.0
        let height: CGFloat = 144
        return UICollectionViewCompositionalLayout { [weak self] (sectionIndex, layoutEnvironment) in
            guard let self = self else {
                return nil
            }
            switch sectionIndex {
                case 0:
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
                    section.interGroupSpacing = 22
                    return section
                    
                case 1:
                    // Item
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
                default:
                    let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
                    let section = NSCollectionLayoutSection.list(using: configuration, layoutEnvironment: layoutEnvironment)
                    return section
            }
        }
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
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if section == 0 {
            return Cart2Model.products.count
        } else {
            return 1
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
            case 0:
                guard let cell: CartTheme2CollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
                    Logger.log("Can't dequeue ProductsCollectionViewCell", category: \.default, level: .fault)
                    return UICollectionViewCell()
                }
                cell.setup(product: Cart2Model.products[indexPath.row])
                return cell
                
            case 1:
                guard let cell: CheckOutCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
                    Logger.log("Can't dequeue ProductsCollectionViewCell", category: \.default, level: .fault)
                    return UICollectionViewCell()
                }
                return cell
            default:
                return UICollectionViewCell()
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                           withReuseIdentifier: Header.identifier,
                                                                           for: indexPath) as? Header else {
            Logger.log("Failed to get header view", category: \.default, level: .fault)
            return UICollectionReusableView()
        }
        header.setTitle("My Cart")
        return header
    }
}
