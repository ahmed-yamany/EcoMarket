//
//  HomeThem2UseCase.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 24/02/2024.
//

import Foundation

protocol HomeThem2UseCaseProtocol {
    func getProductDetails(by id: String) -> ProductDetails
}

class HomeThem2UseCase: HomeThem2UseCaseProtocol {
    
    let repository: HomeRepositoryProtocol
    init(repository: HomeRepositoryProtocol) {
        self.repository = repository
    }
    
    func getProductDetails(by id: String) -> ProductDetails {
        return repository.getProductDetails(by: id)
    }
}

protocol HomeRepositoryProtocol {
    func getProductDetails(by id: String) -> ProductDetails
}

class HomeRepository: HomeRepositoryProtocol {
    var product: ProductDetails?
    
    func getProductDetails(by id: String) -> ProductDetails {
        if let product = product {
            return product
        } else {
            guard let product: ProductDetails = JSONDecoder().decode(forResource: "ProductDetails") else {
                fatalError()
            }
            self.product = product
            return product
        }
    }
}
