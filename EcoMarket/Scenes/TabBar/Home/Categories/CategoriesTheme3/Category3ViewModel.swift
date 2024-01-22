//
//  Category3ViewModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 22/01/2024.
//

import Foundation
import Combine

public final class Category3ViewModel {
    
    // MARK: - Published Properties
    @Published var categories: [CategoryModel] = []
    
    // MARK: - Public Methods
    //
    func viewDidLoad() {
        getData()
    }
    
    // MARK: - Private Methods
    //
    private func getData() {
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }

            DispatchQueue.main.async {
                self.categories = CategoryModel.mockData3
            }
        }
    }
}
