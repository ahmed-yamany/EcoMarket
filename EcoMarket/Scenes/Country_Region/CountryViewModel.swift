//
//  CountryViewModel.swift
//  EcoMarket
//
//  Created by Youssef Eldeeb on 19/02/2024.
//

import Foundation

class CountryViewModel{
    
    var countryArray: [CountryModel] {
        JSONDecoder().decode(forResource: "Countrys") ?? []
    }
}
