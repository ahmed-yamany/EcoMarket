//
//  Category2ViewModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 21/01/2024.
//

import Foundation
import Combine

public final class Category2ViewModel {
    
    // MARK: - Published Properties
    @Published var categories: [CategoryModel] = []
    
    func viewDidLoad() {
        getData()
    }
    
    private func getData() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.categories = CategoryModel.mockData2
            }
        }
    }
}
