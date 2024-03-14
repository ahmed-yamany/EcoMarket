//
//  Category2ViewModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 21/01/2024.
//

import UIKit
import Combine

public final class Category2ViewModel {
    
    // MARK: - Published Properties
    @Published var categories: [String] = []
    var productUseCase: ProductRepositories
    private var cancellable: Set<AnyCancellable> = []
    // MARK: - Init
    //
    init(productUseCase: ProductRepositories) {
        self.productUseCase = productUseCase
        getCategories()
    }
    
    // MARK: - Private Methods
    //
    private func getCategories() {
        productUseCase.getCategories().sink {[weak self] categories in
            self?.categories = categories
        }
        .store(in: &cancellable)
    }
    
    func getCategoryDetail(category: String) -> (UIImage?, Int) {
        let categoryCount = productUseCase.getCategoryCount(category: category)
        let image = UIImage(folderName: .category2, named: category)
        return (image, categoryCount)
    }
}
