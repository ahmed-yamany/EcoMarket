//
//  ProductSourceDetailRepositories.swift
//  EcoMarket
//
//  Created by Hassan on 25/02/2024.
//

import Foundation
import Combine

class ProductSourceDetailRepositories: ObservableObject {
    @Published private var productDetail: ProductSourceDetail = .mockData
    
    private func updateProductSourceDetail(by id: String) {
        productDetail = JSONDecoder().decode(forResource: "ProductSourceDetail") ?? .mockData
    }
    
    func getProductSourceDetail(by id: String) -> AnyPublisher<ProductSourceDetail, Never> {
        updateProductSourceDetail(by: id)
        return $productDetail.eraseToAnyPublisher()
    }
        
}
