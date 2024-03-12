//
//  CategoriesSection.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 17/02/2024.
//

import UIKit

protocol CategoriesSectionDelegate: AnyObject {
    func categoriesSection(_ section: CategoriesSection, didSelect item: String)
}

class CategoriesSection: SectionsLayout {
    typealias ItemsType = String
    
    var items: [String] = []
    
    var isSelectedIndex: Int?
    
    var headerTitle: String?
    
    weak var delegate: CategoriesSectionDelegate?
    
    init(delegate: CategoriesSectionDelegate, headerTitle: String?) {
        self.delegate = delegate
        self.headerTitle = headerTitle
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func sectionLayout(
        _ collectionView: UICollectionView,
        layoutEnvironment: NSCollectionLayoutEnvironment
    ) -> NSCollectionLayoutSection {
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(80), heightDimension: .absolute(30))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let header = createHeader()

        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 6
        section.contentInsets.bottom = 25
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .continuous
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
        
        header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        return header
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell: CategoriesCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
            Logger.log("Can't dequeue UserCollectionViewCell", category: \.default, level: .fault)
            return UICollectionViewCell()
        }
        let isSelected = indexPath.item == isSelectedIndex
        cell.setup(category: items[indexPath.row], isSelected: isSelected)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        isSelectedIndex = indexPath.item
        let item = items[indexPath.item]
        delegate?.categoriesSection(self, didSelect: item)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: CollectionSectionHeader.identifier,
            for: indexPath
        ) as? CollectionSectionHeader else {
            Logger.log("Failed to get header view", category: \.default, level: .fault)
            return UICollectionReusableView()
        }
        header.setTitle(headerTitle ?? "")
        return header
    }
    
    func registerCell(in collectionView: UICollectionView) {
        collectionView.registerNib(CategoriesCollectionViewCell.self)
    }
    
    func registerSupplementaryView(in collectionView: UICollectionView) {
        collectionView.register(CollectionSectionHeader.self,
                                forSupplementaryViewOfKind: CollectionSectionHeader.elementKind,
                                withReuseIdentifier: CollectionSectionHeader.identifier)
    }
    
    func registerDecorationView(layout: UICollectionViewLayout) {
        
    }
}
