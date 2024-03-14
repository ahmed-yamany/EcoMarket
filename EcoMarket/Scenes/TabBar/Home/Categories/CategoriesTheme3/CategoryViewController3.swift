//
//  CategoryViewController3.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 22/01/2024.
//

import UIKit
import Combine

class CategoryViewController3: UIViewController {
    
    // MARK: - Properties
    //
    private(set) var viewModel: Category3ViewModel
    private var cancellable: Set<AnyCancellable> = []
    
    // MARK: - Initializers
    //
    init (viewModel: Category3ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Outlets
    //
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - View Lifecycle
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        subscribedCategories()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        cancellable.forEach { $0.cancel() }
    }
    
    // MARK: - Combine Subscriptions
    //
    /// Sets up Combine subscriptions to update the collection view when the `viewModel.categories` change.
    private func subscribedCategories() {
        viewModel.$categories
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.collectionView.reloadData()
            }
            .store(in: &cancellable)
    }
    
    // MARK: - Configuration
    //
    /// Configures the collection view properties.
    private func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNib(CategoryCollectionViewCell3.self)
        collectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    // MARK: - Compositional Layout
    //
    /// Creates a compositional layout for the collection view.
    /// - Returns: A UICollectionViewCompositionalLayout object.
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 15, trailing: 20)

        // Section
        let section = NSCollectionLayoutSection(group: group)
        
        // Create and return a compositional layout with the defined section.
        return UICollectionViewCompositionalLayout(section: section)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
//
extension CategoryViewController3: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categories.count
   }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: CategoryCollectionViewCell3 = collectionView.dequeue(indexPath: indexPath) else {
            Logger.log("Error: Unable to dequeue CategoryCollectionViewCell3.", category: \.default, level: .fault)
            return UICollectionViewCell()
        }
        
        let categoryName = viewModel.categories[indexPath.row]
        let categoryDetail = viewModel.getCategoryDetail(category: categoryName )
        cell.setup(categoryName: categoryName, categoryDetail: categoryDetail)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = viewModel.categories[indexPath.row]
        viewModel.showProductView(category: category)
    }
}
