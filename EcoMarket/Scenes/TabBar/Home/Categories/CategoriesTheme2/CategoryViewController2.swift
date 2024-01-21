//
//  CategoryViewController2.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 21/01/2024.
//

import UIKit
import Combine

class CategoryViewController2: UIViewController {
    
    // MARK: - Properties
    private(set) var viewModel: Category2ViewModel
    private var cancellable: Set<AnyCancellable> = []
    
    // MARK: - Initializers
    init (viewModel: Category2ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        subscribedCategories()
    }
    
    // MARK: - Combine Subscriptions
        
        /// Sets up Combine subscriptions to update the collection view when the `viewModel.categories` change.
    private func subscribedCategories() {
        viewModel.$categories
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.collectionView.reloadData()
            }
            .store(in: &cancellable)
        
        viewModel.getData()
    }
    
    // MARK: - Configuration
       
       /// Configures the collection view properties.
    private func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, 
                                      bundle: nil),
                                forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    // MARK: - Compositional Layout
        
        /// Creates a compositional layout for the collection view.
        /// - Returns: A UICollectionViewCompositionalLayout object.
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        // Define the size of each item in the collection view.
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        // Create an item with the specified size.
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Apply content insets to the item for spacing.
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 16, trailing: 10)

        // Define the size of the group that contains the items.
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(120))
        
        // Create a vertical group with the specified size and containing the defined item.
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                
        // Create a section with the defined group.
        let section = NSCollectionLayoutSection(group: group)
        
        // Create and return a compositional layout with the defined section.
        return UICollectionViewCompositionalLayout(section: section)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension CategoryViewController2: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categories.count
   }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier,
                                                            for: indexPath) as? CategoryCollectionViewCell else {
            print("Error: Unable to dequeue CategoryCollectionViewCell.")
            return UICollectionViewCell()
        }
        
        cell.setup(category: viewModel.categories[indexPath.row])
        
        return cell
    }
}

extension UICollectionViewCell: Identifiable {
    
}
