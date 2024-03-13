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
    
    static var searchImage: UIImage? {
        return UIImage(systemName: "magnifyingglass")
    }
    
    static var arrow: UIImage? {
        return UIImage(named: "icon/profile-arrow")
    }
    
    static var alertSuccessefulShopping: UIImage? {
        return UIImage(named: "icon-alertSuccessefulShopping")
	}

    static var favouriteImage: UIImage? {
        return UIImage(systemName: "heart.circle.fill")
    }
    
    enum Onboarding {
        static var nextButton: UIImage? {
            return UIImage(folderName: .onboarding, named: "next-button")
        }
        
        static var splash1: UIImage? {
            return UIImage(folderName: .onboarding, named: "splash-2")
        }
        
        static var logo: UIImage? {
            return UIImage(folderName: .onboarding, named: "logo")
        }
    }
    
    enum Auth {
        
        private static var folderName: String {"auth"}
        
        static var logout: UIImage? {
            return UIImage(named: "\(folderName)/logout")
        }
        
        static var successImage: UIImage? {
            return UIImage(named: "\(folderName)/icon-success")
        }
        
        static var facebookIcon: UIImage? {
            return UIImage(named: "\(folderName)/icon-facebook")
        }
        
        static var googleIcon: UIImage? {
            return UIImage(named: "\(folderName)/icon-google")
        }
        
        static var appleIcon: UIImage? {
            return UIImage(named: "\(folderName)/icon-apple")
        }
    }
    
    enum Icon {
        
        static var productDelete: UIImage? {
            return UIImage(folderName: .icon, named: "product-delete")
        }
        
        static var loveButton: UIImage? {
            return UIImage(folderName: .icon, named: "love")
        }
        
        static var delete: UIImage? {
            return UIImage(folderName: .icon, named: "delete")
        }
        
        static var arrow: UIImage? {
            return UIImage(folderName: .icon, named: "arrow")
        }
        
        static var rating: UIImage? {
            return UIImage(folderName: .icon, named: "rating")
		}

        static var scanerIcon: UIImage? {
            return UIImage(folderName: .icon, named: "scaner")
        }
        
        static var menu: UIImage? {
            return UIImage(folderName: .icon, named: "menu")
        }
    }
    
    enum Alert {
        
        static var addToCart: UIImage? {
            return UIImage(folderName: .alert, named: "add-to-cart")
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
    
    enum ProductDetails {
        private static var folderName: String {"productDetails"}
    
        static var favourite: UIImage? {
            UIImage(named: "\(folderName)/favourite")
        }
        
        static var favouriteFill: UIImage? {
            UIImage(named: "\(folderName)/favouritefill")
        }
        
        static var cartIcon: UIImage? {
            UIImage(named: "\(folderName)/cart")
        }
    }
    
    enum Settings {
        private static var folderName: String {"settings"}
    
        static var dot1: UIImage? {
            UIImage(named: "\(folderName)/dots")
        }
        
        static var dot2: UIImage? {
            UIImage(named: "\(folderName)/dots-2")
        }
        
        static var editButton: UIImage? {
            UIImage(named: "\(folderName)/edit")
        }
    }
    
    enum Profile {
        private static var folderName: String {"profile"}
        
        static var profileImage: UIImage? {
            UIImage(named: "\(folderName)/profileImage")
        }
    }
}

enum AssetsFolderName: String {
    case onboarding = "Onboarding"
    case icon = "icon"
    case alert = "Alert"
}

extension UIImage {
    convenience init?(folderName: AssetsFolderName, named: String) {
        self.init(named: "\(folderName.rawValue)/\(named)")
    }
}
