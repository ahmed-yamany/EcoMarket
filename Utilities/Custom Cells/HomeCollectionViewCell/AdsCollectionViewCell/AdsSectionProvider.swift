//
//  AdsSectionProvider.swift
//  EcoMarket
//
//  Created by Mohamed Khaled on 15/01/2024.
//

import UIKit

class AdsSectionProvider: SectionLayout {

    // MARK: - Type Aliases

    typealias ItemsType = Adds
    typealias CellType = AdsCollectionViewCell

    // MARK: - Properties

    // Initial data for the section
    var data: [ItemsType] = []
    
    init(data: [ItemsType]) {
        self.data = data
    }

    // MARK: - Section Layout Properties

    // Item size for the collection view
    var itemSize: NSCollectionLayoutItem {
        return NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                        heightDimension: .fractionalHeight(1)))
    }

    // Group layout for the collection view
    var group: NSCollectionLayoutGroup {
        return NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .absolute(260),
                                                                  heightDimension: .absolute(160)), subitems: [itemSize])
    }

    // Spacing between groups
    var groupSpacing: CGFloat {
        return 20
    }

    // Scrolling behavior for the section
    var scrollingBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior {
        return .continuous
    }

    // MARK: - Section Layout

    // Create the layout for the section
    var section: NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = scrollingBehavior
        section.interGroupSpacing = groupSpacing
        section.contentInsets = .init(top: 16, leading: 16, bottom: 25, trailing: 16)
        return section
    }

    // MARK: - UICollectionViewDelegate Methods

    // Provide a cell for the collection view at a given index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellType.cellID,
                                                            for: indexPath) as? CellType
        else { return UICollectionViewCell() }
        cell.setupUI(data[indexPath.row])
        return cell
    }

    // Handle the selection of an item in the collection view
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(data[indexPath.row].title)
    }
    
    // MARK: - Unused UICollectionViewDelegate Methods

    // Provide a supplementary view for the section (not implemented in this example)
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        return UICollectionReusableView()
    }
}
