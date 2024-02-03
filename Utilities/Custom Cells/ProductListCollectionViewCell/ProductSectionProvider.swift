//
//  ProductSectionProvider.swift
//  EcoMarket
//
//  Created by Mohamed Khaled on 15/01/2024.
//

import UIKit

class ProductSectionProvider: SectionLayout {    
    
    typealias DataType = ProductModel
    
    typealias CellType = ProductListCollectionViewCell

    typealias SupplementaryViewType = HeaderView

    var data: [DataType] = [
        .init(image: "popular", name: "Axel Arigato", description: "Clean 90 Triple Sneakers", price: "$245.00"),
        .init(image: "popular", name: "Axel Arigato", description: "Clean 90 Triple Sneakers", price: "$245.00"),
        .init(image: "popular", name: "Axel Arigato", description: "Clean 90 Triple Sneakers", price: "$245.00")
    ]
    
    var itemSize: NSCollectionLayoutItem {
        return NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                        heightDimension: .fractionalHeight(1)))
    }
    
    var group: NSCollectionLayoutGroup {
        return NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .absolute(260),
                                                                  heightDimension: .absolute(160)), subitems: [itemSize])
    }
    
    var groupSpacing: CGFloat {
        return 20
    }
    
    var scrollingBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior {
        .continuous
    }
 
    func section(_ index: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = scrollingBehavior
        section.interGroupSpacing = groupSpacing
        section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
        section.contentInsets = .init(top: 16, leading: 4, bottom: 0, trailing: 4)
        return section
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellType.cellID,
                                                            for: indexPath) as? CellType
        else {return UICollectionViewCell()}
        cell.productImage.image = UIImage(named: data[indexPath.row].image)
        cell.productName.text = data[indexPath.row].name
        return cell
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
            header.title = "New Arrivals" // Use indexPath.section instead of indexPath.row
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print(data[indexPath.row].name)
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .estimated(50)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
    }
}
