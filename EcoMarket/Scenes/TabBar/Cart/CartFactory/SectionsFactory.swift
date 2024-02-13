//
//  SectionsFactory.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 13/02/2024.
//

import Foundation

// Enum to represent the types of sections
enum SectionsType: Codable {
    case product
    case promoCode
    case checkOut
}

// Factory class responsible for creating different sections based on their type
class SectionsFactory {
    
    /// Creates a section based on the provided SectionsModel.
        ///
        /// - Parameter section: The SectionsModel containing the type and products for the section.
        /// - Returns: An instance conforming to the SectionsLayout protocol.
    func createSection(section: SectionsModel) -> any SectionsLayout {
        switch section.type {
            case .product:
                return CartProductsSection(items: CartModel.products)
            case .promoCode:
                return CartPromoCodeSection()
            case .checkOut:
                return CartCheckOutSection()
        }
    }
}
