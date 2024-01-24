//
//  AdsSectionProvider.swift
//  EcoMarket
//
//  Created by Mohamed Khaled on 15/01/2024.
//

import UIKit

class AdsSectionProvider: SectionLayout {
        
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdsCollectionViewCell.cellID,
                                                            for: indexPath) as? AdsCollectionViewCell
        else {return UICollectionViewCell()}
        cell.setupUI(data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView",
                                                                               for: indexPath) as? HeaderView
            else { return UICollectionReusableView() }
            header.title = data[indexPath.section].title // Use indexPath.section instead of indexPath.row
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print(data[indexPath.row].title)
    }
    
}
