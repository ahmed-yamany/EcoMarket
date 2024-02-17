//
//  OnboardingViewModel.swift
//  EcoMarket
//
//  Created by Youssef Eldeeb on 13/01/2024.
//

import Foundation
import Combine

class OnboardingViewModel {
    
    let coordinator: OnboardingCoordinatorProtocol
    init(coordinator: OnboardingCoordinatorProtocol, currentIndex: Int = 0) {
        self.coordinator = coordinator
    }
    
    var onboardingArray: [Onboarding] {
        JSONDecoder().decode(forResource: "OnboardingData") ?? []
    }
    
    var currentIndex = 0
    
    func move(didMoved: (Int) -> Void, reachedEnd: () -> Void) {
        if currentIndex < onboardingArray.count - 1 {
            currentIndex += 1
            didMoved(currentIndex)
        } else {
            reachedEnd()
            self.showSplashScreen()
        }
    }
    
    func showSplashScreen() {
        coordinator.showAuthFlow()
    }
}
