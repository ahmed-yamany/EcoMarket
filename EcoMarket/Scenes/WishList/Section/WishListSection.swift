//
//  WishListSection.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 11/03/2024.
//

import UIKit

class WishListSection: SectionsLayout {
    typealias ItemsType = Product
    
    var items: [ItemsType] = []
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func sectionLayout(
        _ collectionView: UICollectionView,
        layoutEnvironment: NSCollectionLayoutEnvironment
    ) -> NSCollectionLayoutSection {
        let padding: CGFloat = 25.0
        let height: CGFloat = 100
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(height))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: padding, bottom: 0, trailing: padding)
        
        let header = createHeader()
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [header]
        section.interGroupSpacing = 22
        return section
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: WishListCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
            Logger.log("Failed", category: \.default, level: .fault)
            return UICollectionViewCell()
        }
        cell.setup(product: items[indexPath.row])
        return cell
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
        header.setTitle("WishList")
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func registerCell(in collectionView: UICollectionView) {
        collectionView.registerNib(WishListCollectionViewCell.self)
    }
    
    func registerSupplementaryView(in collectionView: UICollectionView) {
        collectionView.register(CollectionSectionHeader.self,
                                forSupplementaryViewOfKind: CollectionSectionHeader.elementKind,
                                withReuseIdentifier: CollectionSectionHeader.identifier)
    }
    
    func registerDecorationView(layout: UICollectionViewLayout) {
        
    }
}
