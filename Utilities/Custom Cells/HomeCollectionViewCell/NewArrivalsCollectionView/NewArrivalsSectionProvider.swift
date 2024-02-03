//
//  NewArrivalsSectionProvider.swift
//  EcoMarket
//
//  Created by Mohamed Khaled on 24/01/2024.
//

import UIKit

class NewArrivalsSectionProvider: SectionLayout {
    typealias DataType = ProductModel
    typealias SupplementaryViewType = HeaderView
    typealias CellType = NewArrivalsCollectionView
    
    // MARK: - Properties
    private var spacingBetweenGroups: CGFloat = 20

    var data: [DataType] = []
    init(data: [DataType]) {
        self.data = data
    }
    
    // MARK: - Section Layout
    private var itemForGroup: NSCollectionLayoutItem {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        return NSCollectionLayoutItem(layoutSize: itemSize)
    }
    
    private var groupForSection: NSCollectionLayoutGroup {
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.46),
            heightDimension: .absolute(260)
        )
        return NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [itemForGroup])
    }
    
    func section(_ index: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: groupForSection)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = spacingBetweenGroups
        section.boundarySupplementaryItems = [createSupplementaryItemForHeader()]
        section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
        return section
    }
    
    // MARK: - UICollectionViewDelegate Methods
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellType.identifier,
                                                            for: indexPath) as? CellType
        else { return UICollectionViewCell() }
        cell.updateUI(data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(data[indexPath.row].name)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            case UICollectionView.elementKindSectionHeader:
                guard let header = collectionView
                    .dequeueReusableSupplementaryView(ofKind: kind,
                                                      withReuseIdentifier: SupplementaryViewType.identifier,
                                                      for: indexPath) as? SupplementaryViewType
                else { return UICollectionReusableView() }
                header.title = "New Arrivals" 
                return header
            default:
                return UICollectionReusableView()
        }
    }
    
    // MARK: - Private Methods
    private func createSupplementaryItemForHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                      heightDimension: .estimated(27)),
                                                    elementKind: UICollectionView.elementKindSectionHeader,
                                                    alignment: .top)
    }
}
