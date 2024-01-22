//
//  AppImage.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 14/01/2024.
//

import UIKit

enum AppImage {
    static var appLogo: UIImage? {
        return UIImage(named: "app-logo")
    }
    static var eyeSlash: UIImage? {
        return UIImage(named: "eye")
    }
    
    static var successImage: UIImage? {
        return UIImage(named: "icon-success")
    }
    
    static var facebookIcon: UIImage? {
        return UIImage(named: "icon-facebook")
    }
    
    static var googleIcon: UIImage? {
        return UIImage(named: "icon-google")
    }
    
    static var appleIcon: UIImage? {
        return UIImage(named: "icon-apple")
    }
    
    static var verifyImage: UIImage? {
        return UIImage(named: "verify")
    }
    
    enum Onboarding {
        private static var folderName: String {"Onboarding"}
        
        static var nextButton: UIImage? {
            return UIImage(named: "\(folderName)/next-button")
        }
        
        static var splash1: UIImage? {
            return UIImage(named: "\(folderName)/splash-2")
        }
        
        static var logo: UIImage? {
            return UIImage(named: "\(folderName)/logo")
        }

    }
}