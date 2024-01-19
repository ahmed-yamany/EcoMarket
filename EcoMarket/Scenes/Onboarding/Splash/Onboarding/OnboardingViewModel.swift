//
//  OnboardingViewModel.swift
//  EcoMarket
//
//  Created by Youssef Eldeeb on 13/01/2024.
//

import Foundation
import Combine

struct Onboarding: Codable {
    let id: Int
    let image: String
    let title: String
    let subtitle: String
}

class OnboardingViewModel {
    // swiftlint: disable all
    var onboardingArray: [Onboarding] { JSONDecoder().decode(forResource: "OnboardingData") ?? [] }
    // swiftlint: enable all
    
}
