//
//  ShippingViewModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 27/03/2024.
//

import Foundation

class ShippingViewModel {
    @Published var address: [Address] = []
    
    func getData() {
        self.address = Address.mockData
    }
}
