//
//  SectionsFactory.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 13/02/2024.
//

import Foundation

enum SectionsType: Codable {
    case product
    case promoCode
    case checkOut
}

class SectionsFactory {
    func createSection(section: SectionsModel) -> any SectionsLayout {
        switch section.type {
            case .product:
                return CartProductsSection()
            case .promoCode:
                return CartPromoCodeSection()
            case .checkOut:
                return CartCheckOutSection()
        }
    }
}
