//
//  Tracking.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 23/02/2024.
//

import Foundation

struct Tracking: Codable {
    let image: String
    let ID: String
    let title: String
    let subtitle: String
    let shippingDate: String
    let shippingArea: String
    let deliveryDate: String
    let deliveryArea: String
}

extension Tracking {
    static let mockData: Tracking =
        .init(image: "tracking",
              ID: "6556 23341 8090",
              title: "Ena Express",
              subtitle: "Transit",
              shippingDate: "25 June, 2021",
              shippingArea: "Sacramnto",
              deliveryDate: "30 June, 2021",
              deliveryArea: "Tamil Nadu")
}

struct Shipping: Codable {
    let transportImage: String
    let shippingID: String
    let shippingArea: String
    let shippingStatus: String
}
