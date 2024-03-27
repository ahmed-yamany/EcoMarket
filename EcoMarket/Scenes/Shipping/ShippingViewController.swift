//
//  ShippingViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 27/03/2024.
//

import UIKit
import Combine

class ShippingViewController: UIViewController {
    
    var viewModel: ShippingViewModel
    private var cancellable: Set<AnyCancellable> = []
    
    @IBOutlet weak var paymentButton: PrimaryButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    init(viewModel: ShippingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configCollectionView()
        bindViewMode()
        setupNavigationBar()
    }
    
    private func configureUI() {
        title = L10n.Shipping.title
        paymentButton.title = L10n.Shipping.PaymentButton.title
        navigationItem.backButtonTitle = ""
    }
    
    func bindViewMode() {
        viewModel.$address.receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.collectionView.reloadData()
            }
            .store(in: &cancellable)
    }
    
    func setupNavigationBar() {
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapPlus))
        navigationItem.rightBarButtonItem = plusButton
    }
    
    @objc func didTapPlus() {
        viewModel.goToAddAddress()
    }
    
    // MARK: - Configuration
    //
    /// Configures the collection view properties.
    private func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNib(AddressCollectionViewCell.self)
        collectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    // MARK: - Compositional Layout
    //
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
        section.contentInsets = .init(top: 16, leading: 16, bottom: 0, trailing: 16)
        
        // Create and return a compositional layout with the defined section.
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    @IBAction func paymentButtonPressed(_ sender: Any) {
        viewModel.didTapPayment()
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
//
extension ShippingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.address.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: AddressCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
            Logger.log("Failed to dequeue collection view cell", category: \.default, level: .fault)
            return UICollectionViewCell()
        }
        
        cell.setup(address: viewModel.address[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
