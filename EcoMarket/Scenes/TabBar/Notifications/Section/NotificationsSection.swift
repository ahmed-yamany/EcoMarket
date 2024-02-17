//
//  NotificationsSection.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 14/02/2024.
//

import UIKit

class NotificationsSection: SectionsLayout {
    // MARK: - Properties
    //
    typealias Header = CollectionSectionHeader
    typealias ItemsType = Notification
    
    var items: [ItemsType] = []
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func sectionLayout(_ collectionView: UICollectionView,
                       layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        var configurations = UICollectionLayoutListConfiguration(appearance: .plain)
        configurations.backgroundColor = .clear
        configurations.showsSeparators = true
        
        let header = createHeader()
        
        let section = NSCollectionLayoutSection.list(using: configurations, layoutEnvironment: layoutEnvironment)
        section.boundarySupplementaryItems = [header]
        section.contentInsets = .init(top: 0, leading: 25, bottom: 40, trailing: 25)
        
        return section
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: NotificationCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
            Logger.log("Can not dequeue NotificationCollectionViewCell", category: \.default, level: .fault)
            return UICollectionViewCell()
        }
        cell.setup(notification: items[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                           withReuseIdentifier: Header.identifier,
                                                                           for: indexPath) as? Header else {
            Logger.log("Failed to get header view", category: \.default, level: .fault)
            return UICollectionReusableView()
        }
        header.setTitle("Notification")
        return header
    }
    
    // MARK: - Private Methods
    /// Creates and returns the header for the section.
    private func createHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .estimated(50))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: Header.elementKind,
            alignment: .top
        )
        
        header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
        return header
    }
    
    func registerCell(in collectionView: UICollectionView) {
        collectionView.registerNib(NotificationCollectionViewCell.self)
    }
    
    func registerSupplementaryView(in collectionView: UICollectionView) {
        collectionView.register(Header.self,
                                forSupplementaryViewOfKind: Header.elementKind,
                                withReuseIdentifier: Header.identifier)
    }
    
    func registerDecorationView(layout: UICollectionViewLayout) {
        
    }
}
