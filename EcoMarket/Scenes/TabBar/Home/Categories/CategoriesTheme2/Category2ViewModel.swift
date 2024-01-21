//
//  Category2ViewModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 21/01/2024.
//

import Foundation
import Combine

class Category2ViewModel {
    
    // MARK: - Published Properties
    @Published var categories: [CategoryModel] = []
    
    func getData() {
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            
            let mockData = [
                CategoryModel(image: "category2/image-1", name: "New Arrivals", productNumber: "208 Product"),
                CategoryModel(image: "category2/image-2", name: "Clothes", productNumber: "200 Product"),
                CategoryModel(image: "category2/image-3", name: "Bags", productNumber: "130 Product"),
                CategoryModel(image: "category2/image-4", name: "Shoese", productNumber: "100 Product"),
                CategoryModel(image: "category2/image-5", name: "Electronics", productNumber: "190 Product"),
                CategoryModel(image: "category2/image-1", name: "Jewelry", productNumber: "80 Product")
            ]
            
            DispatchQueue.main.async {
                self.categories = mockData
            }
        }
    }
}
