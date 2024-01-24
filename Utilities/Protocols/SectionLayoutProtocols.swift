//
//  SectionLayoutProtocols.swift
//  EcoMarket
//
//  Created by Mohamed Khaled on 15/01/2024.
//

import UIKit
// one section
protocol SectionLayout {
    associatedtype DataType
    var itemSize: NSCollectionLayoutItem { get }
    var group: NSCollectionLayoutGroup { get }
    var section: NSCollectionLayoutSection { get }
    var groupSpacing: CGFloat { get }
    var data: [DataType] { get set }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    // to make this func optional -> object c
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
}

// retrun items Count
extension SectionLayout {
    var itemsCount: Int {
        data.count
    }
}
