//
//  ViewModel.swift
//  EcoMarket
//
//  Created by Mohamed Khaled on 16/01/2024.
//

import Foundation

struct MockData {
    static let shared = MockData()
    private let ads: ListSection = .ads([.init(title: "", image: "ads-image"),
                                         .init(title: "", image: "ads-image")
    ])
    private let newArrivals: ListSection = .newArrivals([.init(title: "Mohamed", image: "popular"),
                                                         .init(title: "", image: "popular")
    ])
    var pageData: [ListSection] {
        [ads, newArrivals]
    }
}


enum ListSection {
    case ads([Item])
    case newArrivals([Item])
    
    var items: [Item] {
        switch self {
        case .ads(let items),
                .newArrivals(let items):
            return items
        }
    }
    
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .ads:
            return ""
        case .newArrivals:
            return "New Arrivals"
        }
    }
}
