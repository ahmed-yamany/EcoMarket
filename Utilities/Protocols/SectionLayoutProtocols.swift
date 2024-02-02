//
//  SectionLayoutProtocols.swift
//  EcoMarket
//
//  Created by Mohamed Khaled on 15/01/2024.
//

import UIKit

// Protocol for defining a section layout
protocol SectionLayout {
    associatedtype DataType
    
    // Section layout for the collection view
    func section(_ index: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection
        
    // Data associated with the section
    var data: [DataType] { get set }
    
    // Method to provide a cell for the collection view at a given index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    
    // Method to provide a supplementary view for the section
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView
    
    // Method to handle the selection of an item in the collection view
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
}

// Extension to provide a default implementation for getting the count of items
extension SectionLayout {
    var itemsCount: Int {
        return data.count
    }
}
