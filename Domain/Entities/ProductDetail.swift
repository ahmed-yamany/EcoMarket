//
//  ProductDetail.swift
//  EcoMarket
//
//  Created by Hassan on 25/02/2024.
//

import UIKit

struct ProductDetail {
    let images: [String]
    let rating: Double
    let review: Int
    let productAttribute: [ProductAttribute]
    let description: String
    
    static let mockData = ProductDetail(images: ["discount_image4"],
                                        rating: 4,
                                        review: 33,
                                        productAttribute: [
                                            .init(
                                                sizes: .m,
                                                avaliableInStok: [22],
                                                colors: [.blue])],
                                        description: "srfsdf")
}

struct ProductAttribute {
    let sizes: ProductSizes
    let avaliableInStok: [Int]
    let colors: [UIColor]
}

public enum ProductSizes: String, CaseIterable {
    case s
    case m
    case l
    case xl
    case xxl
}

extension ProductSourceDetail {
    func toProductDetail() -> ProductDetail {
        ProductDetail(images: self.images,
                      rating: self.rating,
                      review: self.review,
                      productAttribute: self.productAttribute.toProductSourceAttribute(),
                      description: self.description)
    }
}

extension Array where Element == ProductSourceAttribute {
    func toProductSourceAttribute() -> [ProductAttribute] {
        return self.map { source in
            ProductAttribute(sizes: source.sizes.toProductSizes(),
                             avaliableInStok: source.avaliableInStok,
                             colors: source.colors.map { getColor(name: $0)})
        }
    }
    
    func getColor (name: String) -> UIColor {
        switch name {
        case "Red":
            return .red
        case "Blue":
            return .blue
        case "Green":
            return .green
        case "Black":
            return .black
        case "White":
            return .white
        case "Yellow":
            return .yellow
        default:
            return .yellow
        }
    }
}

extension ProductSourceSizes {
    func toProductSizes () -> ProductSizes {
        switch self {
        case .s:
            ProductSizes.s
        case .m:
            ProductSizes.m
        case .l:
            ProductSizes.l
        case .xl:
            ProductSizes.xl
        case .xxl:
            ProductSizes.xxl
        }
    }
}
