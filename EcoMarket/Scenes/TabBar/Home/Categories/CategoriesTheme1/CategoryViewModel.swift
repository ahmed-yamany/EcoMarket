//
//  CategoryViewModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 20/01/2024.
//

import Foundation
import Combine

class CategoryViewModel {
    
    // MARK: - Published Properties
    @Published var categories: [CategoryModel] = []
    
    func getData() {
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            
            let mockData = [
                CategoryModel(image: "category/icon", name: "New Arrivals", productNumber: "208 Product"),
                CategoryModel(image: "category/icon-2", name: "Clothes", productNumber: "200 Product"),
                CategoryModel(image: "category/icon-3", name: "Bags", productNumber: "130 Product"),
                CategoryModel(image: "category/icon-4", name: "Shoese", productNumber: "100 Product"),
                CategoryModel(image: "category/icon-6", name: "Electronics", productNumber: "190 Product"),
                CategoryModel(image: "category/icon-5", name: "Jewelry", productNumber: "80 Product")
            ]
            
            DispatchQueue.main.async {
                self.categories = mockData
            }
        }
    }
}
