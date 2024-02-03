//
//  SectionType.swift
//  EcoMarket
//
//  Created by Mohamed Khaled on 01/02/2024.
//

import UIKit

// Define an enumeration to represent different types of sections
enum SectionType: Codable {
    case adds, newArrival
}

// Define a factory class responsible for creating section layouts
class SectionLayoutFactory {
    
    /// Method to create section layout based on the provided section object
    func makeSection(section: Section) -> any SectionLayout {
        switch section.type {
        case .adds:
            return AdsSectionProvider(data: section.adds ?? [])
        case .newArrival:
            return NewArrivalsSectionProvider(data: section.newArrivarProducts ?? [])
        }
    }
}
