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
    @Published var errorMessage: String?
    
    // MARK: - Public Methods
    //
    func viewDidLoad() {
        getData()
        
    }
    
    // MARK: - Private Methods
    //
    private func getData() {
        Task { [weak self] in
            guard let self = self else { return }
            do {
//                self.products = try await ProductModel.mockData
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
}
