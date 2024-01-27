//
//  CartViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 27/01/2024.
//

import UIKit

class CartViewController: UIViewController {
    // MARK: - Outlets
    //
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - View Lifecycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configureCollectionView()
    }
    
    // MARK: - UI Configuration
    
    /// Configures the collection view with necessary settings and registers cell classes.
    private func configureCollectionView() {
        collectionView.registerNib(PrroductCollectionViewCell.self)
        collectionView.registerNib(PromoCodeCollectionViewCell.self)
        collectionView.registerNib(FooterCollectionViewCell.self)
        
        collectionView.register(Header.self,
                                forSupplementaryViewOfKind: Header.elementKind,
                                withReuseIdentifier: Header.identifier)
        collectionView.collectionViewLayout = createCompositionalLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Compositional Layout
    //
    /// Creates a compositional layout for the collection view.
    /// - Returns: A UICollectionViewCompositionalLayout object.
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let interItemSpacing: CGFloat = 5
        let padding: CGFloat = 15.0
        let height: CGFloat = 130
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
                    return section
                    
                case 1:
                    // Item
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
                    
                case 2:
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
}
    
    // MARK: - UICollectionViewDataSource
    extension CartViewController: UICollectionViewDelegate, UICollectionViewDataSource {
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 3
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if section == 0 {
                return CartModel.products.count
            } else {
                return 1
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            switch indexPath.section {
                case 0:
                    guard let cell: PrroductCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
                        Logger.log("Can't dequeue ProductsCollectionViewCell", category: \.default, level: .fault)
                        return UICollectionViewCell()
                    }
                    cell.setup(product: CartModel.products[indexPath.row])
                    return cell
                case 1:
                    guard let cell: PromoCodeCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
                        Logger.log("Can't dequeue ProductsCollectionViewCell", category: \.default, level: .fault)
                        return UICollectionViewCell()
                    }
                    return cell
                    
                case 2:
                    guard let cell: FooterCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
                        Logger.log("Can't dequeue ProductsCollectionViewCell", category: \.default, level: .fault)
                        return UICollectionViewCell()
                    }
                    return cell
                default:
                    return UICollectionViewCell()
            }
            
        }
        
        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                            at indexPath: IndexPath) -> UICollectionReusableView {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: Header.identifier,
                                                                               for: indexPath) as? Header else {
                Logger.log("Failed to get header view", category: \.default, level: .fault)
                return UICollectionReusableView()
            }
            header.setTitle("Cart")
            return header
        }
    }
    
extension UICollectionReusableView: Identifiable {}

class Header: UICollectionReusableView {
    static let elementKind = String("Cart")
    
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
