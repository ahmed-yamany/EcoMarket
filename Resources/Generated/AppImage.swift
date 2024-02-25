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
    
    enum Icon {
        
        static var productDelete: UIImage? {
            return UIImage(folderName: .icon, named: "product-delete")
        }
        
        static var loveButton: UIImage? {
            return UIImage(folderName: .icon, named: "love")
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
    
    enum CreditCard {
        private static var folderName: String {"creditcard"}
        
        static var credit1: UIImage? {
            UIImage(named: "\(folderName)/credit1")
        }
        
        static var credit2: UIImage? {
            UIImage(named: "\(folderName)/credit2")
        }
        
        static var credit3: UIImage? {
            UIImage(named: "\(folderName)/credit3")
        }
        
        static var credit4: UIImage? {
            UIImage(named: "\(folderName)/credit4")
        }
        
        static var visaLogo: UIImage? {
            UIImage(named: "\(folderName)/visa")
        }
        
        static var masterLogo: UIImage? {
            UIImage(named: "\(folderName)/mastercard")
        }
        
        static var paypalLogo: UIImage? {
            UIImage(named: "\(folderName)/paypal")
        }
        
        static var americanLogo: UIImage? {
            UIImage(named: "\(folderName)/ameri")
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
