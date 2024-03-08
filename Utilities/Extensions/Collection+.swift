//
//  Collection+.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 08/03/2024.
//

import Foundation

public extension Collection {
    /// Safely retrieves an element at the specified index, if it exists.
    ///
    /// - Parameter index: The index of the element to retrieve.
    /// - Returns: The element at the specified index, or `nil` if the index is out of bounds.
    subscript(safe index: Index) -> Element? {
        /// Checks if the collection contains the specified index.
        ///
        /// If the index is within the valid range of indices for the collection,
        /// returns the element at that index. Otherwise, returns `nil`.
        indices.contains(index) ? self[index] : nil
    }
}
