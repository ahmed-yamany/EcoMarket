//
//  ProfileModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 04/02/2024.
//

import Foundation

struct ProfileModel {
    let title: String
    let image: String
}

struct UserModel {
    let image: String
    let name: String
    let email: String
}

extension ProfileModel {
    static let mockData1 = [
        ProfileModel(title: "Personal Details", image: "profile/icon"),
        ProfileModel(title: "My Order", image: "profile/icon-2"),
        ProfileModel(title: "My Favourites", image: "profile/icon-3"),
        ProfileModel(title: "Shipping Address", image: "profile/icon-4"),
        ProfileModel(title: "My Card", image: "profile/icon-5"),
        ProfileModel(title: "Settings", image: "profile/icon-6")
    ]
    
    static let mockData2 = [
        ProfileModel(title: "FAQs", image: "profile/icon-7"),
        ProfileModel(title: "Privacy Policy", image: "profile/icon-8"),
        ProfileModel(title: "Community", image: "profile/icon-9")
    ]
    
    static let mockData3 = [
        ProfileModel(title: "Language", image: "settings/icon"),
        ProfileModel(title: "Notification", image: "settings/icon-2"),
        ProfileModel(title: "Dark Mood", image: "settings/icon-3"),
        ProfileModel(title: "Help Center", image: "settings/icon-4")
    ]
}

extension UserModel {
    static let user = [UserModel(image: "profile/user", name: "Fscreation", email: "Fscreation441@gmail.com")]
}
