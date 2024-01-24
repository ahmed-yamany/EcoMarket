//
//  NewArrivalsSectionProvider.swift
//  EcoMarket
//
//  Created by Mohamed Khaled on 24/01/2024.
//

import UIKit

class NewArrivalsSectionProvider: SectionLayout {
    
    // MARK: - Properties
    
    // Define the data type for the section
    typealias DataType = ProductModel
    typealias SupplementaryViewType = HeaderView
    typealias CellType = NewArrivalsCollectionView
    
    // Initial data for the section
    var data: [DataType] = []
    init(data: [DataType]) {
        self.data = data
    }
    
    // MARK: - Section Layout Properties
    
    // Item size for the collection view
    var itemSize: NSCollectionLayoutItem {
        NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                 heightDimension: .fractionalHeight(1)))
    }
    
    // Group layout for the collection view
    var group: NSCollectionLayoutGroup {
        NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(0.46),
                                                           heightDimension: .absolute(260)), subitems: [itemSize])
    }
    
    // Spacing between groups
    var groupSpacing: CGFloat {
        20
    }
    
    // Scrolling behavior for the section
    var scrollingBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior {
        .continuous
    }
    
    // MARK: - Section Layout
    
    // Create the layout for the section
    var section: NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = scrollingBehavior
        section.interGroupSpacing = groupSpacing
        section.boundarySupplementaryItems = [supplementaryHeaderItem()]
        section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
        return section
    }
    
    // MARK: - UICollectionViewDelegate Methods
    
    // Provide a cell for the collection view at a given index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellType.identifier,
                                                            for: indexPath) as? CellType
        else { return UICollectionViewCell() }
        cell.updateUI(data[indexPath.row])
        return cell
    }
    
    // Handle the selection of an item in the collection view
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(data[indexPath.row].name)
    }
    
    // Provide a supplementary view for the section (header in this case)
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            case UICollectionView.elementKindSectionHeader:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                   withReuseIdentifier: SupplementaryViewType.identifier,
                                                                                   for: indexPath) as? SupplementaryViewType
                else { return UICollectionReusableView() }
                header.title = "New Arrivals" // Use indexPath.section instead of indexPath.row
                return header
            default:
                return UICollectionReusableView()
        }
    }
    
    // MARK: - Private Methods
    
    // Create a boundary supplementary item for the header
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                      heightDimension: .estimated(27)),
                                                    elementKind: UICollectionView.elementKindSectionHeader,
                                                    alignment: .top)
    }
}
