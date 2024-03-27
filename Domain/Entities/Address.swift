//
//  Address.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 27/03/2024.
//

import Foundation

struct Address: Codable {
    let name: String
    let number: String
    let address: String
}

extension Address {
    static let mockData: [Address] = [
        .init(name: "ibragim", number: "8937483927", address: "cairo")
    ]
}
