//
//  AlertStatus.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 17/02/2024.
//

import UIKit

public enum AlertStatus {
    case success, warning, error
    
    var title: String {
        switch self {
            case .success: return "Success"
            case .warning: return "Warning"
            case .error: return "Error"
        }
    }
    
    var image: UIImage {
        switch self {
            case .success:
                return AppImage.Alert.addToCart ?? UIImage()
            case .warning:
                return AppImage.Alert.warning ?? UIImage()
            case .error:
                return AppImage.Alert.error ?? UIImage()
        }
    }
}
