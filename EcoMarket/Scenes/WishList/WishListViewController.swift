//
//  WishListViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 11/03/2024.
//

import UIKit
import Combine

class WishListViewController: UIViewController {

    // MARK: - Properties
    lazy var sections: [any SectionsLayout] = [wishListSection]
    let wishListSection = CustomProductDetailsSection()
    private var cancellable: Set<AnyCancellable> = []

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scanButton: UIButton!
    
    // MARK: - Initializer -
    let viewModel: WishListViewModel

    init(viewModel: WishListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        viewModel.viewDidLoad()
        addCollectionViewSections()
        wishListSection.delegate = self
        viewModel.$products.sink {  products in
            
            DispatchQueue.main.async {
                self.wishListSection.items = products
                self.wishListSection.headerTitle = "WishList"
                self.collectionView.reloadData()
            }
        }
        .store(in: &cancellable)
    }
    
    private func addCollectionViewSections() {
        configureCollectionView()
    }
    
    // MARK: - UI Configuration
    private func configureUI() {
        view.backgroundColor = AppColor.backgroundColor
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        stackView.isLayoutMarginsRelativeArrangement = true
        setupButtonsUI()
    }
    
    private func setupButtonsUI() {
        scanButton.setTitle("", for: .normal)
        scanButton.setImage(AppImage.Icon.scan, for: .normal)
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
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
            self.sections[sectionIndex].sectionLayout(self.collectionView, layoutEnvironment: layoutEnvironment)
        }
    }
}

extension WishListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        sections[indexPath.section].collectionView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sections[indexPath.section].collectionView(collectionView, didSelectItemAt: indexPath)
    }
}

extension WishListViewController: CustomProductDetailsSectionDelegate {
    func customProductDetails(_ section: CustomProductDetailsSection, product: CustomProductDetails) {
        viewModel.addToCart(product)
    }
    
    func customProductDetailsSection(
        _ section: CustomProductDetailsSection,
        willRemove item: (Product, CustomProductDetails),
        at indexPath: IndexPath
    ) {
        viewModel.removeFromWishList(item.1)
    }
}
