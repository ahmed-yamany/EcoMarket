//
//  HomeViewModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 19/02/2024.
//

import UIKit

typealias HomeSectionsDelegate = FeaturesSectionDelegate & CategoriesSectionDelegate & TopSectionDelegate

class HomeViewModel {
    let homeModel: HomeModel? = JSONDecoder().decode(forResource: "Home2")
    lazy var factory = HomeFactory(delegate: self)
    
    let coordinator: HomeCoordinatorProtocol
    let useCase: HomeThem2UseCaseProtocol
    init(coordinator: HomeCoordinatorProtocol, useCase: HomeThem2UseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
    func getSections() -> [any SectionsLayout] {
        guard let sections = homeModel?.sections else {
            return []
        }
        
        return sections.map {factory.createSection(section: $0)}
    }
}

extension HomeViewModel: HomeSectionsDelegate {
    func featuresSection(_ section: FeaturesSection, didSelect item: ProductModel) {
        let product = useCase.getProductDetails(by: item.id)
        coordinator.showDetails(product: product)
    }
    
    func categoriesSection(_ section: CategoriesSection, didSelect item: CategoriesModel) {
        
    }
    
    func topSection(_ section: TopSection, didSelect item: TopProductModel) {
        
    }
}
