//
//  ProfileSection.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 07/02/2024.
//

import UIKit

class ProfileSection: SectionsLayout {
    typealias Header = CollectionSectionHeader
    typealias ItemsType = ProfileModel
    
    var items: [ProfileModel] = []
    
    var headerTitle: String = ""
    
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
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(55))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 15, trailing: 20)
        
        let header = createHeader()
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        
        if !headerTitle.isEmpty {
            section.boundarySupplementaryItems = [header]
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 25, bottom: 30 + 15, trailing: 25)
            section.decorationItems = [
                NSCollectionLayoutDecorationItem.background(elementKind: SectionDecorationView.identifier)
            ]
        } else {
            section.decorationItems = [
                NSCollectionLayoutDecorationItem.background(elementKind: SectionDecorationView.identifier)
            ]
            section.contentInsets = NSDirectionalEdgeInsets(top: 60, leading: 25, bottom: 30 + 15, trailing: 25)
        }
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        items[indexPath.row].action()
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                           withReuseIdentifier: Header.identifier,
                                                                           for: indexPath) as? Header else {
            Logger.log("Failed to get header view", category: \.default, level: .fault)
            return UICollectionReusableView()
        }
        header.setTitle(headerTitle)
        return header
    }
    
    private func createHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .absolute(40))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: Header.elementKind,
            alignment: .top
        )
        
        header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
        return header
    }
    
    func registerCell(in collectionView: UICollectionView) {
        collectionView.registerNib(ProfileCollectionViewCell.self)
    }
    
    func registerSupplementaryView(in collectionView: UICollectionView) {
        collectionView.register(Header.self,
                                forSupplementaryViewOfKind: Header.elementKind,
                                withReuseIdentifier: Header.identifier)
    }
    
    func registerDecorationView(layout: UICollectionViewLayout) {
        layout.register(SectionDecorationView.self, forDecorationViewOfKind: SectionDecorationView.identifier)
    }
}
