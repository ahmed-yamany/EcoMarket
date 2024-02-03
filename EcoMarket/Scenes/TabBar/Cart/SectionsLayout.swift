//
//  SectionLayout.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 02/02/2024.
//

import UIKit

/// Protocol for defining the layout and configuration of sections in a UICollectionView.
protocol SectionsLayout {
    
    associatedtype ItemsType
    
    var items: [ItemsType] { get set }
    
    func numberOfItems() -> Int
    
    func sectionLayout() -> NSCollectionLayoutSection
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView
    
    func registerCell(in collectionView: UICollectionView)
    
    func registerSupplementaryView(in collectionView: UICollectionView)
}
