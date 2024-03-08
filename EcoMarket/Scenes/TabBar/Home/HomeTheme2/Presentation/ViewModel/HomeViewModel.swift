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
    @Published var sections: [any SectionsLayout] = []
    lazy var featuresSection = FeaturesSection(delegate: self)
    lazy var categoriesSection =  CategoriesSection(delegate: self, headerTitle: "Categories")
    lazy var productsSection = TopSection(delegate: self)
    
    var reloadData: (() -> Void)?
        
    let coordinator: HomeCoordinatorProtocol
    let useCase: HomeUseCaseProtocol
    init(
        coordinator: HomeCoordinatorProtocol,
        useCase: HomeUseCaseProtocol
    ) {
        self.coordinator = coordinator
        self.useCase = useCase
        sections = [
            featuresSection,
            categoriesSection,
            productsSection
        ]
        productsSection.headerTitle = "Top Dressed"
    }
    
    func viewWillAppear() {
        coordinator.showTabBar()
        getFeatures()
        getCategories()
    }
    
    private func getFeatures() {
        Task {
            do {
                featuresSection.items = try await useCase.getFeatures()
                reloadData?()
            } catch {
                
            }
        }
    }
    
    private func getCategories() {
        Task {
            do {
                let categories = try await useCase.getCategories()
                categoriesSection.items = categories
                getProducts(for: categories[safe: 0] ?? "")
            } catch {
                
            }
        }
    }
    
    func getProducts(for category: String) {
        Task {
            do {
                productsSection.items = try await useCase.getProducts(for: category)
                reloadData?()
            } catch {
                
            }
        }
    }
}

extension HomeViewModel: HomeSectionsDelegate {
    func featuresSection(_ section: FeaturesSection, didSelect item: Product) {
        coordinator.showDetails(product: item)
        coordinator.hideTabBar()
    }
    
    func categoriesSection(_ section: CategoriesSection, didSelect item: String) {
        getProducts(for: item)
    }
    
    func topSection(_ section: TopSection, didSelect item: Product) {
        
    }
}
