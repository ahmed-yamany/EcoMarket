//
//  FooterSection.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 08/02/2024.
//

import UIKit

protocol FooterSectionDelegate: AnyObject {
    func footerSection(_ section: FooterSection)
}

class FooterSection: SectionsLayout {
    typealias ItemsType = String
    var items: [String] =  [""]
    
    weak var delegate: FooterSectionDelegate?
    
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
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 25, leading: 25, bottom: 15, trailing: 25)
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.bottom = 30
        return section
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell: FooterCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
            Logger.log("Can't dequeue UserCollectionViewCell", category: \.default, level: .fault)
            return UICollectionViewCell()
        }
        cell.delegate = self
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
        collectionView.registerNib(FooterCollectionViewCell.self)
    }
    
    func registerSupplementaryView(in collectionView: UICollectionView) {
        
    }
    
    func registerDecorationView(layout: UICollectionViewLayout) {
        
    }
}

extension FooterSection: FooterCollectionViewCellDelegate {
    func didTapLogOut() {
        delegate?.footerSection(self)
    }
}
