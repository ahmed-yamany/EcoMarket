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
                case .order:
                    self.coordinator.showOrder()
                case .favourites:
                    self.coordinator.showFavourites()
                case .shippingAddress:
                    self.coordinator.showShippingAddress()
                case .card:
                    self.coordinator.showCard()
                case .settings:
                    self.coordinator.showSettings()
                case .faq:
                    self.coordinator.showFAQ()
                case .privacyPolicy:
                    self.coordinator.showPrivacyPolicy()
                case .community:
                    self.coordinator.showCommunity()
                default: break
            }
        }
    }
}
