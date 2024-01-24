//
//  ProductSectionProvider.swift
//  EcoMarket
//
//  Created by Mohamed Khaled on 15/01/2024.
//

import UIKit

class ProductSectionProvider: SectionLayout {
        
    var data: [Item] = [.init(title: "", image: "ads-image"),
                        .init(title: "", image: "ads-image")]
    
    typealias DataType = Item
    
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
    
    var section: NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = scrollingBehavior
        section.interGroupSpacing = groupSpacing
        section.contentInsets = .init(top: 16, leading: 4, bottom: 0, trailing: 4)
        return section
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductListCollectionViewCell.cellID,
                                                            for: indexPath) as? ProductListCollectionViewCell
        else {return UICollectionViewCell()}
        cell.productImage.image = UIImage(named: data[indexPath.row].image)
        cell.productName.text = data[indexPath.row].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print(data[indexPath.row].title)
    }
}
