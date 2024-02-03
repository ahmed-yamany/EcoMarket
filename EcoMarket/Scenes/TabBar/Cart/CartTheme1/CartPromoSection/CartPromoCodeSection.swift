//
//  CartPromoCodeSection.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 31/01/2024.
//

import UIKit

class CartPromoCodeSection: SectionsLayout {
    func collectionView(_ collectionView: UICollectionView, 
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        UICollectionReusableView()
    }
    
    typealias ItemsType = String
    var items: [String] =  [""]
    
    func collectionView(_ collectionView: UICollectionView, 
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: PromoCodeCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
            Logger.log("Can't dequeue ProductsCollectionViewCell", category: \.default, level: .fault)
            return UICollectionViewCell()
        }
        return cell
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    let interItemSpacing: CGFloat = 5
    let padding: CGFloat = 15.0
    let height: CGFloat = 130
    
    func sectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25)
        group.interItemSpacing = .fixed(interItemSpacing)
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.bottom = 85
        return section
    }

    func registerCell(in collectionView: UICollectionView) {
        collectionView.registerNib(PromoCodeCollectionViewCell.self)
    }
    func registerSupplementaryView(in collectionView: UICollectionView) {
  
    }
}
