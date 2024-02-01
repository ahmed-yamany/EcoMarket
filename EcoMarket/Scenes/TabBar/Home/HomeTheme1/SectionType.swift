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
    // Method to create section layout based on the provided section object
    func makeSection(section: Section) -> any SectionLayout {
        // Switch over the type of section and create corresponding layout
        switch section.type {
        case .adds:
            // If section type is "adds", create AdsSectionProvider layout with provided data
            return AdsSectionProvider(data: section.adds ?? [])
        case .newArrival:
            // If section type is "newArrival", create NewArrivalsSectionProvider layout with provided data
            return NewArrivalsSectionProvider(data: section.newArrivarProducts ?? [])
        }
    }
}
