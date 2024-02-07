//
//  ProfileSection.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 07/02/2024.
//

import UIKit

class ProfileSection: SectionsLayout {
    
    typealias ItemsType = ProfileModel
    
    var items: [ProfileModel] = []
    
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
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 15, trailing: 20)
            
            // Section
            
            let section = NSCollectionLayoutSection(group: group)
            section.decorationItems = [
                NSCollectionLayoutDecorationItem.background(elementKind: SectionDecorationView.identifier)
            ]
            section.contentInsets = NSDirectionalEdgeInsets(top: 25, leading: 25, bottom: 30 + 15, trailing: 25)
            // Create and return a compositional layout with the defined section.
            return section
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: ProfileCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
            Logger.log("Can't dequeue UserCollectionViewCell", category: \.default, level: .fault)
            return UICollectionViewCell()
        }
        cell.setup(profile: items[indexPath.row])
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        UICollectionReusableView()
    }
    
    func registerCell(in collectionView: UICollectionView) {
        collectionView.registerNib(ProfileCollectionViewCell.self)
    }
    
    func registerSupplementaryView(in collectionView: UICollectionView) {
        
    }
    
    func registerDecorationView(layout: UICollectionViewLayout) {
        layout.register(SectionDecorationView.self, forDecorationViewOfKind: SectionDecorationView.identifier)
    }
}
