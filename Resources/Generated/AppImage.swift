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
    
    static var searchImage: UIImage? {
        return UIImage(systemName: "magnifyingglass")
    }
    
    static var checkImage: UIImage? {
        return UIImage(named: "checkImage")
    }
    
    static var cartIcon: UIImage? {
        return UIImage(named: "cart")
    }
    
    static var favIcon: UIImage? {
        return UIImage(named: "favourite")
    }
    
    static var ratingIcon: UIImage? {
        return UIImage(named: "rating")
	}

    static var arrowImage: UIImage? {
        return UIImage(named: "arrow")
    }
    
    static var delete: UIImage? {
        return UIImage(named: "delete")
    }
    
    static var arrow: UIImage? {
        return UIImage(named: "icon/profile-arrow")
    }
    
    static var editButton: UIImage? {
        return UIImage(named: "edit")
    }
    
    static var profileImage: UIImage? {
        return UIImage(named: "profileImage")
    }
    
    static var logout: UIImage? {
        return UIImage(named: "logout")
    }
    
    static var dot1: UIImage? {
        return UIImage(named: "dots")
    }
    
    static var dot2: UIImage? {
        return UIImage(named: "dots-2")
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
    
    enum Icon {
        private static var folderName: String {"icon"}
        
        static var productDelete: UIImage? {
            UIImage(named: "\(folderName)/product-delete")
        }
    }
    
    enum HomeTheme2 {
        private static var folderName: String {"hometheme2"}
        
        static var menuButtonIcon: UIImage? {
            UIImage(named: "\(folderName)/menu")
        }
        
        static var userButtonIcon: UIImage? {
            UIImage(named: "\(folderName)/user")
        }
        
        static var filterButtonIcon: UIImage? {
            UIImage(named: "\(folderName)/filter")
        }
        
        static var arrowButtonIcon: UIImage? {
            UIImage(named: "\(folderName)/arrowbutton")
        }
    }
}
