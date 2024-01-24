//
//  Item.swift
//  EcoMarket
//
//  Created by Mohamed Khaled on 16/01/2024.
//

import Foundation

struct Adds: Codable {
    let title: String
    let image: String
    
    static let samples: [Adds] = [
        .init(title: "", image: "ads-image"),
        .init(title: "", image: "ads-image")
    ]
}
