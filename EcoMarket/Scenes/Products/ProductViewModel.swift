//
//  ProductViewModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 23/01/2024.
//

import Foundation
import Combine

public final class ProductViewModel {
    
    // MARK: - Published Properties
    @Published var products: [ProductModel] = []
    
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
                self.products = ProductModel.mockData
            }
        }
    }
}
