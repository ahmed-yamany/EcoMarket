//
//  ProfileSectionFactory.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 15/02/2024.
//

import Foundation

class ProfileItemFactory {
    let coordinator: ProfileCoordinatorProtocol
    
    init(coordinator: ProfileCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func makeItem(from model: ProfileModel) -> ProfileItem {
        guard let action = model.action else {
            return ProfileItem(model: model, action: {})
        }
        return ProfileItem(model: model) {
           
            switch action {
                case .personalDetails:
                    self.coordinator.showPersonalDetails()
                    self.coordinator.hideTabeBar()
                case .order:
                    self.coordinator.showOrder()
                    self.coordinator.hideTabeBar()
                case .favourites:
                    self.coordinator.showFavourites()
                    self.coordinator.hideTabeBar()
                case .shippingAddress:
                    self.coordinator.showShippingAddress()
                    self.coordinator.hideTabeBar()
                case .card:
                    self.coordinator.showCard()
                    self.coordinator.hideTabeBar()
                case .settings:
                    self.coordinator.showSettings()
                    self.coordinator.hideTabeBar()
                case .faq:
                    self.coordinator.showFAQ()
                    self.coordinator.hideTabeBar()
                case .privacyPolicy:
                    self.coordinator.showPrivacyPolicy()
                    self.coordinator.hideTabeBar()
                case .community:
                    self.coordinator.showCommunity()
                    self.coordinator.hideTabeBar()
                default: break
            }
        }
    }
}
