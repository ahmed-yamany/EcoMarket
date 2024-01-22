//
//  Category3ViewModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 22/01/2024.
//

import Foundation
import Combine

class Category3ViewModel {
    
    // MARK: - Published Properties
    @Published var categories: [CategoryModel] = []
    
    func getData() {
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            
            let mockData = [
                CategoryModel(image: "category3/image-5", name: "New Arrivals", productNumber: "208 Product"),
                CategoryModel(image: "category3/image-6", name: "Clothes", productNumber: "200 Product"),
                CategoryModel(image: "category3/image-10", name: "Bags", productNumber: "130 Product"),
                CategoryModel(image: "category3/image-9", name: "Shoese", productNumber: "100 Product"),
                CategoryModel(image: "category3/image-7", name: "Electronics", productNumber: "190 Product"),
                CategoryModel(image: "category3/image-8", name: "Jewelry", productNumber: "80 Product")
            ]
            
            DispatchQueue.main.async {
                self.categories = mockData
            }
        }
    }
}
