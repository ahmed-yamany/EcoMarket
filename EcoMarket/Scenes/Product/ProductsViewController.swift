//
//  ProductsViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 23/01/2024.
//

import UIKit
import Combine

extension LoggingCategories {
    var category: String { "Category" }
}

class ProductsViewController: UICollectionViewController {
    typealias Header = CollectionSectionHeader
    // MARK: - Properties
    //
    private var viewModel: ProductViewModel
    private var cancellable: Set<AnyCancellable> = []
    
    // MARK: - Initializers
    //
    init(viewModel: ProductViewModel) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: .init())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        configureCollectionView()
        subscribedCategories()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        cancellable.forEach { $0.cancel() }
        cancellable.removeAll()
    }
    
    // MARK: - Combine Subscriptions
    private func subscribedCategories() {
        viewModel.$products
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.collectionView.reloadData()
            }
            .store(in: &cancellable)
    }
    
    // MARK: - Configuration
    private func configureCollectionView() {
        
        collectionView.registerNib(ProductCollectionViewCell.self)
        collectionView.register(Header.self,
                                forSupplementaryViewOfKind: Header.elementKind,
                                withReuseIdentifier: Header.identifier)
        collectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    // MARK: - Compositional Layout
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        let interItemSpacing: CGFloat = 15.0
        let padding: CGFloat = 25.0
        let height: CGFloat = 260.0
        
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(height))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: padding, bottom: padding, trailing: padding)
        group.interItemSpacing = .fixed(interItemSpacing)
        
        // Header
        let header = createHeader()
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [header]
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func createHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: CollectionSectionHeader.elementKind,
            alignment: .top
        )
        
        header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)
        return header
    }
    
    // MARK: - UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: ProductCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
            Logger.log("Can't dequeue ProductsCollectionViewCell", category: \.category, level: .fault)
            return UICollectionViewCell()
        }
        cell.setup(product: viewModel.products[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = viewModel.products[indexPath.row]
        viewModel.showDetails(product: product)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                           withReuseIdentifier: Header.identifier,
                                                                           for: indexPath) as? Header else {
            Logger.log("Failed to get header view", category: \.category, level: .fault)
            return UICollectionReusableView()
        }
        header.setTitle(viewModel.category)
        return header
    }
}
