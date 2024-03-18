//
//  CartViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 27/01/2024.
//

import UIKit
import Combine

class CartViewController: UICollectionViewController {
    
    // MARK: - Properties
    lazy var sections: [any SectionsLayout] =  [productSection, CartPromoCodeSection(), CartCheckOutSection()]

    private var cancellable: Set<AnyCancellable> = []
    
    let productSection = CustomProductDetailsSection()

    // MARK: - Initializer -
    let viewModel: CartViewModel

    init(viewModel: CartViewModel) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: .init())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        addCollectionViewSections()
        productSection.delegate = self
        viewModel.$products.sink {  products in
            
            DispatchQueue.main.async {
                self.productSection.items = products
                self.productSection.headerTitle = "My Cart"
                self.collectionView.reloadData()
            }
        }
        .store(in: &cancellable)
    }
    
    private func addCollectionViewSections() {
        configureCollectionView()
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
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) in
            self.sections[sectionIndex].sectionLayout(self.collectionView, layoutEnvironment: layoutEnvironment)
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
    
    override func collectionView(_ collectionView: UICollectionView, 
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        sections[indexPath.section].collectionView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension CartViewController: CustomProductDetailsSectionDelegate {
    func customProductDetails(_ section: CustomProductDetailsSection, product: CustomProductDetails) {
        
    }
    
    func customProductDetailsSection(
        _ section: CustomProductDetailsSection,
        willRemove item: (Product, CustomProductDetails),
        at indexPath: IndexPath
    ) {
        viewModel.removeCartViewModel(item.1)
    }
}
