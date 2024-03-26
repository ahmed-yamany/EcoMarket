//
//  FeaturesSection.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 17/02/2024.
//

import UIKit

protocol FeaturesSectionDelegate: AnyObject {
    func featuresSection(_ section: FeaturesSection, didSelect item: Product)
}

class FeaturesSection: SectionsLayout {
    typealias ItemsType = Product
    
    var items: [Product] = []
    weak var delegate: FeaturesSectionDelegate?
    
    init(delegate: FeaturesSectionDelegate) {
        self.delegate = delegate
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func sectionLayout(
        _ collectionView: UICollectionView,
        layoutEnvironment: NSCollectionLayoutEnvironment,
        sectionIndex: Int
    ) -> NSCollectionLayoutSection {
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(120))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.bottom = 25
        return section
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell: FeaturesCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
            Logger.log("Can't dequeue UserCollectionViewCell", category: \.default, level: .fault)
            return UICollectionViewCell()
        }
        
        guard let feature = items[safe: indexPath.row] else {
            Logger.log("failed to get feature at \(String(describing: indexPath))", category: \.default, level: .fault)
            return UICollectionViewCell()
        }
        
        cell.setup(product: feature, delegate: self)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        UICollectionReusableView()
    }
    
    func registerCell(in collectionView: UICollectionView) {
        collectionView.registerNib(FeaturesCollectionViewCell.self)
    }
    
    func registerSupplementaryView(in collectionView: UICollectionView) {
        
    }
    
    func registerDecorationView(layout: UICollectionViewLayout) {
        
    }
}

extension FeaturesSection: FeaturesCollectionViewCellDelegate {
    func featuresCell(_ cell: UICollectionViewCell, didTapped model: Product) {
        delegate?.featuresSection(self, didSelect: model)
    }
}
