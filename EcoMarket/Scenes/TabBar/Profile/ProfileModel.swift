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
    let action: () -> Void
}

struct UserModel {
    let image: String
    let name: String
    let email: String
    let action: () -> Void
}

extension ProfileModel {
    static let mockData1 = [
        ProfileModel(title: "Personal Details", image: "profile/icon", action: {
            print("Personal Details")
        }),
        ProfileModel(title: "My Order", image: "profile/icon-2", action: {
            print("My Order")
        }),
        ProfileModel(title: "My Favourites", image: "profile/icon-3", action: {
            print("My Favourites")
        }),
        ProfileModel(title: "Shipping Address", image: "profile/icon-4", action: {
            print("Shipping Address")
        }),
        ProfileModel(title: "My Card", image: "profile/icon-5", action: {
            print("My Card")
        }),
        ProfileModel(title: "Settings", image: "profile/icon-6", action: {
            print("Settings")
        })
    ]
    
    static let mockData2 = [
        ProfileModel(title: "FAQs", image: "profile/icon-7", action: {
            print("FAQs")
        }),
        ProfileModel(title: "Privacy Policy", image: "profile/icon-8", action: {
            print("Privacy Policy")
        }),
        ProfileModel(title: "Community", image: "profile/icon-9", action: {
            print("Community")
        })
    ]
    
    static let mockData3 = [
        ProfileModel(title: "Language", image: "settings/icon", action: {
            print("Language")
        }),
        ProfileModel(title: "Notification", image: "settings/icon-2", action: {
            print("Notification")
        }),
        ProfileModel(title: "Dark Mood", image: "settings/icon-3", action: {
            print("Dark Mood")
        }),
        ProfileModel(title: "Help Center", image: "settings/icon-4", action: {
            print("Help Center")
        })
    ]
}

extension UserModel {
    static let user = [
        UserModel(image: "profile/user", name: "Fscreation", email: "Fscreation441@gmail.com", action: {
        print("Profile")
    })
    ]
}
