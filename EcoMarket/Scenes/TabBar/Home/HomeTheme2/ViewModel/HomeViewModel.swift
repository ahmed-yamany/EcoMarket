//
//  HomeViewModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 19/02/2024.
//

import UIKit
import Combine
typealias HomeSectionsDelegate = FeaturesSectionDelegate & CategoriesSectionDelegate & TopSectionDelegate

class HomeViewModel {
    
    var homeModel: HomeModel? = HomeModel(sections: [])
    lazy var factory = HomeFactory(delegate: self)
    var reloadData: (() -> Void)?
    let coordinator: HomeCoordinatorProtocol
    let productUseCase: ProductRepositories
    private var cancellables = Set<AnyCancellable>()

    @Published var products: [Product] = [] {
        didSet {
            updateHomeModel()
        }
    }
    
    @Published var categories: [String] = []
    @Published var selectedCategory: String = "" {
        didSet {
            updateProducts()
        }
    }
    init(coordinator: HomeCoordinatorProtocol, productUseCase: ProductRepositories) {
        self.coordinator = coordinator
        self.productUseCase = productUseCase
        updateCategories()
        updateHomeModel()
    }
    
    func getSections() -> [any SectionsLayout] {
        guard let sections = homeModel?.sections else {
            return []
        }
        
        return sections.map {factory.createSection(section: $0)}
    }
    
    func updateHomeModel() {
        homeModel = HomeModel(
            sections: [
                .features(items: products),
                .categories(items: categories, title: "Categories"),
                .top(items: products, title: selectedCategory)])
        reloadData?()
    }
    
    private func updateCategories() {
        productUseCase.getCategories()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] categories in
                self?.categories = categories
                if let firstCategory = categories.first {
                    self?.selectedCategory = firstCategory
                }
            }
            .store(in: &cancellables)
    }
    
    private func updateProducts() {
        Task {
            do {
                self.products = try await productUseCase.getProducts(category: selectedCategory)
            } catch {
                print(error.localizedDescription)
            }
        }
            
    }
}

extension HomeViewModel: HomeSectionsDelegate {
    func featuresSection(_ section: FeaturesSection, didSelect item: Product) {
        coordinator.showDetails(product: item)
    }
    
    func categoriesSection(_ section: CategoriesSection, didSelect item: String) {
        selectedCategory = item
    }
    
    func topSection(_ section: TopSection, didSelect item: Product) {
        
    }
}
