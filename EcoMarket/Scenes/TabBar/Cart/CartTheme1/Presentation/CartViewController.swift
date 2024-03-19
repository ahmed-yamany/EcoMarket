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
    lazy var sections: [any SectionsLayout] =  [productSection, CartPromoCodeSection(), cartCheckOutSection]
    
    private var cancellable: Set<AnyCancellable> = []
    
    let productSection = CustomProductDetailsSection()
    let cartCheckOutSection = CartCheckOutSection()
    
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
        bindViewModel()
        addingRightBarButtonItem()
    }
    
    @objc func rightButtonAction() {
        // Handle the action here
        print("Right bar button item tapped")
    }
    
    private func addingRightBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: AppImage.Icon.cart?.withRenderingMode(.alwaysOriginal),
            style: .done,
            target: self,
            action: #selector(rightButtonAction))
    }
    
    // MARK: - Private Methods
    private func bindViewModel() {
        viewModel.$products.sink {  products in
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return}
                productSection.items = products
                productSection.headerTitle = "My Cart"
                cartCheckOutSection.setup(
                    totalPrice: viewModel.totalPrice,
                    productsCount: products.count
                )
                collectionView.reloadData()
            }
        }
        .store(in: &cancellable)
    }
    
    private func addCollectionViewSections() {
        configureCollectionView()
    }
    
    // MARK: - UI Configuration
    private func configureCollectionView() {
        sections.forEach { section in
            section.registerCell(in: self.collectionView)
            section.registerSupplementaryView(in: self.collectionView)
        }
        collectionView.backgroundColor = AppColor.backgroundColor
        collectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    // MARK: - Compositional Layout
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) in
            self.sections[sectionIndex].sectionLayout(
                self.collectionView,
                layoutEnvironment: layoutEnvironment,
                sectionIndex: sectionIndex
            )
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
