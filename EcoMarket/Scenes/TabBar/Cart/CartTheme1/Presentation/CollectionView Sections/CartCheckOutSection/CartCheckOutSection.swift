//
//  CartCheckOutSection.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 31/01/2024.
//

import UIKit

class CartCheckOutSection: SectionsLayout {
    
    typealias ItemsType = String
    var items: [String] = [""]
    
    var totalPrice: String = ""
    var productsCount: Int = 0
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: CheckOutCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
            Logger.log("Can't dequeue ProductsCollectionViewCell", category: \.default, level: .fault)
            return UICollectionViewCell()
        }
        cell.setup(totalPrice: totalPrice, productsCount: productsCount)
        return cell
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    let interItemSpacing: CGFloat = 5
    let padding: CGFloat = 15.0
    let height: CGFloat = 130
    
    func sectionLayout(
        _ collectionView: UICollectionView,
        layoutEnvironment: NSCollectionLayoutEnvironment,
        sectionIndex: Int
    ) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(110))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25)
        group.interItemSpacing = .fixed(interItemSpacing)
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    func collectionView(_ collectionView: UICollectionView, 
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func registerCell(in collectionView: UICollectionView) {
        collectionView.registerNib(CheckOutCollectionViewCell.self)
    }
    
    func registerSupplementaryView(in collectionView: UICollectionView) {
        
    }
    
    func registerDecorationView(layout: UICollectionViewLayout) {
        
    }
    
    func setup(totalPrice: String, productsCount: Int) {
        self.totalPrice = totalPrice
        self.productsCount = productsCount
    }
}
