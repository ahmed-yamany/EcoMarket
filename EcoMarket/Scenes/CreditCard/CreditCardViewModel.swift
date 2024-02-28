//
//  CreditCardViewModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 25/02/2024.
//

import UIKit
import Combine

class CreditCardViewModel {
    // Inputs
    let cardNumber = PassthroughSubject<String, Never>()
    let cardHloderName = PassthroughSubject<String, Never>()
    
    // Outputs
    @Published var formattedCardNumber: String = ""
    @Published var cardType: String = ""
    @Published var cardLogo: UIImage?
    @Published var cardImage: UIImage?
    @Published var cardHolder: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        cardNumber
            .map { self.formatCardNumber($0) }
            .assign(to: &$formattedCardNumber)
        
        cardNumber
            .map { self.detectCardType($0) }
            .assign(to: &$cardType)
        
        cardNumber
            .map { self.detectCardLogo($0) }
            .assign(to: &$cardLogo)
        
        cardNumber
            .map { self.detectCardImage($0) }
            .assign(to: &$cardImage)
        
        cardHloderName
            .map { self.detectCardHolder($0) }
            .assign(to: &$cardHolder)
    }
    
    private func formatCardNumber(_ value: String) -> String {
        // Remove any non-digit characters
        let cleanedValue = value.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        // Limit to 16 characters
        let limitedValue = String(cleanedValue.prefix(16))
        
        // Insert space every 4 characters
        var formattedValue = ""
        var index = limitedValue.startIndex
        while index < limitedValue.endIndex {
            let nextIndex = limitedValue.index(index, offsetBy: min(4, limitedValue.distance(from: index, to: limitedValue.endIndex)))
            formattedValue += limitedValue[index..<nextIndex]
            if nextIndex != limitedValue.endIndex {
                formattedValue += " "
            }
            index = nextIndex
        }
        
        return formattedValue
    }
    
    private func detectCardType(_ value: String) -> String {
        guard !value.isEmpty else { return "" }
        if value.hasPrefix("4") {
            return "VISA"
        } else if value.hasPrefix("5") {
            return "MasterCard"
        } else if value.hasPrefix("6") {
            return "PAYPAL"
        } else {
            return ""
        }
    }
    
    private func detectCardLogo(_ value: String) -> UIImage? {
        guard !value.isEmpty else { return nil }
        if value.hasPrefix("4") {
            return AppImage.CreditCard.visaLogo
        } else if value.hasPrefix("5") {
            return AppImage.CreditCard.masterCardLogo
        } else if value.hasPrefix("6") {
            return AppImage.CreditCard.paypalLogo
        } else {
            return nil
        }
    }
    
    private func detectCardImage(_ value: String) -> UIImage? {
        guard !value.isEmpty else {
            return AppImage.CreditCard.credit1
        }
        if value.hasPrefix("4") {
            return AppImage.CreditCard.credit3
        } else if value.hasPrefix("5") {
            return AppImage.CreditCard.credit2
        } else if value.hasPrefix("6") {
            return AppImage.CreditCard.credit4
        } else {
            return AppImage.CreditCard.credit1
        }
    }
    
    private func detectCardHolder(_ value: String) -> String {
        return value.uppercased()
    }
}
