//
//  ProfileModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 04/02/2024.
//

import Foundation

struct ProfileItem {
    let model: ProfileModel
    let action: () -> Void
}

struct ProfileSection: Codable {
    let type: String
    let title: String
    let models: [ProfileModel]
}

// MARK: - Model
struct ProfileModel: Codable {
    let title, image: String
    let action: ProfileAction?
}

struct UserModel {
    let image: String
    let name: String
    let email: String
    let action: () -> Void
}

enum ProfileAction: String, Codable {
    case personalDetails
    case order
    case favourites
    case shippingAddress
    case card
    case settings 
    case faq
    case privacyPolicy
    case community
    case language
    case notification
    case mode
    case help
}

extension UserModel {
    static let user = [
        UserModel(image: "profile/user", name: "Fscreation", email: "Fscreation441@gmail.com", action: {
        print("Profile")
    })
    ]
}
