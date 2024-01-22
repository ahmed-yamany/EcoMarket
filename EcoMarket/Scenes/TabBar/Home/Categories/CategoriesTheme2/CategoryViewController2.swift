//
//  CategoryViewController2.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 21/01/2024.
//

import UIKit
import Combine

extension UICollectionView {
    func registerFromNib(_ cell: UICollectionViewCell.Type) {
        register(UINib(nibName: cell.identifier, bundle: nil), forCellWithReuseIdentifier: cell.identifier)
    }
    
    func dequeue<Cell: UICollectionViewCell>(indexPath: IndexPath) -> Cell? {
        dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as? Cell
    }
}

class CategoryViewController2: UIViewController {
    // MARK: - Properties
    //
    private(set) var viewModel: Category2ViewModel
    private var cancellable: Set<AnyCancellable> = []
    
    // MARK: - Initializers
    //
    init (viewModel: Category2ViewModel) {
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getData()
    }
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
        collectionView.registerFromNib(CategoryCollectionViewCell.self)
        collectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    // MARK: - Compositional Layout
    
    /// Creates a compositional layout for the collection view.
    /// - Returns: A UICollectionViewCompositionalLayout object.
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 16, trailing: 10)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(120))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        // section
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
        guard let cell: CategoryCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
            
            return UICollectionViewCell()
        }
        
        cell.setup(category: viewModel.categories[indexPath.row])
        
        return cell
    }
}

extension UICollectionViewCell: Identifiable {
    
}
