//
//  OnboardingViewModel.swift
//  EcoMarket
//
//  Created by Youssef Eldeeb on 13/01/2024.
//

import Foundation
import Combine

class OnboardingViewModel{
    
    var onboardingArray: [Onboarding] = decode(file: "OnboardingData")
    
}


func decode<T: Codable>(file: String) -> T {
    guard let url = Bundle.main.url(forResource: file, withExtension: "json") else {
        fatalError("Fail to locate the file")
    }
    guard let data = try? Data(contentsOf: url) else{
        fatalError("Fail to load the data")
    }
    let decoder = JSONDecoder()
    guard let decodedData = try? decoder.decode(T.self, from: data) else {
        fatalError("Fail to decode the file")
    }
    return decodedData
}


struct Onboarding: Codable{
    let id: Int
    let image: String
    let title: String
    let subtitle: String
}
