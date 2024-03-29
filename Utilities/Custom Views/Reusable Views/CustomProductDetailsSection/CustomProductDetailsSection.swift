//
//  CartProductsSection.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 31/01/2024.
//

import UIKit

protocol CustomProductDetailsSectionDelegate: AnyObject {
    func customProductDetailsSection(
        _ section: CustomProductDetailsSection,
        willRemove item: (Product, CustomProductDetails),
        at indexPath: IndexPath
    )
    func customProductDetails(_ section: CustomProductDetailsSection, product: CustomProductDetails)
    func updateCount(_ cell: CustomProductDetailsCollectionViewCell, for product: CustomProductDetails?, with count: Int)
}
/// A section layout for displaying products in a cart.
class CustomProductDetailsSection: SectionsLayout {
    typealias ItemsType = (Product, CustomProductDetails)
    weak var delegate: CustomProductDetailsSectionDelegate?
    var items: [ItemsType] = []
    var headerTitle: String = ""

    func sectionLayout(
        _ collectionView: UICollectionView,
        layoutEnvironment: NSCollectionLayoutEnvironment,
        sectionIndex: Int
    ) -> NSCollectionLayoutSection {
        
        var configurations = UICollectionLayoutListConfiguration(appearance: .plain)
        configurations.backgroundColor = .clear
        configurations.showsSeparators = false
        
        configurations.trailingSwipeActionsConfigurationProvider = { [weak self] indexPath in
            self?.trailingSwipeActionConfiguration(collectionView, at: indexPath)
        }
        
        let header = createHeader()
        let section = NSCollectionLayoutSection.list(using: configurations, layoutEnvironment: layoutEnvironment)
        section.boundarySupplementaryItems = [header]
        section.contentInsets = .init(top: 0, leading: 24, bottom: 40, trailing: 24)
        
        return section
    }
    
    private func trailingSwipeActionConfiguration(
        _ collectionView: UICollectionView,
        at indexPath: IndexPath
    ) -> UISwipeActionsConfiguration {
        
        let actionHandler: UIContextualAction.Handler = { [weak self] _, _, completion in
            self?.trailingSwipeAction(collectionView, at: indexPath)
            completion(true)
        }
        
        let action = UIContextualAction(style: .normal, title: nil, handler: actionHandler)
        action.image = AppImage.Icon.productDelete
        action.backgroundColor = AppColor.primaryButton
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    private func trailingSwipeAction(_ collectionView: UICollectionView, at indexPath: IndexPath) {
        let item = items[indexPath.row]
        delegate?.customProductDetailsSection(self, willRemove: item, at: indexPath)
        items.removeAll { $0 == item }
        collectionView.deleteItems(at: [indexPath])
    }
    
    /// Returns the number of items in the section.
    func numberOfItems() -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: CustomProductDetailsCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
            Logger.log("Can't dequeue ProductsCollectionViewCell", category: \.default, level: .fault)
            return UICollectionViewCell()
        }
        cell.setup(cart: items[indexPath.row], delegate: self)
        cell.layoutIfNeeded()
        collectionView.layoutIfNeeded()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: CollectionSectionHeader.identifier,
            for: indexPath
        ) as? CollectionSectionHeader else {
            Logger.log("Failed to get header view", category: \.default, level: .fault)
            return UICollectionReusableView()
        }
        header.setTitle(headerTitle)
        return header
    }
    
    func registerCell(in collectionView: UICollectionView) {
        collectionView.registerNib(CustomProductDetailsCollectionViewCell.self)
    }
    
    private func createHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .estimated(50))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: CollectionSectionHeader.elementKind,
            alignment: .top
        )
        
        header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)
        return header
    }
    
    func registerSupplementaryView(in collectionView: UICollectionView) {
        collectionView.register(CollectionSectionHeader.self,
                                forSupplementaryViewOfKind: CollectionSectionHeader.elementKind,
                                withReuseIdentifier: CollectionSectionHeader.identifier)
    }
    
    func registerDecorationView(layout: UICollectionViewLayout) {
        
    }
}

extension CustomProductDetailsSection: CustomProductDetailsViewCellDelegate {
    func updateCount(_ cell: CustomProductDetailsCollectionViewCell, for product: CustomProductDetails?, with count: Int) {
        delegate?.updateCount(cell, for: product, with: count)
    }
    
    func addToCart(_ cell: CustomProductDetailsCollectionViewCell, product: CustomProductDetails) {
        self.delegate?.customProductDetails(self, product: product)
    }
}
