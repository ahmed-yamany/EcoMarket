//
//  HomeModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 19/02/2024.
//

import Foundation

struct HomeModel {
    let sections: [HomeType]
}

enum HomeType {
    case features(items: [Product])
    case categories(items: [String], title: String)
    case top(items: [Product], title: String)
}
