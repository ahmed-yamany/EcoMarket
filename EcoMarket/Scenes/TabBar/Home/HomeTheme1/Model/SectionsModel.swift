//
//  SectionsModel.swift
//  EcoMarket
//
//  Created by Mohamed Khaled on 01/02/2024.
//

import UIKit

struct Section: Codable {
    let type: SectionType
    let header: String
    var newArrivarProducts: [ProductModel]?
    var adds: [Adds]?
}
// to mock data
extension Section {
    static let samples: [Section] = [
        Section(type: .adds, header: "For You", adds: Adds.samples),
        Section(type: .newArrival, header: "New Arrival", newArrivarProducts: ProductModel.samples)
    ]
}
